From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2009 23:19:25 +0200
Subject: [Buildroot] A more readable build output ?
Message-ID: <20090916231925.0a8ce23b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Currently, Buildroot displays the full build log on the standard
output. Having the full build log is of course nice, but:

 *) It is quite scary for new users

 *) It makes it more complicated for new users to understand the
    different steps of the Buildroot build process

 *) It makes it more complicated to see the progression of the build
    process (what is it doing now ? is it almost at the end ?)

Therefore, I've prototyped a simple thing that redirects the build log
to a file (so that the full build log is not lost and can be examined
for diagnostic purposes) and only display messages like "Doing this",
"Doing that" on the standard output. The goal is to disable this
behaviour when V=1 is passed, but this isn't implemented yet.

I'm sending the prototype in an early/ugly state just to see how the
feature is received by the Buildroot community. If it's well received,
I'll finalize the development and polish the implementation.

The idea of the prototype is that the main Makefile calls itself by
redirecting the standard output and error output to a file, and then
redirect a special file descriptor (8) to the standard output. Then, a
MSG macro is provided to print the "Doing this", "Doing that" messages
both to file descriptor 8 (so they get displayed on the console) and to
the normal output (so that they get saved into the build log). Of
course, it means that many places in Buildroot must be modified to call
the MSG macro (but the Makefile.autotools.in machinery makes it easy
for a large set of packages). The MSG macro could replace the MESSAGE
macro currently defined in Makefile.autotools.in.

Here is the (ugly) prototype (alternative solutions or cleanup
improvements are welcome):

diff --git a/Makefile b/Makefile
index f2e349f..c557f02 100644
--- a/Makefile
+++ b/Makefile
@@ -32,6 +32,22 @@ noconfig_targets:=menuconfig xconfig config oldconfig randconfig \
        defconfig allyesconfig allnoconfig release tags \
        source-check help
 
+define MSG
+       @echo $(1) >&8
+       @echo "============================================="
+       @echo $(1)
+       @echo "============================================="
+endef
+
+MYSUBMAKE=cmd() { \
+  >/tmp/toto.log 2>&1 make -s INSIDE=1 -C . $$* || \
+   { echo "Build failed. See /tmp/toto.log for details." ; false; } }  8>&1; \
+  cmd
+
+ifneq ($(INSIDE),1)
+default:
+       $(MYSUBMAKE)
+endif

Then, to print a message, just do:

   $(call MSG,"Configuring Busybox")

What's your opinion about this ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
