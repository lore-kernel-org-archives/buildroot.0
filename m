Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7F5E9A03B
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 10:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B00409EA;
	Thu, 19 Feb 2026 10:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUIHngP5x0Ma; Thu, 19 Feb 2026 10:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C7740ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771497829;
	bh=QOwfykVWPFvqUjAjeM+pEzPDT7Gg8YXa6nmKQ8Kn+eg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lCFxMBL6zuPzMWHCPJNNRYVJOmflEJc7/JdN2723bBzFPtG+PounL1cvo55zNRleM
	 k1pWu/x6FeWRexMROKWoySDoxztkcAhlFzc/kxs6zViir+9bCLLZ2riL09JxkewaVw
	 iw3TmseVLdI6rzj59angnqRa1rbs8vR61wVDZ/SDkRg9RA/slUwsKdVZVJFt8cTHxh
	 chWDErTte/uNoAvF5S95jIyxpkHac/S+3o14IMSkZEaqGvxUL1I6jmhKVHeTl7Ukva
	 HwHYBJJvPfzf8SZKDuMkIP8DRiuEqN1iYVf+AQC5NAf84Pt/Kttgq3IscWz9nbda+6
	 7sRphhP58wouA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C7740ABC;
	Thu, 19 Feb 2026 10:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C7B183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF5382277
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zch6JQgCxYzS for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 10:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8218A8227E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8218A8227E
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8218A8227E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id t1VWv92YWIfDkt1VWv35Nx; Thu, 19 Feb 2026 11:43:42 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 11:43:39 +0100
Message-ID: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGDAPl9RytZMdhmFmXIVWoWjh1PLQsDjkhcAJA74IgJe1yGbxnmvzpfrC7TInAC6kIqXM1KVSyQ9O7ACMYTaur/sZvGUva4NZTFTftv0aWf7T0VSjNgD
 zvkz2tuj2+bAQRPK/JyMI6Vsp4LcsvDa82bVgDIvDknz3Rf9mLV3fe5pSV5RGd25aky67PzzFXPJoFW1brC+YadeDqi2PVpPJZDXszmjmsxDlBlGS4TsKvyn
 dceRtKycndSrjFiIgFG8TNsf+aoJjRigi5Z0+zZ24EgXAMqtm73yUyPeanxfdLHnWXPnnqTvPbw+kWba/gucY62UmIAKO4QMcwwNe8RIynFmYQECYliPllDQ
 D3dybT/f
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771497822; bh=ogwHNspcs0+b0v5fxy2GJifFc86as+ca1Bv+NtW7GO8=;
 h=From:To:Subject:Date:MIME-Version;
 b=Yf2Rj9wkamA4Bc4fbxeNDmojJzpkSffyNq8hGJM+PjqwSKu7YchUE7rWDiMQw5Lva
 +whAULIqjFNrJlJWBt8i3GzlAEHUZHgILEiHWrqsKXbgGQkVX3riqFn1EG95yDlHQR
 Tb6P8DjcVb2beBePY0HcvEuUBH3rNWc6hUHCKc+PqQ+frlJ0Gqok8/VN4yXKuSoegA
 0R3hdcnryfICPN5p37aEOQ8oe2pKydG6g5xYCmtFKBvqp6vvF1ZQLSmzwiklDs7RkN
 SZyn4DU/i5sylt1dn/LKwSxKFj5tne2ohFm/OUpxpkwb0yJPUHOGBC6IxNhNlSKrCf
 c9QlVc0ReziSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Yf2Rj9wk
Subject: [Buildroot] [PATCH 1/3]
 configs/olimex_a20_olinuxino_lime_defconfig: bump Linux to version 6.18.8
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 437a6113c9..7edbdcf369 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
