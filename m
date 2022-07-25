Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773CDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0985A83332;
	Mon, 25 Jul 2022 19:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0985A83332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxegsZAi5AS0; Mon, 25 Jul 2022 19:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081D783122;
	Mon, 25 Jul 2022 19:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081D783122
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF7E1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5745E40423
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5745E40423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQAHvnNHFRFm for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68CD04012B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68CD04012B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:47:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g2so9389132wru.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cZg0kD5/MVt9G8w4pYbVdf+O86cxPN1YJOM7mf8Xn6c=;
 b=x1Lx/pHN9l+0q0SQbYQJMH7L4Sym/CI6my9Dec2TumElHidJILZCN3JIvSMNQBYXt9
 O/lbqjqd5KR6S7b7kTB4zRPKS02ZjDT7CHO3Q2dDjujohFFlyq5CZCmDCNH1+xj0+hVO
 2jWxr4sNoz7aULHYtnlByC3Cn4pAzkReVUA9SxJb5ti7VP9E4MqINj5f1lzFwio1D50L
 dmA31kykWGQsPmnyX6S8Gp7UfRAlcZLMyA6nQKJBhLB9A4jB0WkYdHed1IJKO5999Ka3
 WVs+T9eDjgXOcvJE9g+e+sFtU0hZrl64x1bPGv3nPodF3GLWyXyzErFv+NlZKIyK1W4n
 Mm7Q==
X-Gm-Message-State: AJIora9nRMg54I7f9uGHnmrogDmDv+cortjvKE4w+F15fWEy4XtvqHhq
 nQBduI+h2+yPufdmJQNYGaCUPTp0Cqk=
X-Google-Smtp-Source: AGRyM1vZULXUmoBEKpEIR1Dd7eyRVdah+Wc5iRTNi+X1H2AurEt1SVdJHcpQLq/WAfN/woza26H83w==
X-Received: by 2002:a05:6000:1563:b0:21d:9d8b:9b9d with SMTP id
 3-20020a056000156300b0021d9d8b9b9dmr8251744wrz.421.1658778444123; 
 Mon, 25 Jul 2022 12:47:24 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adfb609000000b0021e519eba9bsm12576990wre.42.2022.07.25.12.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 12:47:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 21:47:20 +0200
Message-Id: <20220725194720.246080-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cZg0kD5/MVt9G8w4pYbVdf+O86cxPN1YJOM7mf8Xn6c=;
 b=dw3oPrZCWRbobP8aD93ZHFAKumONNGsYbhifI9F4+h4npV0xlxag4LMHMR1tgzWuGH
 SojkfKQ4ddGOp2hvAfhOUt0tln78UCc+nPJ7yUs4MhGMb0CAQdoLFDNoNpqZ1Hoy335g
 lDTvCmSwliCr79Thm6iji9rEjc1qrld8epMjExNVZwK+nxYvly3pC0o5nAz/1QiArLda
 2hXrKVPjnc7GEC41d9/+MxH8Qq0O7d4eMP4WSxFQMFQm4RW06sS1OJo4neNrWXwG9qQF
 NAx5Kcv3Snu+GY5i0fEMLV5a9jwkoq/TKCdZCJsg8BBYvs68z8yrw1QnC3QY+MpdJbXH
 Gllw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dw3oPrZC
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: disable doxygen
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable doxygen which is enabled by default since bump to version 16.1
in commit 6f3131296484767f037d3535ab69f328e94351db:

../output-1/build/pulseaudio-16.1/doxygen/meson.build:9:0: ERROR: Program 'doxygen' not found or not executable

Fixes:
 - http://autobuild.buildroot.org/results/127b87f97eb5517cd0a513289768a599081c15c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 1322b25fe3..b423057ab6 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -13,6 +13,7 @@ PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
 PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
 PULSEAUDIO_CONF_OPTS = \
+	-Ddoxygen=false \
 	-Dlegacy-database-entry-format=false \
 	-Dman=false \
 	-Drunning-from-build-tree=false \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
