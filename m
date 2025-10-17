Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B471DCCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB1581E16;
	Fri, 17 Oct 2025 17:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilIWhUk2tAjI; Fri, 17 Oct 2025 17:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E685D81D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E685D81D9F;
	Fri, 17 Oct 2025 17:16:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9F83D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B055D81D9F
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9JKXaRLUvmY for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 17:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0B9A81D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B9A81D7C
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0B9A81D7C
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:16:24 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-789fb76b466so2047769b3a.0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760721381; x=1761326181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ssfL3XSrSsuZOA6j+aE4CbnUR/ophd2FNw8K0SI6k10=;
 b=VLQYbOqGLAULKHPgPAHreOpqlxs2gqUaZzdnvQT92bXezjNcLFjtk4OlJOlHMqAUNv
 g92n0CoXSgbc4/fMMzafDPXTxq8rHnr0LOF/JS28whwTCUio0dMhleBb7hXC4dxWRsBb
 1BcyjtBD6dyVhFjmgvHdSxcX+xVv1UES+SxLY24DTx4Tc9GZg4do8QkLOAF4uFBF3g/s
 RX5OJXOx+lrQTvuEVXrhXYJ00VtCbaCcBGBAMq7PNs3DGtjJqRJnqMJFVcAfV5+O++L0
 tyUyc8jADWcNEnet2j86b6s3FvHVzzDnQKnHDgdE3cqCFueIjoghhm73nSB0Xypc+1b/
 Ms0g==
X-Gm-Message-State: AOJu0YxI2AQYTLeK8pg3zSqZOz3PSViYSxuWo22UZkM9TeBB+cLr2z8D
 KCTxQ1fepOGBCmXsl+rVaG3uboVRkqDOiACRuPay7FkSz0OUcOkZS8O8sW6viuyy
X-Gm-Gg: ASbGncv6y1e+ksNa29ns/p9jF88yp9GoLUCpf1YDP/99141IpnKnwibCIPJJ+3UmzIh
 Y3MIghu+4SoDT10c9aXxMWD8XRwhfsFjD7yXN9pThwb2YZsSZwfwWEVr/eQgaum4zzxGyKYhnrm
 eb5fT0q8A+6Ix64OLaTW232H7wddarIPfFIet8U3tk6SGTZz4HyaoyPnvfCV8UgeAPikVYQFHKC
 QeZwWudvs/ppu3LoYyhcaYr5BjKTT3CT8Onp/a3oqZp+L8SOHaKdgur99ygrwFWEqmBAOvDzCpl
 FKUTfaGqVWmD4V0XkcOTnThh/XDC/usJaYPjdCK8SdhS5mJ6dIDIid9bnzycFaOS5tpZ47JoBF6
 p8uJIdQMwrYjXsWxh/1UXsAGgV1wHD1TM803OHd58uQVdFvCwlcthg89nK3JyDAOs5+gDUQp8/E
 8UUHSR8Tvrs2gMXqlX/TF21sU=
X-Google-Smtp-Source: AGHT+IG/+aPwHYBvMxC1j1g8zRVORu6r2Vf88l9Gddwj61B+LQa8S3lUCgKiTY65qZpfJTLQh/x3Yw==
X-Received: by 2002:a05:6a20:7286:b0:2f6:9592:9075 with SMTP id
 adf61e73a8af0-334a856e785mr6313803637.25.1760721381352; 
 Fri, 17 Oct 2025 10:16:21 -0700 (PDT)
Received: from eldorado.. (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33bb66b6fc9sm6147745a91.18.2025.10.17.10.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:16:18 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 10:16:08 -0700
Message-ID: <20251017171608.2940076-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760721381; x=1761326181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ssfL3XSrSsuZOA6j+aE4CbnUR/ophd2FNw8K0SI6k10=;
 b=JoW/WVBKqsKN5XsfCoPhhuHRqm5k+kRIjo8Dw1sgLeUXB1SQh5Cq6PB2/cflrqf8JJ
 P7EnKJrTrgDNiSy1y5MqbjjiN90YskxuyPiTng2fiyhE4JpsGDoeJOC05kmy5GU5oNcy
 vTkOxiOUIKiMN16dUc5WG0FMA0C+PVIi1uAK76q/DnBDNcUAkeoMsUgAIHbtvzvAmfMj
 i1XaDd3hClawF8Aw7Aq7q1YqS89F0LpEv4QZZnWxK+VgnDRu4DKp+yw12bc8o7r/Nq+U
 bQ3f3Rt2QRxxGB0T684N9n1od9PWFSW+iQl+EvBzgU7GbJOmcfbmLD1ELWjBY8/wmv6I
 9CvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JoW/WVBK
Subject: [Buildroot] [PATCH] package/cpulimit: Correct function signature to
 use named parmeters
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
Cc: ju.o@free.fr, romain.naour@smile.fr,
 Florian Fainelli <f.fainelli@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update 0005-Correct-loop-function-signature.patch to include a named
parameter otherwise the following compiler warning turned error is
triggered:

busy.c:6:1: error: parameter name omitted
 void *loop(void *)
 ^~~~

Fixes: https://autobuild.buildroot.org/results/8592e4eb5959124acc885a1cbc2f9d24fb7bcbd1
Fixes: https://autobuild.buildroot.org/results/cf12d080ddd7a2398a79be430d935071ca3250a3/
Fixes: e63181bc0056 ("package/cpulimit: Backport fix for function signature")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/cpulimit/0005-Correct-loop-function-signature.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cpulimit/0005-Correct-loop-function-signature.patch b/package/cpulimit/0005-Correct-loop-function-signature.patch
index 5b7f4a01dd5e..5b44ab9782c2 100644
--- a/package/cpulimit/0005-Correct-loop-function-signature.patch
+++ b/package/cpulimit/0005-Correct-loop-function-signature.patch
@@ -1,4 +1,4 @@
-From 74e95c96e8d82e4e374f86142972fcf4305fe1f2 Mon Sep 17 00:00:00 2001
+From e94b6dd7b3ca884f72f02879fd85792a3aee961d Mon Sep 17 00:00:00 2001
 From: Florian Fainelli <f.fainelli@gmail.com>
 Date: Wed, 2 Jul 2025 20:47:58 -0700
 Subject: [PATCH] Correct loop function signature
@@ -23,7 +23,7 @@ Upstream: https://github.com/opsengine/cpulimit/pull/127
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/busy.c b/tests/busy.c
-index b3afb7cd853b..93f0bcce67a8 100644
+index b3afb7cd853b..8acbcd82e04f 100644
 --- a/tests/busy.c
 +++ b/tests/busy.c
 @@ -3,7 +3,7 @@
@@ -31,7 +31,7 @@ index b3afb7cd853b..93f0bcce67a8 100644
  #include <unistd.h>
  
 -void *loop()
-+void *loop(void *)
++void *loop(void *unused)
  {
  	while(1);
  }
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
