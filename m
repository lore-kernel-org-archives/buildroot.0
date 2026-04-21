Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB02EF94CB1
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E74842110;
	Tue, 21 Apr 2026 20:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxx5QXMCY2km; Tue, 21 Apr 2026 20:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771B542111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776804534;
	bh=YY9RAvnCYvBAjx8hTfKU6s6j0mQOA0CKRxbvOECWi7U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ihsCNXwmewOtWFVJz/nGZXdBrjQDphj2k7tN4AVd7N6bR88CFLEAAd3X2EMBGfvhX
	 rspBU6yPdOXGJyg4tIb7WRRapM+X0MpJ8bF1lTTjRob1nRi9W2rXIEo0PhsLHV7vlQ
	 FAApj79bZ3OrRfqcNc1S1E3fweRtPIb1iY826nszdq14uqIleYLigr7TRkdLNKAtQj
	 dgUHPpc6CZLvnlC+tPxtSd7jRQ4LInCfKwxLeliyru/lnRAx6DVR4pVQG/Ss8lAiSZ
	 OyHmJnM//NaWkVaDr6MySzvE4nSu/m+0u8jS6WbhEjxfOfjCvrhXEijcVMggvENEn6
	 5xdjqTyvUtQHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771B542111;
	Tue, 21 Apr 2026 20:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 580CD257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4973F420CF
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8TbYYkVTE2E for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com;
 envelope-from=hellohacker.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B180420CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B180420CD
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B180420CD
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:48:52 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8aca450026bso3399316d6.0
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 13:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776804531; x=1777409331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fy1BKehkORVj5LUFUyJhPSPCWPu+ByiM2liWnK5gFsI=;
 b=mr7QeHWrUf7u7n377q/cndv6h6Q8FKu8XRcheW3cNaq45sVZkxRCWwYubVF0sfn/Xl
 ZTww6SouMhqYEQuhfrYlugFmbubxpbTeKiYjYDnndTvAwOJSCM/6YbZCffOqwx5UKh2P
 fStNzmh4vk0aiz07OEzEfmfg4ZOCNX3wspjXvB9tvndfrbtKWBnjGaRk5Xk0lPZtE1gY
 6PuM9vkzNdzGV1swYXyBq1k6shEQ/yZE5lfE4WQLuNF1RIbBvex7Mq6HMi5cTbf+aO71
 /fm/g6nAM/jwcWdeBbtLo+aukp7SUwV6vCPmy5Jnn5Yr9kfZkKbjQIsjMbAoysF2JaWl
 +ETg==
X-Gm-Message-State: AOJu0Yx436OGDs2hONKkTahYv0EkSvFISgfUuNc6RLm7b26vrjL29KSs
 t+3LG86TDZsFLkokwQ7NvV8BReXkg/OlmyQO3jp6YQliaNMDiXqaKPw4m00UFtY8gvbtRA==
X-Gm-Gg: AeBDievIBTByEpB4l/SYPfFycMzPqLnvWhp5cwt6ThxfRcksPDazFPNQrjjt+hpzdRg
 dzwt9IWcxRNq96vrz2287fovk2muxVe17lJbeLgvAAHFjsi60Ggp+ahTH7xZWOB/D8wIRT/mtnX
 iwx0J/XqXUqBQesiA6rO01hj/mqq8FPBPcqBeuU+B2WleTBrIsIMICfpj39ITasyqmJQjKehcKu
 ZRRrbhckq8bECcKFAw2dZuV7tPRf1ruQHdR196NTcaFzMPRIMe3Ro6SpCgCxJmGiUivWUAyerfk
 Y23uaYoRPxvW4W3iXoQ/A3H2vjJTExLf0VNErqK3LsZT3hGDgraA9lOSAN9znkDFBuL/iYNCiB3
 MdTVEjZxmtMEm3mRE4BjJbsSmwSg4Kh5Taq6i1b+n29duX3aRirfjIdsZL+vJfXYGWdEN31C1gE
 Sfa2JLiazn1/dQh6p+hdAuahXOr34nhXdpvcn8p8g=
