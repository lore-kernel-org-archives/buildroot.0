Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DFEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5875A40A65;
	Mon, 21 Mar 2022 21:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjHg7UAnBMyj; Mon, 21 Mar 2022 21:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AECEE40A68;
	Mon, 21 Mar 2022 21:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA3B1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B03A8124F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzhsGR_iz4y9 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:13:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 871E181000
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2FDA284D85; Mon, 21 Mar 2022 21:04:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:08:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee860ce3dc3dada4ee4af41dd0d0eee7c0489a28
X-Git-Newrev: 585cf07e905dc61118bcdc15b49762f6aa0230a9
X-Patchwork-Hint: ignore
Message-Id: <20220321210440.2FDA284D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump to version 1.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6955954603723018807=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6955954603723018807==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=585cf07e905dc61118bcdc15b49762f6aa0230a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch wich is included in the new version.

Also recreate config.xml by building and running Gerbera using:

```
~/buildroot/output/target/usr/bin/gerbera --create-config > package/gerbera/config.xml
```

Note, that Gerbera sets the `<home>` parameter to the runtime user's home by
default when generating the script. This is not appropriate when running Gerbera
on an embedded Linux system as we usually do not have multiple users or even
users at all. Therefore, we set the home directory to /var/lib/gerbera`.

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gerbera/0001-Fix-for-fmt-8-0.patch | 44 -----------------------
 package/gerbera/config.xml                 | 58 +++++++++++++++++++++++++-----
 package/gerbera/gerbera.hash               |  2 +-
 package/gerbera/gerbera.mk                 |  2 +-
 4 files changed, 51 insertions(+), 55 deletions(-)

diff --git a/package/gerbera/0001-Fix-for-fmt-8-0.patch b/package/gerbera/0001-Fix-for-fmt-8-0.patch
deleted file mode 100644
index c4419209a5..0000000000
--- a/package/gerbera/0001-Fix-for-fmt-8-0.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 82d84ac5e62c23e717198fc7b2ef190ff95e70d1 Mon Sep 17 00:00:00 2001
-From: kyak <bas@bmail.ru>
-Date: Wed, 12 Jan 2022 19:41:37 +0300
-Subject: [PATCH] Fix for fmt > 8.0
-
-[Retrieved from:
-https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/util/logger.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/util/logger.h b/src/util/logger.h
-index 58696e52f..ba64afa79 100644
---- a/src/util/logger.h
-+++ b/src/util/logger.h
-@@ -32,7 +32,9 @@
- #ifndef __LOGGER_H__
- #define __LOGGER_H__
- 
-+#include <fmt/format.h>
- #include <spdlog/spdlog.h>
-+#include <type_traits>
- 
- #define log_debug SPDLOG_DEBUG
- #define log_info SPDLOG_INFO
-@@ -40,4 +42,17 @@
- #define log_error SPDLOG_ERROR
- #define log_js SPDLOG_INFO
- 
-+#if FMT_VERSION >= 80100
-+template <typename T>
-+struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
-+    : formatter<std::underlying_type_t<T>> {
-+    template <typename FormatContext>
-+    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
-+    {
-+        return fmt::formatter<std::underlying_type_t<T>>::format(
-+            static_cast<std::underlying_type_t<T>>(value), ctx);
-+    }
-+};
-+#endif
-+
- #endif // __LOGGER_H__
diff --git a/package/gerbera/config.xml b/package/gerbera/config.xml
index 30d70e21f7..e6261f25d0 100644
--- a/package/gerbera/config.xml
+++ b/package/gerbera/config.xml
@@ -1,7 +1,7 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <config version="2" xmlns="http://mediatomb.cc/config/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
   <!--
-     See http://gerbera.io or read the docs for more
+     See https://gerbera.io or read the docs for more
      information on creating and using config.xml configuration files.
     -->
   <server>
@@ -11,7 +11,7 @@
       </accounts>
     </ui>
     <name>Gerbera</name>
-    <udn>uuid:ac20d9b6-5c82-48e6-80de-436965fbe1d7</udn>
+    <udn>uuid:7b156a2a-d79e-4763-983b-ae1d13fe0ff4</udn>
     <home>/var/lib/gerbera</home>
     <webroot>/usr/share/gerbera/web</webroot>
     <!--
@@ -23,12 +23,20 @@
         the value configured here. Ex: A value of 62 will result
         in an SSDP advertisement being sent every second.
     -->
-    <alive>1800</alive>
+    <alive>180</alive>
     <storage>
       <sqlite3 enabled="yes">
         <database-file>gerbera.db</database-file>
       </sqlite3>
     </storage>
+    <containers enabled="yes">
+      <container location="/LastAdded" title="Recently Added" sort="-last_updated">
+        <filter>upnp:class derivedfrom "object.item" and last_updated &gt; "@last7"</filter>
+      </container>
+      <container location="/LastModified" title="Recently Modified" sort="-last_modified">
+        <filter>upnp:class derivedfrom "object.item" and last_modified &gt; "@last7"</filter>
+      </container>
+    </containers>
     <extended-runtime-options>
       <mark-played-items enabled="no" suppress-cds-updates="yes">
         <string mode="prepend">*</string>
@@ -45,12 +53,15 @@
     <mappings>
       <extension-mimetype ignore-unknown="no">
         <map from="asf" to="video/x-ms-asf" />
-        <map from="asx" to="video/x-ms-asf" />
-        <map from="dff" to="audio/x-dsd" />
-        <map from="dsf" to="audio/x-dsd" />
+        <map from="asx" to="video/x-ms-asx" />
+        <map from="dff" to="audio/x-dff" />
+        <map from="dsd" to="audio/x-dsd" />
+        <map from="dsf" to="audio/x-dsf" />
         <map from="flv" to="video/x-flv" />
         <map from="m2ts" to="video/mp2t" />
         <map from="m3u" to="audio/x-mpegurl" />
+        <map from="m3u8" to="audio/x-mpegurl" />
+        <map from="m4a" to="audio/mp4" />
         <map from="mka" to="audio/x-matroska" />
         <map from="mkv" to="video/x-matroska" />
         <map from="mp3" to="audio/mpeg" />
@@ -98,14 +109,42 @@
         <treat mimetype="audio/x-wav" as="pcm" />
         <treat mimetype="audio/x-wavpack" as="wv" />
         <treat mimetype="image/jpeg" as="jpg" />
+        <treat mimetype="image/png" as="png" />
+        <treat mimetype="video/mkv" as="mkv" />
         <treat mimetype="video/mp4" as="mp4" />
+        <treat mimetype="video/mpeg" as="mpeg" />
         <treat mimetype="video/x-matroska" as="mkv" />
+        <treat mimetype="video/x-mkv" as="mkv" />
+        <treat mimetype="video/x-ms-asf" as="asf" />
+        <treat mimetype="video/x-ms-asx" as="playlist" />
         <treat mimetype="video/x-msvideo" as="avi" />
       </mimetype-contenttype>
+      <mimetype-dlnatransfermode>
+        <map from="application/ogg" to="Streaming" />
+        <map from="application/x-srt" to="Background" />
+        <map from="audio/*" to="Streaming" />
+        <map from="image/*" to="Interactive" />
+        <map from="srt" to="Background" />
+        <map from="text/*" to="Background" />
+        <map from="video/*" to="Streaming" />
+      </mimetype-dlnatransfermode>
+      <contenttype-dlnaprofile>
+        <map from="asf" to="VC_ASF_AP_L2_WMA" />
+        <map from="avi" to="AVI" />
+        <map from="dsd" to="DSF" />
+        <map from="flac" to="FLAC" />
+        <map from="jpg" to="JPEG_LRG" />
+        <map from="mka" to="MKV" />
+        <map from="mkv" to="MKV" />
+        <map from="mp3" to="MP3" />
+        <map from="mp4" to="AVC_MP4_EU" />
+        <map from="mpeg" to="MPEG_PS_PAL" />
+        <map from="ogg" to="OGG" />
+        <map from="pcm" to="LPCM" />
+        <map from="png" to="PNG_LRG" />
+        <map from="wma" to="WMAFULL" />
+      </contenttype-dlnaprofile>
     </mappings>
-    <online-content>
-      <AppleTrailers enabled="no" refresh="43200" update-at-start="no" resolution="640" />
-    </online-content>
   </import>
   <transcoding enabled="no">
     <mimetype-profile-mappings>
@@ -133,3 +172,4 @@
     </profiles>
   </transcoding>
 </config>
+
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 5dcd364c33..89ac9ad55a 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dee562cc5d22e8442e2fe1620b073bda612c80f9c4a8333311c647db06c1c4cd  gerbera-1.9.2.tar.gz
+sha256  bd6c7b2c6380e2e265a998bbc0df9eec14b9c6a65bc91e7f2c0ae0b67fd0c9cf  gerbera-1.10.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index ab49f661ac..6acdfb86ac 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.9.2
+GERBERA_VERSION = 1.10.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md

--===============6955954603723018807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6955954603723018807==--
