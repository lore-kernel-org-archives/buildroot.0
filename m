Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC59C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0C883D4B;
	Thu, 14 Dec 2023 19:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0C883D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9tcuFElKs-v; Thu, 14 Dec 2023 19:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E7C83C1C;
	Thu, 14 Dec 2023 19:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E7C83C1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65D111BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE0741625
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE0741625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8pb4rqIMSTo for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:45 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39443416D1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39443416D1
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7b72d574399so395153939f.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581883; x=1703186683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XtaoyywSOYuRoqZUTTjQuO3UJT1liYox6iM0mJQPKI=;
 b=nwUIVSe7Xh1NXT0+/34cI7eamMLe6qIc+1hDt9ZuaJTqQkbgshXGeUrf7oVROKksRS
 i7yiSRokiPAttmnjzCG9vZFNxGiTJQ+yjk42ib/112VURu35Bo5GUVx5i6W+e0BWSNUz
 AXjGs+Heq1YRLHpA4KU6eTs+kEg3EnUFwINF+Ahd5lABa8Gy01DuQop2MmgT6aFpHEZA
 At+KJJzf5MWYBpfpSaEv6EMM/XW29FYM5nbwmqThYXo7zHF1SKD2ls3wKCvAcLJiCA9W
 RTUUtVRPxhn0smtIgHHVBnI60N4XjJaf0sw/SKh2+wroO6G1aoTqklYXHB+ZY9TCGoV4
 vIng==
X-Gm-Message-State: AOJu0YyuVNtaLAwRg9XtqTYSzC9UuHory6QkPjyYISFGOysmdEC4qCE5
 gr9w8a6G5Nyq5duPzSqdfMMLVx4VipF+yw==
X-Google-Smtp-Source: AGHT+IEPf5/Mtno1OTiGp1EBKKBsprBXXDiYtdLGnBbeFa0nyPFN+AuyxaLXApe2HqTP4oDkGK0rDQ==
X-Received: by 2002:a6b:dd19:0:b0:7b7:1db4:be12 with SMTP id
 f25-20020a6bdd19000000b007b71db4be12mr11589129ioc.27.1702581883667; 
 Thu, 14 Dec 2023 11:24:43 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:35 -0700
Message-Id: <20231214192439.259156-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581883; x=1703186683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XtaoyywSOYuRoqZUTTjQuO3UJT1liYox6iM0mJQPKI=;
 b=mKA0Q+DhRhNzDQ74MmbuYj8bMrLKc1Zrr/2/iMvIIe/Ty0QNedEdbWD1cqpn0y2wfL
 KTDDWnm8FlEQrCDNWuboEqLlgqVAEWnpd2i0Opkr4YUDHLAgEEeQzQnS5BEsgYkAmwgA
 j0tR4yK0f+TntG1lUvqIIAWDK+skYY/24gR5SYk0scFdzl4m396pAU+0B5DHkt8MceK+
 leWr5F1PsvtrohDT4xox63Qv9zL4P7CWDQQM8VMbcTqcSPMHcUHBxZrraOmMnmiRFIn4
 9Qyi8eQQyNAHklVFCupuq2fubF9gpPkCj83Ztf0aGnXF02V1njx6AEYAeYmwhEgIeNbf
 eERA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mKA0Q+Dh
Subject: [Buildroot] [PATCH 3/7] package/python-cachetools: new package
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
 package/Config.in                                |  1 +
 package/python-cachetools/Config.in              |  6 ++++++
 package/python-cachetools/python-cachetools.hash |  5 +++++
 package/python-cachetools/python-cachetools.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-cachetools/Config.in
 create mode 100644 package/python-cachetools/python-cachetools.hash
 create mode 100644 package/python-cachetools/python-cachetools.mk

diff --git a/package/Config.in b/package/Config.in
index 5a6de1d1b7..21f711c456 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "External python modules"
 	source "package/python-brotli/Config.in"
 	source "package/python-bsdiff4/Config.in"
 	source "package/python-cached-property/Config.in"
+	source "package/python-cachetools/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-canopen/Config.in"
 	source "package/python-cbor/Config.in"
diff --git a/package/python-cachetools/Config.in b/package/python-cachetools/Config.in
new file mode 100644
index 0000000000..550e3d2560
--- /dev/null
+++ b/package/python-cachetools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CACHETOOLS
+	bool "python-cachetools"
+	help
+	  Extensible memoizing collections and decorators.
+
+	  https://github.com/tkem/cachetools/
diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
new file mode 100644
index 0000000000..7b6b939191
--- /dev/null
+++ b/package/python-cachetools/python-cachetools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cachetools/json
+md5  5317c13b69c4021e925a2fbbc199bcc9  cachetools-5.3.2.tar.gz
+sha256  086ee420196f7b2ab9ca2db2520aca326318b68fe5ba8bc4d49cca91add450f2  cachetools-5.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256  76260c1370a7d41d5fac71a27d781f3add5d7249adfbbfa930846d2d9e47dbd5  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
new file mode 100644
index 0000000000..c841e0761f
--- /dev/null
+++ b/package/python-cachetools/python-cachetools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cachetools
+#
+################################################################################
+
+PYTHON_CACHETOOLS_VERSION = 5.3.2
+PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/10/21/1b6880557742c49d5b0c4dcf0cf544b441509246cdd71182e0847ac859d5
+PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
+PYTHON_CACHETOOLS_LICENSE = MIT
+PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
