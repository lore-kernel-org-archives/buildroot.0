From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 22:00:41 +0200
Subject: [Buildroot] [git commit] php: force cross-compilation
Message-ID: <20120623201135.733EE88E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7944f19740497e68287b612db6a63e94e3cc1fe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes build problems like
http://autobuild.buildroot.org/results/e3c5815766fdcf3f13b06fa0758ec418618ac4be/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php-force-cross-compile.patch |   50 +++++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/php/php-force-cross-compile.patch b/package/php/php-force-cross-compile.patch
new file mode 100644
index 0000000..f14b477
--- /dev/null
+++ b/package/php/php-force-cross-compile.patch
@@ -0,0 +1,50 @@
+php: force cross-compilation
+
+In its configure script, PHP detects whether we're cross-compiling or
+not, by compiling and running a simple C program. Depending on whether
+cross-compiling has been detected or not, then PHP enables or disables
+the AC_TRY_RUN tests (which verify the availability of something by
+*executing* a program, which, by definition, cannot work in
+cross-compilation mode).
+
+This works just fine when the target architecture is ARM or PowerPC
+and the build machine is x86 or x86_64. Unfortunately, when the target
+architecture is x86_64 and the build machine is also x86_64, the
+cross-compilation mode detection concludes that we are not
+cross-compiling, because it succeeds in running this small program.
+
+However, while it succeeds in running this basic small program, some
+other programs executed later through AC_TRY_RUN tests do not work,
+because they have target library dependencies that are not available
+on the build machine. For example, the libxml2 test fails to *run*
+because libxml2 is not available on the build machine, only in the
+target/staging directories. So trying to run a program linked against
+libxml2, on the build machine, simply doesn't make sense.
+
+We fix this problem by just forcing PHP to think that we're
+cross-compiling (which is always the case with Buildroot, as we're at
+the moment never building PHP for the host). Unfortunately, the
+configure.in file dates back from the autoconf 2.13 era, so the
+configure script does not understand the ac_cv_prog_cc_cross cache
+variable, and we cannot easily regenerate the configure script using
+our package autoconf version. The easiest solution is therefore to
+simply patch the configure script to make the cross-compilation test
+fail: we replace the execution of the program by a call to false,
+which always fail, leading the configure script to understand that we
+*are* cross-compiling.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
+@@ -2387,7 +2387,7 @@
+ if { (eval echo configure:2388: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+-  if (./conftest; exit) 2>/dev/null; then
++  if (false; exit) 2>/dev/null; then
+     ac_cv_prog_cc_cross=no
+   else
+     ac_cv_prog_cc_cross=yes
