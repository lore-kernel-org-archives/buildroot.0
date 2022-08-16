Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98204C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4A640291;
	Tue, 16 Aug 2022 14:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4A640291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQ11e9-vjNoZ; Tue, 16 Aug 2022 14:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F6A402A0;
	Tue, 16 Aug 2022 14:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F6A402A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B986E1BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0551829BB
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0551829BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iF3houLFtOfm for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9047782983
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9047782983
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id ba1so2317847wrb.5
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/oUEdpaY7MFA+SKGXiFo0xliKNTosaiEaoae6O+V8HU=;
 b=K0IPkiO7E1yiHv5cHip7mjSqRARpMy5glQ4sntLFyoZU+cALdeoXKa1Kwc6X0xA0eS
 FUtWm/0YHe2L1mne1g+vhI+YzS4/7PMDublQK8fAD/JKoz6sLWHvRY5xUuGBJcUQXHjl
 0QzlNkPDjW39+aK1VA+rxNotGbnc5sJVcbxQkgO2LpDkLEfh8+sWkLS7fw9iVKPp73xu
 L+jBnS4dw3M6xuxj2Vu4+CsK+WE8XzMF3X/xcjgx2obowBqKFzTxa9PAkzNRkD7p2wKe
 TWXqpwO3+cEpdJeUVI9qVu/6dqrGhlC3G9ehdwJvGvaxztGZfwvmXLHPg9w3TvBTyyJj
 LflA==
X-Gm-Message-State: ACgBeo2Rp1XzoBpK9rLwTUp5Iep3eXXuddMEt1meFRkS8vWMmV5t7Bko
 O7jzuydCGRZp993XEHUbcW/5TrHdoXU=
X-Google-Smtp-Source: AA6agR4dv86STOJ7B+pqXNVVyEuW3LdotRzmA09SfXQ06w30rucL9B5riLBF+AulJ+ZfwmyU56wlSQ==
X-Received: by 2002:a5d:6d85:0:b0:220:7084:35e9 with SMTP id
 l5-20020a5d6d85000000b00220708435e9mr12181317wrs.11.1660660837611; 
 Tue, 16 Aug 2022 07:40:37 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:40:37 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:42 +0200
Message-Id: <20220816143943.16142-6-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/oUEdpaY7MFA+SKGXiFo0xliKNTosaiEaoae6O+V8HU=;
 b=c1W9cehZn2TcvHO7q/mnp+BPHJoI36TjCr6FV0BppQwatIghiNz0FT0pq2EC1fTCOH
 4GaB53VuuMemob5cI/K+QbEVqOwEomss6eLtYHk/GdXiEzHbQGtmyGzUYFcHne6Y/Wol
 KLuZV+tTd7ErlDfyHIa0mdWu7u6funYVQU8jAvJMKbnH+zQjeHnDv2PqURzoaQP79B40
 ho+KRkOp7sn44UKXlC6REqINlDp9qAiKf7G6L52rlBtgbwIJPxKltJNgtIYulQP3TVXr
 RKLvuvHou81cjd9rXLl3T+BXa0ym+/+dDoVGkiRwvWfhOryzj9OGEUzwarSaPJvpJjWK
 yPBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c1W9cehZ
Subject: [Buildroot] [PATCH v1 6/7] package/python-scikitlearn: new package
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

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
python-scikitlearn needs scipy both as build time and runtime dependency
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-scikitlearn/Config.in          | 24 +++++++++++++++++++
 .../python-scikitlearn.hash                   |  4 ++++
 .../python-scikitlearn/python-scikitlearn.mk  | 21 ++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/python-scikitlearn/Config.in
 create mode 100644 package/python-scikitlearn/python-scikitlearn.hash
 create mode 100644 package/python-scikitlearn/python-scikitlearn.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 21a35cf9d1..049f9fe186 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1194,6 +1194,7 @@ F:	package/python-gast/
 F:	package/python-joblib/
 F:	package/python-pybind/
 F:	package/python-pythran/
+F:	package/python-scikitlearn/
 F:	package/python-scipy/
 F:	package/python-threadpoolctl/
 F:	package/reaver/
diff --git a/package/Config.in b/package/Config.in
index 876d7309eb..a2ee4f73e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1236,6 +1236,7 @@ menu "External python modules"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scikitlearn/Config.in"
 	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
diff --git a/package/python-scikitlearn/Config.in b/package/python-scikitlearn/Config.in
new file mode 100644
index 0000000000..1fabdf92fe
--- /dev/null
+++ b/package/python-scikitlearn/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_PYTHON_SCIKITLEARN
+	bool "python-scikitlearn"
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN # python-scipy
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # python-scipy
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_PYTHON_SCIPY # runtime
+	select BR2_PACKAGE_PYTHON_JOBLIB # runtime
+	select BR2_PACKAGE_PYTHON_THREADPOOLCTL # runtime
+	help
+	  Scikit-Learn is a Python module for machine learning
+	  built on top of Python-Scipy.
+
+	  https://scikit-learn.org/
+
+comment "python-scikitlearn needs a toolchain with fortran"
+	  depends on !BR2_TOOLCHAIN_HAS_FORTRAN
+
+comment "python-scikitlearn needs lib openblas"
+	  depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+
+comment "python-scikitlearn needs python-numpy"
+	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
diff --git a/package/python-scikitlearn/python-scikitlearn.hash b/package/python-scikitlearn/python-scikitlearn.hash
new file mode 100644
index 0000000000..e8c712761a
--- /dev/null
+++ b/package/python-scikitlearn/python-scikitlearn.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  568e621b9e1479b9ab952a9241db5af2ba3ab4f69d44b8aba3dd7648825e8e5a  python-scikitlearn-1.1.1.tar.gz
+# License files, locally calculated
+sha256  bc2e5553b31344779335ddadac8de6f9d12da6f4ce46e22a8e2820951a1d5458  COPYING
diff --git a/package/python-scikitlearn/python-scikitlearn.mk b/package/python-scikitlearn/python-scikitlearn.mk
new file mode 100644
index 0000000000..00cdcd9ac7
--- /dev/null
+++ b/package/python-scikitlearn/python-scikitlearn.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-scikitlearn
+#
+################################################################################
+
+PYTHON_SCIKITLEARN_VERSION = 1.1.1
+PYTHON_SCIKITLEARN_SITE = $(call github,scikit-learn,scikit-learn,$(PYTHON_SCIKITLEARN_VERSION))
+PYTHON_SCIKITLEARN_LICENSE = BSD-3-Clause
+PYTHON_SCIKITLEARN_LICENSE_FILES = COPYING
+PYTHON_SCIKITLEARN_SETUP_TYPE = setuptools
+PYTHON_SCIKITLEARN_DEPENDENCIES = \
+	host-python-cython \
+	host-python-scipy \
+	python-joblib \
+	python-threadpoolctl
+
+# disable test execution when cross compiling
+PYTHON_SCIKITLEARN_ENV = PYTHON_CROSSENV=1
+
+$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
