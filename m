Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E07C3ABB6
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 23:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3A0540422;
	Sun, 15 Sep 2024 23:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIvPqZh7MvR2; Sun, 15 Sep 2024 23:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F784064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F784064F;
	Sun, 15 Sep 2024 23:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3E01BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 23:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B844400A4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 23:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qosjAc9E2Xi for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 23:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA5AB40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA5AB40004
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA5AB40004
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 23:55:55 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82ce1cd2026so128644639f.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 16:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726444554; x=1727049354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qK3BcMBLUcQaDJJc4TCLo3+xH7KbqFp1WeyV709mVms=;
 b=wzO3bijV+pKuMg2ryK5h/lNRoePL/xx+XSkI2M9/OtWB01+kSGGGNUJ2SAisPnOGWD
 ej1Kydjxd5ax++yQnzpT2NmmHZuI7Nd1f4Z62MCVpvVnHkAlVYY/YPxQdIV5bM4dAiLE
 hxFhbI3RrIQMNrghKQuN0bQezzR6ZQ6iujxbnyMiWdIMrRQgaqO1gvBrVzVF2MHTal6x
 4d9vPosrbcw2/mpvRq40kPstLWDbDiN6o2a0xlZgTxNxtkVvZ/ih4xJuufAjXuSbtFm3
 k6wdooi1YP2nQjT2iO2sGFw1zTpfoYVWjnzkjY1IdLq4f6iBLhBniI/ls4DQbk0rCgpF
 0GKA==
X-Gm-Message-State: AOJu0YwII49ERMoEhYgqTEB8DT1Riq0DxNy+3rhKkBITLQAj3YuAYrYF
 xETmVZg4NWUP7aWJvBa19ZSllEuAJDsDfR2UmgDkdXC5+bQio+4sEJ12Hg==
X-Google-Smtp-Source: AGHT+IHJB5ceDwnLJNF5GooGgx1GDuoCI9NYR1F1JtmXDTkFB0VfX7F+2ibS7yr2G0I9g1P2oKQXcA==
X-Received: by 2002:a05:6602:1408:b0:82c:fb31:2340 with SMTP id
 ca18e2360f4ac-82d1f8e7683mr1325883539f.7.1726444554242; 
 Sun, 15 Sep 2024 16:55:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17ea6sm1171828173.38.2024.09.15.16.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 16:55:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 17:55:51 -0600
Message-Id: <20240915235551.2114440-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726444554; x=1727049354; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qK3BcMBLUcQaDJJc4TCLo3+xH7KbqFp1WeyV709mVms=;
 b=R3Cj4uDa8m0kKDXdlMVGllo7BwwyPzxPcuNLXkdhno5v19JYs6uyCk2g4p85EDrcJH
 NN8HEAa+wl3YvVKJOogaxlVLkPUTETkaJOJRn+Q76LH35UyYZvLcPw4adFLIQTeQaHyC
 6tO3Nvuif7yJ6agTEQi3ugKgrJLFm9NIDeWhfcj0q2+birJV231Pol64N72/zyaqLNiN
 xdnxTHDrJVvRPw9cwCXaUzABD/37KnZ9ttNJjs9chFGu4KGTLLet3sqfAk3QMgTO/kgn
 KZUPkketgsybFZRyt2xrDyjgO4vIS80ZeoJr8nV2qGtpVQK9E/NbKSpWk+sJHIixfxzG
 TF7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R3Cj4uDa
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib: bump to version
 3.9.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to meson build system.

Add new python-fonttools runtime dependency.

Add new python-packaging runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-matplotlib/Config.in           |  2 ++
 .../python-matplotlib/python-matplotlib.hash  |  4 ++--
 .../python-matplotlib/python-matplotlib.mk    | 20 +++++++++----------
 package/python-matplotlib/setup.cfg           | 10 ----------
 4 files changed, 14 insertions(+), 22 deletions(-)
 delete mode 100644 package/python-matplotlib/setup.cfg

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index b3d84e2b43..13894004aa 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -13,8 +13,10 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_PYTHON_PYBIND
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PILLOW # runtime
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index c2fb907e2c..2882997b8a 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib/json
-md5  72896b8c240903ebddc47be6451d813b  matplotlib-3.8.2.tar.gz
-sha256  01a978b871b881ee76017152f1f1a0cbf6bd5f7b8ff8c96df0df1bd57d8755a1  matplotlib-3.8.2.tar.gz
+md5  bb92dfd3c1e9c816100b91008be5e300  matplotlib-3.9.2.tar.gz
+sha256  96ab43906269ca64a6366934106fa01534454a69e471b7bf3d79083981aaab92  matplotlib-3.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 5f5d53172e..7312d2b1ec 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.8.2
+PYTHON_MATPLOTLIB_VERSION = 3.9.2
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/fb/ab/38a0e94cb01dacb50f06957c2bed1c83b8f9dac6618988a37b2487862944
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/9e/d8/3d7f706c69e024d4287c1110d74f7dabac91d9843b99eadc90de9efc8869
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
@@ -19,16 +19,16 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = \
 	python-cycler \
 	python-pybind \
 	qhull
-PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
-PYTHON_MATPLOTLIB_BUILD_OPTS = --skip-dependency-check
+PYTHON_MATPLOTLIB_CONF_OPTS = \
+	-Dmacosx=false \
+	-Dsystem-freetype=true \
+	-Dsystem-qhull=true
+PYTHON_MATPLOTLIB_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
 ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
 PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
 endif
 
-define PYTHON_MATPLOTLIB_COPY_SETUP_CFG
-	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/mplsetup.cfg
-endef
-PYTHON_MATPLOTLIB_PRE_CONFIGURE_HOOKS += PYTHON_MATPLOTLIB_COPY_SETUP_CFG
-
-$(eval $(python-package))
+$(eval $(meson-package))
diff --git a/package/python-matplotlib/setup.cfg b/package/python-matplotlib/setup.cfg
deleted file mode 100644
index 4bda0d4376..0000000000
--- a/package/python-matplotlib/setup.cfg
+++ /dev/null
@@ -1,10 +0,0 @@
-[libs]
-# Disable LTO to prevent the following error:
-# Relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZSt3hexRSt8ios_base'
-# which may bind externally can not be used when making a shared object;
-# recompile with -fPIC
-enable_lto = False
-
-# Freetype and qhull are provided by Buildroot
-system_freetype = True
-system_qhull = True
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
