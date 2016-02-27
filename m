From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:26:53 +0100
Subject: [Buildroot] [PATCH/next v9 03/28] package/freeswitch: add optional
	dependency to libuuid
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/Config.in     | 4 ++++
 package/freeswitch/freeswitch.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index b52d469..a641008 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -10,6 +10,10 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_SQLITE
+	# "libuuid development package highly recommended!"
+	# https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/build/config/uuid.m4#9
+	select BR2_PACKAGE_UTIL_LINUX if BR2_USE_WCHAR
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID if BR2_USE_WCHAR
 	select BR2_PACKAGE_ZLIB
 	help
 	  FreeSWITCH is a scalable open source cross-platform telephony
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 3172ba8..b3e0784 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -158,4 +158,8 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+FREESWITCH_DEPENDENCIES += util-linux
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0
