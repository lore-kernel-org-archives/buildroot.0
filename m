Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34434D2ED0C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 14:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642CE61CB4;
	Wed, 21 Jan 2026 14:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHxiDxwkEksG; Wed, 21 Jan 2026 14:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC3961643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769006631;
	bh=PTIlbJDkisI8URBPS822ZjI1BQkUXFSvPKMeELVHUAo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FiKAFu2GZmp0QFja17Xi0FbkA6R/KiTM32Ec1y/3JZfXX7mygPME9TRj3O4/AYRf+
	 X2r2cg/AeMrc2PrBLXTWU9uqFzkKnH9nvbK3UsxGaVzdVrNshm8sKSvFngaer7v4L8
	 2HKTJtSeuFXQXxIUV5iKcW3tQC9qfr9aucilCvbtbjCeZje0cvRhnq7jI9Nf5Nh8lR
	 jz4BQ13m8YCoJobw6aKM3LabgoTJzboo72iSpPOR2pL3f75kd0eqmp0EJZrro2bReZ
	 q78RQIbN41IEXd0nGVzMvPD7IY3aZJQbFFYW0/fy4U83M2p7ATKzf7s62z0uqCu63H
	 AiBxqJ3QA30Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC3961643;
	Wed, 21 Jan 2026 14:43:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E23C6169
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 14:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C709C61643
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 14:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5fnP8qDIXNc for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 14:43:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B03A615C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B03A615C2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B03A615C2
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 14:43:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so3840622f8f.0
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 06:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769006628; x=1769611428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlG4hQkbqA5v5rTV1ekKyM39/ITerpNHCbPdm1rpNoM=;
 b=cfcIxx5hLn+E392XOyvgetxheXuE4pEI7idEFRo9w/gUiGnlb8ciZf1yvZ5LOOmg8u
 mCaPCa4xzU/oYLSqod6U0Xd9ir6ZPyhN99OgmAbcb2AQeIElzV5q2RQaJQZ2Nv+5l49k
 wAjk1Hak2vlPT4SNnxC8QB0+Pj1mV6pfaBgoX8eJf+iHn0/UyPSKvdtp6P89Hnp2UPhL
 MYk3m+60PIchWb7rWc2fNuFMUGp3T2bV5j/sY9xRvryaeKtltJpjANfXGHiVZXsvEFb0
 vJVgSXlJLPVYOMKPegi/3aVTDswnqud2QsoigTFM6NHvrucBQ0S1T5SrK/R1n4UkQvQe
 VWnQ==
X-Gm-Message-State: AOJu0Ywv9yi4FZ9THPoMI9TkbSdTTh4GYnSJ5M1S0LeZjaJ6HBtdPBDx
 sKSjXY/+ROcVGUqRkTdQiT6bC7ThzbSIx2SJinW/qRDdxjcMgrbwH2SFlPwHkw==
X-Gm-Gg: AZuq6aLCvzj+RG72cAOkQqLWCGPb7Sg0qidCJYfr1Wwwh52uXBAF0rGakhPwCPJN64Q
 iaWjnQAtyrhJPUuFQn2NCpgXAR1IGusDAS6rGBv0XfYNpF5JHckWCSc7gWC+5nwhPtAwGT+OKlk
 HnqJDAkIgJaSFVFlL+KuBufBragdX5YDYlgGhw/G32B+vqBfO1UTUoi0ZBOMhbLeVc/e8h53+mJ
 lP4xvD2bH+17DcWQnOX0bbkIXctw1lNdgoxf0b/Bfpe9lmcXWcbLbu7daRn9jfLWNiifgs5P6gJ
 YbLMpX0B/zC//XqxJR/nWph6t3xzmQf1yJfGzVf4gOl0gydv49a4K97kpsDZnngr0Rpf+GB6hkp
 Vi6hvUtVKECH+pHdfKzLEZCel1SzDtBcYgH21wl2iw5yO0zIE6Ia16Ir4cigtiVIDidG3b1YP6T
 B35kUj2kfnO0TTt+m123vjFX1mo8b5HD147iIlCG41mmdK96MRbRlqtQ==
X-Received: by 2002:a05:6000:2481:b0:432:d9ef:3bf4 with SMTP id
 ffacd0b85a97d-43569bc6f59mr23900439f8f.47.1769006627803; 
 Wed, 21 Jan 2026 06:43:47 -0800 (PST)
Received: from vcllano-01.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43596b62700sm8469302f8f.42.2026.01.21.06.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:43:47 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Wed, 21 Jan 2026 15:43:44 +0100
Message-ID: <20260121144345.1587764-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769006628; x=1769611428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KlG4hQkbqA5v5rTV1ekKyM39/ITerpNHCbPdm1rpNoM=;
 b=i2TRcPD+tmLXyuV/YsQHiuF6cCNhoAebikYkrKhTBMyBQqCxXeryRgMTC9DVSLmia/
 QoPA8TUlUTlKHDMEja3v9UgyKwXynTGae/3ayEWRRrqJWJLYr8r+nL6GsJtaaAyVQw2x
 i+N0jj9wfXmiDSE9euf5XfSJayx/drbnGkYhgvWhgkVXDA/akVgAFsEtybNr/etnqEZA
 4l6KD5F8A5f21j/zOdF+u1ifgJ4e6Vlre+U/Ae/wRcjiyQU7X/Ausz3VdVzKrgfssX7b
 xk7N5ewk/DeKqyNGFvkrVkpxFGPLOeXlg9jXWTSFA939IxR4mCG0YkmNJsbYl9YWPsia
 A0yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i2TRcPD+
Subject: [Buildroot] [PATCH] package/systemd: also run preset-all for the
 user units
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will enable critical stuff like dbus.socket.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 10e29ab1ac..41c5acbae0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -843,6 +843,7 @@ SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
+	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all --global
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
