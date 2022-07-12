Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37565C43334
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B453C6129D;
	Tue, 12 Jul 2022 21:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B453C6129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfHUZ1q43tZ0; Tue, 12 Jul 2022 21:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C885661171;
	Tue, 12 Jul 2022 21:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C885661171
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48E251BF37B
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 318EC81AD1
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 21:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318EC81AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULkE17Lfax3M for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 21:37:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E1A281A33
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E1A281A33
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 21:37:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 y22-20020a7bcd96000000b003a2e2725e89so161591wmj.0
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 14:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3Ayk/eNudwk2oZF47mRoEK025llMTbxYokktySInV0=;
 b=1TvSYqGYN6dk/iCIHfqJdwLN0DsNrwYPpewFFYzgQR3gVaTT1Q70DP37BRunJFEDJv
 2ce0Jvr8DsTmKjQX7BgfPedLn6zlyEOW5zEKNw377Fw7ezw9B7HwoREaeJHwYRbhHyVh
 dQfOWhnlAF+9QRvUknsjuoLEAE+JPOgwrX/J6NNxaZR4o59BwHdbj+Qz+yYebilejhlA
 zkpya4aph92/9A+uY3ijaQMHJvNvI0Qqb93Ch09sDPOW863InGoidymeiYOH42K/zxKG
 mIAdkd128Te3k5VFfv+EvlWPbCybKFqxeRJ0j7ha1xuzAFJxVnpe4StRdFRRVonfN+x1
 AJwQ==
X-Gm-Message-State: AJIora/auvLZPVmiF++Ez+zMQeKD7XqVnyQfTh/xpDzE78EOTGmvQ59l
 KKXzpP48OwTtL4NVpJMCRuZazK+PAaY=
X-Google-Smtp-Source: AGRyM1szE3CxbZE1IUEdporOUDB+LBFSFiHuczFT7rB6SdUnrS1lJI47AvwNxm4Gp3ow6jFP/6xZ8A==
X-Received: by 2002:a05:600c:1e10:b0:3a2:e35c:f5fb with SMTP id
 ay16-20020a05600c1e1000b003a2e35cf5fbmr58352wmb.27.1657661838142; 
 Tue, 12 Jul 2022 14:37:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b003973ea7e725sm275897wmq.0.2022.07.12.14.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 14:37:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 23:34:10 +0200
Message-Id: <20220712213410.1912088-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3Ayk/eNudwk2oZF47mRoEK025llMTbxYokktySInV0=;
 b=GSn4SpnaU4FgYOWwfjcXu0dv8WeDo/hME4wT+KLUugjRpb3AXOAOH1Uc8s5t+eUmzF
 exscu6h7OhHX1hgf6YAdIUL2+7hYknLg9zNDRU1AXxZQmzI+bhT7fe+Gfhi/iarsE7F8
 IbHeFJgi7Yr3IOWMhYCz5VX0hnh8t7SHbVqC5H6yv212/zYb3zs5eir2LMVja4b6JtLz
 idpKp6++7o0lxWMBC8oCcw86rgGSLAVyKozCJhUwFlRMlSxwCifpGsxvlIThlNsqCzEo
 rE9sXxCZ9qIcUVXJaU7u0Fn2/bgtBDOTUjlRqnbYVcERlGtLLThjCJRMMfgnf3oaLKsc
 RJFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GSn4Spna
Subject: [Buildroot] [PATCH v2,1/1] package/libstrophe: disable examples
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable examples to avoid the following build failure on sparc:

examples/perf.c: In function 'rdtsc':
examples/perf.c:110:5: warning: 'x' is used uninitialized in this function [-Wuninitialized]
  110 |     __asm__ __volatile__("rd %%tick, %0; clruw %0, %1; srlx %0, 32, %0"
      |     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5881246c4e9f7560181d2e60185d3bb5cf4f5a5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop patch and autoreconf as patch is already in version 0.12.1

 package/libstrophe/libstrophe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index ce99c9fe48..7a349a19d4 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -11,6 +11,7 @@ LIBSTROPHE_DEPENDENCIES = host-pkgconf
 LIBSTROPHE_LICENSE = MIT or GPL-3.0
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
+LIBSTROPHE_CONF_OPTS = --disable-examples
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBSTROPHE_CONF_OPTS += --without-libxml2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
