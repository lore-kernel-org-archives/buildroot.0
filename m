From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
Date: Tue, 25 Oct 2016 23:48:26 +0200
Subject: [Buildroot] [PATCH 1/1] tzdata: Improve right/posix installation
Message-ID: <20161025214826.17275-1-mylene.josserand@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Improve the right/posix timezone installation by creating new options
to choose between these two versions. As one version is necessary, the
default one is posix.
Now, the user can install both versions or one of both. It reduces the
image size when only one version is needed.

Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>
---
 package/tzdata/tzdata.mk | 26 ++++++++++++++++++++------
 system/Config.in         | 15 +++++++++++++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index de7d1be..d1ed21c 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -32,10 +32,20 @@ TZDATA_EXTRACT_CMDS =
 define TZDATA_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
 	cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
-	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
-	for zone in posix/*; do                 \
-	    ln -sfn "$${zone}" "$${zone##*/}";  \
-	done
+	cd $(TARGET_DIR)/usr/share/zoneinfo;     \
+	if [ -n "$(BR2_TARGET_TZ_POSIX)" ]; then \
+		for zone in posix/*; do \
+			ln -sfn "$${zone}" "$${zone##*/}"; \
+		done \
+	fi;
+	# If "right" is the only version enabled
+	cd $(TARGET_DIR)/usr/share/zoneinfo; \
+	if [ -n "$(BR2_TARGET_TZ_RIGHT)" ] && [ -z "$(BR2_TARGET_TZ_POSIX)" ]; then \
+		for zone in right/*; do \
+			ln -sfn "$${zone}" "$${zone##*/}"; \
+		done \
+	fi;
+
 	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
 	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
 	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
@@ -51,8 +61,12 @@ endef
 define HOST_TZDATA_BUILD_CMDS
 	(cd $(@D); \
 		for zone in $(TZDATA_ZONELIST); do \
-			$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
-			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
+			if [ -n "$(BR2_TARGET_TZ_POSIX)" ]; then \
+				$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
+			fi; \
+			if [ -n "$(BR2_TARGET_TZ_RIGHT)" ]; then \
+				$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
+			fi; \
 		done; \
 	)
 endef
diff --git a/system/Config.in b/system/Config.in
index f9a3bda..dcc9f6b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -429,6 +429,7 @@ config BR2_TARGET_TZ_INFO
 	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_TARGET_TZ_POSIX if ! BR2_TARGET_TZ_RIGHT
 	help
 	  Say 'y' here to install timezone info.
 
@@ -461,6 +462,20 @@ config BR2_TARGET_LOCALTIME
 	  If empty, no local time will be set, and the dates will be
 	  expressed in UTC.
 
+config BR2_TARGET_TZ_POSIX
+	tristate "Install the Posix timezone"
+	help
+	  The time zone can be provided by two versions : a posix and a right version.
+	  The "posix" version is based on the Coordinated Universal Time (UTC).
+	  This is the default one.
+
+config BR2_TARGET_TZ_RIGHT
+	tristate "Install the Right timezone"
+	help
+	  The time zone can be provided by two versions : a posix and a right version.
+	  The "right" version is based on the International Atomic Time (TAI) and
+	  includes the leap seconds.
+
 endif # BR2_TARGET_TZ_INFO
 
 config BR2_ROOTFS_USERS_TABLES
-- 
2.9.3
