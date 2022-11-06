Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46524C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D8B81BFA;
	Sun,  6 Nov 2022 10:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D8B81BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQEw5aNAzF4N; Sun,  6 Nov 2022 10:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96D181BC6;
	Sun,  6 Nov 2022 10:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E96D181BC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26AF21BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022E960B42
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 022E960B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDbk4YDkEUaC for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:21:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDCDF60B38
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDCDF60B38
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:21:40 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u24so13387027edd.13
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 02:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dptRUAlMkhl1naSFJtCLv/g0gswiRc46omSv1As8qYE=;
 b=nbgiSb7DLo7KL3Ox22OK48Cupp1K0TPNKPBFmJqmvYCdBl76YErqJ1qMi/bs+aDTD/
 ZQePzyKD3CCRomTUJOXVCg2WtHyQoyxJDr9PCpT53BsT4y6rsxqoH5bB7PPZBdPJRxu0
 sv/GXL8tc0+TvnOZQ4kh0Dhhx1r/ChfexkX6rKxIjFkqGK4HrWaw6vf6vU9MPryb8yts
 KDpxT6fLvsJ0juIxSfPgEXGkqbXz5FjZ6iGhVatAZcWNTdbrd7Gb1nQDWUjxIi7tA9ye
 kIUYhsD1TZt5RkREznYx7RLNcQYmDrrmYtHnC+vXxM/y9gekc6sUCEGovyfim5qqH43b
 2WlQ==
X-Gm-Message-State: ACrzQf1Ot/GWPEz8sjio4LOFCwtu6TGdMnBj/WXCbKhZWQR9X1D79yxe
 saqJ6C4lDGdi+rfPP4NSPUwo+1TJNUg=
X-Google-Smtp-Source: AMsMyM4rUsRiFXTnioxjEr2dRsq5FvOU6cTt3IfAhpdPZrr5qhS1fGQrVMY/FnNmZaX4mRAE488kWA==
X-Received: by 2002:a05:6402:27c6:b0:461:e426:dc8b with SMTP id
 c6-20020a05640227c600b00461e426dc8bmr43374389ede.403.1667730098611; 
 Sun, 06 Nov 2022 02:21:38 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b0073c8d4c9f38sm1966445ejc.177.2022.11.06.02.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 02:21:37 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 11:20:48 +0100
Message-Id: <20221106102046.13138-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221106102046.13138-1-heiko.thiery@gmail.com>
References: <20221106102046.13138-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dptRUAlMkhl1naSFJtCLv/g0gswiRc46omSv1As8qYE=;
 b=qZZ9WMz7YS3Rjv121b+tqyVKoQV767sO3vIAWhcGwn9C0AVeKiUhSwYWOWgT080s5M
 5C5j3zRzRMc3+KiiLnbUX7uaTt5hOjX9VJ0zpzHCt3uCIUVXW3wJM1UStu+wmVSZ0/P5
 O/2Z/qrXiP3Ymn8zhGeVggjsz2KT8/gAN94at1sLoAOyeo3rx5MGFkbdkd3aqtLtLfSu
 kF2YDYiEdgVb9y2Di2YSOPC1KBMaZu9FTVEe5qVb9MOfGA6AL75X0DFPq/WrdWi4fZEX
 UjgFWor49Q097EjFjR2YW9NDQ6I++wKTSNvL2aczLdU2Z1geIoRIOAX9/2/bsdBI4cBy
 A59g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qZZ9WMz7
Subject: [Buildroot] [PATCH] configs/kontron_smarc_sal28: add
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uboot host tools require openssl. So enable BR2_TARGET_UBOOT_NEEDS_OPENSSL.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233835

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_smarc_sal28_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 25846c8cbd..f8515f5b76 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
