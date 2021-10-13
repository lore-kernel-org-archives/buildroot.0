Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FB2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451D361053
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 451D361053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124EB40500;
	Wed, 13 Oct 2021 16:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuUcJD3s85LK; Wed, 13 Oct 2021 16:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A3C4033A;
	Wed, 13 Oct 2021 16:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 896BB1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85CFB608ED
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6rq1JrT_u5d for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:24:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9CCA6060D
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:24:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t2so10236435wrb.8
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWo8fdSMmFySCkBa3qD93XfFmwUgSiPr6UTmdbNi8PY=;
 b=nFuG3OVOOZrmrWM6gK/ZqbryXfWjRpk4pGNwKn0QtCUZHEqqvsE3D4DTc4We//8Vxd
 3OglkQcHKnn85lvOSy4QnNZ9w7vSzBYXvswIeuHxDMSDkCZz42mPP1Fxz8kxXd0PUAfe
 kYFEzILGFq0zTKs8ipmNA2dv4oxleseqs/ZVVX30kUgIuSU/cbpeKyLqF0XAPwa8R2xQ
 wNElckQA9BovPoWt39Skxq7guVFp1kkFwe8I94NxxzZPhvohDGANIUQgHxt8iFmM0O+w
 cy4MuCdvHoo/gU8p5cKP5ZTmLsfeGQugIek4u/agNQ2GoH20VXnnfcJm1lFhBAemzgs8
 TJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SWo8fdSMmFySCkBa3qD93XfFmwUgSiPr6UTmdbNi8PY=;
 b=ircZZgqsW5ryZZRKLj8enyiyf+kJCL/6Ufh3hB+EC8kvg900gFDBDJUAO+roRbKa01
 1zgWqwRTzLqM6NLE1jz1NhY5L3pPcTb15dALLeOyLj0sK3oiYpwAIj3Ss0dCgzo8nwI2
 UwonvMyGs4+tYtrrnSl+RNd0XdHPsQ5LfDtjEgpLr2UIZB696/rfgTPWh4rOSaV3098Z
 UokgRNaHIcbS/wL3IsMw/QgndNYKBf8TrlWnyJMGcpCKFfXODTZL7d2nE9o0O6qRDGkW
 wUrR4I/651RJTtxGh478Xzjm+csM/8osr84ZD1XAsEe78dzkokJi3wgdCx2fgpODpbwD
 pJBA==
X-Gm-Message-State: AOAM533hIufHRr4X08kNHAtbWrqngFYoUdaq9tfsnHRZyulitMtnf3wl
 uSGK8IEs3wgMBhc5daX2nZdZqyIm6xI=
X-Google-Smtp-Source: ABdhPJzaAe5U7Jk9Twh+KKDLx99QA6wLwcCIijyhSROlLuzZ0FixxO0j3ex9KzzJ0YVIo6eWnOWyNA==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr13640567wmc.31.1634142263949; 
 Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:5b8:fa6c:9a56:27a6])
 by smtp.gmail.com with ESMTPSA id r8sm42672wrv.61.2021.10.13.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 18:24:10 +0200
Message-Id: <20211013162410.520492-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dtbocfg: add missing comment about
 kernel dependency
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b00b9c865d21 (package/dtbocfg: depends on kernel) forgot to add a
comment when the kernel is not enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>
---
 package/dtbocfg/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
index 862dc0ccc5..2b2a8538a3 100644
--- a/package/dtbocfg/Config.in
+++ b/package/dtbocfg/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_DTBOCFG
 	  as a userspace API of Device Tree Overlay.
 
 	  https://github.com/ikwzm/dtbocfg
+
+comment "dtbocfg needs a kernel to be built"
+	depends on !BR2_LINUX_KERNEL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
