Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A778C61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB69640160;
	Sat, 25 Nov 2023 01:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB69640160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhU1pFT_ZCXs; Sat, 25 Nov 2023 01:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 754E540190;
	Sat, 25 Nov 2023 01:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 754E540190
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC4CA1BF3B5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85E040103
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85E040103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tp4exzYP-9Rq for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:38:14 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F40D401AD
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F40D401AD
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35c30eb9ad0so7558525ab.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700876293; x=1701481093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuhnVccTSyueiYmK01zsvLXz2EnAupJJX2wcMymA2i0=;
 b=cf7MI/phUdzuetETwkDY9FBr8QWmcX6pyO9QIX1f36Srvfpjk0I/u60lprhG5jlUsL
 WauKLKgjCq4AfK3PLFCUELRl3ylcRna3NMPImXGoNdhoiMFwvKD85kCC3u7B4R6hll2J
 PRFCOP/B8NhVV2197OoBd7VDjp7/yBp2GXsX3SWA4bDS8CHQUKUhohLpViOmyVFJgX7x
 ddSElJ20+RwRFs5/WVWK8pF2RNLE9/PoBc3HDo16cWyZOdzjw+GtkFXGVDrpxB5y2vnE
 2D5Wz++iHZQbtnLb4GgegkC1hB27NT8dht9vHhFAt2cVbMY/sSI8v5xzUTCKILmvEIKh
 X1VQ==
X-Gm-Message-State: AOJu0Yx2vmyDzq5oYGaJUhkU83kqGAsx8kOdobvBWHakHMz9dpwU3vhh
 pveuamqSAOfgxHFYnfnfEN6oigluIgM=
X-Google-Smtp-Source: AGHT+IFfEyDCX9VWlxuzbSS49a8ExlTOzXeW0QSOwXDSBuEWhp8dkawPwOR1vS0+P4qR6FyOwd7Cog==
X-Received: by 2002:a05:6602:254c:b0:7b3:70c5:a60 with SMTP id
 cg12-20020a056602254c00b007b370c50a60mr128545iob.14.1700876293094; 
 Fri, 24 Nov 2023 17:38:13 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 g1-20020a028501000000b004645642818esm1139552jai.35.2023.11.24.17.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:38:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:38:06 -0700
Message-Id: <20231125013807.213822-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125013807.213822-1-james.hilliard1@gmail.com>
References: <20231125013807.213822-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700876293; x=1701481093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuhnVccTSyueiYmK01zsvLXz2EnAupJJX2wcMymA2i0=;
 b=PB9hF2V3o1V4RLYc3lKdXbte9vtNOAJBUc5ugu+12w4UPUMpJuOfuourTfQzIyAxaN
 i1Ai9sQUcksJI5fHnOIGh77dGyQXjHSa3ooOkuiopCSJ7iNcmAJW6VY7d44VI/wcvCoW
 Nu9Zo0KD5rJqVcYgqW+3VUUZnxfajdqRBlNhyWzAId3Wu0zirV7C0sVtTP22jHq0cNwH
 F7JjvTXeTxLMNM2hD/sSY6nhjf8hYbtpObie3foRMnSeOnntrPzk7j2gBIxSN7wnL3td
 16oNGbzfbB8px6WC3klH4dh9bMaDsTcjL1vM6tQ96VOJrQ4O7DbIm6jlhpyKihAkeD+q
 YvRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PB9hF2V3
Subject: [Buildroot] [PATCH 3/4] package/python-contourpy: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-contourpy/Config.in             |  8 ++++++++
 package/python-contourpy/python-contourpy.hash |  5 +++++
 package/python-contourpy/python-contourpy.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-contourpy/Config.in
 create mode 100644 package/python-contourpy/python-contourpy.hash
 create mode 100644 package/python-contourpy/python-contourpy.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..5d0d6492c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1029,6 +1029,7 @@ menu "External python modules"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-construct/Config.in"
+	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crayons/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-contourpy/Config.in b/package/python-contourpy/Config.in
new file mode 100644
index 0000000000..4843884a97
--- /dev/null
+++ b/package/python-contourpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CONTOURPY
+	bool "python-contourpy"
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  Python library for calculating contours of 2D quadrilateral
+	  grids.
+
+	  https://github.com/contourpy/contourpy
diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
new file mode 100644
index 0000000000..8f23d107ae
--- /dev/null
+++ b/package/python-contourpy/python-contourpy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/contourpy/json
+md5  cae5b781ade023c01bc1a8a53312f2ac  contourpy-1.1.0.tar.gz
+sha256  e53046c3863828d21d531cc3b53786e6580eb1ba02477e8681009b6aa0870b21  contourpy-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c2522156ba7d4dfbbec266dfea98bf76a69bc41edb18cad323177fad6b19b35f  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
new file mode 100644
index 0000000000..f305793cb2
--- /dev/null
+++ b/package/python-contourpy/python-contourpy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-contourpy
+#
+################################################################################
+
+PYTHON_CONTOURPY_VERSION = 1.1.0
+PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/a7/3b/632c003e1dfbc82d32c0466762f2d2cf139d26032626dc65944e38d0e5b9
+PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
+PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
+PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
