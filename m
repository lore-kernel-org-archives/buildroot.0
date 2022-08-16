Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E052EC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547D661024;
	Tue, 16 Aug 2022 14:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547D661024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHak9ii9raI9; Tue, 16 Aug 2022 14:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4AFC60E83;
	Tue, 16 Aug 2022 14:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4AFC60E83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 683B71BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 502F382983
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 502F382983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRsnqzfgTNDF for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C97281D4F
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C97281D4F
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v3so12924801wrp.0
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VMbii+ULw+kUccgjiBNNd9HN7Vt6SoYi+KidyJYZYBw=;
 b=JXE7tffq/SYNALnrexhsxuDoWSGybq+aQGz15lmhYwitRxauZtP6F6vmwoZuWwMJjt
 6mI2FwAhMGcnYZdvDAf8+lITWVOmo6o+lo3c8yz/PfjetTCsX/AYxx2gt3Tske4mjhfX
 P5hYwxWwSNByClYbNYzgUAecLAp6HbaLgrvuQd/zMKL2sEOM9ZmY84uFE7HEj8RTzDS3
 53OtXpZRZ7hNX2H9p91UYJgDGycLy9S1mKApvJH1et7iVivp7kXlJ6mPRYijDvHkc7J8
 zY+6y88kkYWdXFPBpB4N3gs52gYVJrfGIbV+EykH+rdOmvoNO6dwFCVEmfKb9xHSeqsz
 iELA==
X-Gm-Message-State: ACgBeo3Yf8tEuxb7q4HmNJdn0otokBSyd2IhHORUlxBBJmyCu+ulMo9W
 q2exSifsTwS6CjB0kPt/tGSkhd0rWII=
X-Google-Smtp-Source: AA6agR6ieFbYHYhPgfpFIUFQDHe8MgI/iduHsf7vOQt5qA0CFmj99wxRFPcW8DRBMooLmBkiDgR7/A==
X-Received: by 2002:a05:6000:120a:b0:21f:dfb:ff12 with SMTP id
 e10-20020a056000120a00b0021f0dfbff12mr11575772wrx.215.1660660812212; 
 Tue, 16 Aug 2022 07:40:12 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:40:11 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:38 +0200
Message-Id: <20220816143943.16142-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VMbii+ULw+kUccgjiBNNd9HN7Vt6SoYi+KidyJYZYBw=;
 b=PVYfFKCOIWCcQdtjJDJmtkTT6vjwjrmiCMmjFinQ1ibmyjKxd0MQnQaSC9anG6EMqG
 tBT2Ia2eF/sFVoHuFDuhUHCMysbtgKLqAR+ydgpdhXBIvn6+WlD4rMjmx8ibwaHGg5V6
 pJHTHDhEdxXKQpSfvQHO8K/Mpe/FqbGJZzSvB6MO3XrCwqGD0OpUWwf8VeWVVrKjOlSc
 ZpunreQXz2y9lm5gMs/YTdlyHrzQmbiLtg0zo1lumRuszfm58Z9C9dN1qx8egTH1gwVt
 edo/Grbb0+yejUgEoXCqZuuUy9GDjCJ/gqqBFlI9eOv7PXCax81zRoTXYiqg883ewAsC
 ysjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PVYfFKCO
Subject: [Buildroot] [PATCH v1 2/7] package/python-threadpoolctl: new package
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

package/python-scikitlearn needs python-threadpoolctl as a
runtime dependency.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
python-threadpoolctl originally builds with "flit", whose
build process merely consists in copying threadpoolctl.py to
the /usr/lib python pool. As we have no knowledge of "flit",
I simply used the buildroot infra to recreate this behavior.
Let me know of any suggestion
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-threadpoolctl/Config.in        | 10 +++++++++
 .../python-threadpoolctl.hash                 |  3 +++
 .../python-threadpoolctl.mk                   | 22 +++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/python-threadpoolctl/Config.in
 create mode 100644 package/python-threadpoolctl/python-threadpoolctl.hash
 create mode 100644 package/python-threadpoolctl/python-threadpoolctl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c4f9ed76e..21a35cf9d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1195,6 +1195,7 @@ F:	package/python-joblib/
 F:	package/python-pybind/
 F:	package/python-pythran/
 F:	package/python-scipy/
+F:	package/python-threadpoolctl/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
diff --git a/package/Config.in b/package/Config.in
index 7f017c92e9..876d7309eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1274,6 +1274,7 @@ menu "External python modules"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
+	source "package/python-threadpoolctl/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
 	source "package/python-tinyrpc/Config.in"
diff --git a/package/python-threadpoolctl/Config.in b/package/python-threadpoolctl/Config.in
new file mode 100644
index 0000000000..127de3bc39
--- /dev/null
+++ b/package/python-threadpoolctl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_THREADPOOLCTL
+	bool "python-threadpoolctl"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Python helpers to limit the number of threads
+	  used in the threadpool-backed of common native
+	  libraries used for scientific computing and
+	  data science (e.g. BLAS and OpenMP).
+
+	  https://github.com/joblib/threadpoolctl
diff --git a/package/python-threadpoolctl/python-threadpoolctl.hash b/package/python-threadpoolctl/python-threadpoolctl.hash
new file mode 100644
index 0000000000..6b6fa72443
--- /dev/null
+++ b/package/python-threadpoolctl/python-threadpoolctl.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  449b806f9147a3cf28ed7ec6389dbff9c450331d695873ab75dea79fe661f1e7  python-threadpoolctl-3.1.0.tar.gz
+sha256  81ac619075248b06e53660b652d10e485f4675f5d0ae0f97ea22370da1f7e23b  LICENSE
diff --git a/package/python-threadpoolctl/python-threadpoolctl.mk b/package/python-threadpoolctl/python-threadpoolctl.mk
new file mode 100644
index 0000000000..50f77b1b1f
--- /dev/null
+++ b/package/python-threadpoolctl/python-threadpoolctl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-threadpoolctl
+#
+################################################################################
+
+PYTHON_THREADPOOLCTL_VERSION = 3.1.0
+PYTHON_THREADPOOLCTL_SITE = $(call github,joblib,threadpoolctl,$(PYTHON_THREADPOOLCTL_VERSION),$(PYTHON_THREADPOOLCTL_VERSION).tar.gz)
+PYTHON_THREADPOOLCTL_LICENSE = BSD-3-Clause
+PYTHON_THREADPOOLCTL_LICENSE_FILES = LICENSE
+
+# threadpoolctl is originally built using 'flit' which
+# simply symlinks $(@D)/threadpoolctl.py to site-packages
+define PYTHON_THREADPOOLCTL_BUILD_CMDS
+endef
+
+define PYTHON_THREADPOOLCTL_INSTALL_TARGET_CMDS
+	cp $(@D)/threadpoolctl.py \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
+endef
+
+$(eval $(generic-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
