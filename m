Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82949D715EE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD5EF82525;
	Sat, 24 Jan 2026 15:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiZ1Aa9VhsA3; Sat, 24 Jan 2026 15:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D726824E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769268813;
	bh=eP080bwyjd7JUBJtqNO0weA6de68QWJTom6qA70kNy4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Vf9k7pVqlpW58mf3i0mc/jJ8BKn9KHGx93GLErtN6qc4bpvULQwav2xfsumZeig+2
	 sP/VMzFgxvnNc9MdTrdPUlS8fO9FmO/IACh4cJsrBvq27d9pJZJqI6c+ILDJu/zgAx
	 h6EPEBDJF9pzspDqXvG279LEJeFFDwrsLrf/0K/cV6hTa5H+1p1B7CuZILUz2INI9p
	 PyGyTVqbutWCK9DzZLBLoqc4/tcY3zB53TLznZ2IyRC/mUYubvqN8oGHWCDsMarROy
	 NhEOLMFlOD7JNrwBgV3H+fctid60S0HObGsX0E5mrNOPB0smzug420Eng/6qLkNFmu
	 vbbcL+x0LUJSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D726824E2;
	Sat, 24 Jan 2026 15:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E8B71F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CD740965
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7A8zE_2DaJz for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C35A440746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35A440746
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C35A440746
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:33:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo36277355e9.3
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769268809; x=1769873609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQI2C1pLM389NMfo1Djcuv2ibGbbu1fZjOuVrcv1nTo=;
 b=o1QVO+MiaL2JCDUA+98EKH9P2L0kdcZvne0w0zWXGekv3bEdJDtaNpIVVInbxtugwa
 JtuCOuctbwUlLleZ2YHuoP/2K0j4qm5a7yY61htZrzwPRilmTTqkIioXPDzm9VJn8P7j
 4JHhAfiuUGJIeQseinwP60gKuQ28EH1LgeXUxiizYFstHFfzpEp1DZSJaknVoLfI2IoJ
 7cbH5a6swP9k9WLih8hRt+Bq0VgKUzXsKXPRUno0m+xDwbtMYCEfKX2b4Fb1HYlQfZiZ
 ZrH10yKjArirC7nXW81D1KKMgLcdrpi63OzLb85fJNabtqUcz7td3wZvP3nz6uU0PTw+
 bArA==
X-Gm-Message-State: AOJu0YyZvrHmG50nOR5fLK//vlw1ldmvUtnO2/zNFyd087dGpN4IQmUV
 SxgUt1KCOq/Wy0Wg//1I1SsfACOey854qArhBDxcEby1AuPX1QyYCIpVmESSXA1Y+IIwyGirujZ
 kJ9VN
X-Gm-Gg: AZuq6aLheGgreGOlNTCrKrODhi5Mxuc085ZvohJjuAK2yd3D1PljSOnUkcei2932OSC
 1imv3jYVPIe/5Esu42eqiESWM5kgA9ZQKpA7cXlUGYtsqJpSFCSXI28ftf0u1TOAG42ElyTsK/x
 Z3oMgOIEqEA7JCxPq+fK2NvhF0ROL6UB9Aheckj1acD0rja2rCk72VHd5hEVggO4BmKViSWaTca
 5N2DAt5f8EN8YWikNC2nwOlgbA26D1J7Qng6apseXL5h1s0OSwyRxR0Ym/kEznPBI7mBpqBx0ks
 Lf0ano0ux49C81IRv+Qkfk+Ak1RgrbT50oK4DpsvLHXRSLdjt7+wF8qdBiwk7VgufvH2TSGa+g+
 Yq+STMMDE8MTK31l3AV9AhPEZkQGL1H+ZJm5zFUunaOt5n1Mn/q55UjBJB+8VeJ5WbEGuAri9g6
 fq5dQsQvUuuw4cfxwZ9yBykal+v0BGFXMXpFAoDDyfmfWELJrmHXy2FeCgnhq4Usi/+TIY+oVgl
 uoOmKTafe11/CpOP9N6EQypSV16EGLhFgGttYVI6DSSuKYsg2NofDA8zKipTuPxvlupebwszT6Z
 W3J0LlQqkz4=
X-Received: by 2002:a05:600c:8214:b0:47e:e20e:bbb2 with SMTP id
 5b1f17b1804b1-4804c947c78mr115766875e9.7.1769268809351; 
 Sat, 24 Jan 2026 07:33:29 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804702876asm239297785e9.1.2026.01.24.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:33:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 16:33:25 +0100
Message-ID: <20260124153325.1060846-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769268809; x=1769873609;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQI2C1pLM389NMfo1Djcuv2ibGbbu1fZjOuVrcv1nTo=;
 b=MwEqL6YBjOP7T+Hb6Kc0univHLvTZOjcHccW5qmolu4rL3P3IYYuNO8/znmybVvdRA
 TzegY9Dcsnb6q6KHtxMBPOoPo1m/Tkx/LzquN/9KP8puN6NBW5uZJptO6bwY100YHj8S
 VEzKJo2Ti6TUuLO3kzJZYYoB3LgeLmpDegLp4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MwEqL6YB
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f746-disco:
 exit post-build.sh on error
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f746-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
index 03e9dcae8215..74c59fdb72dd 100755
--- a/board/stmicroelectronics/stm32f746-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
