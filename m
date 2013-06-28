From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 28 Jun 2013 18:40:26 +0800
Subject: [Buildroot]  [PATCH] ramspeed/smp: new package
Message-ID: <1372416026-7582-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new package: ramspeed/smp

RAMspeed/SMP, a cache and memory benchmarking tool
(for multiprocessor machines running UNIX-like operating systems)

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 package/Config.in        |    1 +
 package/ramsmp/Config.in |    7 +++++++
 package/ramsmp/Makefile  |   14 ++++++++++++++
 package/ramsmp/ramsmp.mk |   20 ++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/ramsmp/Config.in
 create mode 100644 package/ramsmp/Makefile
 create mode 100644 package/ramsmp/ramsmp.mk

diff --git a/package/Config.in b/package/Config.in
index 8a29c99..20dd41e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -40,6 +40,7 @@ source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/perf/Config.in"
 source "package/ramspeed/Config.in"
+source "package/ramsmp/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
 source "package/stress/Config.in"
diff --git a/package/ramsmp/Config.in b/package/ramsmp/Config.in
new file mode 100644
index 0000000..c379bb1
--- /dev/null
+++ b/package/ramsmp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RAMSMP
+	bool "ramspeed/smp"
+	help
+	  RAMspeed/SMP is a free open source command line utility
+	  to measure cache and memory performance of multiprocessor machines.
+
+	  http://alasir.com/software/ramspeed/
diff --git a/package/ramsmp/Makefile b/package/ramsmp/Makefile
new file mode 100644
index 0000000..5cd76e0
--- /dev/null
+++ b/package/ramsmp/Makefile
@@ -0,0 +1,14 @@
+
+all: generic
+
+generic: ramsmp.c fltmem.c fltmark.c intmem.c intmark.c
+	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o ramsmp
+
+i386: ramsmp.c i386/*.s i386/cpuinfo/*.s
+	$(CC) $(CFLAGS) -DI386_ASM $(LDFLAGS) $^ -o ramsmp
+
+x86_64: ramsmp.c amd64/*.s
+	$(CC) $(CFLAGS) -DAMD64_ASM $(LDFLAGS) $^ -o ramsmp
+
+clean:
+	rm -f *.o ramsmp
diff --git a/package/ramsmp/ramsmp.mk b/package/ramsmp/ramsmp.mk
new file mode 100644
index 0000000..1b44402
--- /dev/null
+++ b/package/ramsmp/ramsmp.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# ramsmp
+#
+#############################################################
+
+RAMSMP_VERSION = 3.5.0
+RAMSMP_SITE = http://www.alasir.com/software/ramspeed
+RAMSMP_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
+
+define RAMSMP_BUILD_CMDS
+	cp -f package/ramsmp/Makefile $(@D)
+	$(TARGET_CONFIGURE_OPTS) make -C $(@D) $(RAMSMP_ARCH)
+endef
+
+define RAMSMP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/ramsmp $(TARGET_DIR)/usr/bin/ramsmp
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
