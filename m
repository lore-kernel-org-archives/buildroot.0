Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9686C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:34:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6009D60E99
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6009D60E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30938826EF;
	Fri, 27 Aug 2021 16:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rK_6ihUw9LRw; Fri, 27 Aug 2021 16:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17D9827FB;
	Fri, 27 Aug 2021 16:34:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64CF31BF40D
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5096D40291
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLFAzn6fcfsC for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 16:34:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC5ED4029A
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 16:34:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n5so11258100wro.12
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lUgMrwedcm7pgCsSSjVq035zSK+gyTdapZaN0/Aw3Hc=;
 b=BxU1u6JigwiDcMSDOsyRCBSQpPL51WF2O7FJZ2+ZSTpJVoW06xhi4iacoUxa77ZTjO
 NeuP2C2oVxJMvARJHjSF+lLx+0NGXmFPlMLY+mk49KOJ0Mt6BnIncWXgjHcpPyZGaB9C
 xWy7bzsH/aZVjAftXq0rjXuyPpmFfMqC7WXtppBjcj4dDS0JW7A2QHoz/XdE6Q3PHwIb
 URYvCyYTK6sHlCKh/fN/LjGTe3St1EmJnxRuIh/JYZu2MzkfXC75HKbR34sRmo5bR9rp
 u/53uu+RSk+TLwstz/4sshyJqgVFiGBFj8jIcFygRULOumlVlF8GaT4Qjhs4Lrn9/NQQ
 XMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lUgMrwedcm7pgCsSSjVq035zSK+gyTdapZaN0/Aw3Hc=;
 b=hJKvaTugGl0pdi2+fTex+3cheVEnJMEke6Z/jousiUTdLB3TD200rXg3+uL19dhxYI
 hBAsIORNNuXi9fF9UHXNyOOSoIMurp/FSs58j7Tmq9ckdqwM8xtdOkYu7Is+eO3/W3Mu
 mgRw66wt6Y2NCIQrLPHLdZOPtEDbEErgYtsRYaJjYM0yDe1uPqDFCRMEPdzPOinnyveM
 WR0rlmLv8DJt+hwLzSN0kTXg7rpme0KRQYHtFKSsujHOwSECkmS3TQZOtUIU2E8RQBMH
 LbpgxPoWbr350hrB5dUcRaAMKiAKpNZapb0vAaE6d4NzQ3ia1z9mnsjZ95ULgYBFIBpR
 I5IQ==
X-Gm-Message-State: AOAM531nDGvEGIxSxgqRjtxapg7SqWCJ7HfYFV8bF3tU6NHC7curUFZt
 VaJMxm7iYlnd+SG5RoQUdZHjPnwYq8LVPw==
X-Google-Smtp-Source: ABdhPJwdAtW7kxZgshk9BoXjJTtrRxTEyRY80RU/tu+0oTRLeB7ZKUocI/PzZvnbh1V/T0fus7GuXA==
X-Received: by 2002:adf:8027:: with SMTP id 36mr11507006wrk.109.1630082085729; 
 Fri, 27 Aug 2021 09:34:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id g5sm6800351wrq.80.2021.08.27.09.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 18:33:55 +0200
Message-Id: <20210827163355.2007793-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to version
 12.22.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix CVE-2021-22931, CVE-2021-22940 and CVE-2021-22939:
https://nodejs.org/en/blog/vulnerability/aug-2021-security-releases

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 7d11a8d104..1552e937b7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.4/SHASUMS256.txt
-sha256  44cd4eab131e5282fc923e9e720d983a0b44c12e4aa4f6c3598dc97ae1e4cd4c  node-v12.22.4.tar.xz
+# From https://nodejs.org/dist/v12.22.5/SHASUMS256.txt
+sha256  f927ff6c2ac5a7234596031b18ba03febbcadd2650d375f1a3fd02426687fd14  node-v12.22.5.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 08d2f6d7c1..39099b53dc 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.4
+NODEJS_VERSION = 12.22.5
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
