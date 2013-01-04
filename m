From: Richard Braun <rbraun@sceen.net>
Date: Fri,  4 Jan 2013 14:06:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: new package
In-Reply-To: <20130104134155.4ff8f301@skate>
References: <20130104134155.4ff8f301@skate>
Message-ID: <1357304770-23310-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the time zone database, used by glibc for translations between
UTC and local time.

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 package/Config.in        |    1 +
 package/tzdata/Config.in |   24 ++++++++++++++++++++++++
 package/tzdata/tzdata.mk |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 package/tzdata/Config.in
 create mode 100644 package/tzdata/tzdata.mk

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
index 0000000..d219ae2
--- /dev/null
+++ b/package/tzdata/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_TZDATA
+	bool "tzdata"
+	help
+	  Time zone database
+
+	  http://www.iana.org/time-zones/repository/tz-link.html
+
+	  Note that this package is most useful for glibc-based systems, as
+	  uClibc doesn't support the format. Despite this, the time zone
+	  database can also be built on uClibc-based systems in case an
+	  application has specific support for it.
+
+config BR2_PACKAGE_TZDATA_ZONELIST
+	string "Time zone list"
+	depends on BR2_PACKAGE_TZDATA
+	default "default"
+	help
+	  Space-separated list of time zones to compile.
+
+	  The value "default" includes all commonly used time zones. Note
+	  that this set consumes around 5.5M.
+
+	  The full list is the list of files in the time zone database source,
+	  not including the build and .tab files.
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
new file mode 100644
index 0000000..5bcee85
--- /dev/null
+++ b/package/tzdata/tzdata.mk
@@ -0,0 +1,44 @@
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
+TZDATA_DEFAULT_ZONELIST = africa antarctica asia australasia backward etcetera \
+			europe factory northamerica pacificnew southamerica
+
+ifeq ($(call qstrip,$(BR2_PACKAGE_TZDATA_ZONELIST)),default)
+TZDATA_ZONELIST = $(TZDATA_DEFAULT_ZONELIST)
+else
+TZDATA_ZONELIST = $(call qstrip,$(BR2_PACKAGE_TZDATA_ZONELIST))
+endif
+
+# Don't strip any path components during extraction.
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
-- 
1.7.2.5
