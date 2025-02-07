Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C5C02199
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 23:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D31E66078F;
	Fri,  7 Feb 2025 23:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECRJDR4WjEja; Fri,  7 Feb 2025 23:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E21B26076C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21B26076C;
	Fri,  7 Feb 2025 23:20:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6DABCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 23:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B8EC42950
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 23:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_FQlHnY3Zx2 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 23:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7FAD4294C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7FAD4294C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7FAD4294C
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 23:20:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439307d83f0so342715e9.3
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 15:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738970445; x=1739575245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7HSgtCdXlYRGskRkj4CY+bguZ3ApMkbUnCPwm8QsGA=;
 b=a1n6r0Wmcwsld1DOMo0ndr/CoNtAOqNBtvFTbFD8aI0elapg0nnYtq2YOQJEUW98lY
 WtijBGmtDg80mCN5K+1Ul2uty0pX528xWRMkKHkLR69/ov+rnKP8Izq4QbU07oTYEELz
 zxSifLTgr2w3KAVg38cfpGDJ1VbGj69v33wEj+SogtMUh0FvC1yspmGqBUDaRv6lxiGF
 rdP9FrBCepB2qZ4pIWzuAB13fkrcuSUu2mFG78pTWnrUlnMhbB0S+mSSA+KFQkJYHoLk
 usaxL0wpDaMF8sdV7ThEtaZPXhEgvL30sT1aDWUw/jN0v0/A5Vd2e5NqsIJGdIiQ33nk
 99Rg==
X-Gm-Message-State: AOJu0Yw0FfrEEJxQs9Aw63vfdQc/Rp87BF/p0NTF6OUqfVDWMEty0h6+
 BlRMtdvIukmsuk4nDlcpSoky6sUk+kHxU0ce8RtqsteJYaeh70/ILdUcxR+7e/h/kT/OYy0y+OF
 K
X-Gm-Gg: ASbGncu5Z4Jy9C/btdl9Bz5P6DqV1GbvfqzbV/Ox0Zm2Rvdlsbx0sFSQGTt8XwSYERt
 YJZkvVaCrfDwCr2ShH/Zh17uSbc9gdCUBBWjy3B16J9Z551QdzOEYiaNxvIMYr8Z5J18/RsSmlC
 CUIHw47U7sJ9O8D9qqnMgJrhhtRr/xwxixlfhcSHf/2hjpXvJBG/phJvvQRI1yaoamTTbydP32W
 EIHj0GtAxh1iLSkXinWctibCKotv3lROqtTa6t1fcgIC5etE+EubQExKJOesobasW6bdBlBg1Nz
 5/8lviv2qPrTuBsREoDBG4TAQSC0NO608euI5ggl556mGEcle5At1hddhHGEwloBdIVaxgmyOFg
 eT00=
X-Google-Smtp-Source: AGHT+IHcD4QD3I+AIBj2S75d6wc31tmuNv4h8YRA/ih+ARL0sql6q2tMue3Yj9N+7uEnO1m4Xu/qGA==
X-Received: by 2002:a05:600c:b87:b0:436:1c04:aa8e with SMTP id
 5b1f17b1804b1-43924991e23mr50597225e9.16.1738970445556; 
 Fri, 07 Feb 2025 15:20:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd35742sm5588221f8f.21.2025.02.07.15.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 15:20:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Marleen Vos <marleen.vos@mind.be>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  8 Feb 2025 00:20:35 +0100
Message-ID: <20250207232035.3953972-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738970445; x=1739575245;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7HSgtCdXlYRGskRkj4CY+bguZ3ApMkbUnCPwm8QsGA=;
 b=lzT2A6Bdk81eEVGi21R/QXjUKZjBmn/yCdNUjKjtYx4Ka7aNa5Oi2p7/uxQPTggcsP
 AdStgjwNP0ljFsIoEK2Kmeln8aiu/6zinsNVKXbqNulXgDUufFVNCA9CN3F2xZFGckiJ
 8wfF8tuTUG9wfOEIc65Bk4sT4RYBYp06pO1II=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lzT2A6Bd
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/common/stm32mp157:
 restore linux hash
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

The commit 9802fa0b5baa ("configs/stm32mp135f-dk: new defconfig") removed
the hash for the stm32mp157a_dk1 and stm32mp157c_dk2 configurations,
breaking the build. The patch restores this value.

Fixes: 9802fa0b5baa ("configs/stm32mp135f-dk: new defconfig")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../common/stm32mp1xx/patches/linux/linux.hash                   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 42d02c9f7836..f6a5f5e1c90c 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
+sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
 sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
