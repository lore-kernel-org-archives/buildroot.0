Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04380CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 18:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3502740500;
	Mon,  2 Sep 2024 18:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcdgk7GUq89n; Mon,  2 Sep 2024 18:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 881B1403B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 881B1403B8;
	Mon,  2 Sep 2024 18:17:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 864EB1BF8B4
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72BA160739
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqxVnyTP6fPx for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 18:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51B296063D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B296063D
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51B296063D
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 18:17:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-533488ffaddso5632582e87.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 11:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725301068; x=1725905868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCB3j3VkUxsK5wUF6i8+wg+xusHKbY4lIf/luPa4J9U=;
 b=LLAdqkGLLE58l5e/yBP+TrDDXKAoKr9r+VSDlymbmzjZVG4FyI2MyAX104oWW4wakI
 yJkf/k8k8xEx2p11WNcoyOCD8NEOOZqe6l9demQ+vlVK7fkyrb0voSgREfhqsjl+grJ/
 BBImF/9fZxelBA4zu1VXOOhhqspO0O1d91Di71Sca39s8NlXv67zIFjn03SuVY5H2cl0
 PsAFIJ0BPhD/I6p49BOZhu7iSUlHZ9vegBgxIBNBnvfEe45S6Lh6vJi4qLX/KmzEsMbS
 MHcXtjSNN44Xd98KDnqmP+nPKj+GJk9b4oeCml3eB9GsA+9kIGgr9xVkar/OSHtnStgm
 Twzg==
X-Gm-Message-State: AOJu0YzGrN8/DLOIyZbGMkyWW43ETa7e6NXGoOM3Dc+e6gadsdn+OO4t
 EV3j9uPBhNi9en96f8fib0pjK9+bIPvNqDDSIyl2U37YVXOg6taAqsRLgw==
X-Google-Smtp-Source: AGHT+IEMIoc+wbZlSOpc81Nu4viAYT0dHmr+XVcdaYx/p6h87hSWOSGUnw/Ku4J4B/SonKHPzpYDVA==
X-Received: by 2002:a05:6512:b9b:b0:52f:cdf3:2934 with SMTP id
 2adb3069b0e04-53546afa392mr9432200e87.8.1725301067108; 
 Mon, 02 Sep 2024 11:17:47 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb410sm590179066b.21.2024.09.02.11.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 11:17:46 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 20:17:42 +0200
Message-ID: <20240902181743.528003-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725301068; x=1725905868; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TCB3j3VkUxsK5wUF6i8+wg+xusHKbY4lIf/luPa4J9U=;
 b=YGKpggjE35dRHAkGq8BTUEAzg9M7yi187jsW0sgUt9H3uW8tuI6TppUdtfeW4chYLd
 hmC5NzsG/0R0OL2ymrkDDd2/awbY+SFeYw41eWKJtvwMa+T9uUMAjVLD8Xm2Ax4hk0vX
 44IGogDT96xCfQpKL6DhWgbymLheW3nNplMG6cwrHNxcN9Jsr8PPB2csD8Rw0ECbcwSs
 yg1HnoAgwYdnZ8Aw+LgPscIRS4+4CPiTsxtnsRrd5FZR6jm5tac4C0LCB64N2aPevaiO
 1JFKakaGBxwQJ+WQq3GXH4lfgJUA1KBodHMdNIHzfjuxoD7lhysfea4Oz/gy+WwGFYzS
 RbTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YGKpggjE
Subject: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to 1.6.2
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version also reintroduced COPYING COPYING.LGPL, therefore add them
to IMA_EVM_UTILS_LICENSE_FILES.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ima-evm-utils/ima-evm-utils.hash | 9 ++++++---
 package/ima-evm-utils/ima-evm-utils.mk   | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 844ba0d4fe..72e8c89242 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,3 +1,6 @@
-# https://github.com/linux-integrity/ima-evm-utils/releases/download/v1.6/ima-evm-utils-1.6.tar.gz.sha256
-sha256  3d09e77a09e985b285891f13d458653f44913879147679dce30bdbf00380d40e  ima-evm-utils-1.6.tar.gz
-sha256  d037fb0b5fdb4d1e09e246a56bdb8049fc6d9b1f9270c0ec2ae4bc8f9285165b  LICENSES.txt
+# https://github.com/linux-integrity/ima-evm-utils/releases/download/v1.6.2/ima-evm-utils-1.6.2.tar.gz.sha256
+sha256  9346a5ccd5ca77caf6a9d2ac0d83873c04d0372414a632126df4e7a88bedff4a  ima-evm-utils-1.6.2.tar.gz
+# locally computed
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LGPL
+sha256  9d2cf91f1292121f94b412abfdea1dd2d83984704f594b0a14de88d7b1cfb42c  LICENSES.txt
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 858efee8da..b7eb8ff530 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.6
+IMA_EVM_UTILS_VERSION = 1.6.2
 IMA_EVM_UTILS_SITE = https://github.com/linux-integrity/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
 IMA_EVM_UTILS_LICENSE = LGPL-2.0+ (libimaevm), GPL-2.0+ (evmctl)
-IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt
+IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt COPYING COPYING.LGPL
 IMA_EVM_UTILS_INSTALL_STAGING = YES
 IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl tpm2-tss
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
