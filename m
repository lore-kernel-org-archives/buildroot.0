Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F07C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 18:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DE46128B;
	Tue, 22 Mar 2022 18:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7e-ZmKeylFH; Tue, 22 Mar 2022 18:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847EB61286;
	Tue, 22 Mar 2022 18:31:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9631BF9B2
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 18:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09A01418A0
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 18:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGhSjf2SdBk6 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 18:31:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8A9E4189C
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 18:31:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r7so11874150wmq.2
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8smFPdPnH5lQ4cBUemzcZdZy0Rdil71cFBg0F9mEZEM=;
 b=FN8QeGDT6LOhIc+AED2BYzVrXjlhBQUsEgK/+PeoFK8MXqToweF286SsxlWKlD5wHT
 E88hVaj0J6LQNNJz2el392T7avFGJi6zI4Hb3NfiA1NxGME9b8AdP8bzzSWaOcTmzO6I
 J4bzP6djw2np4Z67w+JKo8rAAbEx10ySxt0NC388W18UaQ3kYpadTlsMwDUWYyYUvkwo
 2P8XWFCI1NpUORBIvYk9ZRaZCPXoFCDzgrGJaVKKtnIseqDyeJjJwJnEZZmgc2zxPvIr
 ZwStpq+EyDUdWu40O1YyannnnVUyCC3hoZE/TzB+DsAY7u62+pDTCZJNNXqsYNE/b3mX
 KmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8smFPdPnH5lQ4cBUemzcZdZy0Rdil71cFBg0F9mEZEM=;
 b=UAjO3IUq0QvnB/2Ke/1wtrEAVkXgq+yqi/owDaa29wIuzu8lDCVpcdMEPNnvZ0fhDw
 hbFS5qI44IdDQbKouoM+CENzDWCVbxmTAxM2rMjUXl0hf2Le4HBE12n8+AHo7Bp5Jo5T
 AyJQpCJmk18u5H0uDr1HULtN0CiiqFxOCqXbEw89Sv+ey3ZhpA+3ciMzfutsgk36MHyt
 Bct7lwiqelHuVA0U776NJvRujcAm8NBG9uLcKB4hO2CqlmjE6QuI1KYygwd8x+Oele0p
 4F1wBe5hQpDPr+QOAliXxmnghN9EQ6dcrxMiQCi89cHLxRSHvYT8stV1blTgMZcamf+E
 9xNw==
X-Gm-Message-State: AOAM530my7lTGLVYigc1AWb0hbVDQLLFoVYbDAZ/R6+L7LbKWpakqx56
 EG+bwAkGmG9D8Tp8Wq6lW5IxkCFDfJI=
X-Google-Smtp-Source: ABdhPJw3MZgbZJGjLY1GY6dod/CsFLaTeoijsD5HtKIYdR+Li/DIT8RLOmuiQ6Mn5y/3q9FsR9EiXA==
X-Received: by 2002:a1c:e915:0:b0:37b:d847:e127 with SMTP id
 q21-20020a1ce915000000b0037bd847e127mr5204674wmc.180.1647973873845; 
 Tue, 22 Mar 2022 11:31:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm23803820wri.0.2022.03.22.11.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:31:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 19:29:46 +0100
Message-Id: <20220322182946.2446236-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: bump to version 2.1.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to new active fork:
  https://github.com/enzo1982/mp4v2/discussions/1
  https://github.com/TechSmith/mp4v2/commit/461abd2b1365e14ba28dd0e4a0cb6c3bee1bab41
- C++11 is not needed anymore thanks to
  https://github.com/enzo1982/mp4v2/commit/5a57bc2ce8948f6ffa96761286921ab3e2ebe467
