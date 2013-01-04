From: Richard Braun <rbraun@sceen.net>
Date: Fri,  4 Jan 2013 12:48:44 +0100
Subject: [Buildroot] [PATCH] packages: add tzdata
Message-ID: <1357300124-7011-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The time zone database can be used by glibc (and potentially other
applications) to offset UTC time and translate it according to
additional rules, such as zone boundaries and daylight-saving time.

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 package/Config.in                      |    1 +
 package/tzdata/Config.in               |    8 +++++++
 package/tzdata/tzdata.mk               |   37 ++++++++++++++++++++++++++++++++
 package/zic/zic-fix-dependencies.patch |   25 +++++++++++++++++++++
 package/zic/zic.mk                     |   26 ++++++++++++++++++++++
 5 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 package/tzdata/Config.in
 create mode 100644 package/tzdata/tzdata.mk
 create mode 100644 package/zic/zic-fix-dependencies.patch
 create mode 100644 package/zic/zic.mk

diff --git a/package/Config.in b/package/Config.in
index 2cbadf4..99bb724 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -540,6 +540,7 @@ source "package/protobuf/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/liblog4c-localtime/Config.in"
+source "package/tzdata/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
new file mode 100644
index 0000000..cd4f818
--- /dev/null
+++ b/package/tzdata/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TZDATA
+	bool "tzdata"
+	help
+	  Time zone database
+
+	  http://www.iana.org/time-zones/repository/tz-link.html
+
+	  Note that uClibc doesn't support this database.
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
new file mode 100644
index 0000000..5995c24
--- /dev/null
+++ b/package/tzdata/tzdata.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# tzdata
+#
+#############################################################
+
+TZDATA_VERSION = 2012j
+TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
+TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
+TZDATA_DEPENDENCIES = host-zic
+TZDATA_LICENSE = Public domain
+
+TZDATA_ZIC = $(HOST_DIR)/usr/sbin/zic
+TZDATA_ZONELIST = africa antarctica asia australasia backward etcetera \
+			europe factory northamerica pacificnew southamerica
+
+define TZDATA_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
+		| $(TAR) --strip-components=0 -C $(@D) -xf -
+endef
+
+define TZDATA_BUILD_CMDS
+	(cd $(@D); \
+		for zone in $(TZDATA_ZONELIST); do \
+			$(TZDATA_ZIC) -d _output -y yearistype.sh $$zone; \
+			$(TZDATA_ZIC) -d _output/posix -y yearistype.sh $$zone; \
+			$(TZDATA_ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
+		done; \
+	)
+endef
+
+define TZDATA_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
+	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
+endef
+
+$(eval $(generic-package))
diff --git a/package/zic/zic-fix-dependencies.patch b/package/zic/zic-fix-dependencies.patch
new file mode 100644
index 0000000..e67c5eb
--- /dev/null
+++ b/package/zic/zic-fix-dependencies.patch
@@ -0,0 +1,25 @@
+From 087046dc38cfa4fa429317cc5db4c9bfaaaedc64 Mon Sep 17 00:00:00 2001
+From: Richard Braun <rbraun@sceen.net>
+Date: Fri, 4 Jan 2013 10:57:24 +0100
+Subject: [PATCH] fix zic dependencies
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d76a81e..30df7dc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -349,7 +349,7 @@ version.h:
+ zdump:		$(TZDOBJS)
+ 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZDOBJS) $(LDLIBS)
+ 
+-zic:		$(TZCOBJS) yearistype
++zic:		$(TZCOBJS)
+ 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZCOBJS) $(LDLIBS)
+ 
+ yearistype:	yearistype.sh
+-- 
+1.7.2.5
+
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
new file mode 100644
index 0000000..d2d5c7d
--- /dev/null
+++ b/package/zic/zic.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# zic
+#
+#############################################################
+
+ZIC_VERSION = 2012j
+ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
+ZIC_SITE = http://www.iana.org/time-zones/repository/releases
+ZIC_LICENSE = Public domain
+
+define HOST_ZIC_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(ZIC_SOURCE) \
+		| $(TAR) --strip-components=0 -C $(@D) -xf -
+endef
+
+define HOST_ZIC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
+endef
+
+define HOST_ZIC_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/sbin
+	install -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.2.5
