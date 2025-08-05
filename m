Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DB7C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 02:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03BA41A35;
	Tue,  5 Aug 2025 02:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUWCcoeJijKd; Tue,  5 Aug 2025 02:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032CA41A31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032CA41A31;
	Tue,  5 Aug 2025 02:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A661A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2359441A31
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3sR44eaUBCn for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 02:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73670419EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73670419EC
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73670419EC
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:59:33 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4b064e94400so20999791cf.0
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 19:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754362772; x=1754967572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EBFIEP6LsxdAqegZo3G7AYUXgNDMG1lqunmkl/24DYA=;
 b=du+6D2e3UEsj/F7lQXP6f/hvyVraxBhqqaFDSG4RmeW/qfXkclvcJy/ygW6n401TGC
 P6IuGTWnBNOp5P708a7k2DMCSmot/CqfXgbA6C73qhP7DWTiKr9CVXokKoWh8/z9ggEJ
 AWUqY3OiFgJ2rG6oQvrQnOJoNNoCJHOcxMpBFziLlIEbpBo3ZtuWmGfYTtmCFC70lzNd
 YUieOWfiO5D0C3LfHh7YldzR0f0jxTMWhPI0X2RWA1vFGE+iTNDezMe5EkDruJpf22Wp
 VzyEwjMyyd2b4luZxHrPJYIpxuNP83LzoBWC490OElv5RmdJW2rHL3vuytrr7ExrgCdL
 SJgQ==
X-Gm-Message-State: AOJu0YzyzG+B0eXqQfk3zR2S5H2TMNsYXaD6gKm2ztchYQJ1Zs9WRS3t
 wxfaMmViuVLGW/nXpzxx/F8QQfq4fNVJwKNaDplJ/TxH116gl6RPby6Rtil3IQ==
X-Gm-Gg: ASbGncsXPPwdOvrV5kFRcKlRWuZwyaeZI0eBWukFAKBeLluxRgY68bn2pR3ah41PqtG
 bhye3LOdkioX/NR9zmMXElyydpmO/LsKmmHfF+H8XF5eYSPbTgRCPU9R46JjWTmlsMQy200iZ0t
 9q5st3E8wCqWhKL74Osze+P8jzeox8VokiVo4ThXYxSH3M+ikLdly18KGBu0XS2kQ3cmrZX5JSA
 qSJED6vOA2K8fVHgxE82T/Oq5anQWK30/B9rpE3UrEBoyVG1l7/u/GcDJo3qFDB+6dBkIIqnPgd
 vrlBTp3i2oYuS8AoUmxQYryCgXCaZUFrPF/Ksyu3sNYdv/HpxnAx7N9x+WKPY8h3AREMh8g29+Y
 UCb+AO0zodlYHQJk/P4DOPKMFyBDM8eHFR2OGOLi+aZ2elV0YLnaIbCzi3RlTZl4L93aMb4JY4h
 VxdKk8gqcylfXg90QI
X-Google-Smtp-Source: AGHT+IFLVojVqK2g8C2Djmtxk0WOyO1h9lxTgLlOyygrBy/qIN60k04YKLRvCmMrtYUP48Ui7KUSKg==
X-Received: by 2002:a05:622a:5a91:b0:4b0:6a60:7037 with SMTP id
 d75a77b69052e-4b06a607548mr98629701cf.57.1754362771845; 
 Mon, 04 Aug 2025 19:59:31 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b06890e821sm21035791cf.26.2025.08.04.19.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 19:59:31 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Mon,  4 Aug 2025 22:59:29 -0400
Message-ID: <20250805025930.315021-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754362772; x=1754967572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EBFIEP6LsxdAqegZo3G7AYUXgNDMG1lqunmkl/24DYA=;
 b=jx+dna7oPobZRZiJXbs9kjXImEIe3kuh3LWbj5o5vDK4o9+pQwZMBBTHN/1NcY6EKV
 xxMsRFVswHRRY1fS3jPZpSuQPGGCHK+qkkuFadzlRpyfQyce9MUzIaxN0xoJPq+U8FV8
 pvp2xsTD30f/gW3SqsORN7nGCyzoT0fYOOjleWXWdALbcy0UU26VkEmd/cWBIkPREpdO
 DNWTYQPmOoyANeO9LtaWmwgqQsVVEmwWLcxgEh3yBBhzRxeMlHyJRjxR+oVCICZOoIlp
 08DEOUIOggA9JeMocgbeq94aSsREij8P3EQIYV42nC3OpoPdWe17bgko1uo0yZWS1A6N
 /ONA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jx+dna7o
Subject: [Buildroot] [PATCH 1/2] package/pico-sdk: Add host-pico-sdk
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

Add a host-pico-sdk package to pico-sdk.
This will allow users to build rpi pico applications on the host system.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 package/pico-sdk/pico-sdk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 45db495623..32fb7831d6 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -19,4 +19,10 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 	cp -r $(@D)/* $(STAGING_DIR)/usr/share/pico-sdk
 endef
 
+define HOST_PICO_SDK_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
