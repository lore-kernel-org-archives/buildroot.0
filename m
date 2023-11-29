Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC91BC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78441843C4;
	Wed, 29 Nov 2023 17:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78441843C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gi4_n-zMvoA; Wed, 29 Nov 2023 17:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8B2843C5;
	Wed, 29 Nov 2023 17:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8B2843C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 758671BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BD27817FD
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD27817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6UB8ANAoKzN for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:47 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AF3C817BA
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF3C817BA
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54bd7e5182cso84742a12.0
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278805; x=1701883605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxcO84BsE2LxfpIU8FE8QGqmSK2grlEMM2Z4MBDUhjs=;
 b=nqIdgZJHb3JDUfyVbpWs7nSxDq72g+Mwvo5mHLnEQF7tQhqSWehYBv6eH/mdxy9K4E
 vaWKzNlrj/cDLlynOvG3eCdSD4swl9y42VFXUhZnWBdW+C99Ot+brw8nhebY+qDaC/6C
 ER+Jdss1vRVrn/ZQIptg+gA2Iuc4kpdjGb89BK2pmERSwfqGB34mdXRk+RtRHTPL0KZ/
 jQU2yennJT1+r+Kqk4holplJmutzv7E3URHy3S2CYe1sOjqu0DyyzXaneLODi2A1WLHl
 p1gliyLVessal3DxxRc3jCiug4HNRRYc0GR1MCZyXljHw7RkpH3zVV78E3yeNfDw894s
 rgzA==
X-Gm-Message-State: AOJu0YxOHDqS5uVcl9ncPhkcyfp6HMzh6pwjCm5xV71c8TlLE1KfX5RI
 b3eLGngxSlHa+g6sQagfWgVb5IgHTx35TUgEKVltgA==
X-Google-Smtp-Source: AGHT+IGnd5PnZxg8nb/fayOKHX1sl8dGZZswf4zI7KkTmq7wKVCqeT4rrSqoXntO6kuK3hPpUQw6fA==
X-Received: by 2002:a17:907:1683:b0:a15:30e9:4124 with SMTP id
 cx3-20020a170907168300b00a1530e94124mr3682897ejd.46.1701278805485; 
 Wed, 29 Nov 2023 09:26:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:12 +0100
Message-ID: <20231129172615.1683565-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278805; x=1701883605;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxcO84BsE2LxfpIU8FE8QGqmSK2grlEMM2Z4MBDUhjs=;
 b=ZC05kS/OfCqXLtoXH7CSkXS20o09m3yWM+qaHCHzSGQCPmr2L11o7QTRZrt6OOHoq3
 PV1DVsPV+2jCd7Nw2U9yKSpOqo+kDsDJfQA94nay0Y1cmbLMKOEVTy81rWdo/WrsP2rV
 QZ+pQtTGGZOwBc06ypKV+I2eDan84zfH4kjtg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZC05kS/O
Subject: [Buildroot] [PATCH 08/11] boot/ti-k3-r5-loader: set binman
 environment variable
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

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

The patch set the BINMAN_INDIRS environment variable to provide the
directory to search for binary blobs.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f2e..d5ec8fa8ba96 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -58,6 +58,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	BINMAN_INDIRS=$(BINARIES_DIR) \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 define TI_K3_R5_LOADER_BUILD_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
