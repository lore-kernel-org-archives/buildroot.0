Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD256C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 10:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 496A5415A2;
	Tue, 15 Feb 2022 10:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9weCc-ZK7O9Y; Tue, 15 Feb 2022 10:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52419409B2;
	Tue, 15 Feb 2022 10:53:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 146BE1BF290
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 10:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0323B80D1B
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 10:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMf2lUjglzBC for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 10:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B20DC80C7B
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 10:53:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q7so31272572wrc.13
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 02:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bALDrKc8QWUsAOpQtlPcW7GqVbVgtf43aTDQ5LrEI7s=;
 b=RVRvgiNyWcVoqYXKq9kyoKMhAeWYASWM1AL4MugjN2ZO4vGmer57Z4DyheHDQUF1Ms
 WVzxWpHO4cux99I674blTqyp6vWXVnhrERt+9Sf69sEDZ7UniSOO3u2Gdjkq6SdB4zOT
 qUhc/60UaSr8vCfaTxAIIfL2l0r5S9bF0C/iOq6kejBV9kJxXyCO7kkgnEtkz/G27A1r
 QIQP8KMfOo/rANCfA4PigKp/rzNr0tM4HBxVm1Nwb7yWI4KXjUo7wPY7KhyiDK6u++px
 ZDSC8aYkEZio/Ks+i7Yo3p3poPBEHz5uRQJkWoCTCPoIKqguJOo/kNzPcMIbfWfMH6yf
 TXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bALDrKc8QWUsAOpQtlPcW7GqVbVgtf43aTDQ5LrEI7s=;
 b=pw3gLeVX1jCrZR6/Cjo7iVU6aXY+HypKczci+u6dp7RjNLE+ueualhq+lWmUEZoKwH
 DLsAwkav8/BggYjgVZGMc/jLDjtONfz/9HFqH8/xlg39djtbHiMK6bSyoO2Gux9A5n8Q
 SUfL9lq3uhWRJ6n/ddCtHCSl8maDspI2V0Mal3+rXDCVlwXtUerJtFawO9XjfitDOCok
 r3Rw22yxGga2+dTLpSH0PchAmG8ysh7B782avmwfbeLWwuhs4vwgsb1SegdJ6+TXx7nD
 eVhptEzbEsEdJCFbZkWgOsCfmdFCCcjFM4E6bbheoC2JXPvCrg3A7dMi4fvrgma1ygT/
 a/Xw==
X-Gm-Message-State: AOAM532nzHHORF9nY65C85HObfJvFAoJJ1T4HQT/kopnnLRObCiXk4wW
 kJ53f0l8n7eFEfNPRbDhABdk3/YGOzQ=
X-Google-Smtp-Source: ABdhPJypu/SODQ7Ce+ty9zJxpjazVj/4ZzxqaP60ipYIPicNaDoBhoK8ZQRRlq2x8zRaW9+3dLr9fA==
X-Received: by 2002:adf:f803:: with SMTP id s3mr2774855wrp.660.1644922411570; 
 Tue, 15 Feb 2022 02:53:31 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f6sm13762395wrv.116.2022.02.15.02.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 02:53:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 11:53:40 +0100
Message-Id: <20220215105340.1919699-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pycli: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-pycli raises the following build failure since bump of python3 to
version 3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc
due to the new "Multiple Exception types without parentheses" exception
(https://docs.python.org/3/whatsnew/3.10.html)

error:   File "/usr/lib/python3.10/site-packages/cli/app.py", line 242
    except Exception, e:
           ^^^^^^^^^^^^
SyntaxError: multiple exception types must be parenthesized

So drop the package as the last release was made 10 years ago.

Fixes:
 - http://autobuild.buildroot.org/results/8d7b0c23472abffc9447e4a6de273bdd04486d39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                       |  7 +++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/python-pycli/Config.in         |  7 -------
 package/python-pycli/python-pycli.hash |  5 -----
 package/python-pycli/python-pycli.mk   | 14 --------------
 6 files changed, 7 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-pycli/Config.in
 delete mode 100644 package/python-pycli/python-pycli.hash
 delete mode 100644 package/python-pycli/python-pycli.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index aefb0ba6ea..99459c7ad3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PYCLI
+	bool "python-pycli removed"
+	select BR2_LEGACY
+	help
+	  Package was removed because it is not compatible with python
+	  3.10 and is not maintained anymore (no release since 2012).
+
 config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
 	bool "bpftool was moved"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3e7c753836..6208df974d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1065,7 +1065,6 @@ N:	Geoff Levand <geoff@infradead.org>
 F:	package/flannel/
 
 N:	Geoffrey Ragot <geoffreyragot@gmail.com>
-F:	package/python-pycli/
 F:	package/python-pyyaml/
 
 N:	Gerome Burlats <gerome.burlats@smile.fr>
diff --git a/package/Config.in b/package/Config.in
index 3213c4a9b4..ed7d9555b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1144,7 +1144,6 @@ menu "External python modules"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
-	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pycups/Config.in"
diff --git a/package/python-pycli/Config.in b/package/python-pycli/Config.in
deleted file mode 100644
index e1ce3b99a6..0000000000
--- a/package/python-pycli/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYCLI
-	bool "python-pycli"
-	help
-	  The cli package is a framework for making simple, correct
-	  command line applications in Python.
-
-	  https://pythonhosted.org/pyCLI/
diff --git a/package/python-pycli/python-pycli.hash b/package/python-pycli/python-pycli.hash
deleted file mode 100644
index f0890e83a9..0000000000
--- a/package/python-pycli/python-pycli.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/pycli/json
-md5 89c487e7c8068ce05d63394d2ae7ebad pyCLI-2.0.3.tar.gz
-# Locally computed
-sha256  bc53e6c5db031ae1c05d131641f153d22a201c5e82cc8c9324a945752efbb622  pyCLI-2.0.3.tar.gz
-sha256  591490b2ef462a4ad2be1aae5dd47738cb17e191c82d3ba38c3ae906d288e6ba  lib/cli/__init__.py
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
deleted file mode 100644
index 7aff1c6200..0000000000
--- a/package/python-pycli/python-pycli.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pycli
-#
-################################################################################
-
-PYTHON_PYCLI_VERSION = 2.0.3
-PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
-PYTHON_PYCLI_SITE = https://pypi.python.org/packages/95/fc/b2d86a5fbdac4072bcf70b01674b612e1a13026f54962c878fe3eca36fd1
-PYTHON_PYCLI_LICENSE = ISC-like
-PYTHON_PYCLI_LICENSE_FILES = lib/cli/__init__.py
-PYTHON_PYCLI_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
