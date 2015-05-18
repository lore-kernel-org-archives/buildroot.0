From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 23:03:46 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/harfbuzz: disable test
 programs
In-Reply-To: <1431467484-14459-1-git-send-email-romain.naour@openwide.fr>
References: <1431467484-14459-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150518230346.4c8a9a45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 12 May 2015 23:51:23 +0200, Romain Naour wrote:
> Workaround a build issue by disabling all test
> binaries since it forget to link with -lstd++.
> 
> Add a new configure option to disable test programs
> in a upstreamable way.
> 
> Fixes:
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

I was almost going to apply this one, but I'm not entirely happy in
fact. I really works around the real problem, and does not fix it:
imagine a real program now links statically to harfbuzz using harfbuzz
pkg-config file. This pkg-config file does not advertise the dependency
on libstdc++ in its Libs.private, so the link would also fail, just
like it currently fails for the test programs.

Unfortunately, fixing the .pc file would not fix the internal harfbuzz
test programs, since they don't use pkg-config to get the link flags.

To be honest, I am not sure what is the correct automake way of fixing
this problem. Maybe:

-LDADD = $(top_builddir)/src/libharfbuzz.la $(GLIB_LIBS)
+LDADD = $(top_builddir)/src/libharfbuzz.la $(GLIB_LIBS) -lstdc++

in test/api/Makefile.am ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
