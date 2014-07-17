From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 22:50:58 +0200
Subject: [Buildroot] [git commit] package/kexec-lite: Add a package for the
	kexec-lite tools
Message-ID: <20140717205204.AEAD69D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e36e7db93300338842afd0264faa88343e8a2d0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kexec-lite is a tiny impementation of kexec for devicetree-based
platforms.

[Thomas:
- Add !BR2_PREFER_STATIC_LIB dependency, inherited from the dtc
  package
- Fix license to be GPLv2+, and not just GPL.
- Use $(TARGET_CONFIGURE_OPTS) instead of manually passing CC, LD,
  CFLAGS.
- Use a full path as the target of $(INSTALL)]

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/kexec-lite/Config.in                       |   17 ++++++++++
 .../kexec-lite/kexec-lite-01-clean-restart.patch   |   34 ++++++++++++++++++++
 package/kexec-lite/kexec-lite.mk                   |   20 +++++++++++
 4 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b52d347..bc010fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -61,6 +61,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/google-breakpad/Config.in"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
+	source "package/kexec-lite/Config.in"
 	source "package/ktap/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/lmbench/Config.in"
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
new file mode 100644
index 0000000..944ee29
--- /dev/null
+++ b/package/kexec-lite/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_KEXEC_LITE
+	bool "kexec-lite"
+	depends on BR2_powerpc || BR2_powerpc64
+	depends on !BR2_PREFER_STATIC_LIB # dtc
+	select BR2_PACKAGE_LIBELF
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_DTC_PROGRAMS
+	help
+	  Kexec is a user space utiltity for loading another kernel
+	  and asking the currently running kernel to do something with it.
+
+	  This package is a tiny implementation of the kexec userspace
+	  components, for devicetree-based platforms.
+
+comment "kexec-lite needs a toolchain w/ dynamic library"
+	depends on BR2_powerpc || BR2_powerpc64
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/kexec-lite/kexec-lite-01-clean-restart.patch b/package/kexec-lite/kexec-lite-01-clean-restart.patch
new file mode 100644
index 0000000..faaa93a
--- /dev/null
+++ b/package/kexec-lite/kexec-lite-01-clean-restart.patch
@@ -0,0 +1,34 @@
+From 0a654c20e1b9324c57ba4116b52fb6ab33847e1d Mon Sep 17 00:00:00 2001
+From: Jeremy Kerr <jk@ozlabs.org>
+Date: Thu, 8 Aug 2013 17:16:31 +0800
+Subject: [PATCH] kexec: Implement clean restart for busybox init
+
+Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
+---
+ kexec.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/kexec.c b/kexec.c
+index 2edb7df..b2a0c42 100644
+--- a/kexec.c
++++ b/kexec.c
+@@ -27,6 +27,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <syscall.h>
++#include <signal.h>
+ #include <libfdt.h>
+ #include <getopt.h>
+ #include <sys/types.h>
+@@ -818,7 +819,7 @@ int main(int argc, char *argv[])
+ 			sync();
+ 			exec_kexec();
+ 		} else {
+-			execlp("shutdown", "shutdown", "-r", "now", NULL);
++			kill(1, SIGQUIT);
+ 		}
+ 
+ 		return -1;
+-- 
+1.7.10.4
+
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
new file mode 100644
index 0000000..7028c6e
--- /dev/null
+++ b/package/kexec-lite/kexec-lite.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# kexec-lite
+#
+################################################################################
+
+KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
+KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
+KEXEC_LITE_LICENSE = GPLv2+
+KEXEC_LITE_DEPENDENCIES = libelf dtc
+
+define KEXEC_LITE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define KEXEC_LITE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/kexec $(TARGET_DIR)/usr/sbin/kexec
+endef
+
+$(eval $(generic-package))
