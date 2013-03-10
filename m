From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 23:37:04 +0100
Subject: [Buildroot] [git commit] package/tzdata: new package
Message-ID: <20130310223947.9D3909AFF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ca9e06f1c9a5ef12feb63711a48379c0eae7e42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the time zone database, used by glibc for translations between
UTC and local time.

Signed-off-by: Richard Braun <rbraun@sceen.net>
[yann.morin.1998 at free.fr: use global ZIC, install posix TZ only once]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/tzdata/Config.in |   20 ++++++++++++++++++++
 package/tzdata/tzdata.mk |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0ba7762..a65054c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -570,6 +570,7 @@ source "package/protobuf/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/liblog4c-localtime/Config.in"
+source "package/tzdata/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
new file mode 100644
index 0000000..4e68a97
--- /dev/null
+++ b/package/tzdata/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_TZDATA
+	bool "tzdata"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
+	help
+	  Time zone database
+
+	  http://www.iana.org/time-zones/repository/tz-link.html
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
index 0000000..04d9b27
--- /dev/null
+++ b/package/tzdata/tzdata.mk
@@ -0,0 +1,46 @@
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
+			$(ZIC) -d _output/posix -y yearistype.sh $$zone; \
+			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
+		done; \
+	)
+endef
+
+define TZDATA_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
+	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
+	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
+	for zone in posix/*; do                 \
+	    ln -sfn "$${zone}" "$${zone##*/}";    \
+	done
+endef
+
+$(eval $(generic-package))
