Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C1EC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E4B0822CF;
	Wed, 29 Nov 2023 17:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E4B0822CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JqQ02HKwp1m; Wed, 29 Nov 2023 17:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CE4843C5;
	Wed, 29 Nov 2023 17:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68CE4843C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C51B1BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7272E41B27
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7272E41B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6tYfYngiTQJ for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:53 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF40C4193E
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF40C4193E
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5488bf9e193so51557a12.2
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278810; x=1701883610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QB/jABmGVaHxz0Jj4pUxewJBBbdAerfHKX4GgodutkE=;
 b=n588dEKQ7cCvhuRVdpHmQI6Al4QuEzpVWRdUEN+yePBPEI9MzvI/g86K/3s831BNXP
 xokGHnDkbrwWtabQnQfs64oiEso1+OmNhi+/G485+ibCqB4Hv5opaRpe8L7IbvOPTmlM
 9y6nL286Z1n9wnEhkm3xFhu+YcLG1doPajASZmR34fkko7eY9OvZP+owD6c5Ncixtkbw
 f2vN8U2G+NYSEf7XgoyDmod1X9E8PEohXxWjoMEkppANNypnGDCOXFWwYxY8w1DMYK1T
 Jr0T08xuS8wd7ByrDCQIcyovKvtFizX7RXlIE3JOU7ht4UVlGlyhVOyYcn9lUIkwkXz0
 tgYA==
X-Gm-Message-State: AOJu0Yz9msKm4pHjCqjmRi4fbHmg5HDNSB22EYbEh/V6jNLtSUW98Rhp
 t7HSY1UxyfAiJPV7D5tQWKJKnSPRbyIYxDWpO+JYww==
X-Google-Smtp-Source: AGHT+IEyMvtnay2ITuT8E6uk7wrqtt6hJH5WDPXrbzKZxMSVHbVqFCqsVw7Jp37nkeRxuaedmcBriQ==
X-Received: by 2002:a17:906:7c4d:b0:9fa:ca0c:ac42 with SMTP id
 g13-20020a1709067c4d00b009faca0cac42mr14671127ejp.64.1701278810561; 
 Wed, 29 Nov 2023 09:26:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:15 +0100
Message-ID: <20231129172615.1683565-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278810; x=1701883610;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QB/jABmGVaHxz0Jj4pUxewJBBbdAerfHKX4GgodutkE=;
 b=AH+gCwdWokBrnw5e7GTpGnFshTgTnXr3/9PEmbF3lXCHHBu5FWD8jvUxL/G8xJkzKO
 aaUe5ijO00PMhPIsFaPjWeW2fd+JnraVC7JzZY/SKAxUJNVnJInho28d/I9o6lQRUTln
 /66+5efpm0Y+2FoIe3Q28w0x7p6UcdIhCpKRc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AH+gCwdW
Subject: [Buildroot] [PATCH 11/11] configs/ti_am62x_sk_defconfig: bump Linux
 version to 6.6.1
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 9e4df5e8b2ed..155bc240a9ce 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,8 +1,11 @@
 BR2_aarch64=y
+BR2_KERNEL_HEADERS_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r PARTUUID=00000000-02 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
