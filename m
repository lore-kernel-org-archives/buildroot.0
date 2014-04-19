From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 19 Apr 2014 08:02:56 +0200
Subject: [Buildroot] wget autoreconfigure problem
Message-ID: <1899265.ckz4x4Fb2x@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm running into a problem with wget and gettext. The problem is not caused 
by Buildroot, but it would be good to have a workaround. Also I would like 
some advice on which upstream to contact for a definitive fix.

The problem is triggered since commit 84bf8f04 (wget: fix build against 
uclibc snapshot), because that triggers an autoreconfigure by adding 
"WGET_AUTORECONF = YES" to "package/wget/wget.mk".

The build of wget fails with the following error message:

make[3]: Entering directory 
`/home/mth/gcw0/buildroot/output/build/wget-1.15/po'
*** error: gettext infrastructure mismatch: using a Makefile.in.in from 
gettext version 0.17 but the autoconf macros are from gettext version 0.18
make[3]: *** [check-macro-version] Error 1

The wget-1.15 source from the tarball is designed to be used with gettext 
0.17: the mentioned Makefile template "po/Makefile.in.in" defines 
"GETTEXT_MACRO_VERSION = 0.17". The configure macros in "m4/po.m4" are also 
from gettext 0.17.

What happens on the autoreconfigure though is that aclocal will start 
searching for m4 files and picks up "$(HOST_DIR)/usr/share/aclocal/po.m4", 
which is from gettext 0.18. Apparently gettext doesn't support mixing of 
versions and has sanity checks to prevent that, which is where the error 
message comes from.

For some reason this problem occurs on my machine, but doesn't occur for 
Paul Cercueil when building the same git revision. A possible explanation is 
that "package/wget/wget.mk" does not declare a dependency on gettext, so 
whether it will build with or without gettext support is just a matter of 
which package gets built first; I don't think that is a desirable situation.

When it comes to a solution, I don't really know where to start. I tried to 
disable scanning host directories for m4 files and while that fixes gettext, 
it breaks util-linux. So a quick hack is probably not the solution here.

I don't know how it is designed to work: apparently m4 files can either be 
included with the package or be searched for systemwide. But which is the 
primary file and which is the fallback? If the in-package file should take 
precedence, then aclocal should always take the in-package file if it 
exists. If the systemwide file should take precedence, then having hardcoded 
version dependencies like gettext does is invalid.

Does anyone here know how the aclocal m4 search is supposed to work? Since 
that would determine which upstream package should be approached for a fix.

Bye,
		Maarten
