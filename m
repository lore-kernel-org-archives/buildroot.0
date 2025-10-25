Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC4CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 14:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F86081191;
	Sat, 25 Oct 2025 14:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktQ7minPVAF2; Sat, 25 Oct 2025 14:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7255A81192
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7255A81192;
	Sat, 25 Oct 2025 14:36:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E90D4976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E673C81192
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiiRQ4g37yaR for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 14:36:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.54;
 helo=mail-ed1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD28281191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD28281191
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD28281191
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:36:03 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-63bf76fc9faso5525479a12.2
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761402962; x=1762007762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hKkUEYF4jdoaqv/jM3/WPoY13MVdggPtJv+O95ar6NI=;
 b=te06kEIYG7hhBToip/yiLD2OB74aeFBOaT5YmYWUtVN03A5scFRbz7gUuUzxbguIvU
 Vlk30nq60VFLNTqfxvdRPdAhfAWmzm+C7TtqJqBse1Rs3N8Emg4hSNovybK4VTlhCKWr
 ESYpWUYoI77jD57ZgI5WcK7UjJntgEclEpjXyw/qD/+7lgaP7GRAeFVz1KUxdRmrvoGj
 mLCKI66i7Dz7tJkBV0P4qeBPHxyFN/oYTPYLtx4i4bL/mk1ZYpl6iV7bEKfjdT4ovNRW
 0ujwZcAmLGTPitTxl15FGPzAE+9Sg4OMbYbJApq7LLc3Z3rJjq/kF+DX6NfPZ24eiAGR
 uRyw==
X-Gm-Message-State: AOJu0YztrB0rpiitgQTXjVVsb2dEjDkrsFGPDbAl5hYotdzSpsbhKE2t
 sJ5DzACt/kfuKiYQrLh3vp7Q5jnyVipBql5zTIVzo7m/4T4UIuPN8JekHLDnjg==
X-Gm-Gg: ASbGnctM6MdKl9DQyB4iKHHYGWIFkVA4m8zZsZ9F1UCWdXbIDaeSqNqgk8WNmIYVUIc
 d/30iBto61BHhODXQjCi4zEy9SRxx9vd0l6EvYTajFprjsshoM1jiaBinkpL9Q6UojN8pZ3ZlUH
 qtsya9TaKw/doOB9IKwIFr+lfoZTzZsSA3/X9XOZ5vKcCHbaNi89XBetNQpWyeNOubQTpJPqypO
 otZPd2LfxdiyLupi5hSWSLzPsajQmwsdmXqjQH8cFOGS2cPRTK3wLzPgsb/cl0vCM4q7fzOJrlE
 bO0IQHeaZun0pjAfV37goFoepk3geqGVEbpnfRO7n/zfpEZUUPaXD+tFNlj+QtbomtdR3j8FVEX
 F0+oTsAu2SFU5iNJE8l4UZgTGO5HKZnESM6FQVLz8smy9hWoqhkNkM3CZBoAOsUeAf4RVV0ZFqr
 aEVISTiWu+gBH529GQbsHEv7JqznOenad/dLdArZ/VSFE14/Kq1iZEePysbZApktDVtUuskab2X
 ZsbFw==
X-Google-Smtp-Source: AGHT+IFqsKDmqf9fNhNAjYfLqoOBXG2fofTUZ50Mw+IZAVeJ7cCp5Zpwm9b3mAwXby3Ny94Q40vK4Q==
X-Received: by 2002:a05:6402:146d:b0:63e:1c77:a93 with SMTP id
 4fb4d7f45d1cf-63e1c7714efmr13817378a12.35.1761402961588; 
 Sat, 25 Oct 2025 07:36:01 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb6f:7900:7ce7:55f1:adbb:3618])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efd0c2asm1858781a12.36.2025.10.25.07.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 07:36:01 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: bernd.kuhls@t-online.de
Cc: buildroot@buildroot.org,
	Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Sat, 25 Oct 2025 16:35:57 +0200
Message-ID: <20251025143557.79322-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20230516173411.823978-1-bernd.kuhls@t-online.de>
References: <20230516173411.823978-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/icu: disable icu config
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Seen while using BR2_PER_PACKAGE_DIRECTORIES, not sure on how to reproduce.

Fixes:

/usr/bin/install: cannot stat 'config/icu-config.1': No such file or directory
2025-10-25T00:09:10 make[2]: *** [Makefile:359: install-manx] Error 1
2025-10-25T00:09:10 make[2]: Leaving directory '/home/thomas/buildroot/build/output/build/host-icu-73-2/source'
2025-10-25T00:09:10 make[1]: *** [Makefile:153: install-recursive] Error 2
2025-10-25T00:09:10 make[1]: *** Waiting for unfinished jobs....
2025-10-25T00:09:10 make[1]: Leaving directory '/home/thomas/buildroot/build/output/build/host-icu-73-2/source'
2025-10-25T00:09:10 make: *** [package/pkg-generic.mk:283: /home/thomas/buildroot/build/output/build/host-icu-73-2/.stamp_host_installed] Error 2
2025-10-25T00:09:10 make: *** Waiting for unfinished jobs....

There was a proposal in the past to do exactly the same:

https://lore.kernel.org/buildroot/20230516173411.823978-1-bernd.kuhls@t-online.de/

The icu-config script was deprecated upstream:

https://unicode-org.github.io/icu/userguide/icu/howtouseicu.html#notes-on-icu-config

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/icu/icu.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 4789edf0e2..4cd72cf5c0 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -49,7 +49,8 @@ HOST_ICU_CONF_OPTS = \
 	--disable-tests \
 	--disable-extras \
 	--disable-icuio \
-	--disable-layout
+	--disable-layout \
+	--disable-icu-config
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
