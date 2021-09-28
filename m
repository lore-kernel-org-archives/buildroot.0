Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19D2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E2361159
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63E2361159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE8140701;
	Tue, 28 Sep 2021 06:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oYFbbHua4rE; Tue, 28 Sep 2021 06:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CFF404D7;
	Tue, 28 Sep 2021 06:44:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 473721BF40A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375F380D40
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMcUpLSN8NMz for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 06:44:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34B9B80D36
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 06:44:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so1198540wmb.3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 23:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkDwnn1dvyV0I6af6PS+we9losDnxF5HA6xBt3JqUsc=;
 b=PntOWX5eyg2bUJCONR6cdTuZOZyZSvqfbt2cfTk2dAP2WROnRJoI0Cr9MkObfnjmcY
 MFIO9CYqoo31AU9J3V/K0lSTRx/jsgeNsP5k72Inuu7WV/T+1efPA/3gLiI7/6wqddfK
 Q2jhNAMh98Uhfgb8gGQd0M2RGgiyi6Spe/lxl9+XByfxbkVaFqfOdc4ITteXlF94jZ0m
 yxIiqIiD5PXcHKVQdRUnUqcO0HSibdONB6AXOYSAzko1OY8lxmT12ZsEInlHQbLSiR6k
 ys6Y2wmCq350oQ/Tyn9gZ/yvP9021zGlB9kNyTTa6AHybEI/9ayVAqybzqu55c6VATPK
 kD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkDwnn1dvyV0I6af6PS+we9losDnxF5HA6xBt3JqUsc=;
 b=Yf3HyQVr9DYb0OquCmBey6AjjExhPgEs/LYYGh4q0e7DWp1AvHsZqFnEJQl4ryRFMs
 tm+3+7aWaVKQ9a4gpxd+5J9jXrzKWKJDILmK9Vu/3KxAjYz6OBaw27+Sc6dkzQlv0c0H
 4XSv4Gp+7Krm4BgFlCv3gpCsyQpSgTaWs+viCsOUFwMEam5mSwoTmxo9x2CjSXsB6mG1
 i971lt8u52LMyCjsxF/tdge8vlecOmRPhSNjgRpjy98hSU4tZUVYV4NR48hZsJvhwhAk
 z9un0eeuxGstWQMr9DFuIU2mGRkWjebXj0YRid01vrE/Tmvhc482IOsQFBeCNuGo7THg
 O4wQ==
X-Gm-Message-State: AOAM532iGkdrTqouY6Vy+YHQteBcDFUUHtFWLdCFSxeIo7Jw6rkqwsJK
 CAfAE3UJiciQm0dnIlCLh+6J4Ab9up4=
X-Google-Smtp-Source: ABdhPJx1asv0YN4fnH//wVPUt92gvma57QEGUY5uV2lsjXkRGdoZc0wKasSgHUl0lizh8PC5EhkwQg==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr2964972wmi.153.1632811446684; 
 Mon, 27 Sep 2021 23:44:06 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7b33:8acc:211c:62ed])
 by smtp.gmail.com with ESMTPSA id 1sm1923428wms.0.2021.09.27.23.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 23:44:06 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 09:43:56 +0300
Message-Id: <20210928064400.573159-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928064400.573159-1-asafka7@gmail.com>
References: <20210928064400.573159-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.4.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-markdown2/Config.in             | 1 +
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/Config.in b/package/python-markdown2/Config.in
index 8fe2332491..5513219a40 100644
--- a/package/python-markdown2/Config.in
+++ b/package/python-markdown2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MARKDOWN2
 	bool "python-markdown2"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A fast and complete Python implementation of Markdown.
 
diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 03315fd3ea..a3e310aacf 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  5c1f9002060cf534bde0bdd584d6b70a  markdown2-2.3.9.tar.gz
-sha256  89526090907ae5ece66d783c434b35c29ee500c1986309e306ce2346273ada6a  markdown2-2.3.9.tar.gz
+md5  6134fce06c4783b3178a90a719fa9d91  markdown2-2.4.1.tar.gz
+sha256  ce9265cf179c4e07934e7b6a4b03f3edb7891e66e6d0f7017755f6064bbbe13f  markdown2-2.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 3ffa35796f..6acfad2ccb 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.3.9
+PYTHON_MARKDOWN2_VERSION = 2.4.1
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/14/69/c542025f80916457ff4fe962404a27ab6417d43822fe54bf88ee2dd1b36f
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/fb/10/4f327f4517fa5dda90021618fe174d1f4aff3c4e06abcd7f77685a455511
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
