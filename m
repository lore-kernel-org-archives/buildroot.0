Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8D8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E0061019
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83E0061019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298108102D;
	Sun, 26 Sep 2021 20:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkCfYTlu2k5v; Sun, 26 Sep 2021 20:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C41780F29;
	Sun, 26 Sep 2021 20:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099B91BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02991402CA
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpiabyrMa4sm for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C76E40246
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:35:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c21so16234520wrb.13
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/riH72c6nmqjDLr5c1xsMZaTYV4qW7VsWV9EN9R8Dak=;
 b=UpgBVnGLolof6YXpInnCZEZHVb+fhZG0mDxXzcbRuk6P5i+h7GSbmUN+xNUrUP0vqp
 /XPrz9tTK0H1HF+d/0hNVUNbxXnhQwRYf/v6xIHtyxo7HWnsXKcxfzv8wpYO3LXdGzR9
 VWx5wl+j0bMSdjWW2p9vfgKW6n2yNFrMk/1bD6ary0xp1Tty8vmvkErG+OwDw5t/GuXo
 19qIUaTga8gntafjtvgJMBV04RX4sbRhmeoM4a5gVo4nYfdh69JAf+OfH0uOj5Ok0B5F
 vE0AixeuWafJd4K+7tKhjpfNzEJTxG1bgdqeNvlmjJjevnkoXJaAznn0MqsKQdUSqOzB
 RvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/riH72c6nmqjDLr5c1xsMZaTYV4qW7VsWV9EN9R8Dak=;
 b=ckjuqB3VBdshNo4j/DFZTbddYTCUQ7t0PX3Mm0EFgeMmhhQrgSxAVK9gHkZG5aUGHt
 /uMSGFnGk+1yWzRtYx5a9anWBgoRwULNr5LZ7/cEHxKWNZQsl1p+8yVc+5qIxAKY0hq3
 JBujgYVa1EFDNbfcvDjXMZDnVmS4g/DH5PsXKlYfcNvCh29SCEMWeXEuGZ3YfNsTjCYm
 4KAHYgdJYWCnazY/fcrj/usan3Q+liZ8FwasoYZ3ipSGhXXHPFSokubzwiVL3NmSQWxC
 JzEUjQXykWybz4elHua6Vuvo4Uuu4txvbATpS6962KuWopyvj6dgSariDwDJNbg2siqV
 GJjQ==
X-Gm-Message-State: AOAM5331KgDbZ8z1GPTx9mlX6pT1PwRFBLN5rgC/0fRJ6XLSiJrO0hbq
 UHcELsS1mpCetPUatsFEsHb3vzTarP0=
X-Google-Smtp-Source: ABdhPJwid2hd8eTeaNmGtkkmQuiBCV0u50czTxKjZp3dimd8eP8AAiuL9E/AxvoohIuANMBSQGY/sg==
X-Received: by 2002:a1c:141:: with SMTP id 62mr7335768wmb.188.1632688521313;
 Sun, 26 Sep 2021 13:35:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id d1sm16340074wrr.72.2021.09.26.13.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 13:35:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:34:29 +0200
Message-Id: <20210926203429.261419-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210926203429.261419-1-fontaine.fabrice@gmail.com>
References: <20210926203429.261419-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3,
 2/2] package/libvirt: add host-lvm2 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-lvm2 is needed to avoid the following build failure raised since
the addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

Program pvcreate found: NO

../output-1/build/libvirt-7.7.0/meson.build:1888:6: ERROR: Program 'pvcreate' not found

Fixes:
 - http://autobuild.buildroot.org/results/13c12086a0ce06c348d5971b56b5f4f27fa0f317

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 0f6c7cef7f..3118de4d58 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -180,7 +180,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
-LIBVIRT_DEPENDENCIES += lvm2
+LIBVIRT_DEPENDENCIES += host-lvm2 lvm2
 else
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=disabled
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
