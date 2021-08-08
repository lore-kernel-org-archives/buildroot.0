Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A507C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:09:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA77F60FF2
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA77F60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65E894016B;
	Sun,  8 Aug 2021 10:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4I9jCnyA9eh; Sun,  8 Aug 2021 10:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C794023F;
	Sun,  8 Aug 2021 10:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3D41BF38E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157D44023F
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uftXGI74ZFn9 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 10:09:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A60184016B
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 10:09:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id l20so19980273iom.4
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 03:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bu3hvypJAS1IJ/tOdC2skXiBTjp3GvKJdIhuX8p5nmM=;
 b=jk788Y/mCs7tUg2Awa59Wm87eTVrxFbJeuJqKeXO7n5iS6xg+yfC4tLiYJLSoAZYr3
 G6uY4Rk7/mNNRrzY3mIln3c8uGnSTuOICenuqkqPLJywvA0RxG7A2zYFCoLGTpmszKu2
 QDjBwUCTvVeMCnCi5d2woVgPfhT4red9GMXe2PbKijMZEvy6cbsGdc0fCGthULiwhHUq
 g3egWWvl7bZfjMMXB/yddDGcPRzpqGI51jk12wR0qdjgxflRRt7mowpny8t8YlEKGVSe
 JtQt/mqdrdbeem8zzNgLp1buxVMKTm9W+LSWieVr7fsFNQWYv262v0xRCMdHaveInwIm
 7iVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bu3hvypJAS1IJ/tOdC2skXiBTjp3GvKJdIhuX8p5nmM=;
 b=mu3LxjHcIrh+e8hS8FoWe7GepGOU3a+jNtqrEsqq2s5IsDPwo9H1DvUXLdrCfFAiWw
 Q3AMRFE5qKh8c7kOU5OQ68tTPbnmCS2gfAuclxGrrVwh7fmF5Q15Ol8F3i4t5W+NIzDJ
 c5i3oThYzG1ZwLoQPqYP49K4kRM/IdMnxL0C0w4K2+4gX/GSrDu1sFFjW2S5Rys1deRA
 XTKWbMy/Q0pVft3wU7j9P3/FUwZTjzQEJ5OZdtWUeOeNGvjdCIeG4SGR1y2gxpAKZHrf
 JaTtXcmUlv/f00IhagnaPw/L/+Fi8kNM9udYegMfulwsJDigLJQkhQt3HLWCceh0cQg5
 Lnpw==
X-Gm-Message-State: AOAM532fi2+uUo7h7ZKhJsVVqmLbaSZKj/1l+Uie1dElxY5HTPv/0BH4
 hB1L5gECsksWWmS5ZPblejIDp7g+jQ8=
X-Google-Smtp-Source: ABdhPJwGclOZWIqz3sm66Qi0zMDjBCFYvGjeLJ2JvcCuwp4aA3e8i/AuP3xEWt10hhTTgzgYD7finQ==
X-Received: by 2002:a05:6e02:b4b:: with SMTP id
 f11mr105655ilu.130.1628417364487; 
 Sun, 08 Aug 2021 03:09:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id 11sm7703513iln.85.2021.08.08.03.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 03:09:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 04:09:21 -0600
Message-Id: <20210808100921.3415231-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 21.3.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Strip xbr contracts which are used only for the xbr feature which is
entirely unsupported by buildroot.

Add patch to fix some xbr assets getting accidentially included.

Enable the optimized nvx cffi extension module.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...r-packages-and-xbr-templates-package.patch | 54 +++++++++++++++++++
 package/python-autobahn/Config.in             |  1 +
 package/python-autobahn/python-autobahn.hash  |  4 +-
 package/python-autobahn/python-autobahn.mk    |  6 ++-
 4 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch

diff --git a/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch b/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
new file mode 100644
index 0000000000..f239345dc7
--- /dev/null
+++ b/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
@@ -0,0 +1,54 @@
+From b13b7e38b38e2c79c0a13be32e05f0451483cd01 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 12 Jun 2021 15:32:37 -0600
+Subject: [PATCH] Fix duplicate xbr packages and xbr templates package_data.
+ (#1492)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+a370f9e7154e59b313cb675bfcaf8cad6011bd52]
+---
+ MANIFEST.in |  1 -
+ setup.py    | 10 ++++++++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/MANIFEST.in b/MANIFEST.in
+index f4cb6da1..1dd32f0e 100644
+--- a/MANIFEST.in
++++ b/MANIFEST.in
+@@ -1,4 +1,3 @@
+ include LICENSE
+ include autobahn/nvx/_utf8validator.c
+ recursive-include autobahn/wamp/gen/schema *
+-recursive-include autobahn/xbr/templates *
+diff --git a/setup.py b/setup.py
+index cf4e29ba..f27006da 100644
+--- a/setup.py
++++ b/setup.py
+@@ -166,6 +166,12 @@ packages = [
+     'twisted.plugins',
+ ]
+ 
++xbr_packages = [
++    'autobahn.xbr',
++    'autobahn.asyncio.xbr',
++    'autobahn.twisted.xbr',
++]
++
+ package_data = {'autobahn.asyncio': ['./test/*']}
+ 
+ entry_points = {
+@@ -179,8 +185,8 @@ if 'AUTOBAHN_STRIP_XBR' in os.environ:
+     shutil.rmtree('autobahn.egg-info', ignore_errors=True)
+ else:
+     extras_require_all += extras_require_xbr
+-    packages += ['autobahn.xbr', 'autobahn.asyncio.xbr', 'autobahn.twisted.xbr']
+-    package_data['xbr'] = ['./xbr/contracts/*.json']
++    packages += xbr_packages
++    package_data['xbr'] = ['./xbr/templates/*.py.jinja2']
+     entry_points['console_scripts'] += ["xbrnetwork = autobahn.xbr._cli:_main"]
+ 
+ # development dependencies
+-- 
+2.25.1
+
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 78b16897bc..d2dc10f354 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
 	help
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index a5aa2a5a7d..7de1e7e673 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  dcae3cf26203aa4bbd9912137e5c9512  autobahn-20.4.3.tar.gz
-sha256  c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f  autobahn-20.4.3.tar.gz
+md5  dcba839ee61be33d05042a09c008c6bc  autobahn-21.3.1.tar.gz
+sha256  e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03  autobahn-21.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 81e2b7a4ca..ecb04e0e8f 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.4.3
+PYTHON_AUTOBAHN_VERSION = 21.3.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/cb/16/38d27874ef827974f44acb6dd64a92a9248b624734c0e84b91083c2d9350
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/4c/9e/f5bdfb55d1eab67c4b6d24d1397f95feec792071ff1b2f5a893d6d5247f3
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
 PYTHON_AUTOBAHN_CPE_ID_PRODUCT = autobahn
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
+PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi
+PYTHON_AUTOBAHN_ENV = AUTOBAHN_USE_NVX=1 AUTOBAHN_STRIP_XBR=1
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
