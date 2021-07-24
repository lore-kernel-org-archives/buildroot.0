Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C86C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0514960E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0514960E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D11C4401BB;
	Sat, 24 Jul 2021 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VBwoUFQtzhH; Sat, 24 Jul 2021 20:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A78400EA;
	Sat, 24 Jul 2021 20:28:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63F5B1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51C4E400EA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n43jN7OpSetE for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:28:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3570A400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:28:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z7so6097650wrn.11
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=onfVswsunDf/10+7JtQLTX1uRWViczvweZY6+9Lu0tg=;
 b=lu2TdxqFHR9MVLcaZzJ/+zpGUKvyKlBchAl1SoEZww4h7qEvkw74sFWrc+xKEzxO6F
 NPe5x3vkxMu1bcA01bu5Ww3f0rPEXkr60fed8HbDNX/cxirqjaG25v3dkM5CEtPDVHQe
 P1oZaQ7zGX8B3dmCm1SAid4Uyn9trYu5hMF9AGck75FBuplnNeAl8GAVYsAibfTIAZB9
 gPADPf+jntilW3axfZFVBwjCTr5IH2vjAFOfnQbr6I6pS9d8oYo+lODSDf/d6oWs2N71
 C+fqfSd8iI/gm2bVPfk8B9AcTxLFO8SqHUME8XN1ipF+Ka/MC0CftEe5axFm9ZppmP61
 p4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=onfVswsunDf/10+7JtQLTX1uRWViczvweZY6+9Lu0tg=;
 b=FsZ3/tWMZRFItxwnN0Y7GXFP+Ul7u4BxJfO7LXR1MkLUHIkMBEDEXytPBWBS8Bn/Fy
 cM9nQY/MRWTRbVd3PEUwYkSrfd9I7RHrGQkdTirk8sZCyshexcVOFGiYEQBzPu4iBHoD
 x5cDG3502seTZZpxm+UGWgWFvOWBHkJarHyiGsUa/1kCUqBc1qYT4NscjNtmd6xpL1hn
 vZwjwVkio9Emg+hE247TAXXbvYUmKW9XrD49eBOEZebfCnEZ3oINhPsOF6er8lc3MY5o
 FmmHP3Q0lX9zpbVhTHVN4w02oEx7mcX5xZNoV89tzbowgMNqgIYLb7a1otalC8W5pXSU
 HgZg==
X-Gm-Message-State: AOAM530pjmVE/A6q19w09Sc1m36UBSt++1HqDIhNyCv6Uju0PreH/5Jo
 F9cjIwOutD0aMVVVaeqpKJTe3YBzCKP0RQ==
X-Google-Smtp-Source: ABdhPJwQQ0n26gAPcSbzAg2ujk5pH2G0IruFlXn/DKC/pi5o777dsO870je3h72H/S4yCsiEuVFOBg==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr11350515wrq.395.1627158512670; 
 Sat, 24 Jul 2021 13:28:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id j14sm691946wru.58.2021.07.24.13.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:28:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:28:22 +0200
Message-Id: <20210724202822.746625-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: new package
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
index 0000000000..4b1a26b1d9
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
+ 	  for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915
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
