From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:47 +0200
Subject: [Buildroot] [PATCH 04/23] package/kodi-inputstream-rtmp: add
 explicit dependencies to openssl and zlib
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openssl and zlib are built as hard-dependencies of Kodi already. For the
case that Kodi drops these dependencies we need to make sure that this
package still finds its dependencies:
https://github.com/xbmc/inputstream.rtmp/blob/Leia/CMakeLists.txt#L8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-rtmp/Config.in                | 2 ++
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi-inputstream-rtmp/Config.in b/package/kodi-inputstream-rtmp/Config.in
index fa83926301..c4bd2e1380 100644
--- a/package/kodi-inputstream-rtmp/Config.in
+++ b/package/kodi-inputstream-rtmp/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
 	bool "kodi-inputstream-rtmp"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_RTMPDUMP
+	select BR2_PACKAGE_ZLIB
 	help
 	  RTMP input stream add-on for Kodi
 
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index e850be40ff..a30f2e61db 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -8,6 +8,6 @@ KODI_INPUTSTREAM_RTMP_VERSION = 2.0.9-Leia
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = debian/copyright
-KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
+KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi openssl rtmpdump zlib
 
 $(eval $(cmake-package))
-- 
2.26.2
