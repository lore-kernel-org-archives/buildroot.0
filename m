Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5015EC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 02:12:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A086103A
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 02:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4A086103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6945D400E7;
	Sat, 14 Aug 2021 02:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8h6paGdHJBLB; Sat, 14 Aug 2021 02:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C984540183;
	Sat, 14 Aug 2021 02:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED8921BF4E7
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 02:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D94DE404AC
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 02:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zw47PRUIXvsE for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 02:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0000404A7
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 02:12:27 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 108-20020a9d01750000b029050e5cc11ae3so14282606otu.5
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 19:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6s2/1mMvoGLMOWJP1LmY3xwGr0ChBqO7duO1HK9OtVg=;
 b=eEic947s9gm7LnMEAO+36ERRPUVHJ/WetdjbgcM4ElvcVwwUwBmVDfb00JlYtF8cOW
 3w5asSHzVgw5yRcFphsOsUYqgoE0BIPPoFmTxOBNLjEXDQMVUGYyrVjjHaRHlyIuk+h6
 GswcoVjI7/8YQXXgKj/z1ZmXpUc70ZVz+Ykbh8bs7pq0lC5jvNIavN+QDC28iUPh2szO
 4uoYpa++85rjGfs4f8sfaqH6kcAFD+FaNU0aCXL4OJT7qaYLjnfgdZ53noYfMr8vcV03
 HTcZVpgvfDTd/zVxX2REnTAjM9P6EE6Xdd1eWzvt73LLGfBdO348X3QgGH8WYq6AmFck
 ciwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6s2/1mMvoGLMOWJP1LmY3xwGr0ChBqO7duO1HK9OtVg=;
 b=UEAezVmLJCRImIIbpw8KSfpjdKZy8VWl1A2eEsGq5Nv2WBPjUoPfCS0EzR+B/Cv/aB
 lHZYKyDi6ztdmNAs9eKDxbzUpL7vlf4S8HpMp3XwgAsWM0mFSFbDUescb1Hbg4OeNLKc
 UfKcV9RuqgDZZ1iZQB9ay8pO/9q+KSrMIqnzJmQPSDAes9I4kpzeil00siuW341/rZ77
 ZlmBDiaCgdZuQxZE7jdNr9/OZFTqMPztkUFvdo0CHlOF7YqFXr5SaCp97R6mRCKTaV3E
 EFvOmkB97rzgYc/5FaQjYXYT8en9oG2Bf6yOCUoFB2j2jaZkBV6dEymEpcqtoZjTxzrA
 IB5Q==
X-Gm-Message-State: AOAM532uxkWGUZoBsKfeqYT/Q+rYZ+dQyqiK/CA0NXaTNJreqaXIdGE6
 S8U5ovaamqA6Mge9ZHu729DUa0maEDs=
X-Google-Smtp-Source: ABdhPJwOUKLFdIXEuCT2K2epJfLNEICswBgWG1dN9dtYeq/gZaRy+vYl5zNpEbSmvlURUFGtWgVp0A==
X-Received: by 2002:a9d:662:: with SMTP id 89mr4304494otn.24.1628907146287;
 Fri, 13 Aug 2021 19:12:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id u15sm732544oiu.43.2021.08.13.19.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 19:12:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 20:12:23 -0600
Message-Id: <20210814021223.3883699-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioprocessing: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-aioprocessing/Config.in             |  8 ++++++++
 .../python-aioprocessing/python-aioprocessing.hash |  5 +++++
 .../python-aioprocessing/python-aioprocessing.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-aioprocessing/Config.in
 create mode 100644 package/python-aioprocessing/python-aioprocessing.hash
 create mode 100644 package/python-aioprocessing/python-aioprocessing.mk

diff --git a/package/Config.in b/package/Config.in
index 046c04e994..1c656b609b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,6 +897,7 @@ menu "External python modules"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
+	source "package/python-aioprocessing/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
diff --git a/package/python-aioprocessing/Config.in b/package/python-aioprocessing/Config.in
new file mode 100644
index 0000000000..2e76bc562b
--- /dev/null
+++ b/package/python-aioprocessing/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOPROCESSING
+	bool "python-aioprocessing"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A Python 3.5+ library that integrates the multiprocessing
+	  module with asyncio.
+
+	  https://github.com/dano/aioprocessing
diff --git a/package/python-aioprocessing/python-aioprocessing.hash b/package/python-aioprocessing/python-aioprocessing.hash
new file mode 100644
index 0000000000..cf92a72d4a
--- /dev/null
+++ b/package/python-aioprocessing/python-aioprocessing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aioprocessing/json
+md5  838b6aa073f1373bd42204f86b0e3196  aioprocessing-2.0.0.tar.gz
+sha256  469dfb746e8c4e0c727ba135cfabf9e034c554f6a73c27f908bfe3625dd74b9e  aioprocessing-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  53c809e8f0b91a68a39477e5fbdf77fe2b74dd6a1647c2dd9b7b22fed135239e  LICENSE.txt
diff --git a/package/python-aioprocessing/python-aioprocessing.mk b/package/python-aioprocessing/python-aioprocessing.mk
new file mode 100644
index 0000000000..e1e919de2d
--- /dev/null
+++ b/package/python-aioprocessing/python-aioprocessing.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aioprocessing
+#
+################################################################################
+
+PYTHON_AIOPROCESSING_VERSION = 2.0.0
+PYTHON_AIOPROCESSING_SOURCE = aioprocessing-$(PYTHON_AIOPROCESSING_VERSION).tar.gz
+PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/8e/3e/54266241660fb026bfd27f660d44cd81a4b7f8a145d8e2db010de12622a0
+PYTHON_AIOPROCESSING_SETUP_TYPE = setuptools
+PYTHON_AIOPROCESSING_LICENSE = BSD-2-Clause
+PYTHON_AIOPROCESSING_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
