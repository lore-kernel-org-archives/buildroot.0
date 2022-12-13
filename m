Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D666C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DD6C408DE;
	Tue, 13 Dec 2022 01:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD6C408DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMjhsg3hmL_Q; Tue, 13 Dec 2022 01:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD2541697;
	Tue, 13 Dec 2022 01:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AD2541697
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 346411BF2FB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D20381B53
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D20381B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlDLnzjXgdbT for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 038FC8143B
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 038FC8143B
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id y2so4354159ily.5
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUNnWl++3cnmrL+tLpJhzC5YFpimRNWCcUS2jY4qw7g=;
 b=Km+8O46lYF8OmcwltExrYb5rfPgAuWjCg4YzhQJpJdLfq3sPox2Be4tC7qJaud2UcU
 S3vv/QzrFvsJoiDQNb+uv62dCSWpPN3+Ybmiyp7gke1aK9mc6cF4oVIfTIjJ52FsFZPE
 zIuMPIGUDxqLdna9m8lAGdmjKg8U4+6FOQi8ieQGxQiadnR+fK4ud6wJfxwd2JzrZvoZ
 3eA9Wu/BmPDPYlHPdrevbtBXEzNK3e8MnQUBPyJGlxFhD5xug9UktKz683NgTH9f65WB
 vi6DfsEydCweGnuHEBpD9jPONSQ6HPCje0s4CPnjtIfJT4VqA794GFdpTOyEWfsU+gW8
 /ZmQ==
X-Gm-Message-State: ANoB5pnX8ol2i/rRx3C/jcesTWyNNjsZVAw8D9DadL2y8OKLZVNT8+Gg
 UGWMCEsB8+gvtc7TinDvymXBf5XDptS87g==
X-Google-Smtp-Source: AA0mqf5KPx8Mg5/kmmRCcnr2z+UZddtIjbSvzZ363yGKc46vb1KXmHRfg0PkZShahMGKF6E2JJpACQ==
X-Received: by 2002:a92:ad0f:0:b0:303:913f:727a with SMTP id
 w15-20020a92ad0f000000b00303913f727amr9554859ilh.24.1670896219858; 
 Mon, 12 Dec 2022 17:50:19 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:50:01 -0700
Message-Id: <20221213015001.4175808-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213015001.4175808-1-james.hilliard1@gmail.com>
References: <20221213015001.4175808-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUNnWl++3cnmrL+tLpJhzC5YFpimRNWCcUS2jY4qw7g=;
 b=qYD0AmJDQMDyFJVnyyxbNpl8cS5k7ycEU8zn/5ENzX+7kUO/NNkMI9kUnTk6CES0bx
 ZrfKzPNajLnqf7BLSu5NivFz/P0+EgNHreHctHN6nGjlk3KacWo1GZsrLowhDc+r9XNh
 hqwzZw6gzB+gVidOw9HyzvHsnAqGaaIYLZY9G2pWXGhcPOJrIdYDp+vffWFhCAec5vND
 lliLQFSA8yLM2GmwUUI5kmZXu5GzBnbVpGFLJopEUjcDXmZHGXa2PDKTiCOHHl8p/Th0
 Ck2aTRnQVK1Z2tVtCR01/LO8SgxfZgmYPby3y6xXVd9zfVeI1hTb/rXZ9/eWifjwLLbM
 4BlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qYD0AmJD
Subject: [Buildroot] [PATCH 7/7] package/python-selenium: new package
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
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-selenium/Config.in            | 11 +++++++++++
 package/python-selenium/python-selenium.hash |  3 +++
 package/python-selenium/python-selenium.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-selenium/Config.in
 create mode 100644 package/python-selenium/python-selenium.hash
 create mode 100644 package/python-selenium/python-selenium.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a995f1d73f..391fe5e8f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1391,6 +1391,7 @@ F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-rtoml/
+F:	package/python-selenium/
 F:	package/python-snappy/
 F:	package/python-sniffio/
 F:	package/python-sockjs/
diff --git a/package/Config.in b/package/Config.in
index 5c9179a80c..b4b4bcb94d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1256,6 +1256,7 @@ menu "External python modules"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
+	source "package/python-selenium/Config.in"
 	source "package/python-semver/Config.in"
 	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
diff --git a/package/python-selenium/Config.in b/package/python-selenium/Config.in
new file mode 100644
index 0000000000..30820f07f8
--- /dev/null
+++ b/package/python-selenium/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SELENIUM
+	bool "python-selenium"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_PYSOCKS # runtime
+	select BR2_PACKAGE_PYTHON_TRIO # runtime
+	select BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	help
+	  Python language bindings for Selenium WebDriver.
+
+	  https://www.selenium.dev
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
new file mode 100644
index 0000000000..f320e2d0bb
--- /dev/null
+++ b/package/python-selenium/python-selenium.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/selenium/json
+md5  f3f853585dcdfbdde5a5d9e7d5e3f114  selenium-4.7.2.tar.gz
+sha256  3aefa14a28a42e520550c1cd0f29cf1d566328186ea63aa9a3e01fb265b5894d  selenium-4.7.2.tar.gz
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
new file mode 100644
index 0000000000..a6fa95f352
--- /dev/null
+++ b/package/python-selenium/python-selenium.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-selenium
+#
+################################################################################
+
+PYTHON_SELENIUM_VERSION = 4.7.2
+PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
+PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/3e/3f/69a34f8a83c77bba0ea13323c665ee27bf1b357a049c06c7c611dad10f75
+PYTHON_SELENIUM_SETUP_TYPE = setuptools
+PYTHON_SELENIUM_LICENSE = Apache-2.0
+PYTHON_SELENIUM_STRIP_COMPONENTS = 0
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
