Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D44DD5D683
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95A284367;
	Thu,  7 Nov 2024 19:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfR2wg7e_3-2; Thu,  7 Nov 2024 19:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE28C84370
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE28C84370;
	Thu,  7 Nov 2024 19:18:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A27C0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0234961153
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTDQmQPZj0LS for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 19:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1F00610FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F00610FE
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1F00610FE
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:08 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83aae6aba1aso49885139f.2
 for <buildroot@buildroot.org>; Thu, 07 Nov 2024 11:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731007087; x=1731611887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zM9t/VnpApDt+lLSlsR/BBGi5z11GfUyukR0JXhsNso=;
 b=olr9vGESzxUtB150ba+0BKELv9o2wLb5MPfi7awBu0VMvWdK+I/2uMofA+QhDyrd4D
 6RY1A17gbrNvIo8Yyn5Jzw3cCch2/B6kmXHz/0bNX1Mve+oZAmkr8O2SjorPQRejW+TW
 XXBfT6SEXNU9xphWWyGkwEMBCRGsi6cUk7M4i+cttaeBm4Ft1P6sxLsH6rierxDAIzwn
 4Dm+DX2GgFUlMV16WbFf2DGh936gjdnRill1anHLe8MpTI6d5r5mI+7s6JreBIpP/Pte
 kVkdgMlK9NjbwRnbCzgeCZzxoOPR4pqPGGLs888GmYqxVDLfzpoNvjSzbDsLMDvGzZNc
 z9bw==
X-Gm-Message-State: AOJu0Yyv78HfGZJvVnb3zK52JPocrz65ItOGG0U5Wkvgu02hlmYWAHwy
 oEgj91K7rji4B8Sda04E2LHn+5cvvkVBSoIxhXk0ZuzOKojfdFGV9zO8qg==
X-Google-Smtp-Source: AGHT+IFB4ClfjctzLS9TF0gkzWseLyrirc/gWBDuPHIdhIuuNTfajqPvqWShc88RBYY0bi2h6dk/GA==
X-Received: by 2002:a05:6602:6b08:b0:83a:a82b:f855 with SMTP id
 ca18e2360f4ac-83e032e05aamr1962539f.9.1731007087539; 
 Thu, 07 Nov 2024 11:18:07 -0800 (PST)
Received: from james-x399.localdomain (97-118-149-1.hlrn.qwest.net.
 [97.118.149.1]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de5f8cdd00sm441546173.108.2024.11.07.11.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 11:18:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Nov 2024 12:16:31 -0700
Message-Id: <20241107191634.378670-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731007087; x=1731611887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zM9t/VnpApDt+lLSlsR/BBGi5z11GfUyukR0JXhsNso=;
 b=dBbQeCryBMVEUqn1MHAbmIF576ucah6fTK1PfFr4yB+2YebLk/kLIJomCcb2qfgqf2
 E5jmoWojtgjCiJvLvbann0/3gUYW0U/KePiaBCyv2RCsLm3WkjKSMdAPja9k5LXr1MQ1
 1JEyXwHSfryWdm4+j1h3EL3TeI1wqPjo57goI3BMVRhSI+WiM979bIR7oGtoYq2xlELM
 O/fx3cjoPodzE9Otedyz4g0CTf855igQn8nye18wfX/u6NzcKeoybtee0vZ8IVfHJ+mK
 yGQxCi2ktenr6M70aTVmZ10qCGSx/ctYPPWLgItbdPIr+FoRBtBL52U4kn988BGLqMsn
 M8cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dBbQeCry
Subject: [Buildroot] [PATCH v5 1/4] package/kismet: bump to version
 52bcb902e36b2df1562cfbe644b113362248d029
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to use the latest git commit as the last release does not
support compiling with the newer protobuf releases.

Add optional mosquito support.

Add librtlsdr mosquito support.

Fix python-setuptools dependency which should be
host-python-setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/kismet/Config.in   |  1 -
 package/kismet/kismet.hash |  2 +-
 package/kismet/kismet.mk   | 21 +++++++++++++++++----
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 2e1e0cfbd0..aa05e045d5 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -42,7 +42,6 @@ config BR2_PACKAGE_KISMET_PYTHON_TOOLS
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime for RTLAMR and RTLADSB
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime for Freaklabs Zigbee
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	help
 	  Enable Python and Python-related tools (RTL_433, RTLAMR,
 	  RTLADSB and Freaklabs Zigbee)
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 543515858e..2d05a6791b 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f08548e26ca65fa1e567b1debbea1ca4d0e7206bddb96a4f639c90171873e8f7  kismet-2023-07-R1.tar.xz
+sha256  2dccf9b5bbf5f4e6b04a44bf8cfecf80db8dcfa52a8183dd1166396c3ca04660  kismet-52bcb902e36b2df1562cfbe644b113362248d029.tar.gz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index c448233d60..f182fbe328 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2023-07-R1
-KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
-KISMET_SITE = http://www.kismetwireless.net/code
+KISMET_VERSION = 52bcb902e36b2df1562cfbe644b113362248d029
+KISMET_SITE = $(call github,kismetwireless,kismet,$(KISMET_VERSION))
 KISMET_DEPENDENCIES = \
 	host-pkgconf \
 	libpcap \
@@ -37,6 +36,13 @@ else
 KISMET_CONF_OPTS += --disable-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+KISMET_DEPENDENCIES += librtlsdr
+KISMET_CONF_OPTS += --enable-librtlsdr
+else
+KISMET_CONF_OPTS += --disable-librtlsdr
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 KISMET_DEPENDENCIES += libusb
 KISMET_CONF_OPTS += --enable-libusb
@@ -58,6 +64,13 @@ else
 KISMET_CONF_OPTS += --disable-lmsensors
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO),y)
+KISMET_DEPENDENCIES += mosquitto
+KISMET_CONF_OPTS += --enable-mosquitto
+else
+KISMET_CONF_OPTS += --disable-mosquitto
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 KISMET_DEPENDENCIES += pcre2
 KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
@@ -69,7 +82,7 @@ KISMET_CONF_OPTS += --disable-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_KISMET_PYTHON_TOOLS),y)
-KISMET_DEPENDENCIES += python3 python-setuptools
+KISMET_DEPENDENCIES += python3 host-python-setuptools
 KISMET_CONF_OPTS += \
 	--enable-python-tools \
 	--with-python-interpreter=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
