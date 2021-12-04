Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9C6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 12:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 032BE405FB;
	Sat,  4 Dec 2021 12:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHUdXy2Bebi4; Sat,  4 Dec 2021 12:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F914405E0;
	Sat,  4 Dec 2021 12:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 679511BF30A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57EEB83F66
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MK7CeJ_OQVr0 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 12:06:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13EE9831F2
 for <buildroot@busybox.net>; Sat,  4 Dec 2021 12:06:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a9so11542367wrr.8
 for <buildroot@busybox.net>; Sat, 04 Dec 2021 04:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XlbMO1bK/UIFTsgR9irYYW1Jsq/mu7nZ519QUaH6Qz8=;
 b=YwuXkbhF3wBzRbvONADd/XcNme8PjJZ1XkiNBuxt5pP8OdymDnON/Bq/Rcjc20B7gA
 rhK5oLbWIoqKcOhdXWt5psIxdZ3rk+zU1RJApYF4t2qzyjQUEzyqHNwUxpqeUduo5xBt
 aTeW7Ju7XxOmAjPJcnEEckgbDBsmdvTa7/iAFrDvERsYdjSBxTJ+W2l86wynn5NNDdpL
 vaq+pFnHc800aLWoVog7xBtWt3wFJ56M/Lcm1KKlDupyB4Szjd9+Jfd1AhtGyillc733
 E0H2SzMhaNll0ISJrjQpjOXL5OqPZr9AW/vCycvWXNjrcPvAHDftR0DHHFl86OiTkIXP
 q0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XlbMO1bK/UIFTsgR9irYYW1Jsq/mu7nZ519QUaH6Qz8=;
 b=EV2K2k0IeMK5fyBs9bi6Sl27r/YZsqf783Ism+YBi6LwV+YNlPdlVDbRLh9DPNstof
 TJxsl21aEGWPvfHpMoN1UBSF3J8gnjyb6NsYJ/sO+sLGIcdfLqT8iP9PcabGHBnGABJG
 kgRRStZoN/ywqfAsrbYXjWFP8jhOIUIRkp7zfENL2VTV3b90ewOR0/ntd31FsTsLbfY7
 sdN3KStp26I7G3QpSBlf+1PA/9A5+c1hp1sEDuke1SfnuzHDUCJo9tzlqLa9AACK5i40
 d8FhUWQZhu80zOIanhUDVbzRiCBGwBKF7PjDEAouZyvdZFy/Wi5r+dRN2wySnBO1GaOk
 ZsyA==
X-Gm-Message-State: AOAM533Warv5GKbvQIPONTa3pEWBHY0qfeipZZ8QyNd+Q7HOJaLcJ5VD
 JIgv670uaHm01eGJ5ygi3YNKb9KUGuA=
X-Google-Smtp-Source: ABdhPJySlT2Feg9SUcWc6fNgRqMyJXIfXf60IGyju+zYJiXwM19RgkIY80VSstgwrdkDA9dU0MEGrw==
X-Received: by 2002:adf:ee04:: with SMTP id y4mr29965644wrn.0.1638619563221;
 Sat, 04 Dec 2021 04:06:03 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id b10sm5437927wrt.36.2021.12.04.04.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 04:06:02 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Sat,  4 Dec 2021 13:05:48 +0100
Message-Id: <20211204120548.31170-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204120548.31170-1-guillaume.bressaix@gmail.com>
References: <20211204120548.31170-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next v2 2/2]: remove python-pybind
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
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr, asafka7@gmail.com,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

python-pybind was not the right approach and build fails
since v2.6.1

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 Config.in.legacy                         |  7 +++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/python-pybind/Config.in          |  8 --------
 package/python-pybind/python-pybind.hash |  4 ----
 package/python-pybind/python-pybind.mk   | 13 -------------
 6 files changed, 7 insertions(+), 27 deletions(-)
 delete mode 100644 package/python-pybind/Config.in
 delete mode 100644 package/python-pybind/python-pybind.hash
 delete mode 100644 package/python-pybind/python-pybind.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f3ecf981c0..37f56e4b9d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PYBIND
+	bool "python-pyind removed"
+	select BR2_PACKAGE_LEGACY
+	help
+	  'python-pybind' is not the right approach since v2.6.1,
+	  replaced by host-pybind11
+
 config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
 	bool "libmediaart 'none' backend removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8a04efa63f..e5e6d0f538 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1104,7 +1104,6 @@ F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
-F:	package/python-pybind/
 F:	package/pybind11/
 F:	package/reaver/
 
diff --git a/package/Config.in b/package/Config.in
index 5749118ee3..b3bf61a13e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1132,7 +1132,6 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
-	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
deleted file mode 100644
index 604cb9ee67..0000000000
--- a/package/python-pybind/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYBIND
-	bool "python-pybind"
-	help
-	  PyBind is a lightweight header-only library that exposes C++
-	  types in Python and vice versa, mainly to create Python
-	  bindings of existing C++ code.
-
-	  http://pybind11.readthedocs.org/en/master
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
deleted file mode 100644
index a68ac846e2..0000000000
--- a/package/python-pybind/python-pybind.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
-# License files, locally calculated
-sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
deleted file mode 100644
index a6a1bdb976..0000000000
--- a/package/python-pybind/python-pybind.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# python-pybind
-#
-################################################################################
-
-PYTHON_PYBIND_VERSION = 2.6.1
-PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
-PYTHON_PYBIND_LICENSE = BSD-3-Clause
-PYTHON_PYBIND_LICENSE_FILES = LICENSE
-PYTHON_PYBIND_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
