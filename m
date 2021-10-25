Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23B0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:42:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F13760F9B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F13760F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30086400F1;
	Mon, 25 Oct 2021 02:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skIFY_wAXoNj; Mon, 25 Oct 2021 02:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32CDB400F3;
	Mon, 25 Oct 2021 02:42:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C87D61BF378
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C8A80D8D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srO99t4xfEhn for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 02:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA8B780D88
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:42:38 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id 3so8737640ilq.7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO6Bki7V2sX1jFhXJqDV6tKsh9rAUqx6SHTiJAEG0Ew=;
 b=YzOYV/QxVL/SJow+ig03caI0+UYVeN2nGZC8uIVdOJ99fdLSDbNO1x5VtFYqZviOX8
 i+KS5DtRPALzBo0SI6XhcuES6DrgeA6wnEyvnIGIMmoIasrtiBSferO8LXxVDpchLK4D
 hXW8gq8g63dIUoN6d1FBuNnPUjwHjS+k254q2OoO2W9VNwftZJ+crVFkmmHZyGj1tplM
 mlq6byMhRqNQ4GyikCfT9p3nB+QvcBrLPeMLbZ8cgXppI0WtfDHU3yzwXNqSzY1zrQ2y
 U/iBJdl04mCQlNjz5vvOSPKdPmgMFFZpibljHzCo4+Z95Ul9zlvSR0x3FRSWgslkFmRf
 +UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO6Bki7V2sX1jFhXJqDV6tKsh9rAUqx6SHTiJAEG0Ew=;
 b=OqGdlB/+V4wTljdFBg9r4R8p/Fd45naVj8dsj/czNcM9t3XUYwC09DsgVOPyky2tEU
 hlj4HO4olW9EGE33/88dpumEbeOrzW3Ihvgy2rNXFlMgF6ohyqovXgM3N2vTCNvhSH5m
 1Fasdpmdl1N0MIovWbOq9zruIB+4jSVTqVdCI1c2+0BusVPpTLF3FkI7Gdhx3ddrootR
 I+7LgG9IbgzR1VBd4V49JLZao5V2Wk6EoH4SinHLGaMzUtZvnuABrCv9Iioi874Dj015
 KbuJShDHradFlsOH4UFbgFXkp9cLpMq9m+pEGzUdw5Ebx5zXYgEc9jGUgX9wmUq5kml9
 CQ1w==
X-Gm-Message-State: AOAM5306GnyaA2rdrxikh6pJ9+qX8osj7r4Lg1Zwl2QZic6flWmbAT9Q
 LLi5jZV+fXbNuiW36SKGQhVBQOz52t4=
X-Google-Smtp-Source: ABdhPJxi9BsLfhL/7p86euCT1HTXlXLQV+0TzzbKz2nEm4fLZtTvEZTGRhj4xTeIE1PVhByAVq92lg==
X-Received: by 2002:a05:6e02:12cc:: with SMTP id
 i12mr8492044ilm.322.1635129757610; 
 Sun, 24 Oct 2021 19:42:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id k7sm2256431iob.7.2021.10.24.19.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 19:42:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:42:32 -0600
Message-Id: <20211025024233.2153770-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-charset-normalizer: new
 package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-charset-normalizer/Config.in        |  8 ++++++++
 .../python-charset-normalizer.hash                 |  5 +++++
 .../python-charset-normalizer.mk                   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-charset-normalizer/Config.in
 create mode 100644 package/python-charset-normalizer/python-charset-normalizer.hash
 create mode 100644 package/python-charset-normalizer/python-charset-normalizer.mk

diff --git a/package/Config.in b/package/Config.in
index d40eb9dabc..e23feb49aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -950,6 +950,7 @@ menu "External python modules"
 	source "package/python-channels-redis/Config.in"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
+	source "package/python-charset-normalizer/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
diff --git a/package/python-charset-normalizer/Config.in b/package/python-charset-normalizer/Config.in
new file mode 100644
index 0000000000..c4c40fc99b
--- /dev/null
+++ b/package/python-charset-normalizer/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER
+	bool "python-charset-normalizer"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  The Real First Universal Charset Detector. Open, modern and
+	  actively maintained alternative to Chardet.
+
+	  https://github.com/ousret/charset_normalizer
diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
new file mode 100644
index 0000000000..f506fa85ed
--- /dev/null
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
+md5  b28e4463613ff3911d5a2dc62b96233f  charset-normalizer-2.0.7.tar.gz
+sha256  e019de665e2bcf9c2b64e2e5aa025fa991da8720daa3c1138cadd2fd1856aed0  charset-normalizer-2.0.7.tar.gz
+# Locally computed sha256 checksums
+sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
new file mode 100644
index 0000000000..e1b805fbfb
--- /dev/null
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-charset-normalizer
+#
+################################################################################
+
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.7
+PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/334c019f92c26e59637bb42bd14a190428874b2b2de75a355da394cf16c1
+PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
+PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
+PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
