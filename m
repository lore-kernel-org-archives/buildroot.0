Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29A8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5462A610E7
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5462A610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 049CB81BE3;
	Tue, 12 Oct 2021 17:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIcxQthaZys0; Tue, 12 Oct 2021 17:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505EF81BC6;
	Tue, 12 Oct 2021 17:48:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60F531BF5AA
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D54260BD5
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21PTeSK_LBAl for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 17:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96C8B60B86
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 17:48:42 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s75so14557079pgs.5
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlx+rx86XjRehlnDXDF/dlK05qQsWwfkBlk3VeNrFiI=;
 b=m2AZ2t6HUblc5SN7fmLIny0JZ7khF4yUemuIv3vz/V67MRp8B1ka/gCVuv9LjbvAN8
 X+5uJGDHUxd1N/JtPAumcJx06x+rv7aTP6aR/OuRxDsj5/F4Oqj6UZP8KP2Ay/2Ltwuy
 6Eq8IKczY/LrUjO/q3j3V1TuBhfSVizshczLE4X26ScWFOlshkpaHZ4qwvpN+m3W9KHr
 NdzfKxrodC3goPmL9Rd2quliBpbB5+4oZGcwOCUTYxnEKht7nDTyqeFr9OVD8DDVmEEp
 nbK0Jb7NU3RAHkcbxVZ04b9edt6BWcKoTe25GE0jXu+EPOIIzKA1MC8kHdeQNowx+bbO
 CAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlx+rx86XjRehlnDXDF/dlK05qQsWwfkBlk3VeNrFiI=;
 b=dzqn7ZlAp0NpO7ir6EYcxVZudVWd3CvEpOhBT6RyvA5DA+wdaQTilJo+TQCTW4aKqX
 u7aejD+8u2/2HV53KmxShUvoqBdeD2ufC8ae2DuQoNcJfLmkodjCvsYLSJ+NvNqjYjs0
 la2niko6lT0nLewJalJOuvmaWq6Yj0fFSwk5glswJF4movLvpSfovIh+KaWeqgd7e8QL
 b2ljEWm+vsF44gmpjtsJqns6aFXCd8a4cJJWG3QwZtyf6r+NZi8qNXiQ8SYfPtzhmhro
 i4RqQVb0ZSbaZj2ZeLAdlYvN2QDIhVo5L77c6UZnJlLW/xWNcinh/uaxxpMm3neovWRF
 Kvtg==
X-Gm-Message-State: AOAM531T+ih19uTkwb6n+9cKda0vOIQjx68fRVKmOZJWTThqK3NFUi2H
 lLg/1dSHtlUEgi2BXdN+t1xxfi66x6E=
X-Google-Smtp-Source: ABdhPJwdbKbpUUJBMKf1XBqeOiyw38dpPzIC1ZZHV76egeH2JZ/E+1y1sgTovtkk7VuBQwujCYyNfw==
X-Received: by 2002:a63:1656:: with SMTP id 22mr23982996pgw.20.1634060921954; 
 Tue, 12 Oct 2021 10:48:41 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id i125sm11679295pfc.36.2021.10.12.10.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 10:48:41 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 10:48:36 -0700
Message-Id: <20211012174838.1222576-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012174838.1222576-1-aduskett@gmail.com>
References: <20211012174838.1222576-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/python-xmljson: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is a dependency for pyndiff

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-xmljson/Config.in           |  6 ++++++
 package/python-xmljson/python-xmljson.hash |  5 +++++
 package/python-xmljson/python-xmljson.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-xmljson/Config.in
 create mode 100644 package/python-xmljson/python-xmljson.hash
 create mode 100644 package/python-xmljson/python-xmljson.mk

diff --git a/package/Config.in b/package/Config.in
index ba1ee4005c..09e9665f48 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "External python modules"
 	source "package/python-xlsxwriter/Config.in"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
+	source "package/python-xmljson/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-xmodem/Config.in"
 	source "package/python-yarl/Config.in"
diff --git a/package/python-xmljson/Config.in b/package/python-xmljson/Config.in
new file mode 100644
index 0000000000..486f344361
--- /dev/null
+++ b/package/python-xmljson/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_XMLJSON
+	bool "python-xmljson"
+	help
+	  Converts XML into JSON/Python dicts/arrays and vice-versa.
+
+	  https://github.com/sanand0/xmljson
diff --git a/package/python-xmljson/python-xmljson.hash b/package/python-xmljson/python-xmljson.hash
new file mode 100644
index 0000000000..245a74a33e
--- /dev/null
+++ b/package/python-xmljson/python-xmljson.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/xmljson/json
+md5  fc4df2390ad209928ee4311a3540cb17  xmljson-0.2.1.tar.gz
+sha256  b4158e66aa1e62ee39f7f80eb2fe4f767670ba3c0d5de9804420dc53427fdec8  xmljson-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5ce42ba7d76e81428bdacef83658eb6213dbd1ad4a3b6d380bb6e0e8c73f0fb7  LICENSE
diff --git a/package/python-xmljson/python-xmljson.mk b/package/python-xmljson/python-xmljson.mk
new file mode 100644
index 0000000000..913dce2670
--- /dev/null
+++ b/package/python-xmljson/python-xmljson.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xmljson
+#
+################################################################################
+
+PYTHON_XMLJSON_VERSION = 0.2.1
+PYTHON_XMLJSON_SOURCE = xmljson-$(PYTHON_XMLJSON_VERSION).tar.gz
+PYTHON_XMLJSON_SITE = https://files.pythonhosted.org/packages/e8/6f/d9f109ba19be510fd3098bcb72143c67ca6743cedb48ac75aef05ddfe960
+PYTHON_XMLJSON_SETUP_TYPE = setuptools
+PYTHON_XMLJSON_LICENSE = MIT
+PYTHON_XMLJSON_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
