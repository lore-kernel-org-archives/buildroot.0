From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:33:06 +0200
Subject: [Buildroot] [git commit] tz: new package
Message-ID: <20140408224018.D08A99C63E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3345b04f827d38eb49e9648fc3e93dbb5c3de88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc can not use timezone info from tzdata as-is, but accepts setting
the local timezone in /etc/TZ.

[Peter: strip quotes/use local TZ_LOCALTIME variable]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: make it a blind package; little tweak to help text]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in    |    1 +
 package/tz/Config.in |    4 ++++
 package/tz/tz.mk     |   31 +++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f35e1c7..72d529c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -816,6 +816,7 @@ source "package/protobuf/Config.in"
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
index 0000000..a762acd
--- /dev/null
+++ b/package/tz/tz.mk
@@ -0,0 +1,31 @@
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
+TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
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
+	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
+	    cd $(TARGET_DIR)/etc;                                       \
+	    ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
+	fi
+endef
+
+$(eval $(generic-package))
