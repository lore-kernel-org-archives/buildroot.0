From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:19 +0100
Subject: [Buildroot] [PATCH v5 03/29] package/freeswitch: add optional
	dependency to libuuid
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-4-git-send-email-bernd.kuhls@t-online.de>
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
index f5c4fbe..24f5a5b 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -19,6 +19,10 @@ config BR2_PACKAGE_FREESWITCH
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
index 905f03a..694fcae 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -121,4 +121,8 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+FREESWITCH_DEPENDENCIES += util-linux
+endif
+
 $(eval $(autotools-package))
-- 
2.6.4
