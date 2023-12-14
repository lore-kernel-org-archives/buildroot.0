Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781C3C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A9682D0C;
	Thu, 14 Dec 2023 19:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A9682D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUHMHqAV85bZ; Thu, 14 Dec 2023 19:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4863781948;
	Thu, 14 Dec 2023 19:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4863781948
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D69471BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A92A883BDD
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92A883BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvg5fO2-6Szw for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:48 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5744583518
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5744583518
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35f87c7fa54so1105445ab.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581887; x=1703186687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBXFWYJJyORLgULTNE+T4IzYD3QhfeySe/FYC14Eeuk=;
 b=Snxid4RwnJxb7tMyHVXxFmMoHndZLOlXa0XguI6XJcXZG3NiTA7LMXFg/eVUhG9pBw
 JbvcNqpSdg2O3RlKzlr00jhfeUzQfzNQvSDZcsdjXCND2h23E/J8IzFpBLr8JVYbaJge
 NVsjDvRrsPMQO0ENEJwwbRx2jSjwzJgWYoeiWjtfjmgWOdH/EA+NefQDU9I24RjrozBP
 fxWNFIaJ+aTWQrQWtaNaHAc9FGOTYWz/gJW8P7sF2rKJZNKWZHYgZo5rYunFygn6OPxm
 mvEtgupgUvEHf4887XsFU+tcQ+aHRYr2dJoeb5wqbgC6H95dmPVDcRi4eYHTVIBUU0uG
 O9ZQ==
X-Gm-Message-State: AOJu0YyWkiHexs4H4PdmrxLqN53NiRALAKYo0D7tVwrKHNF4l2oXoeWd
 1Oetl1RNQaPqb8YvNYQDHZoJg1ILJUYhCA==
X-Google-Smtp-Source: AGHT+IE4ozlmn6hTJXv2bbabISgrL+hKmyZo6DseF40NOuUJZMIOx659hEqg+nWXGShVnKe61aqXag==
X-Received: by 2002:a05:6e02:214b:b0:35d:59a2:127f with SMTP id
 d11-20020a056e02214b00b0035d59a2127fmr14774736ilv.43.1702581887003; 
 Thu, 14 Dec 2023 11:24:47 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:37 -0700
Message-Id: <20231214192439.259156-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581887; x=1703186687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBXFWYJJyORLgULTNE+T4IzYD3QhfeySe/FYC14Eeuk=;
 b=G1g5ccgh3yIWycOgtUX3ZV5ymypgBFnNcLLllhJSDdTcYGNkofpDSh5vyoAJQj7WOc
 /hlmMuQhoiii/fVvEP038Wic+nvIi4NKBtakO7aMa9rSX8/Arij6VfN5R64/h4Veu2s5
 bp86LuxhsSLQC12UUiclqM5yMQs0aTAu5EPHroeL7l9guTBHby9DJhadBYy7cLbermbV
 oZAZxExu62o6p28UXzPewvYcO4RObENFT/ZlKEfcd2Y/tdIuIu1w4GyZeCnahUJlO/Au
 hKWzYaTkjU/eGOopN0FzTw/575CgIQnY8Faojo9CtLygDX59Et47q5Mx+bNgmP7VLlAl
 sUUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G1g5ccgh
Subject: [Buildroot] [PATCH 5/7] package/python-googleapis-common-protos:
 new package
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
 package/Config.in                                  |  1 +
 package/python-googleapis-common-protos/Config.in  |  7 +++++++
 .../python-googleapis-common-protos.hash           |  5 +++++
 .../python-googleapis-common-protos.mk             | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-googleapis-common-protos/Config.in
 create mode 100644 package/python-googleapis-common-protos/python-googleapis-common-protos.hash
 create mode 100644 package/python-googleapis-common-protos/python-googleapis-common-protos.mk

diff --git a/package/Config.in b/package/Config.in
index 8bc18e9b5d..5c9d5b6197 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1093,6 +1093,7 @@ menu "External python modules"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-googleapis-common-protos/Config.in"
 	source "package/python-google-auth/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
diff --git a/package/python-googleapis-common-protos/Config.in b/package/python-googleapis-common-protos/Config.in
new file mode 100644
index 0000000000..8f487f5ee6
--- /dev/null
+++ b/package/python-googleapis-common-protos/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS
+	bool "python-googleapis-common-protos"
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	help
+	  Common protobufs used in Google APIs.
+
+	  https://github.com/googleapis/python-api-common-protos
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
new file mode 100644
index 0000000000..1169e945e9
--- /dev/null
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
+md5  148bfe9b5a92663c5ff0a6700453ebad  googleapis-common-protos-1.62.0.tar.gz
+sha256  83f0ece9f94e5672cced82f592d2a5edf527a96ed1794f0bab36d5735c996277  googleapis-common-protos-1.62.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
new file mode 100644
index 0000000000..ca943a1cd3
--- /dev/null
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-googleapis-common-protos
+#
+################################################################################
+
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.62.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis-common-protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/4a/5f/eb12d721b45d20a977289d674e179995a0ddab1684d2c61b29a63d43a5f1
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
