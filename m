Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C93CAC5A8
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 11:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D028615E1;
	Sat, 20 Sep 2025 11:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNm6kofI9ROX; Sat, 20 Sep 2025 11:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E64615D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E64615D6;
	Sat, 20 Sep 2025 11:21:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6285D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DC8400BD
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOm-sb3gxCZ3 for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 11:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5D7040057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D7040057
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5D7040057
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:21:51 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b28e1b87c31so34229166b.0
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 04:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758367309; x=1758972109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=He89yfrus3tM7VkrZl+okP2jU0yN7w07n5HfPUxMFNg=;
 b=Oi8jgAK2POE2URBrHTc6UEHJgyxV94oo6zk21aK9tot/QbcCx2WNzAEOFGoR+ib62N
 EA4VXulX/IUvesgk4LhtcNN9OtTic/pAMYyadqRoICMrv2UeN95/sci0UyQO6rYoAtTv
 293se9GeEjAUsJZVm6eb27cV3QOvaYvkSF/XO2jH6UPKMiUMZ9To8kEK2pWD1I9fcyIE
 J4dESoud99NeNuEm2dJauVz3u8PsFUaERHzZ52ToPlzuCIcuOUhs5sxfpkoHoXS0byM+
 ZCP6PkJTgWDLpnNN90kiktYiNCfHvEAlGmGyFEapc4pY2KmWKKua85EYNRtnRKhMTg9R
 4Fpg==
X-Gm-Message-State: AOJu0YzmhHGwfsiV3+syxAc+RmGUr6phwaqBXPU0Cwr0mnHTFxUWNOe5
 RGQ5QIft7KxUJT3+QmNSgzGVRmttEEqHiwi4JZAoAcLYNvkXK433SO+nqHAFUDYdjhrvKX5t6sy
 9gWGq
X-Gm-Gg: ASbGnctfV/mcjRVkN6LxJnq57tmlTfxBwi/H5ZGFCwau5xhZDxl2dP/yFCwL0ze17wx
 8h/H2S88vKGsKIpahHDNajLotohPz9n8WMSrkuhhJTa6QgREPvI4aWrk3WEZxxGEnzDb0uV2Ajs
 XbdXFkS5nyvQOqB0wUCw6J46qp+iFVk1T5TRCVdIWLCWTE0avGs9RqFuftcjlYXSMIf3TNqfoLU
 yUdzHJF1bFzbch6dKDRlUOzMoIyRSyGi/ZXrntb2Z1rbMiEX9s+BpmEVnL9NtRWOzhrOnnESmnt
 8ehwlbwKnSXawQtfLWQcMKq16BZVmU5GTVfU7BE9oa7AS1oBlTGV75UbU2Mk5T2zidMh2wECYyG
 RdAjYPog6pCw5aWjxr/Qx3DR02m5a2mFBMApTQUa2RaxLzPM8Eb/hlCTPUaNKG2oPvFtkYoOATR
 tNAUq1dKTskMqHuvcRcsNEf7V+O/zC2MjJz+M5WvjIc2gYfQ7Yhm3dKC1Ef1HEu1J9
X-Google-Smtp-Source: AGHT+IGpcEXikR+U9mjXMiJ3GwPFDyo07wtnFI/I62e2xswjZYAwdQ2fIWese+yL6K+0UqZUWchgLA==
X-Received: by 2002:a17:907:7287:b0:afe:93e2:3984 with SMTP id
 a640c23a62f3a-b24eca01040mr649551266b.8.1758367309527; 
 Sat, 20 Sep 2025 04:21:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d03befsm5243613a12.2.2025.09.20.04.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 04:21:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 20 Sep 2025 13:21:38 +0200
Message-ID: <20250920112138.2577200-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250920112138.2577200-1-dario.binacchi@amarulasolutions.com>
References: <20250920112138.2577200-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758367309; x=1758972109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=He89yfrus3tM7VkrZl+okP2jU0yN7w07n5HfPUxMFNg=;
 b=Ni970+lKtgSvhTnsEGn4aFgYVqtKelqKJEb/sFLj1zVkTAWeoCKvK5+N7Xf0ZJpstp
 t1F4EfI+r858mxJGOXxH+VygoUomqhFfI4TlcG8HfaPmTcjWljnMf/P78ZdV11iriimo
 X1ZtnUa199dCuznVFJNtRRkXfzKU4ettIpzZw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ni970+lK
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for bc
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 16d9ee892bdb..f067f0dbe950 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -806,6 +806,7 @@ F:	configs/stm32f769_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/bc/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
