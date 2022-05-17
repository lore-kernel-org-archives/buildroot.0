Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3597FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3309610DA;
	Tue, 17 May 2022 21:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_C-eSz508z8; Tue, 17 May 2022 21:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2F3960B7D;
	Tue, 17 May 2022 21:59:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35B451BF20B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F55418FE
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjCK_jQvGwtu for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:59:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6D5B418FB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:59:37 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id j7so294885ila.1
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXPreCJLLITk3EeXwGAMv5ZihsEusTUN43m1Q4Cb+L8=;
 b=N6Dwlb18eMk+bkFCnoLsBLtxSJypbIG+F/feJGYuajPPkDnygVGt0uqGUbJGbyKWCd
 Rl5QDJzrB+nw9KgwLTvGs+NQfO5dAB9NOkv5t3S7aWzRKcgGJWdGz6iytnHZakRVFp4F
 okiuAw6kkkDcArlVG4+XiiP0ldZL0OH4hn3cAmIhkmA/fiV94PJuZI++OZ5czS7qjkD5
 zfCcWdqv64SrUrOoiMcQNLpza1aQcCZ/Qumx8DGuuN9dEduLEZCnqfN35HccVbOItOnB
 /8CtcODWDOVcxiODBlCE+FVEv9hlZzsgqpaPqTaM+hablLWk6OZmjUvOG44md1ZKw4W5
 RTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXPreCJLLITk3EeXwGAMv5ZihsEusTUN43m1Q4Cb+L8=;
 b=vSOOfNUG3gexISZHYCm4mmnxXNLU11gPBdBh80kOXSi5ZJM6z4WlJ/quCqSamdaFrV
 2FkWjMi87c/ayHkCNg+YrPZwTQiVYNIMhwxpKYbgW47SCB4k0MjdD2oJNJxFqh5XB3jF
 DSIcVvy5pDZ6FWiH6KYiL24gPosMk2jqwLyh1Af1ot7Bz5T5ILdpAaNDBnjR5qq23+Vs
 jfj/584BoLEanhqMVu08XZZhsJYXf/rm+9TuWuY6cKpCM9vubEPEVPvPmC0sE/+6uWI5
 PTj7FD5zAR2Y0vdxhPIUu2yHoPv68X6gbPx5R/g3hKXMuyoz/neHtEN4eIHjNwKLSRQg
 Evvg==
X-Gm-Message-State: AOAM5300f2t0TOakRKTyEIjcq1xM3pZM2rCZmaepToi9DTUZYO1iMQXf
 GEyZgxJXch6j8jCh006sKRq9z7+Q1Sc=
X-Google-Smtp-Source: ABdhPJxMCapupPIK2vk7EJcOA21ynpzHOU/MgghR1DIrO0gD8Hl+cI2Youyww29j95zow5B8yw5DuQ==
X-Received: by 2002:a92:d9cb:0:b0:2d1:12f4:7a3e with SMTP id
 n11-20020a92d9cb000000b002d112f47a3emr8290541ilq.321.1652824776760; 
 Tue, 17 May 2022 14:59:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 j13-20020a02cb0d000000b0032e262428d1sm67354jap.143.2022.05.17.14.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 14:59:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 15:59:30 -0600
Message-Id: <20220517215933.1553086-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/python-typeguard: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-typeguard/Config.in             |  6 ++++++
 package/python-typeguard/python-typeguard.hash |  5 +++++
 package/python-typeguard/python-typeguard.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-typeguard/Config.in
 create mode 100644 package/python-typeguard/python-typeguard.hash
 create mode 100644 package/python-typeguard/python-typeguard.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..c1816297c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1264,6 +1264,7 @@ menu "External python modules"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
 	source "package/python-txtorcon/Config.in"
+	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-u-msgpack/Config.in"
diff --git a/package/python-typeguard/Config.in b/package/python-typeguard/Config.in
new file mode 100644
index 0000000000..6fd8351570
--- /dev/null
+++ b/package/python-typeguard/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TYPEGUARD
+	bool "python-typeguard"
+	help
+	  Run-time type checker for Python.
+
+	  https://github.com/agronholm/typeguard
diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
new file mode 100644
index 0000000000..76394bcb19
--- /dev/null
+++ b/package/python-typeguard/python-typeguard.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typeguard/json
+md5  22d49971f62f3baa3525349b1e03723d  typeguard-2.13.3.tar.gz
+sha256  00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e80251cc13dfbb8c4  typeguard-2.13.3.tar.gz
+# Locally computed sha256 checksums
+sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
new file mode 100644
index 0000000000..8471f2e4fd
--- /dev/null
+++ b/package/python-typeguard/python-typeguard.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-typeguard
+#
+################################################################################
+
+PYTHON_TYPEGUARD_VERSION = 2.13.3
+PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/3a/38/c61bfcf62a7b572b5e9363a802ff92559cb427ee963048e1442e3aef7490
+PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
+PYTHON_TYPEGUARD_LICENSE = MIT
+PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
+PYTHON_TYPEGUARD_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
