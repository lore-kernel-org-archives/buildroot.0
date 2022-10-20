Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46ACC4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 14:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47086410BC;
	Thu, 20 Oct 2022 14:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47086410BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6SaM5NbGYsv; Thu, 20 Oct 2022 14:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 643DD410BB;
	Thu, 20 Oct 2022 14:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 643DD410BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CCD21BF312
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187736FAE7
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187736FAE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2OwlFAdWPAb for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 14:14:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 007C46FACA
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 007C46FACA
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 14:14:42 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id x18so26589046ljm.1
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 07:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJOzHjPWeTUJRIypSnDZTyWWoVRfmjJY6ksyIOckLsc=;
 b=JS/16AhzEm+zKENej8vA+9zmwDCtnPrfFYyCMlc/OlAWCyfwnvCk0Jqml5Pw0O6hWZ
 +fdYjQbCZ7tPrBqq3tyRFwyWvtKp/JJmoqcrNkIU0YMhMCqHfF5dpPD2NdbNgM71POHW
 WIZKknoVqm62D1+TVvupta+6JYAsuQRRePthuP5tC04gFQzS13nt4JxvCqDpyUjCwVos
 rxWfHSQ9MdlZ7CElKYY06rBhsX2CEe0uVf6TR92+Kp48UeTmuWfDou6VoWfx672Lln9l
 6zVBrtmo7p8PtOXfrs86CWMV0GbGs/CH2eoXOnDbwYiQq6e+xb3+CCMu26x8TaLyT5/q
 9eZg==
X-Gm-Message-State: ACrzQf0qSAaT0pX0IMVWsPAZZgNzuEy34mlwEB/yh8dgbVki7tpnrWnl
 nBWKdYWzcCvmDP5GLezub7wV4VUEyiLR5Q==
X-Google-Smtp-Source: AMsMyM7aa59g/yM8UTePlLun/1Yc3cKxaRMGKTw3Ju7TDsoSq5tzb3DKUOZ+8V3zwaH/R19NiMBr9Q==
X-Received: by 2002:a05:651c:244:b0:26d:e2af:db15 with SMTP id
 x4-20020a05651c024400b0026de2afdb15mr5150669ljn.271.1666275280634; 
 Thu, 20 Oct 2022 07:14:40 -0700 (PDT)
Received: from wkz-x13.addiva.ad (a120.broadband3.quicknet.se. [46.17.184.120])
 by smtp.gmail.com with ESMTPSA id
 a3-20020ac25e63000000b0048b969ac5cdsm2739975lfr.5.2022.10.20.07.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:14:40 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 16:14:12 +0200
Message-Id: <20221020141412.346992-5-tobias@waldekranz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020141412.346992-1-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJOzHjPWeTUJRIypSnDZTyWWoVRfmjJY6ksyIOckLsc=;
 b=JZtUmLP6gzuss+vgfZQGsX9OtA/iNKW4kc6ldGMb1O92L4RkCe8DVB8UkEYuW7+fkM
 CbDGPt5uzRyNlmMUlzPBNIYCiRzdH2WkAlZcXHn8v3DLVWf5y8gyS6G+sg7VD1PU2Qrz
 Jvf1AiENx7bxZFecUNoRkI+Mh2Fn5KY/wzixnk6UJZY9hvw+VreqloicCkSo6evLjnun
 QN1J9289ukIKe9pcoP/bUfaNlJvZTjSsuJXGPpw36xo/g6zJlLlz1/CTENTqDi8N3VaY
 GhjVjLIwUFf3ZAbcHFx5G+HkazIkDZ1KAxKiIgtcKBrDoAGTVZMZWV4t596CL8ji/QI1
 jcGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=JZtUmLP6
Subject: [Buildroot] [PATCH 4/4] package/kmemd: new package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kmemd let's you inspect a live Linux kernel's memory using GDB.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 package/Config.in        |  1 +
 package/kmemd/Config.in  | 11 +++++++++++
 package/kmemd/kmemd.hash |  5 +++++
 package/kmemd/kmemd.mk   | 20 ++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/kmemd/Config.in
 create mode 100644 package/kmemd/kmemd.hash
 create mode 100644 package/kmemd/kmemd.mk

diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..ebafe11dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -111,6 +111,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
+	source "package/kmemd/Config.in"
 	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
diff --git a/package/kmemd/Config.in b/package/kmemd/Config.in
new file mode 100644
index 0000000000..2190488b0f
--- /dev/null
+++ b/package/kmemd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KMEMD
+	bool "kmemd"
+	depends on BR2_PACKAGE_LIBBPF_SUPPORTED
+	select BR2_PACKAGE_LIBBPF
+	help
+	  Explore a live Linux kernel's memory using GDB
+
+	  https://github.com/wkz/kmemd
+
+comment "kmemd needs libbpf"
+	depends on !BR2_PACKAGE_LIBBPF_SUPPORTED
diff --git a/package/kmemd/kmemd.hash b/package/kmemd/kmemd.hash
new file mode 100644
index 0000000000..60b8589dd2
--- /dev/null
+++ b/package/kmemd/kmemd.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+md5  9954bf82279eeb0da016654689f69ac2  kmemd-1.0.0.tar.gz
+sha1  3ae3bdceb70d674f41f56cd489c7497944b9b0f0  kmemd-1.0.0.tar.gz
+sha256  519ac3cdd367acee5090eec3b7e08400724f9b84486b191f3af534bd7cffca70  kmemd-1.0.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kmemd/kmemd.mk b/package/kmemd/kmemd.mk
new file mode 100644
index 0000000000..902941b981
--- /dev/null
+++ b/package/kmemd/kmemd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# kmemd
+#
+################################################################################
+
+KMEMD_VERSION = 1.0.0
+KMEMD_SITE = https://github.com/wkz/kmemd/releases/download/$(KMEMD_VERSION)
+KMEMD_LICENSE = GPL-2.0
+KMEMD_LICENSE_FILES = COPYING
+KMEMD_DEPENDENCIES = libbpf
+
+define KMEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KPROBES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
+endef
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