X-Received: by 2002:ad4:4eef:0:b0:89c:c7ee:fe96 with SMTP id
 6a1803df08f44-8b028191923mr229828416d6.8.1776804530792; 
 Tue, 21 Apr 2026 13:48:50 -0700 (PDT)
Received: from precialexwin ([76.65.67.233]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02aa4f1f9sm111942096d6.0.2026.04.21.13.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 13:48:50 -0700 (PDT)
From: Alexandre Ondet <hellohacker.dev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 16:48:27 -0400
Message-ID: <20260421204827.2225-1-hellohacker.dev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776804531; x=1777409331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fy1BKehkORVj5LUFUyJhPSPCWPu+ByiM2liWnK5gFsI=;
 b=h25l0nOBd71w17QmhDJAgU/LTsQ8F4yQCJN1o4EF/3PGOHrXFQGtZZdtv/bE2wf6RL
 79fsdCQOYI9wHwPIdJipDK57PQAiZsSf0GOMARhGs2K5kf4zl2TkZfeuUwzy6vVMj1Rg
 ipv6VvOcyXQaOT8iPUv3sQ6tbzawAC+SG4rYOBlq4UOS4bst238OBHHXkY3bKoHZW/Xs
 dGMRULplLQNpWxTcAvdYZzAum1r8y3c6b54+Wbm65Swg30bgWmTmrXz6SoC05gzh0f0e
 iZSfpffPux8CoEaeMkqid2v/qu78WxilkfnrmyhERkSdmOScB3UfABDnPUAFEf6ciG6G
 3olA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=h25l0nOB
Subject: [Buildroot] [PATCH 1/2] package/python-deprecation: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Alexandre Ondet <hellohacker.dev@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <hellohacker.dev@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-deprecation/Config.in               |  5 +++++
 package/python-deprecation/python-deprecation.hash |  2 ++
 package/python-deprecation/python-deprecation.mk   | 14 ++++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/python-deprecation/Config.in
 create mode 100644 package/python-deprecation/python-deprecation.hash
 create mode 100644 package/python-deprecation/python-deprecation.mk

diff --git a/package/Config.in b/package/Config.in
index d0f148699b..a2bd4a2e4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1077,6 +1077,7 @@ menu "External python modules"
 	source "package/python-dbus-fast/Config.in"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
+	source "package/python-deprecation/Config.in"
 	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
diff --git a/package/python-deprecation/Config.in b/package/python-deprecation/Config.in
new file mode 100644
index 0000000000..83bf414bd5
--- /dev/null
+++ b/package/python-deprecation/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PYTHON_DEPRECATION
+	bool "python-deprecation"
+	help
+	  A library to handle automated deprecations in Python.
+	  https://pypi.org/project/deprecation/
diff --git a/package/python-deprecation/python-deprecation.hash b/package/python-deprecation/python-deprecation.hash
new file mode 100644
index 0000000000..027dfafa4e
--- /dev/null
+++ b/package/python-deprecation/python-deprecation.hash
@@ -0,0 +1,2 @@
+# From https://pypi.org/pypi/deprecation/2.1.0/json
+sha256  72b3bde64e5d778694b0cf68178aed03d15e15477116add3fb773e581f9518ff  deprecation-2.1.0.tar.gz
diff --git a/package/python-deprecation/python-deprecation.mk b/package/python-deprecation/python-deprecation.mk
new file mode 100644
index 0000000000..5ec8977c80
--- /dev/null
+++ b/package/python-deprecation/python-deprecation.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-deprecation
+#
+################################################################################
+
+PYTHON_DEPRECATION_VERSION = 2.1.0
+PYTHON_DEPRECATION_SOURCE = deprecation-$(PYTHON_DEPRECATION_VERSION).tar.gz
+PYTHON_DEPRECATION_SITE = https://files.pythonhosted.org/packages/source/d/deprecation
+PYTHON_DEPRECATION_SETUP_TYPE = setuptools
+PYTHON_DEPRECATION_LICENSE = Apache-2.0
+PYTHON_DEPRECATION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
