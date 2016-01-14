From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:39:44 +0100
Subject: [Buildroot] [PATCH v6 03/29] package/freeswitch: add optional
	dependency to libuuid
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-4-git-send-email-bernd.kuhls@t-online.de>
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
index dcbb06a..68907f4 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -20,6 +20,10 @@ config BR2_PACKAGE_FREESWITCH
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
index 9c64cf2..4d046b8 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -135,4 +135,8 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+FREESWITCH_DEPENDENCIES += util-linux
+endif
+
 $(eval $(autotools-package))
-- 
2.6.4
