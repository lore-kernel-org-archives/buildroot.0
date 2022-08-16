Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78235C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C38DD4051A;
	Tue, 16 Aug 2022 14:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38DD4051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OonNuPTGTnAj; Tue, 16 Aug 2022 14:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C35AB40374;
	Tue, 16 Aug 2022 14:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C35AB40374
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5AF1BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5509182983
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5509182983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5Yx4UUp-Yaw for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8103181D4F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8103181D4F
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z16so12851374wrh.12
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=oD14uQmpnxJ2Y2QtxdOoAc2LIaNB1/+IEiSR1IfUE3s=;
 b=Xzr1mg1lMSffO6Q4eGCwMO8evlqVSqznEGzA9o55NCAhIn1+zM3T6AHvgH8Pccd2lc
 TEzBNomDX6G+2T/nnogRql0Icg+WmW9JkPEPRaANfXvx81k7M7a85MHKu4wMLBWfgTGR
 Sn0Umsml9tfZjXj3tmwvJwA2hjbJNjYnOja49rONOaXb0vW74qwlndkab2PuK5nRsD6D
 f8LHrlhlwJBgMm3bQqpKWgDqpsZoH7KppIxck2cnC3PkUDpSKgqAUll8//lNbZvk6l2S
 8fMoQY1S8M1+/34KAjOF6gBkGqiyrvyfdD2Qpzn8jbidc9xJvZ68fZdTakGDXdtw/TIx
 STfg==
X-Gm-Message-State: ACgBeo1r25gA5vmeikwm2S4RwJ3Y33GP1rzvMUDZVsOO74qGEDJycKqG
 UBzpiZvTsr41BWNzKN8D5M2RIHJGUPA=
X-Google-Smtp-Source: AA6agR4aBF9I9rxS5X+iLqlGxmEOJApDVvLHpJb3jW2JyUMPUXTxYkgLxnuEY1FBqEBaG1RaazpOBw==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr12576084wri.39.1660660799398; 
 Tue, 16 Aug 2022 07:39:59 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:39:58 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:37 +0200
Message-Id: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=oD14uQmpnxJ2Y2QtxdOoAc2LIaNB1/+IEiSR1IfUE3s=;
 b=gaybNCD2ZVajIrPo0APBZaqGjz32CB/o6v/QekFJawhLIbUxmFb4LvxCWTFDXsmJ3Y
 chC2uyUKUp0i8Rp9cp/mMbeBwEBa96OXuHRRSyjzXhGnjt9WYVr/gpbU47/gHyAQMPwv
 ptWjWljG5gJP9KTlQBENcnaWDyGo+4yyK6RFyuJCcHUjhuxmclj7HNsLW/iWYcN6HRwH
 FMGTA0oltQ9EuppRCQL3hxvhT8m8ODC0RHc1qORUcPLcKrxEWST/BXfTOSMBBK+tVm2K
 ttdcypU5cLHUjXDifdE4fmxrmBMUS8Ud8vZ4vPOc/ps0p4Z3GYwv8feOlz9JzG7eFQ8V
 bVtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gaybNCD2
Subject: [Buildroot] [PATCH v1 1/7] package/python-joblib: new package
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

package/python-scikitlearn requires python-joblib
as runtime dependency

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-joblib/Config.in          |  8 ++++++++
 package/python-joblib/python-joblib.hash |  3 +++
 package/python-joblib/python-joblib.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-joblib/Config.in
 create mode 100644 package/python-joblib/python-joblib.hash
 create mode 100644 package/python-joblib/python-joblib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..2c4f9ed76e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1191,6 +1191,7 @@ F:	package/mbw/
 F:	package/pixiewps/
 F:	package/python-beniget/
 F:	package/python-gast/
+F:	package/python-joblib/
 F:	package/python-pybind/
 F:	package/python-pythran/
 F:	package/python-scipy/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..7f017c92e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1086,6 +1086,7 @@ menu "External python modules"
 	source "package/python-jedi/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jmespath/Config.in"
+	source "package/python-joblib/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-joblib/Config.in b/package/python-joblib/Config.in
new file mode 100644
index 0000000000..c6c5122c49
--- /dev/null
+++ b/package/python-joblib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JOBLIB
+	bool "python-joblib"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Joblib is a set of tools to provide lightweight
+	  pipelining in Python.
+
+	  https://joblib.readthedocs.io/en/latest/
diff --git a/package/python-joblib/python-joblib.hash b/package/python-joblib/python-joblib.hash
new file mode 100644
index 0000000000..5023ba872c
--- /dev/null
+++ b/package/python-joblib/python-joblib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4cda464ca712a4814849c9477d7551b696ce215dc05d79fc516460814ef48f4f  python-joblib-1.1.0.tar.gz
+sha256  42612911c1872c5e4b43f6ae0e8ee59467cd350332241cf72ce90640264fae6a  LICENSE.txt
diff --git a/package/python-joblib/python-joblib.mk b/package/python-joblib/python-joblib.mk
new file mode 100644
index 0000000000..97bf9172f2
--- /dev/null
+++ b/package/python-joblib/python-joblib.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-joblib
+#
+################################################################################
+
+PYTHON_JOBLIB_VERSION = 1.1.0
+PYTHON_JOBLIB_SITE = $(call github,joblib,joblib,$(PYTHON_JOBLIB_VERSION))
+PYTHON_JOBLIB_LICENSE = BSD-3-Clause
+PYTHON_JOBLIB_LICENSE_FILES = LICENSE.txt
+PYTHON_JOBLIB_SETUP_TYPE = setuptools
+
+# avoid running this test which requires
+# chinese caracters to be supported
+define PYTHON_JOBLIB_REMOVE_SPECIAL_ENCODING_TEST
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/joblib/test/test_func_inspect_special_encoding.py
+endef
+PYTHON_JOBLIB_POST_INSTALL_TARGET_HOOKS += PYTHON_JOBLIB_REMOVE_SPECIAL_ENCODING_TEST
+
+$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
