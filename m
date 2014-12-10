From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:54:55 +0100
Subject: [Buildroot] [git commit] blktrace: new package
Message-ID: <20141210205803.2D6437FEBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5f14b7ef62f179af586d19eeec5c172472c8ede
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/blktrace/Config.in     |   19 +++++++++++++++++++
 package/blktrace/blktrace.hash |    2 ++
 package/blktrace/blktrace.mk   |   22 ++++++++++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dd3a46e..f41e332 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -52,6 +52,7 @@ endif
 endmenu
 
 menu "Debugging, profiling and benchmark"
+	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/dhrystone/Config.in"
diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
new file mode 100644
index 0000000..e68ae13
--- /dev/null
+++ b/package/blktrace/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_BLKTRACE
+	bool "blktrace"
+	# Uses posix_spawn()
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	# Because of libaio arch depends
+	depends on \
+		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
+		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
+		BR2_sparc || BR2_x86_64
+	select BR2_PACKAGE_LIBAIO
+	help
+	  blktrace is a block layer IO tracing mechanism which provides
+	  detailed information about request queue operations
+	  up to user space.
+
+	  http://git.kernel.dk/?p=blktrace.git;a=summary
+
+comment "blktrace needs a (e)glibc or musl toolchain"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/blktrace/blktrace.hash b/package/blktrace/blktrace.hash
new file mode 100644
index 0000000..acd42fb
--- /dev/null
+++ b/package/blktrace/blktrace.hash
@@ -0,0 +1,2 @@
+# From http://brick.kernel.dk/snaps/MD5SUMS
+md5	9a6ca62330c8adb0b6a4ea6cf8a55694	blktrace-1.1.0.tar.gz
diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
new file mode 100644
index 0000000..7687ade
--- /dev/null
+++ b/package/blktrace/blktrace.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# blktrace
+#
+################################################################################
+
+BLKTRACE_VERSION = 1.1.0
+BLKTRACE_SITE = http://brick.kernel.dk/snaps
+BLKTRACE_DEPENDENCIES = libaio
+BLKTRACE_LICENSE = GPLv2+
+BLKTRACE_LICENSE_FILES = COPYING
+
+define BLKTRACE_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define BLKTRACE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+		DESTDIR=$(TARGET_DIR) prefix=/usr
+endef
+
+$(eval $(generic-package))
