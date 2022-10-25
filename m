Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1719C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 589DE40298;
	Tue, 25 Oct 2022 06:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589DE40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAZ-OVqV4kpB; Tue, 25 Oct 2022 06:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7520C40220;
	Tue, 25 Oct 2022 06:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7520C40220
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85EE01BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F8AD40304
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8AD40304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEx-nLutqj0H for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AED40302
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07AED40302
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:55:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a67so34798488edf.12
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 23:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zq4ZkDfEGq5PouFox9/vMU2IwZ0GF6/krEgnaNUR8Gk=;
 b=44PzcSwOUQQzVgR6sCdW6mi1t6Zd4lqN9AQYnnJo0guKVsDqeO3poC6Qa7FZqTghOa
 LDw6gABPotLOb15zxfW1/fOmqFiiBAvz0YG2fpuRTkRwTHpuTzGHfaOJuxztUxcnvHfx
 dOYYRfom7Ftq3T2ACl42w193H2zX6561Sqahjl0x2Cpu5Zv7e8kYvf/Jqw9mC3tzffO1
 fjzcYpj6M98DitnQ6qdxz84O04x16/Rx2a8FaoSe8DvgzXFRsoUxMXf44NFTVhzlVhB5
 /bIEexHiRp9xtu24Yv/AiillqahcD5iWKuYQBRgThpGOK/izQbd8guMeuYJIyK71TuVQ
 futQ==
X-Gm-Message-State: ACrzQf1UKkQHFlJcsXsgUa5ww6Kyag/Yqf0M/+7qkR/WjF2kIy30EdBs
 EH8C/c+MQjzLEgRbA1wS3sFrJooTwGnIMDwYnMU=
X-Google-Smtp-Source: AMsMyM5Mh20rp+tV8bvH6BIStktIN156SBpzjw55OOGjdQ2EckwQ9kMhFQDaWPhFCBvFgYVHmfqLxw==
X-Received: by 2002:a05:6402:b56:b0:461:91aa:11b7 with SMTP id
 bx22-20020a0564020b5600b0046191aa11b7mr13181726edb.220.1666680946764; 
 Mon, 24 Oct 2022 23:55:46 -0700 (PDT)
Received: from smart-All-Series.cisco.com (ip34.ip-145-239-104.eu.
 [145.239.104.34]) by smtp.gmail.com with ESMTPSA id
 y6-20020a17090668c600b0078afe360800sm865910ejr.199.2022.10.24.23.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 23:55:46 -0700 (PDT)
From: Nasser Afshin <afshin.nasser@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 10:25:39 +0330
Message-Id: <20221025065539.4646-1-afshin.nasser@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zq4ZkDfEGq5PouFox9/vMU2IwZ0GF6/krEgnaNUR8Gk=;
 b=nOVx3+8VB9shTwGRoqUi/Fqyk2DOhc+Pavsdr+3y5SBaLKqTlvH3X1CirNQJNU+xaY
 T+wzV0ao3v4Xi794IvPwMDpYbSYOjo3uO2oBWVVjm09cEDc8XHQ9TbtbvPrVMOJG2hys
 PvklBFDVN2Wme/BiZfcfS4PptkkJ6dS4INaU0f76ZNPJo9KGSvbi9l+5aeW0YfMUWK3Q
 JlHsLh31+Wvsy510De8qppBujlJ5yOpSME3qCC4AO+rDtOcuMufPggxWtRCuU8Raed2C
 Qdg9NQEIhNPp/KNhgw5/oON3XOx54YuH3Dyt8/u2kpvPmLF3epv/+8r762K3S86XdcO1
 CGwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nOVx3+8V
Subject: [Buildroot] [PATCH] python-pycrate: new package
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
Cc: Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-pycrate/Config.in           |  8 ++++++++
 package/python-pycrate/python-pycrate.hash |  4 ++++
 package/python-pycrate/python-pycrate.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pycrate/Config.in
 create mode 100644 package/python-pycrate/python-pycrate.hash
 create mode 100644 package/python-pycrate/python-pycrate.mk

diff --git a/package/Config.in b/package/Config.in
index 56b1a08d8b..2443b7bb27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -951,6 +951,7 @@ menu "External python modules"
 	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
+	source "package/python-pycrate/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pydal/Config.in"
diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
new file mode 100644
index 0000000000..9e2123d4dd
--- /dev/null
+++ b/package/python-pycrate/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYCRATE
+	bool "python-pycrate"
+	help
+        It provides basically a runtime for encoding and decoding data structures,
+        including CSN.1 and ASN.1. Additionally, it features a 3G and LTE mobile core
+        network.
+
+        https://github.com/P1sec/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
new file mode 100644
index 0000000000..24aa51d8e4
--- /dev/null
+++ b/package/python-pycrate/python-pycrate.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pycrate/json
+md5	075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
+# Locally computed
+sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
new file mode 100644
index 0000000000..41ce6c18f2
--- /dev/null
+++ b/package/python-pycrate/python-pycrate.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pycrate
+#
+################################################################################
+
+PYTHON_PYCRATE_VERSION = 0.5.5
+PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
+PYTHON_PYCRATE_SETUP_TYPE = distutils
+PYTHON_PYCRATE_LICENSE = LGPL-2.1-or-later
+
+$(eval $(python-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
