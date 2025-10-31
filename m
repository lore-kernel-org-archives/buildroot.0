Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A1CCF9FE
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A6C41FA5;
	Fri, 31 Oct 2025 22:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOzNgssycV0m; Fri, 31 Oct 2025 22:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9044A41FA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9044A41FA1;
	Fri, 31 Oct 2025 22:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA83CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6023A41BBF
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daEPIduhH3HO for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9C2E40C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C2E40C21
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9C2E40C21
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:22:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C29DCA4C5AF0
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 23:22:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45342)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vExVc-0000000080o-2Y3C
 for buildroot@buildroot.org; Fri, 31 Oct 2025 22:22:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 31 Oct 2025 23:22:11 +0100
Message-ID: <20251031222212.2654828-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761949332;
 bh=RF7gsNt9MB1rcgaFfq3ORFvbgCcKzCl9sdJjVV5zFqE=;
 h=From:To:Subject:Date:From;
 b=Uia2AnPDdI+OZ4VJeo8yaJ/3oPvR/O4SLy3I+z77IVJ7uiBQ/zMMlVrCNUGe2uWk+
 qcBzXQRdjv5+CKU67wv/gfr06RIvqN6MWj0xZ1tsK4isMlXP0g/eBkjEDOJyGFA4Qb
 81Loq0E9sR7gHWXQ/Diqsvxi4yg+aYF0F7PlkDC92rznKDLyd5OVZatLyUVuOfkVt4
 pDVksgkS+ruDQRoT9DrFw9H6/liIlnKs5K+BRLLOjP8RVmwylPb4Z5YRjyuojZRwfW
 6N7P1OTyU+bbI1cnTEiitjGFKCQaOf/qalj+2GwqMz/nucjadL2l7tXAGs0j4e5D9F
 3LA5aIEXImtNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Uia2AnPD
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 21.3-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/xbmc/xbmc/releases/tag/21.3-Omega

Removed patch 0002 which is included in this release:
https://github.com/xbmc/xbmc/commit/957b4faa0b765bc91e64c6d33f07e853decae0d0

Updated Java libraries due to upstream commit:
https://github.com/xbmc/xbmc/commit/7b7e20eaaa831d7740d151bdfe22c3257f5a4102
and refactored their version numbers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-jsonschemabuilder.mk                 |  2 +-
 .../kodi-texturepacker/kodi-texturepacker.mk  |  2 +-
 package/kodi/0002-curl-8.16.0.patch           | 24 -------------------
 package/kodi/kodi.hash                        |  8 +++----
 package/kodi/kodi.mk                          | 17 +++++++------
 5 files changed, 16 insertions(+), 37 deletions(-)
 delete mode 100644 package/kodi/0002-curl-8.16.0.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 11f6e073e6..3e61e1af9f 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 21.2-Omega
