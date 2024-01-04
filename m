Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39BEC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 03:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59667400B9;
	Thu,  4 Jan 2024 03:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59667400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Il6GXKOo04eN; Thu,  4 Jan 2024 03:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E26040199;
	Thu,  4 Jan 2024 03:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E26040199
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77E501BF37C
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 03:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF938218F
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 03:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF938218F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZbzqetAWxDZ for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 03:32:54 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BF6681A3B
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 03:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF6681A3B
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7bafda3999cso3291439f.0
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 19:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704339173; x=1704943973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPj+TwAMel9iFu+0mzP8tf4WGPctIt1IZUGJ09JpmTs=;
 b=JhiKYSfNPF80ocP0X/trOuZ2Exw4Xre1483FKOJUf2gmWyaCxj34iAMEKvdrzyge7D
 BpmTfl64d4a1plC1fessssIsUst8522D9g9TsWOaMzeOQ2An31wQzDqwQ1kFTm6LXISw
 Rba7qHb6sWz9rkdPkMpAI79xO//XDK9qpqt87PDPVypDo7EpMFAR0424NDJZvDi+rSDc
 jZIVSTerWr8iIKEVTUTYqx/Dl7xe0y37vKL0gRoSbKJQGwX/TG2ca3gJZRrF1v2NYriU
 LW08aAUVkno8t138zXKm6nY0Pkx7ycjOkC3z5HDfYFeuCQbSpUo064r2kXo3eyHa/pKI
 oK9A==
X-Gm-Message-State: AOJu0YxERJgUy6qkjMGt37zoFDDkhLSzgFi1s2UFm0vz+ey62FLTNTXw
 knnfsIRQTsBZYEKRAkEeukvUkML4coa4Kg==
X-Google-Smtp-Source: AGHT+IHtdFYhT3iax3PV5VEwdTDBt28ZgXR2enqSmLJrJ07ME/GKjFw3QWLVvtR5P9HKY+s8ZeScVw==
X-Received: by 2002:a05:6e02:32c7:b0:360:fa:2a6a with SMTP id
 bl7-20020a056e0232c700b0036000fa2a6amr14594ilb.36.1704339172938; 
 Wed, 03 Jan 2024 19:32:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 ck20-20020a0566383f1400b0046dc3a36544sm1833664jab.171.2024.01.03.19.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 19:32:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:32:48 -0700
Message-Id: <20240104033249.3256088-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704339173; x=1704943973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sPj+TwAMel9iFu+0mzP8tf4WGPctIt1IZUGJ09JpmTs=;
 b=g948P9+vgqYSzu7YFjzF3xxoTmzIDlKqkCsotaQFiFblyzTJ9MnZp0AmE5JMSlkQX6
 JCNG2uxvFxNZgtqdp7ZL5vOm7Dnfh7Nmk0imZQk6U0Nv4OQq2sQErHCJ6hH3qujDHwyB
 UIYliYXvwxQvKIxLAm/oZk/qtdcVuQYZiHo8OBDurDFhsN6rWcJVhGQitCQtuaj1gLWB
 PAJj5HmJxkROKGSDHKFnIrLgXU2QOljGBKRjRsfIJAuhwUd5CuU8auocdoAj1u0cG9ty
 40xDaotTVXH4KI/3Lz4RHlCJoFZOq4tItIt8rUYcj4SPBRW++eMSh6XhD2KELXDNt0I/
 UgFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g948P9+v
Subject: [Buildroot] [PATCH 1/2] package/python-trafaret: new package
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
 package/Config.in                            |  1 +
 package/python-trafaret/Config.in            |  7 +++++++
 package/python-trafaret/python-trafaret.hash |  5 +++++
 package/python-trafaret/python-trafaret.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-trafaret/Config.in
 create mode 100644 package/python-trafaret/python-trafaret.hash
 create mode 100644 package/python-trafaret/python-trafaret.mk

diff --git a/package/Config.in b/package/Config.in
index 38c36428b9..a2cc80aa27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1375,6 +1375,7 @@ menu "External python modules"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
+	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
diff --git a/package/python-trafaret/Config.in b/package/python-trafaret/Config.in
new file mode 100644
index 0000000000..73c7216b1e
--- /dev/null
+++ b/package/python-trafaret/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TRAFARET
+	bool "python-trafaret"
+	help
+	  Ultimate transformation library that supports validation,
+	  contexts and aiohttp.
+
+	  https://github.com/Deepwalker/trafaret/
diff --git a/package/python-trafaret/python-trafaret.hash b/package/python-trafaret/python-trafaret.hash
new file mode 100644
index 0000000000..d0d54c9ff2
--- /dev/null
+++ b/package/python-trafaret/python-trafaret.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/trafaret/json
+md5  85085fe18dd133d3622a2f7a3b0acf6a  trafaret-2.1.1.tar.gz
+sha256  d9d00800318fbd343fdfb3353e947b2ebb5557159c844696c5ac24846f76d41c  trafaret-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  724f8da8a7161f07d9448aa37d1d5c4eb44b14727021c3b5d60a50ecf9a24771  LICENSE.txt
diff --git a/package/python-trafaret/python-trafaret.mk b/package/python-trafaret/python-trafaret.mk
new file mode 100644
index 0000000000..74d87a3d13
--- /dev/null
+++ b/package/python-trafaret/python-trafaret.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-trafaret
+#
+################################################################################
+
+PYTHON_TRAFARET_VERSION = 2.1.1
+PYTHON_TRAFARET_SOURCE = trafaret-$(PYTHON_TRAFARET_VERSION).tar.gz
+PYTHON_TRAFARET_SITE = https://files.pythonhosted.org/packages/c9/ed/aac034e566f8846aee6472dcc90da6011a0b1829e3ffc768407df519a3b0
+PYTHON_TRAFARET_SETUP_TYPE = setuptools
+PYTHON_TRAFARET_LICENSE = BSD-2-Clause
+PYTHON_TRAFARET_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
