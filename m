Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15419C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 05:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E0980F48;
	Wed,  7 Sep 2022 05:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E0980F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5X8a8zvSbo2d; Wed,  7 Sep 2022 05:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49C8B80C62;
	Wed,  7 Sep 2022 05:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C8B80C62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB7EF1BF5A7
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 05:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A474540199
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 05:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A474540199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bx_s0-kkuXIW for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 05:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E408C4017A
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E408C4017A
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 05:23:38 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso545617pjm.5
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 22:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=f8F+cGke+slAu/1zST12mkEALpRmgafoRQKSAs3Ydc4=;
 b=J89Q9CyYh/NpFdYx06t3sRqMOlCnAvj8pRfySAZnz9rdP5WVdlKrXuoNLkK8VHlv2r
 1unGxMkC2DZUZYepTom+1mq1GG2QUTb8qflWHTEc0vPo7sCi1Fy1gTEwWWebevmOthct
 Zmy34xKU6Mh3OR7JS2/OQJeoNZtBK1xgFU+ENVvlRtCu1/lwr3hgZVjydmScQTeYW3rG
 egLQNysbhKOghlQbXfUomPiCO6ED/cD/VDDpIlrHM2IDMUpTVoep4uRrn7Gj20O9L9xp
 Kw68/5G16eY16KGmbZbXhTZgGtk4VTD7nrb1G0xesXNIwXvkjTQgozVxdft3VJ6kRo+p
 JxYw==
X-Gm-Message-State: ACgBeo3KSWhC89kjwD1MWip/oqJT40BOidobe2DreJaSWfnTaGaf9/0u
 a9Q1AfvIV3tDauDcmk1FnQDQWQ1t2px94w==
X-Google-Smtp-Source: AA6agR4FOEOYuJLYfN/R0QCEnMinzQF46QCF4mLQ8K+yUP6xmUX7Oc7++UjYI7jtlZJb+UpN/X9jeQ==
X-Received: by 2002:a17:90b:1b12:b0:200:5dbd:adff with SMTP id
 nu18-20020a17090b1b1200b002005dbdadffmr2126796pjb.43.1662528217849; 
 Tue, 06 Sep 2022 22:23:37 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b00173411a4385sm607646plg.43.2022.09.06.22.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 22:23:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 22:23:32 -0700
Message-Id: <20220907052332.156919-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to version 1.18.6
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.18.6 includes security fixes to the net/http package, as well as bug fixes
to the compiler, the go command, the pprof command, the runtime, and the
crypto/tls, encoding/xml, and net packages.

https://github.com/golang/go/issues?q=milestone%3AGo1.18.6+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2a0f02abfd..959387cb6a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
+sha256  a7f1d50424355dabce66d1112b1cae439b6ee5e4f15edba6f104c0a4b173e895  go1.18.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 16602e590b..a8c84bd312 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.5
+GO_VERSION = 1.18.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
