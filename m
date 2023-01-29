Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D5C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CD681E26;
	Sun, 29 Jan 2023 03:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CD681E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qTNw-d9j8b2; Sun, 29 Jan 2023 03:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7E481E1B;
	Sun, 29 Jan 2023 03:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7E481E1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 282A41BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02BB840123
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02BB840123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6aLvYegKX9h0 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC759400B8
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC759400B8
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id e204so3383499iof.1
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wm/kZ0ynOny3ZJ2G2QjS3BqVdApCsQcPdqOxSlZL/g=;
 b=12fLluRM16ttY8+97Zw29VLJ11R2QoOKW8cmwT1lYzOeCm1DYP4UR4ABlgLQew2BuE
 vi5ARsvGpCz/8LKBIBcy6EPN5GrSUsPsYna0SD+q9SvVpi8YFNL0Z31A+yvWGpk9WL4L
 qglHZxeOnbffrKheAPWy+JbDtwuSz3BpjpHKvrA0K4BoTRyqjvQ2xq5/lmBcieTeSKkR
 oFlSoh5BSp4HJaH+OiPK2TVIGMurRC+D6DRahJbxd9pRZpy7GnEW2AYmdYqP/73fW1X+
 MJt3X2AjlMfaYMbCBZNcaToYQunzGxRJKTZyKzMTC8Pi1s1nYz/RLfa8SBRe+TM4ihDt
 VNUw==
X-Gm-Message-State: AO0yUKWRYJ71S8VgRmduxVDoxPos53hnFKBDQZ05g/g6VSmXfHu15HTY
 G4GtPWEY8sI8izxjzSpSaPh7+1zWh1Y1pQ==
X-Google-Smtp-Source: AK7set9MI6uhW/t909UAgFnCCDv2VtoKbQy54RPEFwMRm3X4D2Av/ucOSgzns7rrg+xmDF3jJXFMiA==
X-Received: by 2002:a5e:8506:0:b0:704:8629:8400 with SMTP id
 i6-20020a5e8506000000b0070486298400mr2747474ioj.8.1674964360841; 
 Sat, 28 Jan 2023 19:52:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:32 -0700
Message-Id: <20230129035232.2480871-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wm/kZ0ynOny3ZJ2G2QjS3BqVdApCsQcPdqOxSlZL/g=;
 b=e545VODDTDpGl984f7cXS6YJjGNIEEO5TUoyChQP/pM9AwhOctDbVttpe40jtkk1PY
 zef5/bKnsRo4wm0V+9Z87PRivKzAVvLN/ykLmkqrWgS83dtXLzGDinDMMYqvKMQsf3A/
 b7/gaucnJiNJOtluT0TUm0Wq4xVtVPe2smm7cz7alkw9avbZ5BnYwXJGievMXB1vQxZc
 H5V1+rc/EfDI3A8NqmbCWKUbvsMzarq3OmQAwQo9RGdbMZBWh2tttTx5YH7zxh/qt2EV
 g6Nt8Gghn9IZ9bpQz2FtDM4+4mRDdtA5dAburmAjtgq6E4MFMopdYzM4VsYfXAZvUWiz
 A72Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e545VODD
Subject: [Buildroot] [PATCH v2 7/7] package/python-selenium: new package
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
Changes v1 -> v2:
  - bump to version 4.8.0
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-selenium/Config.in            | 11 +++++++++++
 package/python-selenium/python-selenium.hash |  3 +++
 package/python-selenium/python-selenium.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-selenium/Config.in
 create mode 100644 package/python-selenium/python-selenium.hash
 create mode 100644 package/python-selenium/python-selenium.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e9e4df8f1..d0a51086cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1396,6 +1396,7 @@ F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-rtoml/
+F:	package/python-selenium/
 F:	package/python-snappy/
 F:	package/python-sniffio/
 F:	package/python-sockjs/
diff --git a/package/Config.in b/package/Config.in
index 46679095b3..fc468148df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1260,6 +1260,7 @@ menu "External python modules"
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
index 0000000000..d462abc62b
--- /dev/null
+++ b/package/python-selenium/python-selenium.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/selenium/json
+md5  e9054eb95920bb2a1d594090f0773f61  selenium-4.8.0.tar.gz
+sha256  fee36724d6cf0b18c73781bb8ec7be4a35ab1e2564e64e64e64da75e50e052af  selenium-4.8.0.tar.gz
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
new file mode 100644
index 0000000000..6dbea6fb7e
--- /dev/null
+++ b/package/python-selenium/python-selenium.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-selenium
+#
+################################################################################
+
+PYTHON_SELENIUM_VERSION = 4.8.0
+PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
+PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/2e/3d/492cf1a6823c48369328572c6bc63b7a957ba25c0009ee6bdb507cd9a6a4
+PYTHON_SELENIUM_SETUP_TYPE = setuptools
+PYTHON_SELENIUM_LICENSE = Apache-2.0
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
