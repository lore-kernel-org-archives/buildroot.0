From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 03:05:08 -0500
Subject: [Buildroot] [PATCH] irda-utils: new package for IrDA devices
Message-ID: <1290240308-9109-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Config.in                                 |    1 +
 package/irda-utils/Config.in                      |   19 ++++++++
 package/irda-utils/irda-utils-0.9.18-daemon.patch |   26 +++++++++++
 package/irda-utils/irda-utils-0.9.18-nommu.patch  |   14 ++++++
 package/irda-utils/irda-utils-0.9.18-subdir.patch |   16 +++++++
 package/irda-utils/irda-utils.mk                  |   47 +++++++++++++++++++++
 6 files changed, 123 insertions(+), 0 deletions(-)
 create mode 100644 package/irda-utils/Config.in
 create mode 100644 package/irda-utils/irda-utils-0.9.18-daemon.patch
 create mode 100644 package/irda-utils/irda-utils-0.9.18-nommu.patch
 create mode 100644 package/irda-utils/irda-utils-0.9.18-subdir.patch
 create mode 100644 package/irda-utils/irda-utils.mk

diff --git a/package/Config.in b/package/Config.in
index bd348a4..f445f69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -175,6 +175,7 @@ source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
 source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
+source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lsuio/Config.in"
diff --git a/package/irda-utils/Config.in b/package/irda-utils/Config.in
new file mode 100644
index 0000000..418ab61
--- /dev/null
+++ b/package/irda-utils/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_IRDA_UTILS
+	bool "irda-utils"
+	help
+	  user space utilities which control the IrDA stack
+
+	  http://irda.sourceforge.net/
+
+if BR2_PACKAGE_IRDA_UTILS
+
+config BR2_PACKAGE_IRDA_UTILS_IRATTACH
+	bool "irattach"
+
+config BR2_PACKAGE_IRDA_UTILS_IRDAPING
+	bool "irdaping"
+
+config BR2_PACKAGE_IRDA_UTILS_IRNETD
+	bool "irnetd"
+
+endif
diff --git a/package/irda-utils/irda-utils-0.9.18-daemon.patch b/package/irda-utils/irda-utils-0.9.18-daemon.patch
new file mode 100644
index 0000000..5ff9f38
--- /dev/null
+++ b/package/irda-utils/irda-utils-0.9.18-daemon.patch
@@ -0,0 +1,26 @@
+--- a/irattach/util.c
++++ b/irattach/util.c
+@@ -156,21 +156,10 @@
+ 
+ void fork_now(int ttyfd)
+ {
+-	int ret;
+ 	int i;
+ 
+-	if ((ret = fork()) > 0)
+-		exit(0);
+-	
+-	if (ret == -1)
+-		syslog(LOG_INFO, "forking: %m");
+-	if (setsid() < 0)
+-		syslog(LOG_INFO, "detaching from tty: %m");
+-
+-	if ((ret = fork()) > 0) {
+-		/* cleanup_files = 0; */
+-		exit(0);
+-	}
++	if (daemon(1, 1))
++		syslog(LOG_INFO, "daemon: %m");
+ 
+ 	/* Close all open inherited files! Except for ttyfd! */
+ 	for (i = 0; i < 64; i++)
diff --git a/package/irda-utils/irda-utils-0.9.18-nommu.patch b/package/irda-utils/irda-utils-0.9.18-nommu.patch
new file mode 100644
index 0000000..f06347b
--- /dev/null
+++ b/package/irda-utils/irda-utils-0.9.18-nommu.patch
@@ -0,0 +1,14 @@
+--- a/irattach/irattach.c
++++ b/irattach/irattach.c
+@@ -397,7 +397,11 @@
+ 					after_names[i]);
+ 				/* Create a new instance for this other
+ 				 * interface */
++#ifdef NO_FORK
++				pid = -1;
++#else
+ 				pid = fork();
++#endif
+ 				/* If in the child */
+ 				if(!pid) {
+ 					/* Get the interface name */
diff --git a/package/irda-utils/irda-utils-0.9.18-subdir.patch b/package/irda-utils/irda-utils-0.9.18-subdir.patch
new file mode 100644
index 0000000..9aa8f70
--- /dev/null
+++ b/package/irda-utils/irda-utils-0.9.18-subdir.patch
@@ -0,0 +1,16 @@
+--- a/Makefile
++++ b/Makefile
+@@ -31,11 +31,11 @@
+ CFLAGS= -O2 -W -Wall
+ 
+ all:
+-	@-(set -e ; for d in $(DIRS) ; do $(MAKE) $(MAKE_OUTPUT) -C $$d $@ ; done)
++	@(set -e ; for d in $(DIRS) ; do $(MAKE) $(MAKE_OUTPUT) -C $$d $@ ; done)
+ 
+ 
+ install:
+-	@-(set -e ; for d in $(DIRS) ; do $(MAKE) $(MAKE_OUTPUT) -C $$d $@ ; done)
++	@(set -e ; for d in $(DIRS) ; do $(MAKE) $(MAKE_OUTPUT) -C $$d $@ ; done)
+ 
+ 
+ clean:
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
new file mode 100644
index 0000000..fb36d85
--- /dev/null
+++ b/package/irda-utils/irda-utils.mk
@@ -0,0 +1,47 @@
+#############################################################
+#
+# irda-utils
+#
+#############################################################
+
+IRDA_UTILS_VERSION = 0.9.18
+IRDA_UTILS_SOURCE = irda-utils-$(IRDA_UTILS_VERSION).tar.gz
+IRDA_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/irda
+
+IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
+ifeq ($(BR2_USE_MMU),)
+IRDA_UTILS_CFLAGS += -DNO_FORK=1
+endif
+
+define IRDA_UTILS_BUILD_CMDS
+	$(MAKE) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(IRDA_UTILS_CFLAGS)" \
+		SYS_INCLUDES= \
+		DIRS="irattach irdaping irnetd" \
+		V=1 -C $(@D)
+endef
+
+define IRDA_UTILS_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+IRDA_UTILS_SBINS-  =
+IRDA_UTILS_SBINS-y =
+IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRATTACH) += irattach
+IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRDAPING) += irdaping
+IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRNETD)   += irnetd
+IRDA_UTILS_SBINS- += $(IRDA_UTILS_SBINS-y)
+
+define IRDA_UTILS_INSTALL_TARGET_CMDS
+	set -e; \
+	for sbin in $(IRDA_UTILS_SBINS-y); do \
+		$(INSTALL) -D $(@D)/*/$$sbin $(TARGET_DIR)/usr/sbin/$$sbin; \
+	done
+endef
+
+define IRDA_UTILS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(IRDA_UTILS_SBINS-))
+endef
+
+$(eval $(call GENTARGETS,package,irda-utils))
-- 
1.7.3.2
