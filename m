Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9979AFF885A
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 07:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 627836121E;
	Sun,  3 May 2026 07:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEd1-eKiYWVK; Sun,  3 May 2026 07:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 074DD60E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777792823;
	bh=yukbj+iGKHu/1eXwlncwPhFerW8yS6ScsFB7hBHthQc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lzlzxpmXGBjDWRjjVjg0I/jfQglbobscgF1LrPQpM7vv+DgrzIxsrudJf3haermfk
	 E7CEaNSZhCWrHLpKcnNlL3jogLVIBm+9PFarWIoz3aoOBAaBNlGDpFN3mBRdm8tI5x
	 jXSzk5Nli7h46i5u2jBQRw1PSeWMkATW0+WmLv7KYCdEZVkl6ZZlbpJs/BAyb44GbA
	 bCHDcoeoiL2lYDaY38AcnvymsbnGnzNXfQcctLx5DnKfkcfVkp8LUrwDWBnhpzuinb
	 eu90rgUBrhUDzSq7jFrqmjoVuh21UqY5BI+uScePRQrGu8+VtygFPsRh9bl4Q+yCbb
	 upKcJC609U5mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074DD60E92;
	Sun,  3 May 2026 07:20:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48291127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 07:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A50D40333
 for <buildroot@buildroot.org>; Sun,  3 May 2026 07:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MM8trEDCkcHR for <buildroot@buildroot.org>;
 Sun,  3 May 2026 07:20:20 +0000 (UTC)
X-Greylist: delayed 332 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 03 May 2026 07:20:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E99940A76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E99940A76
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E99940A76
 for <buildroot@buildroot.org>; Sun,  3 May 2026 07:20:19 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9342231E0A6D; Sun, 03 May 2026 09:14:44 +0200 (CEST)
Date: Sun, 3 May 2026 09:14:44 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <afb15Mavy9Eo776E@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1777792484; bh=IEO6EEef2lKvf+8b8t2XajiYNtqWAYxbsPPy0OQKqUM=;
 h=Date:From:To:Subject:From;
 b=pt+ZTXAgSCItWP+roRYCXSG8ePcYTBEk/dDbGEsLnQdmw/Z5PNc6a761khcr/fja1
 ul1qtKQ/PzL+d+Tg8OZfY418s2AblgbrI6ymafeW4BthVwURnSWrLq0HKBmcIaInec
 3NZPvAKodUz7iTQkkeR+NiPwItroUuETJNB9gApFKvLv7kApM2fOgxEf6+BZuW4ZPB
 eyOs0d59UnZ1FqnwcSNt5kVYTLRXz3l2YE/cSaHR1HNHNFTwGTlDvSBB1lIb2YE6zh
 OBs7aQI7mi/C2Sow3DM4WIHCFmGjYA4rY7TLmh1cuCcZZgbsh3G4jfX1fO+0FVbo0L
 w6KWPymn26KCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/dillo: bump to 3.3.0
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

Update to 3.3.0, see here for a changelog:
https://dillo-browser.org/release/3.3.0/

Update to use new homepage. Project is moving to their own
infrastructure.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/dillo/Config.in  | 2 +-
 package/dillo/dillo.hash | 2 +-
 package/dillo/dillo.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 1ebab8ab3f..1eea18e144 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DILLO
 
 	  Enable openssl package to gain https support.
 
-	  https://dillo-browser.github.io/
+	  https://dillo-browser.org/
 
 comment "dillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
diff --git a/package/dillo/dillo.hash b/package/dillo/dillo.hash
index 50559bf857..c6b863c9ef 100644
--- a/package/dillo/dillo.hash
+++ b/package/dillo/dillo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1066ed42ea7fe0ce19e79becd029c651c15689922de8408e13e70bb5701931bf  dillo-3.2.0.tar.bz2
+sha256  db1863261d5efbd27b090e430c88064082b891cea1edf7a14e234cca51754f60  dillo-3.3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index ce8660c6cb..685b85ff79 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DILLO_VERSION = 3.2.0
-DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)
+DILLO_VERSION = 3.3.0
+DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.gz
+DILLO_SITE = https://dillo-browser.org/release/$(DILLO_VERSION)
 DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
 DILLO_DEPENDENCIES = fltk zlib \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
