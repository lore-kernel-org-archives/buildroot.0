Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEE7CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 15:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C26D40AF1;
	Fri, 15 Aug 2025 15:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mOj0DVaFIPg; Fri, 15 Aug 2025 15:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1AC40AF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1AC40AF4;
	Fri, 15 Aug 2025 15:28:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C99C0223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFF1F4083E
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90V6PsIWti76 for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 15:28:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D14640838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D14640838
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D14640838
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:28:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2001:18c0:a22:bf00:5c2b:f296:f108:6612])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0D1F2780516;
 Fri, 15 Aug 2025 17:28:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Aug 2025 17:27:37 +0200
Message-ID: <20250815152737.588503-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755271695;
 bh=GzglQk5XPAXvndqx2K3SHl6/M3jCBs2ks5c1mAUXzhQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cdtEWl/BnqDsrgsOsDfKY3z48FVn39Ta7PhsP+7zgkMSIreZNx8AsVc6OPjd+z/um
 lVoqPzzoRDkoAUnmbc5qrKRb4Icc1oo4cN2GsYJFW6NUeShNn4a9hGIg0goM019QSe
 YXHCVc+qIsYfB8pR60stTJ/0IHoSzL1zFu00EyMx7PMBZVg2NCow4AGz0qp2SyMA+C
 F8N6Rs7CPy+ztXHri5DR6SHZN7FXOqRy9z8zsmn+nGFHjQMdRKGqKX6BJTwGcJLH95
 vameu4LTrXAKCfAkRaG+MCD1h3vWuQNA14yb2lwKuV4g+MRoDnImp0rSw0T7L3xmHU
 nqGqjI7FBn3mA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cdtEWl/B
Subject: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] "package/gcc: bump 15.x series to 15.2.0",
gcc-bare-metal fails to download its sources. For example using the
commands:

	make zynqmp_kria_kv260_defconfig
	make source

fails with error:

	ERROR: No hash found for gcc-15.1.0.tar.xz

This is because the gcc-bare-metal package reuses the hash file and
the 15.x package patch directory from the gcc package (which was
bumped to 15.2.0), but still defines its _VERSION to 15.1.0.

This commit fixes this issue by bumping gcc-bare-metal to 15.2.0.

Fixes:
https://autobuild.buildroot.org/results/eda879fb8e1ccd696f01927087713b88a4b1a2c5
https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/b1dd235ad0dd91e1919a167a17cc9cd20a3695b2

Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Cc: Neal Frager <neal.frager@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc-bare-metal/15.1.0            | 1 -
 package/gcc-bare-metal/15.2.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/gcc-bare-metal/15.1.0
 create mode 120000 package/gcc-bare-metal/15.2.0

diff --git a/package/gcc-bare-metal/15.1.0 b/package/gcc-bare-metal/15.1.0
deleted file mode 120000
index 669da9e956..0000000000
--- a/package/gcc-bare-metal/15.1.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/15.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/15.2.0 b/package/gcc-bare-metal/15.2.0
new file mode 120000
index 0000000000..d3d1bbdefa
--- /dev/null
+++ b/package/gcc-bare-metal/15.2.0
@@ -0,0 +1 @@
+../gcc/15.2.0
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 17232a8ef1..88fc56ac09 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 15.1.0
+GCC_BARE_METAL_VERSION = 15.2.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
