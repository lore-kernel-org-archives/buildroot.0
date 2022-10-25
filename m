Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52041C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 19:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59DE600BB;
	Tue, 25 Oct 2022 19:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59DE600BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Fn-NBtpeqQR; Tue, 25 Oct 2022 19:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A06605AD;
	Tue, 25 Oct 2022 19:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A06605AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1263A1BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 19:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF8C640265
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 19:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF8C640265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozx7JDGbPcPm for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 19:02:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB2640263
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADB2640263
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 19:02:40 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id h203so11289755iof.1
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 12:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oAy+HM2EfzKiRV3fOTTmJ96STztyeLvmxGK27P/oJTg=;
 b=O2/2W8mHBBPi2zZZkxxD+fKSIEX4lXZzh0bDiPWmdVy2n3N1fipi6SmfQ0SHFVzAm3
 AV4jCrruAI/fcbpPsOXjc3SUIIkU1ypNBHFprg5JoSsZx04DZYDx60me2zsKEzb7Wx4d
 xiDNmI8aHNDNHamBVhtfALqLJpp26C+KYWPhFYT0NDP023JenbaN58egHERaU7pdxufX
 71tHdMVOs4STHfY7wdy1k2wUGzEEbOdKuZiqr+eEbB27t62Tp+yprYebiZnZW6IvMZXo
 qsrzK70vrXDZ6Bf6DrmrBnpF1mD728pUb6y9pZNx+j6XlG2Hu3SeHjM+/p3EDkRIzSlj
 vJEw==
X-Gm-Message-State: ACrzQf2tIbNxyL6TyxYhIH5GYk9YVA/JuFdSes5lxD+OEpgM6TKDRAYb
 mC7s/yks42JAqDl49DkFeqGVcQC9bnmUHg==
X-Google-Smtp-Source: AMsMyM7NajTPRcIHsKqfdfVf2ymZKsSnIfoS3hxm76h424i5ec42HAT3zoPRH57ZnguNxgpMecaGBg==
X-Received: by 2002:a05:6602:125d:b0:6bc:61ec:29c0 with SMTP id
 o29-20020a056602125d00b006bc61ec29c0mr23859874iou.81.1666724559324; 
 Tue, 25 Oct 2022 12:02:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 1-20020a020a01000000b00363faa1ea9asm1204252jaw.15.2022.10.25.12.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 12:02:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 13:02:36 -0600
Message-Id: <20221025190236.1190494-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oAy+HM2EfzKiRV3fOTTmJ96STztyeLvmxGK27P/oJTg=;
 b=SSRtTdg4/IKxyuTXEqUtiRC5+YYzYhbIdSuMyKIkrWgVrQWZNdyrfihn1XI+f0UQRa
 e7E9wDWoWkuZOwb0G+Ufi5bAeANjOLtB0B7UINsumsAFIBjjiFSVC0+bPbw5UYjM/f//
 xt+nljNXmHTAmODNKNGaUx2M8fbCOf9E5EZP+8DSOV3e8RuwNq8GQxzUtNhGB+A4Y+Rk
 vt4Rwbg3vKeQUcL5Yk9MF9KZvUrqcfiYxETsikeIUSfw59TZQT8MatZ7iGXy8YqlCI51
 NZ+OKAuvNWRVPFKKmaLLiapYTHzFqqVCGrkNh15qpjbtr/3ihcf4oGdGQPv4AVwpstKd
 TmoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SSRtTdg4
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bypass configure shell
 wrapper
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configure file is a shell script which searches for a predefined
python binary and then calls configure.py with that.

As we already call configure with the desired python binary we should
call configure.py directly so that the expected python binary is used
and so that the shell wrapper doesn't throw spurious interpreter
validation errors.

This also avoid spurious errors due to the configure shell wrapper
missing supported python versions, for example this fixes:
Node.js configure: Found Python 3.11.0...
Please use python3.10 or python3.9 or python3.8 or python3.7 or python3.6.
	/usr/bin/python3.10 ./configure

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 05456e3443..29a10b900f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -88,7 +88,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 ./configure \
+		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=$(HOST_DIR) \
 		--without-dtrace \
 		--without-etw \
@@ -200,7 +200,7 @@ define NODEJS_CONFIGURE_CMDS
 		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
 		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 ./configure \
+		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=/usr \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
