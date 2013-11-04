From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  4 Nov 2013 09:33:49 +0000
Subject: [Buildroot] [PATCH] libsigsegv: fix avr32 build
Message-ID: <1383557629-13227-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The libsigsegv configure step fails to correctly figure out the direction of
stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
build failures such as the following.

  http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../libsigsegv-0001-fix-avr32-build.patch          | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch

diff --git a/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch b/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
new file mode 100644
index 0000000..daccabb
--- /dev/null
+++ b/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
@@ -0,0 +1,32 @@
+The libsigsegv configure step fails to correctly figure out the direction of
+stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
+build failures such as the following.
+
+  http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/configure b/configure
+--- a/configure	2011-04-03 16:50:50.000000000 +0100
++++ b/configure	2013-11-04 09:29:21.990050318 +0000
+@@ -14504,7 +14504,7 @@ else
+       alpha* | \
+       arc | \
+       arm* | strongarm* | xscale* | \
+-      avr | \
++      avr | avr32 | \
+       c1 | c2 | c32 | c34 | c38 | \
+       clipper | \
+       cris | \
+diff -Nurp a/m4/stack-direction.m4 b/m4/stack-direction.m4
+--- a/m4/stack-direction.m4	2009-11-21 12:22:45.000000000 +0000
++++ b/m4/stack-direction.m4	2013-11-04 09:29:27.558036038 +0000
+@@ -16,7 +16,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       alpha* | \
+       arc | \
+       arm* | strongarm* | xscale* | \
+-      avr | \
++      avr | avr32 | \
+       c1 | c2 | c32 | c34 | c38 | \
+       clipper | \
+       cris | \
-- 
1.8.3.2
