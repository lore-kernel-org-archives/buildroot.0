Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59447C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234A0615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 234A0615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 999BD42561;
	Thu, 30 Sep 2021 07:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwV50ESsdU0o; Thu, 30 Sep 2021 07:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC7642546;
	Thu, 30 Sep 2021 07:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08D231BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECA2983F75
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLEV4n_ln6M8 for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0538583F74
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t8so8314610wri.1
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXbgTUa2yl30D1OV/9J9oyjVwZmwE5UiaJAzqurSZMU=;
 b=B/crIIn7t01KCBU0FxpAa9KU6X3cHAqkJzYey75qrx2cA2zkF45wi6yk+0yNv3JFGE
 lgK7O59h1ICoMfuyvuDw+nhDdJcpRqJk4lbNDIS1k3FqmKIozTo7KhidBXzz/voUCN/n
 f+HoJgUTYDZhcyOvtBf/KjibT/+YXaukyc7GoMB/4ueM5dDt/yZHWn/y0U8+ZsmbILn9
 ZtGO5Zla7nNTVzYfrqF/rBSSjB8CUP+Q2a9BXLUks3nzR/6ibNvR7odEsobHSjjiPeV9
 TVuH31asWF3LTgrNIHQSzoOXfx91bcYWGqauotMKqlshB7iX2JLDDqP4dliw44dvb5MZ
 lYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXbgTUa2yl30D1OV/9J9oyjVwZmwE5UiaJAzqurSZMU=;
 b=jAnFEFGgtAqFkGB4IkS4pxlplVv0duvFGvbUCganafqStCCFAW9l36hjkjFkAbVCAO
 5LJsWKOHTXYIS4UEAg8i99lrBnJ+uXXo0/l+hyIdlgP7Y/8rG11t7gQy4k5MndkKO1Od
 AYXk7RLsZnANyKN85CsKEid62khGzz564epQtiCejeLWqxuXGAAzC1X0fP1AzrLuQHNI
 FtKvM85L+xN+QFgz6Yqq2hLDtVDk5zwK3x3eUwHb9jXUX2DqETA6m7IwrIl8l4EcrIak
 uu2tlgtOl/adKKpW+eypltMDlrQM361qORVJPOrk69mq1aJRHKc34R6gkcpt009i7GfZ
 TC+Q==
X-Gm-Message-State: AOAM533X5aS2l6ALantQ24OOwbz+VffbAqvD+zLugBbKrUmr1Y7BewZ0
 z9MxaNKa9Wf0iT1dNfX7K0HPHBUAMdk=
X-Google-Smtp-Source: ABdhPJwePFnrRuccBCL1CMHkDWX9kRpHuOnH79lX6GtyTpdNzLTindNHyXgNQGOv+u3Cs4iD9DbEGQ==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr4308473wri.338.1632985266115; 
 Thu, 30 Sep 2021 00:01:06 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:05 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:43 +0300
Message-Id: <20210930070051.40361-7-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.2.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* The package doesn't support python2 anymore.
* hash file: indent with two spaces and bring also sha256 from pypi.
* License was updated with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-setproctitle/Config.in                | 1 +
 package/python-setproctitle/python-setproctitle.hash | 8 ++++----
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-setproctitle/Config.in b/package/python-setproctitle/Config.in
index d13afaa401..a901fd7055 100644
--- a/package/python-setproctitle/Config.in
+++ b/package/python-setproctitle/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SETPROCTITLE
 	bool "python-setproctitle"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A Python module to customize the process title.
 
diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 6bade7bba7..88e4453277 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2dcdd1b761700a5a13252fea3dfd1977
-md5	2dcdd1b761700a5a13252fea3dfd1977  setproctitle-1.1.10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/setproctitle/json
+md5  9898587a1668f1c53f6699ca5d35256d  setproctitle-1.2.2.tar.gz
+sha256  7dfb472c8852403d34007e01d6e3c68c57eb66433fb8a5c77b13b89a160d97df  setproctitle-1.2.2.tar.gz
 # Locally computed
-sha256	6283b7a58477dd8478fbb9e76defb37968ee4ba47b05ec1c053cb39638bd7398  setproctitle-1.1.10.tar.gz
-sha256  40e85df0511ccacd29b6b5898e7e09b76889fc2f5d94b2670ece847977d3bbed  COPYRIGHT
+sha256  85bd836337aa702e0a4e2a54676c6ae046ffb357dbf4a990189595a60fcd1648  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index ff33c0c18a..13e9e261be 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.1.10
+PYTHON_SETPROCTITLE_VERSION = 1.2.2
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://pypi.python.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/a1/7f/a1d4f4c7b66f0fc02f35dc5c85f45a8b4e4a7988357a29e61c14e725ef86
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
