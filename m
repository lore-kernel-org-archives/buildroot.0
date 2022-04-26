Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D0AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 15:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10C883365;
	Tue, 26 Apr 2022 15:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyH4eG82Vjm0; Tue, 26 Apr 2022 15:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA3D783388;
	Tue, 26 Apr 2022 15:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04F7C1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 15:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E74C14017F
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 15:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asDQRE9Uz1GG for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 15:37:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5E8940179
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 15:37:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5ECA840009;
 Tue, 26 Apr 2022 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650987459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKhgNg+MZ59ozSWvhGM/pLgMF9VsxZTvpAH2u0Cm6wE=;
 b=RFzrb+v7Ppnh0Fjsr4VwF57rbHATZbDnBt2vq+GTGl4484ZEVraeZQ/7Tja+IroZkiS9F8
 G02vk/JIFw7/regqQ3k39mWQJ46mOMwy9OOEniUUeTJ+Aqej1qCwa+/MYwncr80agiTg33
 8AJ/vwvPmRwnENWH5stK5IQJ/hL0SxMQzPndGLlIumookGEGiNOY6+R5beu/gUw/92oq+9
 TRiyljOBeaPcTutI289OI2y5HFOi16jnraFVoUyghWXuVmU728q273dLF7FYfImDbTiEYJ
 IX7jUm9vcn4dTOZ49szuxi/ms04MRpePXNSaWrId2u9IplnljBGhZPEMciQDyQ==
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 26 Apr 2022 17:37:24 +0200
Message-Id: <20220426153726.312870-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426153726.312870-1-thomas.petazzoni@bootlin.com>
References: <20220426153726.312870-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/binutils: re-enable recent versions
 of binutils for FLAT binaries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks to the bump of elf2flt to version 2021.08, the issue with
recent versions of binutils has been fixed, so we can re-enable using
the recent binutils versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index e639c67149..4382b32237 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -19,21 +19,12 @@ config BR2_BINUTILS_VERSION_2_32_X
 config BR2_BINUTILS_VERSION_2_36_X
 	bool "binutils 2.36.1"
 	depends on !BR2_csky
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_2_38_X
 	bool "binutils 2.38"
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
