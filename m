Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB43DD715EC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8173640A61;
	Sat, 24 Jan 2026 15:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv1T0vER-1LT; Sat, 24 Jan 2026 15:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5453740934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769268595;
	bh=uIfDeSEL2a4y/4xSXvc9sqxXU7A1JL4a7sokkmvWc6I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Om9ZAHe+cYwSixQlwoefGPJPVtzvTKpokFK3VMzFv4K9Mv0MKutzZcAxiT0zUtAKj
	 +yxWpEV56CzLgaFPkWpAzuA4bFGW20SvnUwQ+K53YFduugbI7y3N3SMri81G9Mzlw9
	 F2XRCRG1zLDPmkxF1X9BKO1s1Tcqy1WCV8WAOhHxYxVEZ41FJAeXbmJi0K8MSVeA0d
	 b7b2jJKO8fXjpy1Xme5luFRxGU3QMMRZy/KXhwKvCXaqD4NNHK0EHLXK0NQs2YNiqd
	 VXtvoxnfVwoM5OYX1LkwarKcTjNRGO5PS1wEeOWCfzmMYSamhIKrFUVFzsv7mM/XY+
	 UFmh3ZxgkdI5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5453740934;
	Sat, 24 Jan 2026 15:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3469A71F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 192B881D67
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NalEI_kDefUc for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60BC181DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60BC181DF4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60BC181DF4
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:29:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so22802815e9.0
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769268590; x=1769873390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n3Mlnte6gkZ+/x5T2ZdEnAe3+2rIH2zdeWdmhhKaKqc=;
 b=CsxZDrmgmsK20I0aT2aNajZfz1LeICrEl8B4QG1qYbeKwauhwPVwjIlS2T4X1R92/P
 I7klBqPF89SZ430VEaEz7/I6Iq9NeBdPdabNJmdft8QWI164zdUwhmcTB8xRhKBoZAeg
 jieX7QJTZ0xmbbanmAxXLQg3A2ozKL1UgfjkrcIL5q4woxIKsNXUDC3UfCxUSZyaJrdq
 ywMEI65VdwTh/e8/Yxj0fAD7SmK12W8DnKk9WhvjqtpAPIeSlVWdqmZwOMN8YmQhAxWI
 tjzBcT/1e3zvFMybUfHWoKy8bpFV3HspQbwJKRUS267bqdFoC6szQExUmfdvrRZFfxPs
 BYkQ==
X-Gm-Message-State: AOJu0Yy6wOw17LsQlouQhFR+aKeIzmsNVoQh4UvBFBYfciFTWurIl78M
 1AOFyl1tf2XDYfMenpg1Xqeh4/prb0cS+YFrgUnhQgh7DbWQKiuxLKyughXFjN/kNM3SifqnF7/
 tkpgM
X-Gm-Gg: AZuq6aIbj3gM3RhQM5WlVsN7t/rZtmngk2Bz6vfYMpstSFQYXwxIBL+od+NteoQ8W/J
 xObO1eLnCAhXtR2TVIsvNbOjZ1q4WXadX3l7dQKmcCmW49M17c9HEjUucKpAQmFKwUAYKL8CAv7
 3BKcYzoXnTfckgQ3ysHsx0K9epRxOa9GWQh661J5uijlSvHmQidyMIFzQYrqYRUb1MlgnzJdC6z
 WJB/ln72ExZ0kFiG1BN7XzaEobBUjeQSgZ6uc5vUmpkVoQYbugdSOFe2HFm6rNfbIB5dvUSIAE3
 uGPXy2rvi+5i62ekuy7VutyBCFdWvdt0x5TQPC9O+ZF4sIaDDyPpbe9aNfSNrJRcnYtxt27kRFy
 aXtAnpZ6o57fKZoedUuX7ZcX4C9YW2WQLsbdBpxT0tOlIRCFWLWSCI9aYLxWWCPlLVMM7aSoyyL
 +yeHY3JjxyJVbRosNxm3ZOhvR7K7sl/aheyL1u0HvcUbxIptYqjoZJym0mYagAgHQ5GvDcKuvzH
 2Cd0F1a1cCA86OpOFeM+Trg0qNl3AoHDMiozCaId5dtDFufLV+t1sy7I8jvyHD2VRHYCff2zu+Q
 pBp9u7hMdcY=
X-Received: by 2002:a05:600c:3b0d:b0:47b:deb9:f8a with SMTP id
 5b1f17b1804b1-4804c9b736dmr91567025e9.30.1769268590332; 
 Sat, 24 Jan 2026 07:29:50 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d4f8417sm53068395e9.2.2026.01.24.07.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:29:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bryan Brattlof <bb@ti.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 24 Jan 2026 16:29:41 +0100
Message-ID: <20260124152941.902168-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
References: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769268590; x=1769873390;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3Mlnte6gkZ+/x5T2ZdEnAe3+2rIH2zdeWdmhhKaKqc=;
 b=nAnaRLevfEZC/PBmKz0Imx7A3fCdsE3XSmRRetoHwLd3n/Ht792xpDEZ1B7o/wYCr/
 L4otxT/Uk0yuDLx2/2G5zmYonWr7rYj8Q4VI8u5pt/InXE95gNIh7tdlCC1xxIAhXxsg
 G+2MZqSSOfmweqHH9gZaQhPO5VGXq06d+TH7Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nAnaRLev
Subject: [Buildroot] [PATCH 2/2] board/ti/common/am6xx: exit post-build.sh
 on error
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

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/common/am6xx/post-build.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/ti/common/am6xx/post-build.sh b/board/ti/common/am6xx/post-build.sh
index e3ff4d7f12ce..c32cfe25b299 100755
--- a/board/ti/common/am6xx/post-build.sh
+++ b/board/ti/common/am6xx/post-build.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+set -eu
 
 # genimage will need to find the extlinux.conf
 # in the binaries directory
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
