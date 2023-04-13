Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C6C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 17:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8314C429E3;
	Thu, 13 Apr 2023 17:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8314C429E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUR24Rjj9E-8; Thu, 13 Apr 2023 17:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6E99429C0;
	Thu, 13 Apr 2023 17:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6E99429C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5E71BF2F7
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 17:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8005401ED
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 17:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8005401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXAnN2v8g4M3 for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 17:04:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 239E9405CD
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 239E9405CD
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 17:04:40 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-634b28df952so1325809b3a.2
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 10:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681405480; x=1683997480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9/8s1G9/ziUce+ycuvV+Lb5crRowr2ql+boKY0bhJE=;
 b=DUdRNNX20GHoriW+HiFf5DGT+xSv4TUQjuwNW/Kdq5i66YojTUsPC+L+PcDAKZe2xv
 JuI7Yh5b+sJwfRhRN+ZfdmRXmESOAmvuQeF3VwvxQPRmWW2bRwHCuBdHnNI1bKAIxs/G
 SIlsblQVB/HgcqKhuTx0t4w8he4A6DT6i7UvLh5vHNPN1kWAWw+FNWc8qB1lGVzaOcgN
 QYIIt35lMtWg0LPpCvRBeIiYjjEBeeSHHolgyvXg5a/n7IZLaiJ4kfj8ktAUb3PTy8n0
 e5h+iay4asZ8/zO+z0eowGGIc66DAmB5Ox0z2IN5zS8OULQvxBdJnjA/O0RZND3A+zrS
 E4BQ==
X-Gm-Message-State: AAQBX9dokrR0h17Wzf7DpruqccszKEnzGEaKtQ+mrM4FA4SFJlVgNhoK
 QagCmlQ8y+vKgJctjTlkhP2ce83ExJwgXQ==
X-Google-Smtp-Source: AKy350aMCN1nEYNUtJHDqx1XPV+dmVVMY1L8PrZRO0m+EAyh8KaZth71svh5B08R4sMA5EyhEtEmBA==
X-Received: by 2002:a05:6a00:21d4:b0:639:ae5e:ac57 with SMTP id
 t20-20020a056a0021d400b00639ae5eac57mr4368843pfj.1.1681405479837; 
 Thu, 13 Apr 2023 10:04:39 -0700 (PDT)
Received: from adam-laptop.hsd1.wa.comcast.net ([2601:603:2180:ebe0::a8d0])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b0062607d604b2sm1637133pfn.53.2023.04.13.10.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 10:04:39 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 10:04:35 -0700
Message-Id: <20230413170435.18131-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230413170435.18131-1-aduskett@gmail.com>
References: <20230413170435.18131-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681405480; x=1683997480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9/8s1G9/ziUce+ycuvV+Lb5crRowr2ql+boKY0bhJE=;
 b=YxlZ0tANmP/CoviZoyorj3gKQ4iEI46OlRhRZuvDD+nWzGrkSK5hSbMQR7R17EGXJr
 VSAdURLca0burPabQW1nzYYe5Oq8Kht4bw7ulvVA6hc0ihVETkRVk1BxW2foCnz2ophf
 ZsUB5sA/dDG0UQVBdWsfw2Z/wdZAT88eG2ZhexNRCxkxlwux5gDA0AdyDDEFRnHrxJwt
 fSXOl9TXK22UEETGawtA/UrcP+GJIe2K3ETZMChf5yjIAdhfltneMxpUadOsCXTyXrFC
 AtQdX1BD5VNh4wRYps5qlPncUmMtRGmaBU6hLmiJ5/V21RxBo1lcUKM2OXPd4vSnglbE
 SFsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YxlZ0tAN
Subject: [Buildroot] [PATCH 2/2] board/pc/linux.config: Add framebuffer and
 pci support
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These small options allow the pc defconfigs to boot using default
virtual machine manager KVM options.

Let's use a more modern kernel with a broader range of hardware support
for PCs.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 board/pc/linux.config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/pc/linux.config b/board/pc/linux.config
index f86352e1ea..c26c2a9d00 100644
--- a/board/pc/linux.config
+++ b/board/pc/linux.config
@@ -15,6 +15,7 @@ CONFIG_IP_NF_FILTER=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
+CONFIG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
@@ -63,7 +64,11 @@ CONFIG_DRM_I915=y
 CONFIG_DRM_QXL=y
 CONFIG_DRM_BOCHS=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
+CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_VESA=y
+CONFIG_FB_EFI=y
+CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
