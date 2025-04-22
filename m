Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8B3C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 13:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 761D060755;
	Tue, 22 Apr 2025 13:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9H6h9LMYYjQ; Tue, 22 Apr 2025 13:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B3160BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B3160BD6;
	Tue, 22 Apr 2025 13:11:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 055AC1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB42D40AB6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 13:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krIWoYbtmfhI for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 13:11:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EED440A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EED440A64
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EED440A64
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 13:11:06 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-223fd89d036so62470325ad.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745327465; x=1745932265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1E59cbH43EC/v1wURBe7ax3sfhELdbUtqFl2TEJZPQ=;
 b=WoczEYA8T1hfCGWHbHvl3QHHucTv6qPUD6eUPOdCBBCUDJPWwgzUJsAHZSPPcHnBrh
 XMG9jT3QbFirG75ZTR5Ore+oHr6k62/nuBq+IsjOGNxlkvOfByE9CYUd91dcYRmQ0txX
 EOxharybfjlyLbgBcLGQFD5C57VhIcIrWhuWIZyPbFtuomNzU+OxW6ycPQJ2Y4/pP/AX
 BUETtzw7A/7EHAAEwitRcJeBPjKPGCj5jopJNBTiFFNBaFohW/0aK57UYNen8cMXwUd7
 v4s6dRMMUBlbD9cnIVU3RTn/QwLZBsa6K2Ho4FejAs0hJxRgmAEXlCwmMoj9tjjTAb85
 Ow2Q==
X-Gm-Message-State: AOJu0YwNvNOxNQSR6p1c398Nn97PtpyNRGjXRJhKDaI6k38ubTazBh5P
 3d+4plsZ7ZdDFmv8p9/rU5p/DM382IE5dBvJIWY5WiGvqKJZ9q38sPlcWQ==
X-Gm-Gg: ASbGncta/JNmi7R3suaLAY3kDOZRZMYFXgaJHt2E75vtHr62qQu43TiVDndCCNwhiyZ
 gFRxp8MhecvIox6uLTK25NQWZ0pZEpHSfUK7V/igvyF2goGwxDQSd9QE4iYlDl6qvfQShZJBMVi
 31v/gY1xNqYMB4al9dxvWXUM+3mudzoG6XHjP360xcNfe/4HINjcEme2b3MIsFH4mGfk1UPBL5p
 VI2sQDOcstUnuzFhbcySS31c3QcFU+vLWwLOswQl6X/QAGMYJO0uINzZ/CgL9UkL1VLj3hcZo1q
 /MXjC1s0YQXPiRN6AKijjTfJLBBjBKKiEvuK3GQPdVdkrUJR/oDD0w==
X-Google-Smtp-Source: AGHT+IErPCxVK+8B/PK9a33OrsAZ11yeWpxxTXo+CRr6e5oveeD4WErHkqHX1US1b1eYIciKxVZeMw==
X-Received: by 2002:a17:903:2349:b0:224:d72:920d with SMTP id
 d9443c01a7336-22c53607f83mr189539955ad.37.1745327465166; 
 Tue, 22 Apr 2025 06:11:05 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b78:b23c:5a7f:772d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bdda51sm84940345ad.30.2025.04.22.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 06:11:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Apr 2025 10:10:54 -0300
Message-Id: <20250422131054.1115455-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422131054.1115455-1-festevam@gmail.com>
References: <20250422131054.1115455-1-festevam@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745327465; x=1745932265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1E59cbH43EC/v1wURBe7ax3sfhELdbUtqFl2TEJZPQ=;
 b=LMPt8rigpbXs5yxdrzReesC2BLm0fm1qV75l0WCgV1dqhJFaGzeo9g8pSX+N2xS2su
 Qjd0aIzvk8eGBpjmhDwaMUAOXOUjZwX84/+af2S8Wb16Cz+QCpabNVTQzTKnR8AxcjnC
 KggGW7Tn81loEFLBiD71LWuNi/2TlAIKB1wDMKKs5ysHfY1V2i4/aZNQs4ybojMrwsWZ
 ap+I+DwEvf10VKIL77stjf4Q59nN3K/qh2IR5+74D2kah6MBelKyFaL5n4a2B+XzzKHa
 9ahgM3O0WSgVAY2NAi5eKkaaEv+N73TNAlriCn5ScQxSf3mZlqDJwVEoT7OQtN7eqzYx
 fUbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LMPt8rig
Subject: [Buildroot] [PATCH 2/2] configs/warp7: Improve Wifi instructions
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

The "modprobe brcmfmac" command is not necessary because this driver
is automatically loaded.

Remove the "iwconfig" line as it is considered deprecated:

warning: `iwconfig' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211

Remove the "-Dwext" parameter as it is not supported by the default kernel
configuration:

wlan0: Unsupported driver 'wext'

Tested Wifi by following the updated commands.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/warp7/readme.txt | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
index aff7a601e5..39d845bd32 100644
--- a/board/warp7/readme.txt
+++ b/board/warp7/readme.txt
@@ -107,11 +107,9 @@ To boot your newly created system:
 Using Wifi
 ==========
 
-# modprobe brcmfmac
-# iwconfig wlan0 essid ACCESSPOINTNAME
 # wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
 (enter the wifi password and press enter)
-# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
+# wpa_supplicant -iwlan0 -c /etc/wpa.conf &
 # udhcpc -i wlan0
 # ping buildroot.org
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
