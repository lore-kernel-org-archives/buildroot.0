Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D5FD715EE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 16:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680FB60A7E;
	Sat, 24 Jan 2026 16:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb5dO4e6PXtc; Sat, 24 Jan 2026 16:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25AB60A78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769271629;
	bh=s8A7UT6XXd1OesL+efc3sKwun2StKDppJIneIMR7Ro8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XyCQ7KEA6Kl+9gHBToVDWhTuPX99HE6+Cj+TvV6Cwpy8OV9wJM+yNkwewxOVpHp7f
	 RAvzBytVrb8YlOWN0hKb0iGrZvDWHnlVTSVTabo9ArERRHKk8Nhy03x/z6JFUtkp92
	 nz2JjPhMRiHMaKjGvyz7wIRTLzdE7cORCkeLSbxU6E8NmAO5wFnkIBYKgKy/FaJBwJ
	 HHW/4NfirYTmNI0RaKszK2BUvu1QW2+zK6Yc/axxKPOd0fQS942nsB70YvaO+FhDbQ
	 8C0TTNHsM63qgaIYtN8UAqVV0S/AU7Z/ICrRoy3QRqTQJnP2429WZUEKlhEwFLHUI0
	 RyEKDYerBmNCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25AB60A78;
	Sat, 24 Jan 2026 16:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5408358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 16:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E83405BA
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 16:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RzEY9iNwbfo for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 16:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8B9940168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B9940168
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8B9940168
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 16:20:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so35911345e9.2
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 08:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769271624; x=1769876424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s57SljO0FdPLFfIGI+D1N9yPzCBGZsG+Hu2YLKzc0WY=;
 b=KNsjIkDoJWi3EPJ6n8RrNeBFkkMXDiZIUsUtx1xIp64aca+ZDab5YYsCaV5y151Ysc
 ZD17+Bu2qbleuLm+ZCU8MVEdd5DXZvM+Gwz8tWMmrJsfUJ4GoO+ONKr2Hbzc3yqZ8mhU
 laZOXWXTXK/dX1uTmmX4GmTSUVwOAZ5nHcIDOk4P1Sm220PqhX309vzLWA5pDU3OViG2
 v+iQPO3ueeGt3uCtYKNLrMaRi3VSAaWgXoL0w9PB660p9EkkO9cbtMMDX8DpDLQJDeSs
 2HWWjq9mlahbgLdkiTn3KR6DXCejBfCoMnteNnpCsj6b8Tyfke+LU/HGX4WwjzwG+y41
 EC5w==
X-Gm-Message-State: AOJu0YxSmk3TcKjgHxHLJacgIidRCalkNycHDx9VQozzZO6C5EsJKAld
 aMjowfhWY0hlcRAFIlPJt1mzpHneDotv19+PY+pTFEh+J1CrvIbYTQ4PbEThzUO82Cvf9HMUDRZ
 79KCE
X-Gm-Gg: AZuq6aKcbVPkmJNtHG0JFUOK9QC3keEGe5/Vh8TXk4SQU/NspdIeMzZEGSh2ECm5nSA
 ZV0WnAkQQA1+5xHUvizHfDJDdHVNJkblk3FmS89WBIgUl+VwN7qev7CXX6l5o4hCbOsJhSnpItD
 zbc9Y/7rQk34NuWk9nPAXkoA03G2dDriukl5tVOsoBHkY48fOV4ory2zlnBjvjzNwOLjcMTTfpU
 BIfI6279R3/7mkO60+wZ3b5xndFlZ5Tmu+eldiVPrr4KoX/2wZq3vjiaQNo1GivUBNYC1mXUVPw
 k/PUF0WyD3yGZKguBKN8Cr3hr7jSkUGHkWj9M3h05T+Xard8SMv5ygswbzIhVrdhch8Wtdwh1MK
 nzPWSU7PSqyAWPK5YH2R3EtNKHyVRjiYDsDDbJ8HJDlgZRaaNhoignTZxhhsGOLHA1KHsKBncnU
 xOAXGELPAr/vOHp2oeJtLcVQAAhBhD2yR1P9sG/IzYcIKHL9PPIWbjntvODDHFUZo2M8kfX2LX4
 Vvj7JykK9mB2wmP5pJ8khZi1tW0Yw4IFKxXCR7VOStasPaX1RV//Pwd/U2W4ezqQhVvkYhq1UHV
 0ZjjLMY7PKJbI6pfy/4Stg==
X-Received: by 2002:a05:600c:a016:b0:47e:e712:aa88 with SMTP id
 5b1f17b1804b1-4804c9c144fmr117529285e9.31.1769271624482; 
 Sat, 24 Jan 2026 08:20:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d84589bsm136572315e9.3.2026.01.24.08.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 08:20:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 24 Jan 2026 17:20:00 +0100
Message-ID: <20260124162000.2396200-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769271624; x=1769876424;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s57SljO0FdPLFfIGI+D1N9yPzCBGZsG+Hu2YLKzc0WY=;
 b=ZZ33O06SJJJRbpRitq60x1xVUPxucxub4n/W58QpRMrB7BD+rtspq07SJuMbxqaZ2f
 b8kSmV1soAEi3CxX89JX07ADBmiw/o6W8AeLhbyvbppLE9xmi7EsbZxjvNBv7wYt0S0N
 V4aw65Jah8Ku67+TvPlE9T3qSALwNzJ6LcG7Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZZ33O06S
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f769-disco:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f769-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
index 45100509411b..293bf30cb3ff 100755
--- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 # Kernel is built without devpts support
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
