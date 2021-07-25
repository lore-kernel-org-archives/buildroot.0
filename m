Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0219C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC1360BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BC1360BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4691283231;
	Sun, 25 Jul 2021 12:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVZ3g6sYSiDn; Sun, 25 Jul 2021 12:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7FA83168;
	Sun, 25 Jul 2021 12:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61E841BF470
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E9CA60688
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6krvvRd8f11 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C88360682
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o1so7623743wrp.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W1IyQ1hpX6QJni0HUtS1EapeC/IZORSeuvD94XEXWjY=;
 b=ANFBclHwnX2HC1n7mGoMq4cE2I458g8dbxrqDc5ZSZYzYiSk9vans7Kpx4rNeLxYlq
 RKK04OUuCJBzbxLs+0CAmyUkfselSQ3x+IvrgWS0xpWqB1uhthSPX+fUG79yURFISrPR
 ARlZppMf+r1jpAaRPOlbj/FJFTcvmt1G5RNypReL6bjESFlrtVwo9hQvkyqidq6nCVpw
 uU5GvYMQuJTdQgw6l4Fz8jzcmNMVX97R6GQVO+SsJl0BZXJ5FgsmqaVqF6mRUC5DMKzz
 24BtbzkWv4Gy2uTJnjZbEAUO2dwf2+THBwdxVNE4EPa604l77uSGrbkjlp1aAuTOWkwB
 XkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W1IyQ1hpX6QJni0HUtS1EapeC/IZORSeuvD94XEXWjY=;
 b=sp+rBxTHodzNNT3sMFL+KU64BKBoB0AwsLMWg5FSMH84qGS9CNlJjl84AOPRgk4B8u
 O8Ucwe0G1avqAscxl3o1iFUkcco1djfn45pfsyaU2X17F8UHSzPZDb/dc4ry6gOBTaPQ
 tRwhvab5MaMsM12mVUat1oflDVHAkW8F2Yin+eU+LKSPZZjSSErE6aid1UZmrrRmU0rC
 XYbD0n9QKadEywI4VKVIiu9H89bWJgtHjMsOu1AgLXe3/l7vA1c+jkYbbcmeF/uFsHF5
 FYewnEdG0iH3Z2G8qy0x5jzLTG7uTAGgFWpZT/W9NBTYiD4t2vbMrYhYo5dPOQQpCeD+
 1Krg==
X-Gm-Message-State: AOAM530pBnewO6/dvfgNvFztJV7U7ruDQm5Mw4uo8jTBMHuLpQQfX08G
 FvRgmfFYYtqMOxz/pe6rD1qba508W1j9Qw==
X-Google-Smtp-Source: ABdhPJyCsiC8bQN0xSW8QfP2SEv8CdPe0BZSTdf6Qn0KCW3x1tSNzPP99sjqWSgg9+JMrI1lISK1pw==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr8260684wrp.101.1627217918337; 
 Sun, 25 Jul 2021 05:58:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id k7sm10349590wms.48.2021.07.25.05.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:58:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:58:31 +0200
Message-Id: <20210725125831.900781-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/rtl_433: new package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

rtl_433 (despite the name) is a generic data receiver, mainly for the
433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz ISM bands.

https://github.com/merbanan/rtl_433

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix indentation in Config.in

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/rtl_433/Config.in    | 16 ++++++++++++++++
 package/rtl_433/rtl_433.hash |  4 ++++
 package/rtl_433/rtl_433.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/rtl_433/Config.in
 create mode 100644 package/rtl_433/rtl_433.hash
 create mode 100644 package/rtl_433/rtl_433.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 76dcafd0dd..9799e060e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -914,6 +914,7 @@ F:	package/python-jedi/
 F:	package/python-parso/
 F:	package/python-yatl/
 F:	package/rocksdb/
+F:	package/rtl_433/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/snort3/
diff --git a/package/Config.in b/package/Config.in
index b9d0414385..7a713049e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2071,6 +2071,7 @@ menu "Miscellaneous"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
+	source "package/rtl_433/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
diff --git a/package/rtl_433/Config.in b/package/rtl_433/Config.in
new file mode 100644
index 0000000000..5664227c82
--- /dev/null
+++ b/package/rtl_433/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_RTL_433
+	bool "rtl_433"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
+	help
+	  rtl_433 (despite the name) is a generic data receiver, mainly
+	  for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915
+	  MHz ISM bands.
+
+	  https://github.com/merbanan/rtl_433
+
+comment "rtl_433 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
new file mode 100644
index 0000000000..9ace444b78
--- /dev/null
+++ b/package/rtl_433/rtl_433.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  d8b87535b4e65264018771b6b288259d81137482fc938d01e0c03ac071c03bd5  rtl_433-21.05.tar.gz
+# License file, locally calculated
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
new file mode 100644
index 0000000000..fc32aa679b
--- /dev/null
+++ b/package/rtl_433/rtl_433.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rtl_433
+#
+################################################################################
+
+RTL_433_VERSION = 21.05
+RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
+RTL_433_LICENSE = GPL-2.0+
+RTL_433_LICENSE_FILES = COPYING
+RTL_433_CONF_OPTS = -DENABLE_SOAPYSDR=OFF
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+RTL_433_DEPENDENCIES += librtlsdr
+RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
+else
+RTL_433_CONF_OPTS += -DENABLE_RTLSDR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RTL_433_DEPENDENCIES += openssl
+RTL_433_CONF_OPTS += -DENABLE_OPENSSL=ON
+else
+RTL_433_CONF_OPTS += -DENABLE_OPENSSL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
