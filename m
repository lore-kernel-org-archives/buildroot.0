Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3989CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 16:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 706B140A1B;
	Sat, 21 Sep 2024 16:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqAhxUmJPI_v; Sat, 21 Sep 2024 16:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35F6A40A13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35F6A40A13;
	Sat, 21 Sep 2024 16:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0841BF373
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AD2860618
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuFDgcPWmDuD for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 16:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 542F860621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542F860621
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 542F860621
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 16:33:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso37776885e9.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 09:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726936381; x=1727541181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6+8ezbp8JfLdtnSqRiJ+YuzFX1QM2x85GECEUIdRlQU=;
 b=ENlMIwee6bBy+5qVLawx7XunEgQUkuisunYkMCTCcsCMoZIZiuNwGMDzkhhcQSBvkn
 8RPVFOFh5RZYNsVapUBDjEZ55AcWPwH+LxeGzjsxe54v2i0RmX9eGXJxljdn8RcEMb6J
 HwZvYYp2iFRtgj99TPpwwpQSSgSlDzIDDIfQblcxs5nK/iPgjFl1eG9L0z0jv3qV0xdj
 3LaZpET60iOn0BjmjuvQonlB8wSWcXbbSV28qZjtmUPwWFaTyTG0mtkfmB1ogwiKQR5E
 TRowiEpBp5ScT0IxUqdOhTZ8mHkgzQ49Jbr8Lis33LibORyTMNowbx/LXk6mdjpj8qQ7
 Rmsw==
X-Gm-Message-State: AOJu0YzWP2KrFf3Djc/fSu5fiMGqboRIsQIWp1aVT+9Ffz2GvY8wBQ/b
 JB09/3szla+QA7Psd4efhiT5v0a18BOI3r8gvl55j2vlO5400X6V9Ov/xg==
X-Google-Smtp-Source: AGHT+IFO2GWzeqaFCYnM/BQjEVIOhwtRgLxCkQkya59Tg9aIE+X1hEujSsz9gXbKZFQbDQtHZTYvIg==
X-Received: by 2002:a05:600c:3c97:b0:42c:b187:bdd5 with SMTP id
 5b1f17b1804b1-42e84ac813emr25108625e9.22.1726936381149; 
 Sat, 21 Sep 2024 09:33:01 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f0622sm20364665f8f.18.2024.09.21.09.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 09:33:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:32:58 +0200
Message-ID: <314de891413aba73a2c20439ec98d35e9bce3f64.1726936373.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726936373.git.yann.morin.1998@free.fr>
References: <cover.1726936373.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726936381; x=1727541181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+8ezbp8JfLdtnSqRiJ+YuzFX1QM2x85GECEUIdRlQU=;
 b=XkiYRLfdn2a8/gVzDoP6vXQ3ECTsDUmiHx686N2h9ny9JVz+UytYflDTHvcvh+n4VS
 Y04pqIsVprmUu1Mfb4CKYsoH77eeFg4FHarbuPn/DjW0m2+6h0pZ7llEk3fbpWPxMiEb
 L2aKeaOrAUGUUACzr8vY0x4Ejk8jL1ThDrPET3ZmdeQba6Lqw37ojpBcmxG1y6tMcjC7
 tWFdgzE+eAKYTdor+jVuW3ld8ZWuhtv6+Jl5tTNRt28jL9Qr9g5RDS8p7QVEH4G4ItF0
 6IGuCKvpBOOHHcB5Moyg4qEYDtwRGhIx+HJwMrwzheNE70JL6CemTQExiJBFRY0L8+dZ
 4gyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XkiYRLfd
Subject: [Buildroot] [PATCH 2/3 v2] docs/manual: do not instruct doctoring
 the saved defconfig
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Doctoring a defconfig is tedious, and it is not easy to update a
defconfig, as it requires manual copy-pasting, adding comments and so
on...

Instead, just require defconfigs to be generated with 'savedefconfig'.
Any details can/must be provided in the commit log.

Reported-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-board-support.adoc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/docs/manual/adding-board-support.adoc b/docs/manual/adding-board-support.adoc
index be7699668d..0f7d534603 100644
--- a/docs/manual/adding-board-support.adoc
+++ b/docs/manual/adding-board-support.adoc
@@ -22,11 +22,7 @@ selections are highly application-specific.
 Once you have a known working configuration, run +make
 savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +<boardname>_defconfig+. If the configuration
-is a bit more complicated, it is nice to manually reformat it and
-separate it into sections, with a comment before each section. Typical
-sections are _Architecture_, _Toolchain options_ (typically just linux
-headers version), _Firmware_, _Bootloader_, _Kernel_, and _Filesystem_.
+directory, and rename it +<boardname>_defconfig+.
 
 Always use fixed versions or commit hashes for the different
 components, not the "latest" version. For example, set
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