- Drop patch (not needed since
  https://github.com/enzo1982/mp4v2/commit/23f8b907d4a221e1dae9e8b859cb6b1161206866)
- Update license (minor fix:
  https://github.com/enzo1982/mp4v2/commit/0c37402d9d3644ea0b7d55db1d901bfad9723dfc)
- Version 2.1.1 was never released before so no issue is expected
  (except a misunderstanding of users but new upstream is aware of this:
  https://github.com/enzo1982/mp4v2/discussions/1#discussioncomment-2399344)

https://github.com/enzo1982/mp4v2/releases/tag/v2.1.1
https://github.com/enzo1982/mp4v2/releases/tag/v2.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tatic-cast-to-unsigned-int-for-cases.patch | 99 -------------------
 package/mp4v2/Config.in                       |  8 +-
 package/mp4v2/mp4v2.hash                      |  4 +-
 package/mp4v2/mp4v2.mk                        |  5 +-
 4 files changed, 8 insertions(+), 108 deletions(-)
 delete mode 100644 package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch

diff --git a/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
deleted file mode 100644
index 6c9b13bed8..0000000000
--- a/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From a5ca35b044bbf13c0b16f0066bf24646604bb218 Mon Sep 17 00:00:00 2001
-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
-Date: Thu, 6 Aug 2020 15:22:04 +0200
-Subject: [PATCH] Static cast to unsigned int for cases
-
-Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
-[Retrieved from:
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libmp4v2/files/libmp4v2-2.0.0-unsigned-int-cast.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libutil/Utility.cpp  | 2 +-
- util/mp4art.cpp      | 2 +-
- util/mp4chaps.cpp    | 2 +-
- util/mp4file.cpp     | 2 +-
- util/mp4subtitle.cpp | 2 +-
- util/mp4track.cpp    | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/libutil/Utility.cpp b/libutil/Utility.cpp
-index 76cdd12..d6739d4 100644
---- a/libutil/Utility.cpp
-+++ b/libutil/Utility.cpp
-@@ -493,7 +493,7 @@ Utility::process_impl()
-         if( codes.find( code ) == codes.end() )
-             continue;
- 
--        switch( code ) {
-+        switch( static_cast<unsigned int>( code ) ) {
-             case 'z':
-                 _optimize = true;
-                 break;
-diff --git a/util/mp4art.cpp b/util/mp4art.cpp
-index add935e..6e7f531 100644
---- a/util/mp4art.cpp
-+++ b/util/mp4art.cpp
-@@ -376,7 +376,7 @@ ArtUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int> ( code ) ) {
-         case LC_ART_ANY:
-             _artFilter = numeric_limits<uint32_t>::max();
-             break;
-diff --git a/util/mp4chaps.cpp b/util/mp4chaps.cpp
-index 98400f8..ccc8b70 100644
---- a/util/mp4chaps.cpp
-+++ b/util/mp4chaps.cpp
-@@ -632,7 +632,7 @@ ChapterUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int> ( code ) ) {
-         case 'A':
-         case LC_CHPT_ANY:
-             _ChapterType = MP4ChapterTypeAny;
-diff --git a/util/mp4file.cpp b/util/mp4file.cpp
-index c27844b..b127cd1 100644
---- a/util/mp4file.cpp
-+++ b/util/mp4file.cpp
-@@ -189,7 +189,7 @@ FileUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int>( code ) ) {
-         case LC_LIST:
-             _action = &FileUtility::actionList;
-             break;
-diff --git a/util/mp4subtitle.cpp b/util/mp4subtitle.cpp
-index 7462153..19d977d 100644
---- a/util/mp4subtitle.cpp
-+++ b/util/mp4subtitle.cpp
-@@ -164,7 +164,7 @@ SubtitleUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int>( code ) ) {
-         case LC_LIST:
-             _action = &SubtitleUtility::actionList;
-             break;
-diff --git a/util/mp4track.cpp b/util/mp4track.cpp
-index d550506..cd63d7e 100644
---- a/util/mp4track.cpp
-+++ b/util/mp4track.cpp
-@@ -788,7 +788,7 @@ TrackUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int>( code ) ) {
-         case LC_TRACK_WILDCARD:
-             _trackMode = TM_WILDCARD;
-             break;
--- 
-2.28.0
-
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 00e80cd358..705a8c9d24 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_MP4V2
 	bool "mp4v2"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	help
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
 
-	  https://github.com/TechSmith/mp4v2/
+	  https://mp4v2.org/
 
 if BR2_PACKAGE_MP4V2
 
@@ -19,6 +18,5 @@ config BR2_PACKAGE_MP4V2_UTIL
 
 endif
 
-comment "mp4v2 needs a toolchain w/ C++, gcc >= 5"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+comment "mp4v2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index 7aa5402c8f..d3f0243650 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de31e430e2641f25b67d10c47b0cda35279881b0196120e33bcd71b9cef1bd58  mp4v2-5.0.1.tar.gz
-sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
+sha256  29420c62e56a2e527fd8979d59d05ed6d83ebe27e0e2c782c1ec19a3a402eaee  mp4v2-2.1.1.tar.bz2
+sha256  7187891a4c39ee9e7ec70c71fc7dc8b8ed02c6f56ae1ffc017a34ac66dca5390  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 6d29228a13..7de837c170 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 5.0.1
+MP4V2_VERSION = 2.1.1
 MP4V2_SITE = \
-	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
+	https://github.com/enzo1982/mp4v2/releases/download/v$(MP4V2_VERSION)
+MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
 MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
