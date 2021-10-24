Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA34C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 11:36:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D53C60D43
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 11:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D53C60D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D5D340135;
	Sun, 24 Oct 2021 11:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbcv9jtEmoqg; Sun, 24 Oct 2021 11:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA2BA401FB;
	Sun, 24 Oct 2021 11:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAA31BF406
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 11:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AF8B40300
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 11:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpyZTv5X7-CQ for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 11:36:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CED8402FF
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:36:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w19so15459752edd.2
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnVmVd/STV9PD7vN5i7ppd1KHLrlDg6MWq3Z6qDC3j4=;
 b=TOwZ3wZvKEud5LkYcT0yGEslvAEEzTNueie5JqWBvztcxKbEhCvrmtET0SIeRzdmqa
 aLtwJbxXJT94ktinwYbxoVSyTk4vwebTrgjddeBjy9P7wtMOzFZViglQMK3wJcuP/lYd
 L/sSzycNHPqvMKYxkr5I21qIJYAlQMazb2ymwOg/ct6MkhV6wV9Nr/jLblrMVx6l2gWQ
 gRPR3XV3ZwClR2MTTbZADK3DSolzSPCsDlaYLsB+sVPV/s24IADVHctqp2XXPRWptE+W
 +L09d9Zp1aLfapREJizMDjv+uJXhcKAXTmg5WGoKQt87A0I9safM+lkrRRWoYvTDiYsc
 a3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnVmVd/STV9PD7vN5i7ppd1KHLrlDg6MWq3Z6qDC3j4=;
 b=lGfh5ojK6NBpFs9OZ6lh11ALNHAuyFodRGeYbcv2ESxcDnMNMVEkksE8I9EsSN9jSf
 UKOM+qBpO8cFyu+wO2mlO8pBrJcprOrv0Bzj/+4O4Ror05uQjFn4LZbVCJJ0oVn2CpwH
 DjlLowmuSG+8vmU6kOYbhprEVK2nbMfSYFxTm2bF5Yfy3DMkYAKjKo8lr1x3ehfJxuM2
 DlBKJrVZbEG9ECS2HPPClEHmxxaPzrq4YcBR/WK07rPVCdiTVwMAOCBYlLH/KArW6J/u
 fVXeSJ2LPs67z8exUc1rCwBx0kKzJGRoe2r1n7Xp0SiEWi8l8L4iRQz+XoRGDw/+0kfI
 SQBw==
X-Gm-Message-State: AOAM533itK6Bx2ELBYwll9JQ7TYXxLzbJtC0VDpTI32dQjLEk9WgHzwT
 4LO0EDzaRtyoNpbh1SBoO968v+8nfWg=
X-Google-Smtp-Source: ABdhPJz5KyVkdWQPGdmjBNnVx75ksTsUUAnAEibFhYRdaYCh1CdmOwM1hazFouC81mtche3UOR5Ktw==
X-Received: by 2002:a17:906:a182:: with SMTP id
 s2mr14435336ejy.176.1635075398901; 
 Sun, 24 Oct 2021 04:36:38 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id n23sm2989719edr.58.2021.10.24.04.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 04:36:38 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 13:36:26 +0200
Message-Id: <20211024113626.88663-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/hawktracer: new package
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

HawkTracer is a highly portable, low-overhead, configurable profiling tool

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes v1 -> v2:
- Added C++ support (Heiko Thiery's review)
- Bumped to latest upstream revision
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/hawktracer/Config.in       | 25 +++++++++++++++++
 package/hawktracer/hawktracer.hash |  3 ++
 package/hawktracer/hawktracer.mk   | 44 ++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/hawktracer/Config.in
 create mode 100644 package/hawktracer/hawktracer.hash
 create mode 100644 package/hawktracer/hawktracer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f864f7ef47..4abda3685c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1036,6 +1036,7 @@ F:	configs/freescale_imx8mmevk_defconfig
 F:	package/cctz/
 F:	package/faad2/
 F:	package/fdk-aac/
+F:	package/hawktracer/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index d40eb9dabc..dc7bbf52b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1694,6 +1694,7 @@ endmenu
 
 menu "Logging"
 	source "package/glog/Config.in"
+	source "package/hawktracer/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
new file mode 100644
index 0000000000..456c2867bf
--- /dev/null
+++ b/package/hawktracer/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_HAWKTRACER
+	bool "hawktracer"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  HawkTracer is a highly portable, low-overhead, configurable
+	  profiling tool built in Amazon Video for getting performance
+	  metrics from low-end devices.
+
+	  https://www.hawktracer.org/
+
+if BR2_PACKAGE_HAWKTRACER
+
+config BR2_PACKAGE_HAWKTRACER_TCP_LISTENER
+	bool "Enable hawktracer TCP listener"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+comment "Hawktracer TCP listener feature needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
+
+comment "hawktracer needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
new file mode 100644
index 0000000000..87aa67c4b6
--- /dev/null
+++ b/package/hawktracer/hawktracer.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  b6c7fdfbe8178bc7ba49ef840ec18a92d1488ad73ac9f64d2a09042410ad3ef4  hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8.tar.gz
+sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
new file mode 100644
index 0000000000..f4654b2274
--- /dev/null
+++ b/package/hawktracer/hawktracer.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# hawktracer
+#
+################################################################################
+
+HAWKTRACER_VERSION = e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8
+HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
+HAWKTRACER_LICENSE = MIT
+HAWKTRACER_LICENSE_FILES = LICENSE
+HAWKTRACER_INSTALL_STAGING = YES
+
+HAWKTRACER_CONF_OPTS = \
+	-DENABLE_ASAN=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_CODE_COVERAGE=OFF \
+	-DENABLE_BENCHMARKS=OFF \
+	-DENABLE_DOC=OFF \
+	-DENABLE_PYTHON_BINDINGS=OFF \
+	-DENABLE_MAINTAINER_MODE=OFF \
+	-DENABLE_RELEASE_MODE=OFF \
+	-DENABLE_CLIENT=OFF \
+	-DENABLE_EXAMPLES=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=ON
+else
+HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_HAWKTRACER_TCP_LISTENER),y)
+HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=ON
+else
+HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=OFF
+endif
+
+# Enable threads support if supported by toolchain
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=ON
+else
+HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
