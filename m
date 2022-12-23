Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7834C4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 15:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57D9D606E7;
	Fri, 23 Dec 2022 15:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D9D606E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9iAKuufMxq0; Fri, 23 Dec 2022 15:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BC9606EC;
	Fri, 23 Dec 2022 15:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BC9606EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2591BF5E6
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 15:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F45402E7
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 15:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F45402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5loT_p7zl_pB for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 15:24:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCB244011D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCB244011D
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 15:24:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso120277wms.5
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 07:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SpLb7j57dWy1hGmtpRscBAbjUWo0iYo2FhdX7k1GZeQ=;
 b=gQm3286C1+JWcLimCnry2vyuH149QT+QE5XzfJWq0QIkqhD7sWst5y/vmHiRavF6+4
 Cs6l4o/TNP4wxdvJbFlZeAcpzw/a0mSUADW6tST3lpSrdrRjJ6U2J/b17YDEXoda03Ev
 rB+ncuufzFkUfMSoA7CDum+Og7mathIBbY6swxv+KmvNphlOL1E71DN/UaC5nncuVrf2
 IS0sz5FCc0PM5rIjJMb01JeSChFTRApARNvyssb+S2nqSC1C5M2145C2fhDirG35ohvI
 wZpL92q3eF1JWapoZQTS3yk8GUGh4RLn9pwomRma9YNSU9GdoDxlA7Hlgdr1MSxtnkxt
 CPbA==
X-Gm-Message-State: AFqh2kq1ObzyWPhjeGqE9k4MdhqczsQ8iz7+8OHN2rHAI9TkN4kwsIa1
 U2oYvcAV5i1H9Cpt4YEC1pLBAXRCWM0=
X-Google-Smtp-Source: AMrXdXvapZ7cNBH7GngRQtpF/GjBnoAZvv5dL6WN0PbBaXD7tzVzQjVY6g2JXwZrcclLVJTCzAFL2g==
X-Received: by 2002:a05:600c:1f15:b0:3cf:98e5:f72 with SMTP id
 bd21-20020a05600c1f1500b003cf98e50f72mr10224152wmb.3.1671809045571; 
 Fri, 23 Dec 2022 07:24:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b0026a4bb75477sm3308928wrf.28.2022.12.23.07.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 07:24:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 16:23:57 +0100
Message-Id: <20221223152357.272307-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223152357.272307-1-fontaine.fabrice@gmail.com>
References: <20221223152357.272307-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SpLb7j57dWy1hGmtpRscBAbjUWo0iYo2FhdX7k1GZeQ=;
 b=UgaI9mOhNOv/eIztH0LsReG3o2uvM2UcMhItwxyojtcq8bV2hLQUmVrgCEbw99NZ2T
 pCR/LEVMTdEkf5pxOJZWouxFweelLE1qRcE47/JrSaKxBbLbeXwLXwQHWypRx7l1mYkB
 Xu20o4VPHjCo6GJCPaKw9DMJ2e5a/0koRHqLn2SWV5wEIDVJrIEe7TxqqG5ok3O2nOB0
 YoWGTujVts1YeCnsQI85e6B9fCiRDgOgm4rLhCieXA+KESYhnKWxTcvAI3sjO+TiVbf/
 j0R8Ffijl6aOeo7ClNU8/nkXq9s3SsDBcqf+EOfJaz5pqIeTEGaDgo/rl2mPqjpsV6GH
 YDWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UgaI9mOh
Subject: [Buildroot] [PATCH 2/2] package/rtl_433: bump to version 22.11
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

- Drop all patches (already in version)
- Threads is not mandatory since
  https://github.com/merbanan/rtl_433/commit/4f5231bef29f42acc0ce5700584e8c4df5dc0aa2

https://github.com/merbanan/rtl_433/releases/tag/22.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...inor-Fix-a-compiler-flag-needs-GCC-7.patch | 27 ---------
 ....c-fix-build-without-__has_attribute.patch | 34 -----------
 ...low-in-Clipsal-CMR113-and-Somfy-IOHC.patch | 58 -------------------
 ...0004-Fix-overflow-in-Acurite-00275rm.patch | 35 -----------
 package/rtl_433/Config.in                     |  5 --
 package/rtl_433/rtl_433.hash                  |  2 +-
 package/rtl_433/rtl_433.mk                    | 14 ++---
 7 files changed, 8 insertions(+), 167 deletions(-)
 delete mode 100644 package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
 delete mode 100644 package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
 delete mode 100644 package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
 delete mode 100644 package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch

