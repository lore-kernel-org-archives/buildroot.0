Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32355C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 09:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8664483CC9;
	Thu, 13 Apr 2023 09:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8664483CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oA70EUMrGYuk; Thu, 13 Apr 2023 09:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA11183CC0;
	Thu, 13 Apr 2023 09:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA11183CC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67D8E1C3BE9
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 09:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42226615E7
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 09:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42226615E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avdVJ9hLiX3y for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 09:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 007B2615DA
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 007B2615DA
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 09:31:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id sg7so47226002ejc.9
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 02:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681378314; x=1683970314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V/2aueHTJje5JQRwTl8X/t2t4vevOBFYtvCSE93Ig8k=;
 b=bIcP6Pev6ovVmELubuF8g6bCSp4SHFdtzMzJbheSmZs/ilugB8yJjhZlqabiaPTSOG
 rwln5jDWuLb5kTYfyOJ+n/AKhUjzn3sD8hT576+ttA1nCUFobqZp6gKLZLZlpO/V+sd4
 rI0bLaK4pIXcr0y+ryHq4K3Xn5c6hUHExP6ESucSjoFuowkPZySHh7qbHblBDxE6stU+
 uHnQIu8g53qiTjsp97ATS/vBgE/gEpg89HAJGieh5/Vxp4+tzgIyYnLXME7ExxWo48dg
 29lRZzH+2Gmbzi1bMBoucscad23OAT/enukAD7woPct9FcSBvXBhndFG8SHisbJt9xKE
 fz7g==
X-Gm-Message-State: AAQBX9dwL/XQcqkOrGgrVh17uFU5VhKSeqQzt3i68vC/5Q0s9rOJZLdy
 IUstiPx14GxwXZwaFPJxOByALbzQl/M/7LMvfbo=
X-Google-Smtp-Source: AKy350b2v6YWZauecSDbe+F70ZXGPKQ25WvreAmd0M6lkyNsGZ2PXNlXm9GgJhwQ/UoQMLTZod90xw==
X-Received: by 2002:a17:906:a9b:b0:94a:52bf:b820 with SMTP id
 y27-20020a1709060a9b00b0094a52bfb820mr2367413ejf.46.1681378313854; 
 Thu, 13 Apr 2023 02:31:53 -0700 (PDT)
Received: from localhost.localdomain ([91.90.166.178])
 by smtp.gmail.com with ESMTPSA id
 de26-20020a1709069bda00b00929fc8d264dsm728770ejc.17.2023.04.13.02.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:31:53 -0700 (PDT)
From: Witold Lipieta <witold.lipieta@thaumatec.com>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 11:31:46 +0200
Message-Id: <20230413093146.3440231-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1681378314; x=1683970314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V/2aueHTJje5JQRwTl8X/t2t4vevOBFYtvCSE93Ig8k=;
 b=XmP2d47FXv9OOCAzioNOrPXlTjRS1r5C/Wo0qYI5MRztDle9deKWuhBg6pcV29rKOC
 DMzWpFKAMNtXeXNJz9ikJDwnhvv9GJWftTDh8sPiEFlOx0sSU3v5ZODTMBW+T/RU1tNe
 lkRpU3pZnsArCF07XUn4IxFV6iIP+YClb1ATrhwwA0mO+KfW2/AgiCZmDNZ8U9Oua265
 qOutQ2aMASzYkwXzJuaZ16YDZ+HxwHw+ls8bZVikecsjWzh0oQQ92Swn7A2RSTz4TNLD
 bjla6xsUkexu+chwE99CS2AEhicdWRLS7+V90NG1uwbX/sPrySLGTLbfM4VyejnpqIJe
 SiIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=XmP2d47F
Subject: [Buildroot] [PATCH 1/1] package/python-segno: new package
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

segno 1.5.2 https://pypi.org/project/segno/

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
 package/Config.in                      |  1 +
 package/python-segno/Config.in         |  6 ++++++
 package/python-segno/python-segno.hash |  5 +++++
 package/python-segno/python-segno.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-segno/Config.in
 create mode 100644 package/python-segno/python-segno.hash
 create mode 100644 package/python-segno/python-segno.mk

diff --git a/package/Config.in b/package/Config.in
index 760dda6ac1..68949295df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1273,6 +1273,7 @@ menu "External python modules"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
+	source "package/python-segno/Config.in"
 	source "package/python-selenium/Config.in"
 	source "package/python-semver/Config.in"
 	source "package/python-sentry-sdk/Config.in"
diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
new file mode 100644
index 0000000000..5c6ada7e68
--- /dev/null
+++ b/package/python-segno/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SEGNO
+	bool "python-segno"
+	help
+	  QR Code and Micro QR Code generator for Python 2 and Python 3
+
+	  https://github.com/heuer/segno/
diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
new file mode 100644
index 0000000000..286bdf3615
--- /dev/null
+++ b/package/python-segno/python-segno.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/segno/json
+md5  6d7c852f951501cd3af85ef061d6bee4  segno-1.5.2.tar.gz
+sha256  983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc  segno-1.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  98b0a86ca0cbf68c95051741bc983425a43fdece775fe0e2712e66be459cc9d1  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
new file mode 100644
index 0000000000..c832f38f4b
--- /dev/null
+++ b/package/python-segno/python-segno.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-segno
+#
+################################################################################
+
+PYTHON_SEGNO_VERSION = 1.5.2
+PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/90/2a/2fedf1023f9273d8326362df7936748ebadef92ba53ab7970d9b8df1a6c2
+PYTHON_SEGNO_SETUP_TYPE = setuptools
+PYTHON_SEGNO_LICENSE = BSD-3-Clause
+PYTHON_SEGNO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
