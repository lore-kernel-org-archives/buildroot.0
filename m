Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCC1EC047E
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 09:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 908A741D4D;
	Tue,  3 Mar 2026 09:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cInwPb-BSW9L; Tue,  3 Mar 2026 09:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B60F41B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772531459;
	bh=vQpSPrDPkLlM+ROForN7ue4Mc9Ikk4b3Lt+JVt7Dmzk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m/LljGyfTnsceJ/txOHjv0gm98e863VYCCx6YipZyg9AZtfxXM7T21oq95aNFblYK
	 5pu88rvFjQJ0uKB74vAJhQm73lucndK8nab+m+XGitSz8dO9RtkyT5N3i6fimsAVoZ
	 zKDPfmX2TVrjIn6sTdCCbIEY/oXNs3lqXIvJNYPY0VuuKVZ8+ChTkQlc48XP6Y/cm6
	 zAwWag/EQ8UOsApt3Sdp0Z2bKQv8MFddta9nxoZN/3MscV3sB2CxnegaP8Wk6vQCAs
	 Ad27okxK5T9LmkiUnc1jSVF8bB2e8wfVMdujs7sDS1rusjEPvAv4D+i4W1AmQd5NfF
	 eVOcRlMJE6dEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B60F41B26;
	Tue,  3 Mar 2026 09:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDD111EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9D741A8C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 09:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aamo-HoFOXHm for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 09:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.118;
 helo=out30-118.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C5DD41B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5DD41B26
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C5DD41B26
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 09:50:43 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-9LRAU_1772531429 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 03 Mar 2026 17:50:33 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Tue,  3 Mar 2026 17:50:28 +0800
Message-ID: <20260303095028.9946-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772531434; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=07NDleBbR536mYuyhXDi/nXP9iDJ6eMj3PJope5NcsU=;
 b=l/GN/CBGMqZeDdT2v2QJEwhTMwQ1tgpqBhWcCbSYatyAnhw3GY/b0f9pox3JLYZEwkSYEWcCBM1tn2PulCRUgO7VrX10ACfR24NR36UjJWXl3EbbRHyGqYIQ7iTWPEhHNwb9Z4yqjf6TiLk8f714tDq7oq82T4HWS+7KLnDGNYk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=l/GN/CBG
Subject: [Buildroot] [PATCH] package/iniparser: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Chen Pei <cp0613@linux.alibaba.com>

The iniparser is a simple C library offering ini file parsing services.

ndctl[1] requires it.

[1] https://github.com/pmem/ndctl

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/Config.in                |  1 +
 package/iniparser/Config.in      |  7 +++++++
 package/iniparser/iniparser.hash |  3 +++
 package/iniparser/iniparser.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/iniparser/Config.in
 create mode 100644 package/iniparser/iniparser.hash
 create mode 100644 package/iniparser/iniparser.mk

diff --git a/package/Config.in b/package/Config.in
index 20c9a2e155..d1dce9c4d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2336,6 +2336,7 @@ menu "Text and terminal handling"
 	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
+	source "package/iniparser/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/iniparser/Config.in b/package/iniparser/Config.in
new file mode 100644
index 0000000000..56764c04e6
--- /dev/null
+++ b/package/iniparser/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_INIPARSER
+	bool "iniparser"
+	help
+	  iniparser is a simple C library offering ini file
+	  parsing services.
+
+	  https://gitlab.com/iniparser/iniparser
diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
new file mode 100644
index 0000000000..27a5fa81aa
--- /dev/null
+++ b/package/iniparser/iniparser.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  67575ed032a544d5359610e5f697af786371bbc3eb01311218ef8adfd3e5e329  iniparser-v4.2.6.tar.gz
+sha256  da809b67f3cc571433b7b97d4253ae1f9d8817770aa859aad202df6bde1d5fde  LICENSE
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
new file mode 100644
index 0000000000..9034a1cb78
--- /dev/null
+++ b/package/iniparser/iniparser.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# iniparser
+#
+################################################################################
+
+INIPARSER_VERSION = v4.2.6
+INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/$(INIPARSER_VERSION)
+INIPARSER_SOURCE = iniparser-$(INIPARSER_VERSION).tar.gz
+INIPARSER_INSTALL_STAGING = YES
+INIPARSER_LICENSE = MIT
+INIPARSER_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
