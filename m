Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC25C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED6341893;
	Wed, 23 Nov 2022 09:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED6341893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PP4P3Oi2jCYb; Wed, 23 Nov 2022 09:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B8D04188C;
	Wed, 23 Nov 2022 09:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8D04188C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B07F61BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C34D40242
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C34D40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2tT-u2bG51z for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:35:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8760640158
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8760640158
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:35:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x2so24079724edd.2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 01:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JC/Ca/uwVlWcKI6NAQBj45uiOwCwYi1cbCLRzvf+lVs=;
 b=0GVok7aNWXseWE6hbEwaSGADrYuv+pykWyU8lkiD2d4Z1lfUrgcwF/Aa8eSJwXhP3j
 BX0VbJd77PZH5Pzim+kEvsuWd2l8ArQQow9EM7zmJTMC2OM68jda4jlbFSu6bicyuD/I
 ijsYprZcuZqzFungU9B2HfJhr0jfuAnenISSufc1Vf6lif37CVWY10Sf5c3XhJ48Hov2
 /0PhAMMifV+Vxiz6FmRqT5DdSaL0X0zphShIiV0pfZaeopDSwuBzs4UMYdOfbarpvXkQ
 ZS7nvsDgcEmfJsokSTQ0bdPHsa9zFvqNQDeHDtbrtepxKZeb8tegFort9hlW6KrRtdO5
 hqog==
X-Gm-Message-State: ANoB5plSXpysEoQhT86y8ijteinfkPkYXPqFZMzQIkk7N6GkRr0Qpgjt
 kI9GSlTBykCji383rTK8CWZL8P7GHo0=
X-Google-Smtp-Source: AA0mqf5WL/gh5ZH+RWwka19VoppGAHGveIKxz/cYa8c7TcM57s61aKpiEjgJKMjzQ8h9eS6Df7e1nw==
X-Received: by 2002:aa7:d74c:0:b0:461:b952:8932 with SMTP id
 a12-20020aa7d74c000000b00461b9528932mr16409849eds.104.1669196150167; 
 Wed, 23 Nov 2022 01:35:50 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 s12-20020aa7cb0c000000b0044ef2ac2650sm7372943edt.90.2022.11.23.01.35.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Nov 2022 01:35:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:35:38 +0100
Message-Id: <20221123093538.15211-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20221123093538.15211-1-yegorslists@googlemail.com>
References: <20221123093538.15211-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JC/Ca/uwVlWcKI6NAQBj45uiOwCwYi1cbCLRzvf+lVs=;
 b=ievhKyopTdcCqtAQLvJx0c4M6DVIOQ95umGAutu3ZXAek6NUErJ2bLRGU9DJf3OiWX
 wvdVyL/yXQPEErdTVo8yuqAJp0HwyrkEJa6p16Xvn1E+V/J/iPRIgMlHwfOHoHCqRKMj
 aj5/1GPSpYkL28wNxPoILpdwR2QCP0z1X0d+Vpd7m63Jj6VIUCqb0bZ9v+51GsILLOey
 UfhgnUlWP4nRgkmAVb7cnr+o4nERyaKdg/lQckz+UQbp5OHGO8KeLnLz4sxOd61WQFsQ
 uC5j7hSTjaMdWa594R/KagEXjhGre0fQ+SddFNNwjQ60/61EXAg+sdve5hbmaFQGW/7y
 q8hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ievhKyop
Subject: [Buildroot] [PATCH 2/2 branch/next] package/python-smbprotocol: new
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                  |  1 +
 package/python-smbprotocol/Config.in               |  9 +++++++++
 package/python-smbprotocol/python-smbprotocol.hash |  6 ++++++
 package/python-smbprotocol/python-smbprotocol.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-smbprotocol/Config.in
 create mode 100644 package/python-smbprotocol/python-smbprotocol.hash
 create mode 100644 package/python-smbprotocol/python-smbprotocol.mk

diff --git a/package/Config.in b/package/Config.in
index 7d50d793ec..7d227f8112 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1267,6 +1267,7 @@ menu "External python modules"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-slob/Config.in"
+	source "package/python-smbprotocol/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
diff --git a/package/python-smbprotocol/Config.in b/package/python-smbprotocol/Config.in
new file mode 100644
index 0000000000..ae58a7d9a1
--- /dev/null
+++ b/package/python-smbprotocol/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SMBPROTOCOL
+	bool "python-smbprotocol"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYSPNEGO # runtime
+	help
+	  Interact with a server using the SMB 2/3 Protocol.
+
+	  https://github.com/jborean93/smbprotocol
diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
new file mode 100644
index 0000000000..a46f9f635b
--- /dev/null
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/smbprotocol/json
+md5  a7474ab4cf8912dffaab56ad5067f429  smbprotocol-1.10.1.tar.gz
+sha256  b5bc9d4930ec947d42c21089a4d373b97e3f6488fd15d32d27189312fd8a04c9  smbprotocol-1.10.1.tar.gz
+
+# Locally computed
+sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
new file mode 100644
index 0000000000..17c2b17dbc
--- /dev/null
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-smbprotocol
+#
+################################################################################
+
+PYTHON_SMBPROTOCOL_VERSION = 1.10.1
+PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/13/1a/73ad1883beebe4f6f47879cb9880690944faa00681141920c7a2219f6152
+PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
+PYTHON_SMBPROTOCOL_LICENSE = MIT
+PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
