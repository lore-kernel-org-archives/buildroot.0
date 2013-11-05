From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 08:58:10 +0100
Subject: [Buildroot] [git commit] libsigsegv: fix avr32 build
Message-ID: <20131105132710.E4B4A994C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6e69598a3e801267d23f3e29a030b1ea13878c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libsigsegv configure step fails to correctly figure out the direction of
stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
build failures such as the following.

  http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libsigsegv-0001-fix-avr32-build.patch          |   20 ++++++++++++++++++++
 package/libsigsegv/libsigsegv.mk                   |    2 ++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch b/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
new file mode 100644
index 0000000..f585764
--- /dev/null
+++ b/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
@@ -0,0 +1,20 @@
+The libsigsegv configure step fails to correctly figure out the direction of
+stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
+build failures such as the following.
+
+  http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
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
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 2cc2544..a5bb31c 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -11,4 +11,6 @@ LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPLv2+
 LIBSIGSEGV_LICENSE_FILES = COPYING
 
+LIBSIGSEGV_AUTORECONF = YES
+
 $(eval $(autotools-package))