diff --git a/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch b/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
deleted file mode 100644
index dd3debf7ee..0000000000
--- a/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2010e8f949ab7b4555b99dbf184e149a3f33df46 Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Fri, 24 Dec 2021 11:03:06 +0100
-Subject: [PATCH] minor: Fix a compiler flag needs GCC 7
-
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/2010e8f949ab7b4555b99dbf184e149a3f33df46]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a3f11ac99..bfa6595ca 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -74,7 +74,9 @@ if(("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR "${CMAKE_C_COMPILER_ID}" MATCHES
-     ADD_DEFINITIONS(-pedantic)
-     ADD_DEFINITIONS(-Wshadow)
-     ADD_DEFINITIONS(-Wmissing-prototypes)
--    ADD_DEFINITIONS(-Wimplicit-fallthrough)
-+    if("${CMAKE_C_COMPILER_ID}" MATCHES "Clang" OR NOT "7.0.0" VERSION_GREATER CMAKE_C_COMPILER_VERSION)
-+        ADD_DEFINITIONS(-Wimplicit-fallthrough)
-+    endif()
-     #ADD_DEFINITIONS(-Wfloat-equal)
-     #ADD_DEFINITIONS(-Wbad-function-cast)
-     #ADD_DEFINITIONS(-Wdocumentation)
diff --git a/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch b/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
deleted file mode 100644
index 683754845f..0000000000
--- a/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1b74826f155406f86846d5c97b3534aab87cf6da Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Dec 2021 15:21:39 +0100
-Subject: [PATCH] src/optparse.c: fix build without __has_attribute
-
-Fix build failure without __has_attribute (e.g. gcc 4.8) which is raised
-since
-https://github.com/merbanan/rtl_433/commit/6c8af75c757712bd58b169317795484a72e9a16c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/merbanan/rtl_433/pull/1918]
----
- src/optparse.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/optparse.c b/src/optparse.c
-index aa3d0b53..b5e2d37e 100644
---- a/src/optparse.c
-+++ b/src/optparse.c
-@@ -232,9 +232,11 @@ int atoi_time(char const *str, char const *error_hint)
-             }
-             // intentional fallthrough
- #if defined(__GNUC__) || defined(__clang__)
-+#if defined __has_attribute
- #if __has_attribute(fallthrough)
-             __attribute__((fallthrough));
- #endif
-+#endif
- #endif
-         case ':':
-             ++colons;
--- 
-2.33.0
-
diff --git a/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch b/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
deleted file mode 100644
index e2088b29e7..0000000000
--- a/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 2dad7b9fc67a1d0bfbe520fbd821678b8f8cc7a8 Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Mon, 24 Jan 2022 15:53:20 +0100
-Subject: [PATCH] minor: Fix overflow in Clipsal-CMR113 and Somfy-IOHC reported
- by aug5t7
-
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/2dad7b9fc67a1d0bfbe520fbd821678b8f8cc7a8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/devices/cmr113.c     | 4 ++--
- src/devices/somfy_iohc.c | 9 +++++----
- 2 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/devices/cmr113.c b/src/devices/cmr113.c
-index c85dfac56..19ec5d421 100644
---- a/src/devices/cmr113.c
-+++ b/src/devices/cmr113.c
-@@ -42,8 +42,8 @@ Kudos to Jon Oxer for decoding this stream and putting it here:
- 
- */
- 
--#define COMPARE_BITS 83
--#define COMPARE_BYTES (COMPARE_BITS/8)
-+#define COMPARE_BITS  83
-+#define COMPARE_BYTES ((COMPARE_BITS + 7) / 8)
- 
- static int cmr113_decode(r_device *decoder, bitbuffer_t *bitbuffer)
- {
-diff --git a/src/devices/somfy_iohc.c b/src/devices/somfy_iohc.c
-index 906cae53e..2c88067b5 100644
---- a/src/devices/somfy_iohc.c
-+++ b/src/devices/somfy_iohc.c
-@@ -100,11 +100,12 @@ static int somfy_iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
-     if (bitbuffer->num_rows != 1)
-         return DECODE_ABORT_EARLY;
- 
--    int offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
--    if (offset >= bitbuffer->bits_per_row[0] - 19 * 10)
-+    unsigned offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
-+    if (offset + 19 * 10 >= bitbuffer->bits_per_row[0])
-         return DECODE_ABORT_EARLY;
- 
--    int num_bits = bitbuffer->bits_per_row[0] - offset;
-+    unsigned num_bits = bitbuffer->bits_per_row[0] - offset;
-+    num_bits = MIN(num_bits, sizeof (b) * 8);
- 
-     int len = extract_bytes_uart(bitbuffer->bb[0], offset, num_bits, b);
-     if (len < 19)
-@@ -120,7 +121,7 @@ static int somfy_iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
-     // calculate and verify checksum
-     if (crc16lsb(b, len, 0x8408, 0x0000) != 0) // unreflected poly 0x1021
-         return DECODE_FAIL_MIC;
--    bitrow_printf(b, len * 8, "%s: offset %d, num_bits %d, len %d, msg_len %d\n", __func__, offset, num_bits, len, msg_len);
-+    bitrow_printf(b, len * 8, "%s: offset %u, num_bits %u, len %d, msg_len %d\n", __func__, offset, num_bits, len, msg_len);
- 
-     int msg_type = (b[0]);
-     int dst_id   = ((unsigned)b[4] << 24) | (b[3] << 16) | (b[2] << 8) | (b[1]); // assume Little-Endian
diff --git a/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
deleted file mode 100644
index 057bf9cf64..0000000000
--- a/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 37455483889bd1c641bdaafc493d1cc236b74904 Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Fri, 18 Mar 2022 08:09:15 +0100
-Subject: [PATCH] Fix overflow in Acurite-00275rm (closes #2012)
-
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/37455483889bd1c641bdaafc493d1cc236b74904]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/devices/acurite.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/devices/acurite.c b/src/devices/acurite.c
-index 6879e52da..4f3e83eb3 100644
---- a/src/devices/acurite.c
-+++ b/src/devices/acurite.c
-@@ -1318,15 +1318,15 @@ static int acurite_00275rm_decode(r_device *decoder, bitbuffer_t *bitbuffer)
- 
-     // Combine signal if exactly three repeats were found
-     if (n_rows == 3) {
--        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows];
-+        bitbuffer_add_row(bitbuffer);
-+        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows - 1];
-         for (int i = 0; i < 11; ++i) {
-             // The majority bit count wins
-             b[i] = (b_rows[0][i] & b_rows[1][i]) |
-                     (b_rows[1][i] & b_rows[2][i]) |
-                     (b_rows[2][i] & b_rows[0][i]);
-         }
--        bitbuffer->bits_per_row[bitbuffer->num_rows] = 88;
--        bitbuffer->num_rows += 1;
-+        bitbuffer->bits_per_row[bitbuffer->num_rows - 1] = 88;
-     }
- 
-     // Output the first valid row
diff --git a/package/rtl_433/Config.in b/package/rtl_433/Config.in
index a6db00f477..01c1e2f5cd 100644
--- a/package/rtl_433/Config.in
+++ b/package/rtl_433/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RTL_433
 	bool "rtl_433"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
 	help
 	  rtl_433 (despite the name) is a generic data receiver, mainly
