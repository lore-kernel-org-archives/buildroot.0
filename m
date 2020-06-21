From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jun 2020 23:23:48 +0200
Subject: [Buildroot] [PATCHv4] boot/grub2: Fix GRUB i386-pc build with
 Ubuntu gcc
In-Reply-To: <20200528215015.5018-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 28 May 2020 23:50:15 +0200")
References: <20200528215015.5018-1-yann.morin.1998@free.fr>
Message-ID: <87zh8w8657.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Backport a patch from upstream to fix the build on certain versions of
 > gsc, notably:

 >     Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
 >     Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008

 > The upstream patch is simply a change in the gentpl.py script, which is
 > used to generate parts of the automake machinery, so if we just backport
 > the upstream patch, we need to call the script to regenerate those files.

 > However, the modified script is a python script, so we would need to add
 > a dependency on host-python (2 or 3), which is not so nice.

 > Furthermore, calling the script is not enough: it needs a specific set
 > of optionss for each file it is to generate. That set of options is not
 > static; it is constructed in the convoluted autogen.sh. Calling
 > autogen.sh is usally not so good an idea in the Buildroot context, and
 > indeed this fails becasue it calls to autoreconf, but without our
 > carefuly crafted options and environment variables.

 > There was a little light in the tunnel, in that autogen.sh can be told
 > not to run autoreconf, by setting the environemnt variable
 > FROM_BOOTSTRAP to an non-=empty string, but this is fraught with various
 > other side-effects, as in that cause, autogen.sh expects to be valled by
 > an upper sciopt, bootstrap, which is not provided in the tarball
 > distribution...

 > So, between all those issues, autogen, bootstrap, and a host-python (2
 > or 3) dependency, we choose another route: path the script *and* the one
 > generated file affected by the change. Since that patched file is a .am
 > file, we also patch the corresponding .in file

 > However, we're faced with another issue: the other generated file is
 > now older than the script, so the automake machinery will now want to
 > re-run autoconf et al during the build step, which is still not a good
 > idea for us. So we touch the other generated file so it is mopre recent
 > than the script.

 > This is still not sufficient, because the patched file also has a
 > dependency on the generated file, so we need to touch as well.

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=12946

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - keep the hunk about patching gentpl.py
 >   - make it a git-formatted patch
 >   - add the touch
 >   - drastically expand the commit log
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v3 -> v4:
 >  - changes by Yann as identified in commit log and bundled patch

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
