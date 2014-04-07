From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:07 +0200
Subject: [Buildroot] [PATCH 5/6] tz: new package
In-Reply-To: <cover.1396900553.git.yann.morin.1998@free.fr>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <9cca87f955e4a184666ee5e6a83e4ee242b0ebc7.1396900553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre Belloni <alexandre.belloni@free-electrons.com>

uClibc can not use timezone info from tzdata as-is, but accepts setting
the local timezone in /etc/TZ.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: make it a blind package; little tweak to help text]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in    |  1 +
 package/tz/Config.in |  4 ++++
 package/tz/tz.mk     | 30 ++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/tz/Config.in
 create mode 100644 package/tz/tz.mk

diff --git a/package/Config.in b/package/Config.in
index cc28d51..5cec558 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -815,6 +815,7 @@ source "package/protobuf/Config.in"
 source "package/protobuf-c/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
+source "package/tz/Config.in"
 source "package/tzdata/Config.in"
 endmenu
 
diff --git a/package/tz/Config.in b/package/tz/Config.in
new file mode 100644
index 0000000..943dc5c
--- /dev/null
+++ b/package/tz/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_TZ
+	bool
+	help
+	  Timezone info for uClibc.
diff --git a/package/tz/tz.mk b/package/tz/tz.mk
new file mode 100644
index 0000000..e74c41b
--- /dev/null
+++ b/package/tz/tz.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# tz
+#
+################################################################################
+
+TZ_SOURCE =
+TZ_DEPENDENCIES = host-tzdata host-tzdump
+TZ_LICENSE = Public domain
+
+define TZ_BUILD_CMDS
+	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
+		for i in $$(find . -type f); do                    \
+			mkdir -p $(@D)/output/$$(dirname $$i);         \
+			$(TZDUMP) -p . -q $${i#./} > $(@D)/output/$$i; \
+		done                                               \
+	)
+endef
+
+define TZ_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
+	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
+	if [ -n "$(BR2_TARGET_LOCALTIME)" ]; then                     \
+		ln -sf /usr/share/zoneinfo/uclibc/$(BR2_TARGET_LOCALTIME) \
+			$(TARGET_DIR)/etc/TZ;                                 \
+	fi
+
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