@@ -9,7 +8,3 @@ config BR2_PACKAGE_RTL_433
 	  MHz ISM bands.
 
 	  https://github.com/merbanan/rtl_433
-
-comment "rtl_433 needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index fd479dfd21..51fb29c78e 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b362ef3410adec64aee7ad8e6d4d74875f1b3d59ef6fb4856e96adc03876dc65  rtl_433-21.12.tar.gz
+sha256  61a9163d69cc4b1da46aebbcaf969bd180a055a6b90f42ad281218cc4fbefb86  rtl_433-22.11.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 74a0b54a3d..e3be0e5ecf 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 21.12
+RTL_433_VERSION = 22.11
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
@@ -18,12 +18,6 @@ RTL_433_CONF_OPTS = \
 	-DBUILD_TESTING_ANALYZER=OFF \
 	-DENABLE_SOAPYSDR=OFF
 
-# 0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
-RTL_433_IGNORE_CVES += CVE-2022-25051
-
-# 0004-Fix-overflow-in-Acurite-00275rm.patch
-RTL_433_IGNORE_CVES += CVE-2022-27419
-
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
@@ -38,4 +32,10 @@ else
 RTL_433_CONF_OPTS += -DENABLE_OPENSSL=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+RTL_433_CONF_OPTS += -DENABLE_THREADS=ON
+else
+RTL_433_CONF_OPTS += -DENABLE_THREADS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
