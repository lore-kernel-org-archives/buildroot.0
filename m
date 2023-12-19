Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E77C46CCD
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A101A43571;
	Tue, 19 Dec 2023 12:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A101A43571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UBw1ZPh4pPa; Tue, 19 Dec 2023 12:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86779435AD;
	Tue, 19 Dec 2023 12:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86779435AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0571BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E6D60E7D
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E6D60E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbg4xmpabVNw for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:20 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C9BF605EA
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9BF605EA
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5537dd673e5so1431291a12.0
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988118; x=1703592918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTB+ZKgAbu87XT2EAfgIRr5Gu+Dx+Ep05v30yR7cBrs=;
 b=xBi8n80vJ81jcQORzBlJZUj4p3nV/irdxh2fPZbS50jk8uJDX0zUzzPcEwCOHywNkO
 5XBDBAhXlAJNzk6cQOuFYwa9jxR6q4dYbJntym6VN7BoT4qTk/+JISfB0mtI6RSmUFCH
 DHIbVUJ077lMcX9LrduStAbvBFIs7xbROnZRWsIdo336AARCv6kPvjg1mCcOFsgEyn7k
 HalbzMlk8QgEU50V8T+RVTAR55QX0VYCpuP1Mokjt3zzfYpAPlabFCBLNFJlnceGy2au
 NO4At0ups5R4BWhAoqZjfejFbqmJqM1L5oRj9CzvbAQB6BfaJiv7ECJiFqhCvMo3NYCT
 AhUw==
X-Gm-Message-State: AOJu0YxkaWjaJNQhbKZr5xtZG47Qm9G35WlBbXnKirhjJw7Y20O1fIzL
 KbOoYxEcLLIMMuS7/f2I70nj3+XyDYleAzOPPG4=
X-Google-Smtp-Source: AGHT+IEtSwVmHgqXNBtUVorQgGas6ArU6qse/p9RRrCXIOkCskPd/SM/09acs4iWQ/uTdx/X26XKJw==
X-Received: by 2002:a50:9fab:0:b0:553:4bd4:1d52 with SMTP id
 c40-20020a509fab000000b005534bd41d52mr2345045edf.75.1702988118188; 
 Tue, 19 Dec 2023 04:15:18 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:17 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:06 +0100
Message-Id: <20231219121508.1695768-6-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219121508.1695768-1-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988118; x=1703592918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTB+ZKgAbu87XT2EAfgIRr5Gu+Dx+Ep05v30yR7cBrs=;
 b=hxaRqLkkSCmSEKGYGB8lFnm6xJGUKLC/XzZ8XxZiMiJhUDvdXmB80CwecUwcsHON32
 o4zMUQtTzZyCEeQyrZYpNZxPAa75R7DnmoFKD65sBLi+ZAErhzcdyqD4mfgzcYJfHJG2
 YB7HzFztgX5SzDNXHvzlAcyMZyX9Vns4yhjVWpNqqoFsfz+aGL7hZ5Babm12Vymlr/ek
 rJh3AIWBNTCnIUMv0KUDXAS4TgySU4xF7SR4qlj9xBCfDOmy7AAvIN+siODjsYzaz1uy
 Lvzgeai4jYkRS1vQwUGb6jVvkZwr0ta/KGtE/V19TyIS8h52Pykqnz6DxqQuN8rBE6yw
 foZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=hxaRqLkk
Subject: [Buildroot] [PATCH 5/7] configs/stm32mp157a_dk1_defconfig: update
 arm-trusted-firmware to lts-v2.8.13
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

The assumption is that updates to the stable branch should not break anything,
so we use the latest LTS rather than a specific version.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 configs/stm32mp157a_dk1_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 3122c9647a..170034f0e6 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -27,8 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_v2_8_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
