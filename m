Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5C4C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 09:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A43F402EC;
	Wed,  5 Jun 2024 09:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQeIMXKUOBYs; Wed,  5 Jun 2024 09:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 236524167E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236524167E;
	Wed,  5 Jun 2024 09:04:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF251BF5E0
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 09:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A9CF4167E
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 09:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCtIRzlJa90Z for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 09:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AC52402EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC52402EC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AC52402EC
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 09:04:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-421578c546eso4618835e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 02:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717578293; x=1718183093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M0F6wCM/ywEvEi3hkWiiM28oGxRwly20qOG3ssX8oeU=;
 b=v/eJvwHFmFIJNFV9IMgcLiwYpgDcVN18Sxh2OZcyKMZ2r3H3AeyaUwqVSqn/Ip3xRT
 3qYMlw6O7v3hjztBtmBYm8HulUgG63ggMMjQF4ojXUeMGiKLu5db54RVCpe5Dut8CGCk
 YIK/Iiy8Ip19kTkLp1BQHv5Bc5aL0pL540E4J9+P2EQZASzuWoCB7pAYJigpRhIjW2X0
 l/a91CPBPMiGzE099Mp7BInCTGpw49J9C18nnIYStf0yrCLanXdFX6ZUiCjTIYLfiE1a
 Otp84yEHerjWIdI4U38unwIxs5h48+rWv6qzRIcVfZ9/uD6ed8b9UYm2o2WSQlTwnZwh
 TUpA==
X-Gm-Message-State: AOJu0Yxmeisyo9RptoYUGQ3fOZxx0ZEMmBj0NSBIHTouFy2Z1cYLZYQA
 8IFgtSfXtQ/A5KypOBbdC1Ozgo1lHrK7CWhqoFuTbgAFoM78v8rlBP2UzDBDYujLEEzrUFfjh6S
 C
X-Google-Smtp-Source: AGHT+IG+gP0lvhU3WUrNhyZIAP3locurPsuH+XMNohM4VWTC1WSl6CCAOEp24DlDoRH237vxxpmkEg==
X-Received: by 2002:a05:600c:4707:b0:421:ad:f104 with SMTP id
 5b1f17b1804b1-421562e9513mr15443665e9.10.1717578292954; 
 Wed, 05 Jun 2024 02:04:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd066b47asm13732202f8f.112.2024.06.05.02.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 02:04:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 11:04:40 +0200
Message-ID: <20240605090440.2400647-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717578293; x=1718183093;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M0F6wCM/ywEvEi3hkWiiM28oGxRwly20qOG3ssX8oeU=;
 b=lwe8VHqf5a7Oj5TlKzzq/IeGmFLWVDnQNuPqpVRoydbJZ+cmt5R7WhsTOYbTYDxpsN
 Kg+OVbTM/kiWuTQ9CTuypeWwI7kWoQHEaZ7GImiiLGLctIJa8SvempQUWaY+K7gdOAL/
 k4hQlJT7CyhCKu5D8MEBLuoyDN1FyGNlapnkA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lwe8VHqf
Subject: [Buildroot] [PATCH 1/1] package/openssh: don't use stack protection
 if BR2_SSP_NONE=y
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The openssh package enables the use of compiler's stack protection by
default, but allows this feature to be disabled using the
"--without-stackprotect" configuration option.

The patch disables the compilation of openssh with the compiler's stack
protector if the Buildroot option BR2_SSP_NONE is selected, thus ensuring
that the package is built consistently with the Buildroot configuration.
All this also affects the size of the binaries created by the compilation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d7f4db59ca3d..699b084a5705 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -22,6 +22,7 @@ OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
 	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
+	$(if $(BR2_SSP_NONE),--without-stackprotect,) \
 	--disable-lastlog \
 	--disable-utmp \
 	--disable-utmpx \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
