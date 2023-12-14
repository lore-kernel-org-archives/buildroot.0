Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E32C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F32D83D32;
	Thu, 14 Dec 2023 16:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F32D83D32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_PdL9H7OEGK; Thu, 14 Dec 2023 16:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460DF83D49;
	Thu, 14 Dec 2023 16:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460DF83D49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 082821BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D49B3403C4
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D49B3403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vl3CsVT2zSkx for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:53 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EF434010D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF434010D
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7b71e389fb2so273489639f.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572892; x=1703177692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/Oqp3ICfOPeyaWhuAb9INVf1PoI9sVoQbxhEhk3DSs=;
 b=chs0dfyMNsEFJvfrqW/4OSKclaPWaoatKeKTaL8eN3Prc5wTt8WzLQET3M1okCdJ4A
 6rNg4o9YlV8cA7+pmMzBceF/Nu/pGjGYPs7Sl/L2JmLX44S0oOmKvYbaFhDHSHtFNEoU
 5kODyjgykSoMnCQlSuAdnBdWKaxNxHdGoTXq51Sr1vwR7XSBW5J2hgdh2t0TiPEpXYFN
 Tin8w0a5Bz/j3Ft3GlOxEcPbGac/+O+ceDgRVHDStweeL2GhuAaSkm0wJW9g4vdcaqPq
 BFe0+jbRCTGlaOYrG0h63v6Td4GXLvZLyqw5eWjQRWOaaZ87aZSmExs0ZaLKBnD//NBB
 pcpQ==
X-Gm-Message-State: AOJu0YwzmTF9utw7JFxSPsqiPZ/splf26WudsYm9hLJoiiOZlqCmusTR
 e2AD7aqNEPx8IwRQQSd/TlIJ4QUjMnggPw==
X-Google-Smtp-Source: AGHT+IEs8p61TeWu9rcaMHbkHu3HSgyzuJf1IcyVHiIkcCknCwv/WNwbCHn2/KruizQpnHwPPHpY4w==
X-Received: by 2002:a05:6602:44a:b0:7b7:18ff:8485 with SMTP id
 e10-20020a056602044a00b007b718ff8485mr9412393iov.29.1702572892052; 
 Thu, 14 Dec 2023 08:54:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:20 -0700
Message-Id: <20231214165420.181703-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572892; x=1703177692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/Oqp3ICfOPeyaWhuAb9INVf1PoI9sVoQbxhEhk3DSs=;
 b=WFctNb4Gq2B9t9qjyQAXPnrO3jvvOXNJIkzjowKdpOVBV90vcaHyv+xVum7uK6p94z
 tL5+eq4ge+wAZrHOmA5MOy6xOibBYj6YC+vC2I+zoaFv3zvrrWS9EqEcAt82MF2gR/NP
 Y0X10oDep/KyzlxlK15uj7GZEMYk3xK4Z2pq5NQZgI5kpd8pHoHTOvjMSrlKpm+OI7oy
 Nh1x0oGFFYnIUjM/81r5rRifDAS2wsq43MKlNHmVRsuhFy0Bah/FFxlYQRQS5dUDXAg+
 LZyFo1ptg3cDQ3NlPpOs3KFI7R902RijR41KAR9bmftwrEUiugj/ASPka97jaCqqcigL
 7LCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WFctNb4G
Subject: [Buildroot] [PATCH v3 8/8] package/python-httpx: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-httpx/Config.in         | 11 +++++++++++
 package/python-httpx/python-httpx.hash |  5 +++++
 package/python-httpx/python-httpx.mk   | 17 +++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/python-httpx/Config.in
 create mode 100644 package/python-httpx/python-httpx.hash
 create mode 100644 package/python-httpx/python-httpx.mk

diff --git a/package/Config.in b/package/Config.in
index b304ae8514..fb673560fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1106,6 +1106,7 @@ menu "External python modules"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
+	source "package/python-httpx/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanize/Config.in"
 	source "package/python-hwdata/Config.in"
diff --git a/package/python-httpx/Config.in b/package/python-httpx/Config.in
new file mode 100644
index 0000000000..592cd559cd
--- /dev/null
+++ b/package/python-httpx/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_HTTPX
+	bool "python-httpx"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_HTTPCORE # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	help
+	  The next generation HTTP client.
+
+	  https://github.com/encode/httpx
diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
new file mode 100644
index 0000000000..fc4a68cf51
--- /dev/null
+++ b/package/python-httpx/python-httpx.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpx/json
+md5  f4dcf1002b2116c634a53534ce9d6776  httpx-0.25.2.tar.gz
+sha256  8b8fcaa0c8ea7b05edd69a094e63a2094c4efcb48129fb757361bc423c0ad9e8  httpx-0.25.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
new file mode 100644
index 0000000000..4227acec59
--- /dev/null
+++ b/package/python-httpx/python-httpx.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpx
+#
+################################################################################
+
+PYTHON_HTTPX_VERSION = 0.25.2
+PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/8c/23/911d93a022979d3ea295f659fbe7edb07b3f4561a477e83b3a6d0e0c914e
+PYTHON_HTTPX_SETUP_TYPE = pep517
+PYTHON_HTTPX_LICENSE = BSD-3-Clause
+PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPX_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
