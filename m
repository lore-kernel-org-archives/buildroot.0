Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA68C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29900400D3;
	Sun, 15 Sep 2024 07:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNKu7r-zvmKM; Sun, 15 Sep 2024 07:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9BFE402C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9BFE402C6;
	Sun, 15 Sep 2024 07:14:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27C7E1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 172A0607C5
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-Yl2P_DozMe for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06AEB60776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AEB60776
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06AEB60776
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:14:50 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-39f49600297so12746805ab.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726384490; x=1726989290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hiMqp4JUbUXfGAK5dGBG4Sog+fbKKr2tJJJmLftgTp0=;
 b=o7n+aqhXwHphySmGBMtjp7t1DfAAKhT0Hb/IEIquvO5GmkSHaHNOpQ6n+KeE1SrwvG
 NX1/uoHKIu5emryr6YBLNRSA0U4H1vwuEEsnqnQgX026RPABaUpb+dVz2XmOUjW4mTsp
 UHNhutSobx2TBgTC7tfJxx0sgb3o89ZxOIKi8E2T+5Y/HbYUIh7pT/+/9h2XlcAkp9D0
 CR3TofXOKttB2enDvTNvvAzL0Pbji8c8aagrs0VdamgFmZJmmRpvz7patTavbst8cF0w
 q0fnQPMNv+miXkNIv3zpnnxmhMVkUeaJUlkiPpMsaZTrTPeZC5NL94zP7oSTK99gg5Dm
 QiMQ==
X-Gm-Message-State: AOJu0YwyfDsZE75VIDJ+6t2LRfBjxTa42UrIAerPu6EdVcRZh0h0rwdg
 1gPZ/G91FSfTSRZFqbgg2xZkf0cN8px/7WTGQQpGnh04iTmG/QiBDvYBDA==
X-Google-Smtp-Source: AGHT+IHB91/dQs/mDte7qWxDDtc8d4MrITa7Abq7NcKIZvcoZmEWfJ83I+avoqzynURz1Ny2SSMVSQ==
X-Received: by 2002:a05:6e02:12e7:b0:3a0:91fc:d0f8 with SMTP id
 e9e14a558f8ab-3a091fcd3aemr47164475ab.12.1726384489674; 
 Sun, 15 Sep 2024 00:14:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e71ccasm8852965ab.69.2024.09.15.00.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:14:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:14:46 -0600
Message-Id: <20240915071447.1540596-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726384490; x=1726989290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hiMqp4JUbUXfGAK5dGBG4Sog+fbKKr2tJJJmLftgTp0=;
 b=Z2wKdhJAKUVvecCiZ+ArlmOWOwdCvAnRcqBFuyFfdSv0oG33Czi4gpkdB56bIAVY9E
 WTwcGQ2Y5dqUxDd7JNaRu8yPX2pxLutNzMdDnSteq9cbgvMtreYYWp81CCxrw0ckZp+z
 UV5vTOWO5Yi8WN2Y24aiU3oRFULl96hbQwLkJLu3pNTN4I+Tjz7n+rMInLvejBMRtyvA
 F/wZiqvkYLq9lEEdO1bQJDQqPSWM3PFnDMxfD1wGbkZ/Vp9y0c1QsfLN+CBbWpJ2GQtc
 M0HmaiwIjiIU/sR04RSSZJM7yK3U0bJB4BkDvMmZuRUjzsNXOSv0XAgARFTEXS9+wo6e
 1iGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z2wKdhJA
Subject: [Buildroot] [PATCH 1/2] package/python-proto-plus: new package
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
 package/Config.in                                |  1 +
 package/python-proto-plus/Config.in              |  7 +++++++
 package/python-proto-plus/python-proto-plus.hash |  5 +++++
 package/python-proto-plus/python-proto-plus.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-proto-plus/Config.in
 create mode 100644 package/python-proto-plus/python-proto-plus.hash
 create mode 100644 package/python-proto-plus/python-proto-plus.mk

diff --git a/package/Config.in b/package/Config.in
index 269a8cae6f..505ca64c00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1261,6 +1261,7 @@ menu "External python modules"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
+	source "package/python-proto-plus/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-psycopg2/Config.in"
diff --git a/package/python-proto-plus/Config.in b/package/python-proto-plus/Config.in
new file mode 100644
index 0000000000..368ca0160d
--- /dev/null
+++ b/package/python-proto-plus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PROTO_PLUS
+	bool "python-proto-plus"
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	help
+	  Beautiful, Pythonic protocol buffers.
+
+	  https://github.com/googleapis/proto-plus-python
diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
new file mode 100644
index 0000000000..e9d3632275
--- /dev/null
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/proto-plus/json
+md5  7af507ef2f7c1e512321c29ed5cf131c  proto-plus-1.24.0.tar.gz
+sha256  30b72a5ecafe4406b0d339db35b56c4059064e69227b8c3bda7462397f966445  proto-plus-1.24.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
new file mode 100644
index 0000000000..9ef85790d2
--- /dev/null
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-proto-plus
+#
+################################################################################
+
+PYTHON_PROTO_PLUS_VERSION = 1.24.0
+PYTHON_PROTO_PLUS_SOURCE = proto-plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/3e/fc/e9a65cd52c1330d8d23af6013651a0bc50b6d76bcbdf91fae7cd19c68f29
+PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
+PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
+PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
