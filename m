From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 May 2012 17:48:38 -0300
Subject: [Buildroot] [PATCH] ramspeed: new package
Message-ID: <1338324518-5281-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in            |    1 +
 package/ramspeed/Config.in   |    7 +++++++
 package/ramspeed/Makefile    |   14 ++++++++++++++
 package/ramspeed/ramspeed.mk |   28 ++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/ramspeed/Config.in
 create mode 100644 package/ramspeed/Makefile
 create mode 100644 package/ramspeed/ramspeed.mk

diff --git a/package/Config.in b/package/Config.in
index a3c92ec..4ddb865 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
+source "package/ramspeed/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
 source "package/stress/Config.in"
diff --git a/package/ramspeed/Config.in b/package/ramspeed/Config.in
new file mode 100644
index 0000000..b236329
--- /dev/null
+++ b/package/ramspeed/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RAMSPEED
+	bool "ramspeed"
+	help
+	  RAMspeed is a free open source command line utility
+	  to measure cache and memory performance.
+
+	  http://alasir.com/software/ramspeed/
diff --git a/package/ramspeed/Makefile b/package/ramspeed/Makefile
new file mode 100644
index 0000000..acb8cfd
--- /dev/null
+++ b/package/ramspeed/Makefile
@@ -0,0 +1,14 @@
+
+all: generic
+
+generic: ramspeed.c fltmem.c fltmark.c intmem.c intmark.c
+	$(CC) $(CFLAGS) $^ -o ramspeed
+
+i386: ramspeed.c i386/*.s i386/cpuinfo/*.s
+	$(CC) $(CFLAGS) -DI386_ASM $^ -o ramspeed
+
+x86_64: ramspeed.c amd64/*.s
+	$(CC) $(CFLAGS) -DAMD64_ASM $^ -o ramspeed
+
+clean:
+	rm -f *.o ramspeed
diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
new file mode 100644
index 0000000..ef48e30
--- /dev/null
+++ b/package/ramspeed/ramspeed.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# ramspeed
+#
+#############################################################
+
+RAMSPEED_VERSION = 2.6.0
+RAMSPEED_SITE = http://www.alasir.com/software/ramspeed
+
+ifeq ($(BR2_i386),y)
+RAMSPEED_ARCH = i386
+else
+ifeq ($(BR2_x864_64),y)
+RAMSPEED_ARCH = x86_64
+endif
+endif
+
+define RAMSPEED_BUILD_CMDS
+	cp -f package/ramspeed/Makefile $(@D); \
+	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		make -C $(@D) $(RAMSPEED_ARCH)
+endef
+
+define RAMSPEED_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/ramspeed $(TARGET_DIR)/usr/bin/ramspeed
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
