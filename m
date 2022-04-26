Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33334C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA3D64193B;
	Tue, 26 Apr 2022 21:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZ713JN9HGr4; Tue, 26 Apr 2022 21:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F38B41858;
	Tue, 26 Apr 2022 21:53:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50DE81BF3A6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D53D83E85
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgZYT3YK4H0g for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:53:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2EAA83E46
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:53:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7C41660009;
 Tue, 26 Apr 2022 21:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651010008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKhgNg+MZ59ozSWvhGM/pLgMF9VsxZTvpAH2u0Cm6wE=;
 b=W1uUEhYmCbiJAi8GWUEMUolXKVdHrXgf74SIMVi1HKxL7eVpw69PNpnvHzsERIcsP7trZf
 +z39brb+gLsWyYyLVC72Je+VF3Z3cPad7ePK1Mrmygkw1xJkMULpBgLzP62UlLI2oy6lc1
 8GPWvS8cmFNpfzgJEm9q8FJ7nVYUXWn89hlZrXX/vzKoRvf2N4K8UZh7rR2gv6xf0rzD8i
 Ulj+64wfSmBQNBrMlZ4o7ekIzAv2lKOslv6CnDLr1amMNFDIM+sXCBcpdS0XXGlrImEVWb
 MR3ocPHtB+164y3ukgLe48/RJJ6q5HvBYCodHDvOA2Uf0qy5TbP8u/Ayo6lb4w==
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 26 Apr 2022 23:53:13 +0200
Message-Id: <20220426215315.381964-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426215315.381964-1-thomas.petazzoni@bootlin.com>
References: <20220426215315.381964-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/binutils: re-enable recent
 versions of binutils for FLAT binaries
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
