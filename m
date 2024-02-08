Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D697C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 21:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99522853EB;
	Thu,  8 Feb 2024 21:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9_ix9PHAsWU; Thu,  8 Feb 2024 21:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1CB3853F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1CB3853F2;
	Thu,  8 Feb 2024 21:16:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 460BE1BF30D
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FFB2853C7
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Rmzs1CSMyjr for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 21:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBADB853E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBADB853E2
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBADB853E2
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 21:15:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf5917f049so4005701fa.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 13:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707426956; x=1708031756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FD3lgrsePPFNgsDJt3YYXRrxWO9XVWaIWzaE6IJdYqk=;
 b=VKltmQhxCjNQkJ1DdSuFe6dzMbbw7OfL40o2ovSWPtw/UIDn8rzs1YySgUd6VepBK5
 /YIiGY5kSsGqT+ZFeZ6G2oVwn1I2FEbsvWcr3w+mGf0IE4zhUfNvRvUnv44q5TERXIPn
 1rZ/HJ+DNvepXgvnLSt0Jlz7PDBcUHixFsx2P7f2OwmmoHwhEesQ2tA8mT2qCrfMOt0s
 1BLD++afkiApObbNslF6VeAzWlvkKPTXSI2ru7GbZJFP/ARIcyGFa2GiqIHY5N4DMxwB
 mXttRHTBamSOLBSF/AOjBbo7jLpONocoZXP2XbW3Dpw6b36eWeOwznFa47dvs2kf5x9v
 jktw==
X-Gm-Message-State: AOJu0YywMldEkHs2B5nwHsXgc4gsS8VqLoHGu3+GaJigmmsI6PWtpU6l
 e62p/ZfcFXPPzsgIc3NzGcsXbSTspdBX4d46WTVZ92uVLeWa9x/Hegs1al0X2ybC3g==
X-Google-Smtp-Source: AGHT+IHKYdvVw/2z3OoBs5+UoIEJDU/06XaujJiJJZsMiwlAcneNzcK9fn/SF9LCayYdora4ZPXZEg==
X-Received: by 2002:a05:651c:19a8:b0:2d0:d49d:5c32 with SMTP id
 bx40-20020a05651c19a800b002d0d49d5c32mr457832ljb.12.1707426956160; 
 Thu, 08 Feb 2024 13:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5gk1zwlyD4JnhABbICmtGsNjsUv20Qt5yy0dLnvHvvPwhe94tcQ2AVi3U2uFB+1bWyJBsdP/eJJGhUUbbcp/QRgNg0ySrd6KJ+idt8ydC88OkkZraf8rVLAxfvStn7HQfTpNkGaw=
Received: from yoga7.fritz.box (ip5f5bff47.dynamic.kabel-deutschland.de.
 [95.91.255.71]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056402004a00b0056003b75400sm126217edu.44.2024.02.08.13.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 13:15:55 -0800 (PST)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 22:15:16 +0100
Message-Id: <20240208211517.9234-2-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707426956; x=1708031756; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FD3lgrsePPFNgsDJt3YYXRrxWO9XVWaIWzaE6IJdYqk=;
 b=Y3glmPQDt1MmCsJ+yrCQU5YqlWBk1+GavN6B90G22TrBwYA+MTqndZ4K4wNHUZK+XL
 9k83MSN20dDuNa3dGQxFtTzz+ZNQ1ebSSIDVF6kxoUCAAsfwowPs1uLigQjGd3bkyka1
 /dDkomVsjegtBirYM0etwfhJa/aqAbfeEm9TJRUsZCm1tdu8TWPvnAnifcBWn549tbxT
 htIOm5nzISa4Ac/gF7vXWCcyi0mTsdLa5IkhcioU8rKh1rJyKXhVis6eW8HFI/x1gu9U
 xoGjqWCnP5nEiO0JOIsuwqoPE5igyljJLP0qxePfz1drZ6A8lAqCkNe4FZ6q20iLJTY7
 HdaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y3glmPQD
Subject: [Buildroot] [PATCH v2 1/2] board/visionfive2: fix genimage.cfg path
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
Cc: Lukasz Tekieli <tekieli.lukasz@gmail.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set correct directory for the BR2_ROOTFS_POST_SCRIPT_ARGS.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
---
Changes for v2:
- fix extracted to a separate commit

---
 configs/visionfive2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index dc086953a0..3a1a4f527c 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -3,7 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
