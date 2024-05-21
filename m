Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD09C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 13:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B28C40652;
	Tue, 21 May 2024 13:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIUlKAua6Rfu; Tue, 21 May 2024 13:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A427B40654
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A427B40654;
	Tue, 21 May 2024 13:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 902761C52FE
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 13:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A188608D3
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 13:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdtO1GtCIiwf for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 13:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77258608D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77258608D0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77258608D0
 for <buildroot@buildroot.org>; Tue, 21 May 2024 13:43:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so7520619e87.0
 for <buildroot@buildroot.org>; Tue, 21 May 2024 06:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716298980; x=1716903780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VwqTinye+8FHyuz71Luwl9dAsRlAs7t2t4MHBC9eILQ=;
 b=e1YqpEeNOl6TvEnQOBRi9WKLVg4ivM0sV83vUEHVUW7gKhzZ4M9A1e6gcQGRJZOzr+
 vssWHEoS3InGOAYW3cavFu9E20fvgf/TnZcH/iRP51CsmyP3QD49u71WJdiMxwO2vWJY
 KY3ijrdbkLWWeUrCpHgvwydYy71IzPK6I018VzBgw/etjenOIRQlzVmpH2BOrj5KhL7m
 QRFbQNLC7LCe1IMDOvgpjxGOcn/CraH+vhZWX3n0V2aaMnlnnogRN0Sd57emz95nX5YU
 ypaadoOopEU9RVsPCSLcpMOmQSVg79J84k39OeIJCqvnP12Pc1gH0Lx9K/vnKCfPsM3X
 NGcA==
X-Gm-Message-State: AOJu0YyDT9c+uGY/zSxhx5Q1r9ESIwq9V90yfz7E3MNdez2qnhAvzPZc
 2XkADVs0YkQYdIXvI4xaSe+Cpr72Pe1D2E+7Wk71bm6kWxvJH8R35VbWgQ==
X-Google-Smtp-Source: AGHT+IF/0kcf2xmnt9kpudcux6ENpnQl56mZfee/id++N4FRg+XlUJRgCdfWGsLFY+2fin+60PsqHQ==
X-Received: by 2002:ac2:4181:0:b0:51f:36ed:ee43 with SMTP id
 2adb3069b0e04-5220fe797bcmr24108403e87.31.1716298979320; 
 Tue, 21 May 2024 06:42:59 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17d02sm1617683366b.218.2024.05.21.06.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 06:42:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 15:41:59 +0200
Message-Id: <20240521134159.2268664-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1716298980; x=1716903780; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VwqTinye+8FHyuz71Luwl9dAsRlAs7t2t4MHBC9eILQ=;
 b=FI1fhVQVFL1QIuB9LWe1OIniKfbTFUGst3MmJquV38KGchiLS6Rg5z9IqZ1bWM8ZnI
 zp4M6JWMR9ZzaTDzEB79Mu71YNCHLEpgAW26nhvPTJgfT6PVvjQL3Jm+tRfaIxb206O7
 2ChktEfJn6NEC/2titrt+deyqfi0Of51eiSQPZh/cSXOeH/dUTsuXkaXYojK0q4NZBtw
 sO43M+3i7uRPszCbetgVm+1/gusEuxPY0fzouMK/ccX9lxdXINxlommVkxy6NaMnn9h1
 BYZjDx+Y109Q6vN7hC/t4Zs5fUrlwC0hOJjBYUu1pqtsmt4wH7/f8SZA9pz3mh/QZZKN
 UVAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FI1fhVQV
Subject: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.7
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Fix download location.

Remove already upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ncftp/0001-fix-gcc-10.patch | 24 ------------------------
 package/ncftp/ncftp.hash            |  2 +-
 package/ncftp/ncftp.mk              |  4 ++--
 3 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 package/ncftp/0001-fix-gcc-10.patch

diff --git a/package/ncftp/0001-fix-gcc-10.patch b/package/ncftp/0001-fix-gcc-10.patch
deleted file mode 100644
index 8ff9c44c50..0000000000
--- a/package/ncftp/0001-fix-gcc-10.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix build with gcc 10
-
-Add missing extern to gBm to fix the following build failure with
--fno-common which is enabled by default with gcc 10:
-
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: bookmark.o:(.bss+0x10): multiple definition of `gBm'; gpshare.o:(.bss+0x24): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/78822bc0e0039e8f8949011a256cac022863276f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura ncftp-3.2.6-orig/sh_util/gpshare.c ncftp-3.2.6/sh_util/gpshare.c
---- ncftp-3.2.6-orig/sh_util/gpshare.c	2020-08-21 10:46:34.173816750 +0200
-+++ ncftp-3.2.6/sh_util/gpshare.c	2020-08-21 10:52:25.407976319 +0200
-@@ -28,7 +28,7 @@
- 
- static int gIsAtty1 = 1, gIsAtty2 = 1;
- extern int gLoadedBm, gBookmarkMatchMode;
--Bookmark gBm;
-+extern Bookmark gBm;
- 
- double
- FileSize(double size, const char **uStr0, double *uMult0)
diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 3ab27df5cc..8766516ef8 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23  ncftp-3.2.6-src.tar.gz
+sha256  dbde0d3b4d28ba3a445621e10deaee57a6ba3ced277cc9dbce4052bcddf6cb2a  ncftp-3.2.7-src.tar.gz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 676a9c5895..37da898d5d 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.6
+NCFTP_VERSION = 3.2.7
 # use .gz as upstream .xz tarball has changed after the hash was added for
 # 2017.02. Can be changed back to .xz when version is bumped
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
-NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
+NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
