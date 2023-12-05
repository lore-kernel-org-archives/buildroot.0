Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80418C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 23:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B6AE418A9;
	Tue,  5 Dec 2023 23:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B6AE418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-mbwkZPDMHu; Tue,  5 Dec 2023 23:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43EA141C22;
	Tue,  5 Dec 2023 23:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43EA141C22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3EBB1BF279
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6EA4190E
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6EA4190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7U6z13lXXuG for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 23:59:32 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A927B41855
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 23:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A927B41855
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d0a5422c80so24832065ad.3
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 15:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701820771; x=1702425571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQkIAJZajHFRiU8F+IO3myjcYbMu9zEne6bvaD7HJSE=;
 b=NMd3Zh8kIfEf5AlBklqR+PA0YRkUzMWGIyYtCvXlQ0F6Mp7FLnsGCTXvKJeVZfYsWL
 0JcYlZLVobZ0AqlYzVtjM6ZkPveoT/86YyUke4aF0+C59N39JxD6Mz5VqSOHT/L84JVc
 amsU6iWL409aw+TTcsVosJA2yeojWtaTNCRwKZJkuKH6V1UuTg5OE7gwPX0yumDw1sxW
 MpkIeBu5GrIk3OvmGlFBuVdbtw8AvfV1SKxttSUsVl2+rlLuz83SYrllZ4DgeX6bmgHV
 Ele585y0E1DoxxpXBCoOTSIP+g9BrPmiPbKy907g4gWJd7wYB9L3bqOeYZgIVMrzi/Pb
 h/AQ==
X-Gm-Message-State: AOJu0YzcFrH021XKhKtu+QTzMRD1pPOTLExbB+FKVyN1+AuC6IOL1ahd
 vc0p0n098LJT85naFQuev3XIlpXpjY+4J9UTWcs=
X-Google-Smtp-Source: AGHT+IEj1USY92yDy5j+Mfudqhe0CMtEWvj6wO/3ubch2KegdwzSxSCYK/Bkb7iv5reJoN4yGyVVsw==
X-Received: by 2002:a17:903:22c9:b0:1d0:a720:1fbc with SMTP id
 y9-20020a17090322c900b001d0a7201fbcmr25184plg.102.1701820771195; 
 Tue, 05 Dec 2023 15:59:31 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ab8d00b001cc20dd8825sm7246369plr.213.2023.12.05.15.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 15:59:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 16:59:18 -0700
Message-ID: <20231205235919.510051-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701820771; x=1702425571;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQkIAJZajHFRiU8F+IO3myjcYbMu9zEne6bvaD7HJSE=;
 b=KHGUJdvE7U8W7zt6YWf0yMOnXdo1lknEpIX7B+qjD4dCU94MEljvODokW0gX8tDgNe
 pudm//Dgc5FFgLMornBc/Xf+gqhRKsBFfD/Y2Tw6CorCfKpnneoewQ1tM+ZcQ9hvg7BL
 8L3TjLTE5F3j3H0zgZx9Gchy7JyVj5CW9gn00=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KHGUJdvE
Subject: [Buildroot] [PATCH 2/3]
 package/giflib/0003-Fix-CVE-2023-39742.patch: New security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/giflib/0003-Fix-CVE-2023-39742.patch | 36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/giflib/0003-Fix-CVE-2023-39742.patch

diff --git a/package/giflib/0003-Fix-CVE-2023-39742.patch b/package/giflib/0003-Fix-CVE-2023-39742.patch
new file mode 100644
index 0000000000..2ba01ac8a4
--- /dev/null
+++ b/package/giflib/0003-Fix-CVE-2023-39742.patch
@@ -0,0 +1,36 @@
+From 4288b993ee9df6550a367fe06ede3c003dc7bbc6 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:35:40 -0700
+Subject: [PATCH] Fix CVE-2023-39742
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Fix segmentation faults due to non correct checking for args
+Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-39742
+Upstream: https://sourceforge.net/p/giflib/bugs/166/
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ getarg.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/getarg.c b/getarg.c
+index d569f6c..51fbe0b 100644
+--- a/getarg.c
++++ b/getarg.c
+@@ -307,6 +307,12 @@ GAGetParmeters(void *Parameters[],
+     int i = 0, ScanRes;
+ 
+     while (!(ISSPACE(CtrlStrCopy[i]))) {
++
++        if ((*argv) == argv_end) {
++            GAErrorToken = Option;
++            return CMD_ERR_NumRead;
++        }
++
+         switch (CtrlStrCopy[i + 1]) {
+           case 'd':    /* Get signed integers. */
+               ScanRes = sscanf(*((*argv)++), "%d",
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
