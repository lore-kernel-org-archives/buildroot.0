From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:48:53 +0200
Subject: [Buildroot] [git commit] Revert "qemu: allow to build host variant
	statically"
Message-ID: <20170403205002.BC25F822C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d3a136fe592e47d86e2772a426a01188c1972a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a6afa968fc9080080b943885b8599475df9e36c4, which
causes too many different build issues:

  http://autobuild.buildroot.net/results/d5c/d5ced6c9738b285e6fda8c3d41c3c66ee0cf1edc/build-end.log

  http://autobuild.buildroot.net/results/fca/fca01cc5ce13384df0a7f8fad75e2acd05598f99/build-end.log

  http://autobuild.buildroot.net/results/f17/f1755f26a3eacd84de9bd901b214a5bbb964988c/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in.host | 28 ----------------------------
 package/qemu/qemu.mk        |  4 ----
 2 files changed, 32 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index fbe27bd..b3eb590 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -17,34 +17,6 @@ config BR2_PACKAGE_HOST_QEMU
 
 if BR2_PACKAGE_HOST_QEMU
 
-config BR2_PACKAGE_HOST_QEMU_STATIC
-	bool "Build statically"
-	help
-	  Build qemu as a statically linked executable. Use this
-	  option if you want to 'chroot' in your target directory. The
-	  following steps detail how to achieve this with an ARM
-	  target:
-
-	    1. Copy the qemu binary in your target directory:
-
-	       cp host/usr/bin/qemu-arm target/usr/bin
-
-	    2. Make sure binfmt_misc is mounted on /proc/sys/fs/binfmt_misc:
-
-	       mount -t binfmt_misc none /proc/sys/fs/binfmt_misc
-
-	    3. Register /usr/bin/qemu-arm is interpreter for arm
-	       binaries. See linux/Documentation/binfmt_misc.txt for
-	       more information:
-
-	       MAGIC='\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00'
-	       MASK='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
-	       echo ":qemu-arm:M:0:$MAGIC:$MASK:/usr/bin/qemu-arm:OC" > /proc/sys/fs/binfmt_misc/register
-
-	    4. Chroot into your target:
-
-	       chroot target /bin/sh
-
 comment "Emulators selection"
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4eea982..2b6aafb 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -120,10 +120,6 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
-ifeq ($(BR2_PACKAGE_HOST_QEMU_STATIC),y)
-HOST_QEMU_OPTS += --static
-endif
-
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
