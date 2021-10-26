Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F199BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 17:11:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBA561040
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 17:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EBA561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2687780E3D;
	Tue, 26 Oct 2021 17:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aECySzOku-W; Tue, 26 Oct 2021 17:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A1980E26;
	Tue, 26 Oct 2021 17:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2EBE1BF873
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 17:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD6B980E26
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 17:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOv6npXCZPFV for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 17:11:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7739580E19
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 17:11:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so7617wmd.1
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kXKEGNxZDFtfcdqjNUMwhmBHwGBYsTb567oyKQvPUiY=;
 b=mNA6gSqqmkBQvEqOuG5QOoiYaE+4j42/J5VBIDLJH8IVqepm4zOqNVAeP6D9jRJL1Q
 D/dOvZk2rdeoiOyFy0g8Fp27wgjA6S+p99Du8JAHl5a9v/OYBNPvB/CFtmDcl5Mxc4Gr
 /tkRDNgI8CObIUz4MA4EmlHIaNC3qVoPH1MMKQXB5uO1UqR69nkIKkMqVX+SX+NcKmR4
 uM2l6mn3j5F+Ca3u3fj8knGUN9gVTj/c3g3P/TUwREfmqGSM1YvFWZPFTt8uBFaFAcev
 fuF1oD4PXu1kP5WlsLE3n9SMh4o8wGywKMFwhj/F1rNxNbmDQmDmX6p9zOCN061YYnOY
 FP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kXKEGNxZDFtfcdqjNUMwhmBHwGBYsTb567oyKQvPUiY=;
 b=770wbk78h9hc5uZ1grmHZLTjJ3DweVoZGFYhZdnhV1oAtWJAy0knoGeT5yQAOZOHaH
 oNBhpJ0XoZ6SeCCTKrqLLFTXyEbbU7QcUY1UfOVQayuGu5u/wJLFqMwQi7tnenhETeWH
 B+d5bJgEYywVtRX255I2soE+ga7/pKq20caBciPKgV23wZPUMO01uQy3RHvR1BtE/dpn
 QHq54CGkQaxGNAZszAvZPhusxrgXNhM5s1uMHn3QbVs5FUtwrtkb897A0a2uwTADG5yU
 XNp90cXxu8knAVEhgD1Wx5HuWu7P+l12thLEvwHuAx6prkFi2+KrWOlA5iI1ULx6FpW2
 DEMw==
X-Gm-Message-State: AOAM533yBOxIYCFEh9hllWEWM9/ZP7hJS8Mi20+p6VcdERSUczGWF/iv
 wYUmPqvm07Iy7d7zYJUPwi1piZ3mGyU=
X-Google-Smtp-Source: ABdhPJyZSmpF+XvvXjM2q73Llx357FIg8MGF0KAhlKBq0uevZCZstp0+CxsRL2BgD4KJJJBlVANwbg==
X-Received: by 2002:a1c:3842:: with SMTP id f63mr37244995wma.128.1635268312368; 
 Tue, 26 Oct 2021 10:11:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id g77sm1366141wmg.31.2021.10.26.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 10:11:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 19:09:29 +0200
Message-Id: <20211026170929.4051746-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lrzip: security bump to version
 0.641
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
Cc: Sam Lancia <sam@gpsm.co.uk>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2021-27347: Use after free in lzma_decompress_buf function in
  stream.c in Irzip 0.631 allows attackers to cause Denial of Service
  (DoS) via a crafted compressed file.
- Fix CVE-2021-27345: A null pointer dereference was discovered in
  ucompthread in stream.c in Irzip 0.631 which allows attackers to cause
  a denial of service (DOS) via a crafted compressed file.
- Fix CVE-2020-25467: A null pointer dereference was discovered
  lzo_decompress_buf in stream.c in Irzip 0.621 which allows an attacker
  to cause a denial of service (DOS) via a crafted compressed file.
- lz4 is a mandatory dependency since version 0.640 and
  https://github.com/ckolivas/lrzip/commit/3345a239b7f5353a1c1296d6a5d6b90729d4b669

https://github.com/ckolivas/lrzip/compare/7f3bf46203bf45ea115d8bd9f310ea219be88af4...v0.641

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lrzip/Config.in  | 1 +
 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 6 +++---
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lrzip/Config.in b/package/lrzip/Config.in
index 885b84dbb0..870094796b 100644
--- a/package/lrzip/Config.in
+++ b/package/lrzip/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LRZIP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_BZIP2
 	help
diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index 3e188c41e5..19295383c3 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4d31c429491f1378e868afe06867f68f8b1332fdca0758de24cc4da22103acfb  lrzip-7f3bf46203bf45ea115d8bd9f310ea219be88af4.tar.gz
+sha256  9b6b4bb1ae76dafbaab96ec9d50d41af5fed45a6c4f2e06feea828c2cd8025c0  lrzip-0.641.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 7419bb1ed9..409d9912d8 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 7f3bf46203bf45ea115d8bd9f310ea219be88af4
-LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))
+LRZIP_VERSION = 0.641
+LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
-LRZIP_DEPENDENCIES = zlib lzo bzip2
+LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 LRZIP_DEPENDENCIES += host-nasm
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