+KODI_JSONSCHEMABUILDER_VERSION = 21.3-Omega
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 10d93dc996..329a2d47f4 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 21.2-Omega
+KODI_TEXTUREPACKER_VERSION = 21.3-Omega
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0002-curl-8.16.0.patch b/package/kodi/0002-curl-8.16.0.patch
deleted file mode 100644
index 31ffa7b964..0000000000
--- a/package/kodi/0002-curl-8.16.0.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix build with curl 8.16.0
-
-Downloaded from
-https://gitlab.alpinelinux.org/alpine/aports/-/commit/106a02411488e3f71b9f2085a4a857e4be27b9ea
-
-Upstream: https://github.com/xbmc/xbmc/pull/27224
-
-The upstream patch is aimed at the upcoming release of Kodi 22.0 which
-saw many changes to CurlFile.cpp so we use the fix from Alpine.
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
---- a/xbmc/filesystem/CurlFile.cpp
-+++ b/xbmc/filesystem/CurlFile.cpp
-@@ -44,7 +44,7 @@ using namespace std::chrono_literals;
- 
- #define FITS_INT(a) (((a) <= INT_MAX) && ((a) >= INT_MIN))
- 
--curl_proxytype proxyType2CUrlProxyType[] = {
-+long proxyType2CUrlProxyType[] = {
-     CURLPROXY_HTTP,   CURLPROXY_SOCKS4,          CURLPROXY_SOCKS4A,
-     CURLPROXY_SOCKS5, CURLPROXY_SOCKS5_HOSTNAME, CURLPROXY_HTTPS,
- };
-
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index e7851bde3a..aa962b15fc 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,9 +1,9 @@
 # From https://github.com/xbmc/xbmc/blob/Omega/xbmc/interfaces/swig/CMakeLists.txt
-sha512  743698979c801f3cfb36545888b5303e1e25dae5692bb45cab7ebbe102a6eda31f09abc6978349ad90ecaf630416fc87eacba7781244855e7e771a3c44041fa0  apache-groovy-binary-4.0.16.zip
-sha512  8e7e62418a49ba810512c13a640a8bf35f878fcd54af32fdaab1111e37817f58b21b475980ba663fba4887e45ef8d88af8ff17796f20d202e929e8e2574546dc  commons-lang3-3.14.0-bin.tar.gz
-sha512  2e94877000dd270b69e2e8cbf49f258a90b4c628b6b6b0814e300a2f0e9c391f0816dceb0707e596ae3b7c9532f93e7a4917df47c77f44b3a810e14042ce5f3f  commons-text-1.11.0-bin.tar.gz
+sha512  60d1aea85008a438a9498178dc2137385653f1ea294e7e257959e9e0f94382e160e217e1090047c2a944e328cf46e8ebcfc4b015f7d0cb9f2fcf9d880c6c1344  apache-groovy-binary-4.0.26.zip
+sha512  8927a406a1bd084b548f89cf15fe4bc7567dcaa50ae8abae54e9c883c1574c648fcc8ad6c3abaa381dfbdf1801727ac5e6c4572063203a1dfac293d122282f05  commons-lang3-3.17.0-bin.tar.gz
+sha512  a51667463e88b2d017c3baebb9bbe42c4e50cba96ffe19c89680e82002a4db8b9007daff75f8dbf8bf3725be13a3f03f3c2bc4e1f11e8e02dcab4408abdb44a1  commons-text-1.13.0-bin.tar.gz
 # Locally computed
-sha256  da3a5df663684664b9383b65f1c06568222629d935084a59e4e641fcdcb6c383  kodi-21.2-Omega.tar.gz
+sha256  a60afcb556e4a00cb19fc35b7e77758107c9a8096c6ce9b66af5f92396be31aa  kodi-21.3-Omega.tar.gz
 sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
 sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
 sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f68c38f891..57bfcff555 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 21.2
+KODI_VERSION_MAJOR = 21.3
 KODI_VERSION_NAME = Omega
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
@@ -58,22 +58,25 @@ KODI_DEPENDENCIES = \
 	zlib
 
 # taken from tools/depends/target/*/*-VERSION
+KODI_APACHE_GROOVY_VERSION = 4.0.26
+KODI_COMMONS_LANG3_VERSION = 3.17.0
+KODI_COMMONS_TEXT_VERSION = 1.13.0
 KODI_LIBDVDCSS_VERSION = 1.4.3-Next-Nexus-Alpha2-2
 KODI_LIBDVDNAV_VERSION = 6.1.1-Next-Nexus-Alpha2-2
 KODI_LIBDVDREAD_VERSION = 6.1.3-Next-Nexus-Alpha2-2
 KODI_EXTRA_DOWNLOADS += \
-	https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-4.0.16.zip \
-	https://archive.apache.org/dist/commons/lang/binaries/commons-lang3-3.14.0-bin.tar.gz \
-	https://archive.apache.org/dist/commons/text/binaries/commons-text-1.11.0-bin.tar.gz \
+	https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-$(KODI_APACHE_GROOVY_VERSION).zip \
+	https://archive.apache.org/dist/commons/lang/binaries/commons-lang3-$(KODI_COMMONS_LANG3_VERSION)-bin.tar.gz \
+	https://archive.apache.org/dist/commons/text/binaries/commons-text-$(KODI_COMMONS_TEXT_VERSION)-bin.tar.gz \
 	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	$(call github,xbmc,libdvdread,$(KODI_LIBDVDREAD_VERSION))/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
 
 define KODI_PROVIDE_JAVA_TARBALLS
 	mkdir -p $(@D)/buildroot-build/build/download
-	cp $(KODI_DL_DIR)/apache-groovy-binary-4.0.16.zip $(@D)/buildroot-build/build/download
-	cp $(KODI_DL_DIR)/commons-lang3-3.14.0-bin.tar.gz $(@D)/buildroot-build/build/download
-	cp $(KODI_DL_DIR)/commons-text-1.11.0-bin.tar.gz $(@D)/buildroot-build/build/download
+	cp $(KODI_DL_DIR)/apache-groovy-binary-$(KODI_APACHE_GROOVY_VERSION).zip $(@D)/buildroot-build/build/download
+	cp $(KODI_DL_DIR)/commons-lang3-$(KODI_COMMONS_LANG3_VERSION)-bin.tar.gz $(@D)/buildroot-build/build/download
+	cp $(KODI_DL_DIR)/commons-text-$(KODI_COMMONS_TEXT_VERSION)-bin.tar.gz $(@D)/buildroot-build/build/download
 endef
 KODI_POST_EXTRACT_HOOKS = KODI_PROVIDE_JAVA_TARBALLS
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
