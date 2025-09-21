Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBCDCAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 15:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FCCB4129F;
	Sun, 21 Sep 2025 15:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_SbM8525tgb; Sun, 21 Sep 2025 15:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112E641016
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 112E641016;
	Sun, 21 Sep 2025 15:33:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C994FD3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B35B360834
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q84iaVBceAke for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 15:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A34260832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A34260832
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A34260832
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:33:55 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b0e7bc49263so590776166b.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 08:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758468834; x=1759073634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6uHhVGT+493/YXqHItH9+Y/x6IUGkXY4XkdM40HhJA=;
 b=PCq5VV+JUZyzo3YLxnmulLmkTLUPUSpxBL1loSHlO6f658B+ChRzwcyl5jmV69oo9E
 a5cGGkKBpJJ0ze0M4blAv73y1j1hj5Oipe8snLSzxd9iRWJDkYycCYz2cFCm/P4RBDC4
 ebkuBtB+gHkR8z4I59ZKo992UVhoenvcRB1enou8UpeXl0DGVdivStnksRV6Kv3/dFLR
 bKBVrFLv3wPf2wUZuvT3kdfhqAPOV5hNp4ZeaWxVjWqmLVLZZiQwvhxacUoPnIf8Zw4f
 nD05cjkxsHZtaGzJscFRpSsu6vfMjgsTROdX61DDfXEHaCZSaqHqxwju5DTTXLEurZc/
 T3Cg==
X-Gm-Message-State: AOJu0YyfOmu/ocmW0tIgkgNSSinFpAufq0N0pm+fj4gOLhFCBnFczzbg
 mQ2JiEzVlqrFtJUqMREJugDVsBDQWCNZWTugv8o2FgwHVBhVW6nI794UOer4Mmc9bz3suOLoSSs
 MOTP5
X-Gm-Gg: ASbGncu8WIPd+zTXVV5ZaVf2QUwFeIpp5AMFWBsRIsP35Iu5yoaH/kpzSc3Llo0aSiI
 kz8fhDSh0pXWyPucliCpAhpaH+emAXfrBOltLgk5J9QvOjnoHACyH+3T7BvyzNZIaIRzo3kQlkX
 wVC5KrCha1VkQ8QR/B6vaHLI1+u8sx6Ve/QLNzdOJmq3hZgwhU992WpSgfnzvpTipfyP3jhSQsU
 h3b/b2I7GcwunoJgEPSCPkUK+gH7ILSv0CQfZBWJ89SoDjrlXLUM0u7lmzP2HGK5zSgGHh4uZh9
 tU4eNQXe5FWv+OZNx2N5vxE5k1KbIgy43VUSfF/aIwyXmRmLkd4bEztWV6JrTnwEPCMeBsuD468
 LqSeCMJUm14hui2hSFE6lcWunk8KqWG11a+C1jQBgqXlz3fFe3ZwV9q9GItpd0Jw4px2jtcUiQi
 gVg546R6p1Sn3elU/ICvTNDqtM9uYy0DU+MGTalTSqDqcTTgQraGJpVMzz5LkbmxYg
X-Google-Smtp-Source: AGHT+IEMClo3OpZ1c8fLsB2SOyx0gYNzL+FOaHQI514RTgo/HcNiUCpiFbNO9FTd0Ue4exwuJXaBTg==
X-Received: by 2002:a17:907:7f22:b0:b04:3e43:eccc with SMTP id
 a640c23a62f3a-b24f3794720mr1114236166b.40.1758468833595; 
 Sun, 21 Sep 2025 08:33:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fd14d5f56sm904831666b.74.2025.09.21.08.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 08:33:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sun, 21 Sep 2025 17:33:48 +0200
Message-ID: <20250921153348.2636830-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921153348.2636830-1-dario.binacchi@amarulasolutions.com>
References: <20250921153348.2636830-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758468834; x=1759073634;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6uHhVGT+493/YXqHItH9+Y/x6IUGkXY4XkdM40HhJA=;
 b=p3DrDTGwUxtr63Cz39bPa9Mq/h4Lk98zUadYm/1WcPmIROzBFLV1zYiEW6tgS44ZG1
 XUY0GQZfm/YL0TtnVG7XSGOzNSzf7NoZhttcTn0iIPqKdK/99LH6DrvbTCcssuRPPLlw
 aD+ma/faukR2Czzo1HFQCLcvTIWN1Kz1bcRFU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=p3DrDTGw
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: add Dario Binacchi for bc
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

no changes since v1

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c6ff40886fb..77384a8a100e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -807,6 +807,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
+F:	package/bc/
 F:	package/cmocka/
 F:	package/iana-assignments/
 F:	package/inih/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
