Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD0C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A697641738;
	Sun, 29 Jan 2023 03:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A697641738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lz5X0SYG4GGK; Sun, 29 Jan 2023 03:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686AE416D6;
	Sun, 29 Jan 2023 03:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686AE416D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4844B1BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2232A818E8
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2232A818E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysKW1gF_xK7q for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF4081836
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FF4081836
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id e2so658499iot.11
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1BYmekPyRxG/xK9w1Cb5kQ8oU1sNdclta7xFdHtgLs=;
 b=YhaR/T+265AL/FVtW21cqInQKb3Fh6Ihd2HBYWh85H3+P83mFr8UmACVlxutNpDTwT
 wXIcBcBqK1HvZ+lCCnu2eNtfTrmHUkPTILljhArCbUaiJrRIAB1l/XTnFdHfbm9GlgRo
 Sk7UDQx9ctDvYDQkyW0csWAPo/oHKBp9HzS09WEHKPp35Uc5ghzfLdAUr8RLYsJEKd9r
 u4QPFv1/jsyOGzRGTIHymegpzBLGJX7qro5ZpiGORv8Zmwsq3oMYPfPjL669K/zHvv9M
 lJJywi3jnyWRl6Y8ZSeTXvp/AsRCX/a5ZGfBuxTouK1P++CqXqJ/6bkbsUVXxh1kPai9
 a3nQ==
X-Gm-Message-State: AFqh2krEGSLV+z9lEkDorQ63xoU6gvETQT77edJWZy6qQpGwn6+muGoP
 +bi+zvgjwrCtTlugnxEw5K0FxNmrxttfyA==
X-Google-Smtp-Source: AMrXdXvi/04FXhF99yYl9EUBpOrRbyNH233fPv7XVTxaYRdx66D3sdr2QMaVPGGxMNDJP4BySGz1Cw==
X-Received: by 2002:a05:6602:1516:b0:707:67c0:43a6 with SMTP id
 g22-20020a056602151600b0070767c043a6mr29105279iow.5.1674964360039; 
 Sat, 28 Jan 2023 19:52:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:31 -0700
Message-Id: <20230129035232.2480871-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1BYmekPyRxG/xK9w1Cb5kQ8oU1sNdclta7xFdHtgLs=;
 b=UE7SzZrVddMVbPEGroLpwUGqPcicEgAzuV8rALpnfiDV1KewrXntdTI0x7dF8osJ5g
 W9JzA76RMR9Ioiq+WvtDHaTQcBxkoIiabzwh3H2v6qwI2LY1DzCnO9HLJN8bdQpeCAHE
 tIXHZ3YDPmOOytA2VkKWGrFkg6D8+W5VdltV+8WIt+h/Bbmfx7pd/Yp8aIPoYsNp6dSD
 vwSdhLPBFE2XtsMEq6jzVfoiuvdyied01kARrnQ3JEFcZLYaFEGovvDqGJOHXWrTQAIP
 LvG0h1dqabySdXqRkE+rKJ462xlKloqxdaTqzvfY//aMOb0WnqhNWrEB0Tn+UtADJgD0
 oxLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UE7SzZrV
Subject: [Buildroot] [PATCH v2 6/7] package/python-trio-websocket: new
 package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                          |  1 +
 package/Config.in                                   |  1 +
 package/python-trio-websocket/Config.in             |  9 +++++++++
 .../python-trio-websocket.hash                      |  3 +++
 .../python-trio-websocket/python-trio-websocket.mk  | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-trio-websocket/Config.in
 create mode 100644 package/python-trio-websocket/python-trio-websocket.hash
 create mode 100644 package/python-trio-websocket/python-trio-websocket.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bb56753418..7e9e4df8f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1403,6 +1403,7 @@ F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
 F:	package/python-trio/
+F:	package/python-trio-websocket/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-uhid/
diff --git a/package/Config.in b/package/Config.in
index 2cb785c128..46679095b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1307,6 +1307,7 @@ menu "External python modules"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
+	source "package/python-trio-websocket/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-trio-websocket/Config.in b/package/python-trio-websocket/Config.in
new file mode 100644
index 0000000000..7d35fd0296
--- /dev/null
+++ b/package/python-trio-websocket/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET
+	bool "python-trio-websocket"
+	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
+	select BR2_PACKAGE_PYTHON_TRIO # runtime
+	select BR2_PACKAGE_PYTHON_WSPROTO # runtime
+	help
+	  WebSocket library for Trio.
+
+	  https://github.com/HyperionGray/trio-websocket
diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
new file mode 100644
index 0000000000..3e6e832d90
--- /dev/null
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/trio-websocket/json
+md5  37b141910bdafa3c9b6731aa16646acc  trio-websocket-0.9.2.tar.gz
+sha256  a3d34de8fac26023eee701ed1e7bf4da9a8326b61a62934ec9e53b64970fd8fe  trio-websocket-0.9.2.tar.gz
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
new file mode 100644
index 0000000000..4522b87c9c
--- /dev/null
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-trio-websocket
+#
+################################################################################
+
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.9.2
+PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/75/91/44a0a016025794ba9fef530a6fbe59987153e2cbea7e11fe2f3d8c618740
+PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
+PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
