Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690C4CD98D2
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 19:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 148874127E;
	Sat, 13 Jun 2026 19:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Evmd2wmR0m8L; Sat, 13 Jun 2026 19:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F7EF41289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781379902;
	bh=ROpXCHY50pOtfcEel3OEn/Yb3HdyLRhUXDjL/ShM92U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nOUdP04yImgsNiKZl7vRjaVmd6Fy1HFHu5kqC0CS4tn4EG6lvCqDYfNRxVUe1qIPU
	 nB9GsaV9x1UB+k2co3sGVAcouWkAkpM7sGSVZOB3WJoyYlhFxNqrSA5U/Z5utfxNQS
	 0wRNwymP/ZXinmEXEmkF8AA6JIMOM6S9Z0+SYnk2tLN3+ZNlznEMbem+5yZEUTOqO/
	 8rfLL9qGWAEJ2QijGZ4S+GGuwTONoaLFCiVSwNscXp6d5mDyvG3373g3sfbgpLw5++
	 IgSn4VKkRL/ahkNkmPfnQySIJTFaUFUr79dCyhucZjNtGSdvujn/4HO5OGkmo4BgDJ
	 9FFYNX9k0SDEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F7EF41289;
	Sat, 13 Jun 2026 19:45:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD4A322
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23AD541289
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY6od4e2Y6MY for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 19:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BA674127E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA674127E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BA674127E
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:57 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso19229175e9.3
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 12:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781379896; x=1781984696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FgWLIzT5NzZBuKbtvQ65c6Xekmj1eqhOWHwH5lqTCwI=;
 b=OTTMeIhZ49CPw4bm+qq6uoj25gX0oWPa3YxzirK1zLI2TNhQ8CHTwWONqGYxS0nlsy
 D/CygIYXvTdcTUs5m9792aLJnRfKfkBXchE2IVvjXUU/BC7+fPvaKLw9EY4bfzQ1tFc6
 RIiqM44wpWXh1HDeRInJV6XhIi0pvdu85hGbFObmes5wVzfEHdJ2A7XHG4olK4JZYibl
 +n8TBFSpj4N37/Ux4XstrhxdWPiKmHOW5iizsrysN+/hSfRXDfv445DxqQcT7G9+uzgr
 BgXLgu8jXMstED+IKmmBRnOgqqjLl6akd3kgBSfDOb2PJVlNCLj+tnfznBwjxaEzMNgb
 CKew==
X-Gm-Message-State: AOJu0Yzatnlk9z4hu/diGEkzjjwS5Wzc1mVvdKByqs756XdaAIoZMpEC
 PYOjINwJPQvr+1GM/2PFRlKS8gI+ZemEg+QKwEiVzX9eYPPKTJjh42hhFizWwsENROatFOWfoaM
 09cIZ
X-Gm-Gg: Acq92OFbzwv96L9kmSaJTP9hgvC7GmS1OGsTbLwO0/RmgCQR2dSI/mH9NCG4tuL5Di9
 qqHcafDoQHX89mcNe8HpB5qmhkAlpCGi98TbSpmnw4//G186Dx3taYxjna/5ZL4/3os/RMkCWqu
 FgSF4y2HU+I2qGrjXpaiW5Vva5qnEU9FWAEyzKvg8/mPUuF7jIRF8P7iFJzCjwP/ktET/DViRRC
 fmQMKRl44Jix9OXHgwnSUj8nTXlYEs3901+54XbEjminbI5V5pZUr0TTHtI19qbOpMQhnrIfzYz
 8xI1jaFrajIda2L4evQkKzoxMj6yEIr0sTaPXrETTZdbUsxG6p2zEpt8oPMBSew85+tDYqZzeLL
 LK0iGA9Em2WgtaS+FD4UWL+OTEFTeM3vkG+ZJPbffsdxH+sBf2OH1YKNukk3iFby//1aZ48PH5b
 7EfxKHGBQdA+reNQWFD+sFaBX2Xcj3HhsE9BFjq8N5/Dc/OFNTmt2o+3Cxo65mElJG4Sze5fPrB
 1C/mxlqm96YHogfPB5H8xTzaQ==
X-Received: by 2002:a05:600c:594e:b0:490:b00c:8e6a with SMTP id
 5b1f17b1804b1-49220104f9amr38642165e9.28.1781379895738; 
 Sat, 13 Jun 2026 12:44:55 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edc23sm103167015e9.2.2026.06.13.12.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 12:44:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Jun 2026 21:44:49 +0200
Message-ID: <20260613194451.220317-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613194451.220317-1-romain.naour@smile.fr>
References: <20260613194451.220317-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1781379896; x=1781984696; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgWLIzT5NzZBuKbtvQ65c6Xekmj1eqhOWHwH5lqTCwI=;
 b=jd64bulAHrtlEKASSaCH/KSkNyQimfz4TBSmaW9pmXiPIEIqhZyYcg9hwSfuYanXDh
 SE7kq1Tx/7seF/3NZg9UKZ+9yHQ19rvgvDuYTfdMce/28yWkxbIqGjgTp/swvW900ZhK
 69gqRKyGoN/p6C7xR7NK5Uooxh5vbYxOjxnNc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=jd64bulA
Subject: [Buildroot] [PATCH 3/4] configs/qemu_aarch64_{ebbr,
 sbsa}_defconfig: switch to Bootlin stable toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the qemu aarch64 ebbr/sbsa configurations to use the Bootlin
glibc stable prebuilt external toolchain, as recommended in the
Buildroot meeting report from ELCE 2024:
https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minutes by ~20 minutes.

https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913979 (qemu_aarch64_ebbr_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913980 (qemu_aarch64_sbsa_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_aarch64_ebbr_defconfig | 4 +++-
 configs/qemu_aarch64_sbsa_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index 15c68d2035..8d20813044 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/post-image.sh support/scripts/genimage.sh"
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 57bc899e03..56c160c85a 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_neoverse_n2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
