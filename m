Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA3CD58E4D
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 07:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF878144A;
	Wed,  4 Mar 2026 07:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_YerxYQjeJY; Wed,  4 Mar 2026 07:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B88E781440
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772609294;
	bh=kGStcJvSe13INT1xuisG8J3ABtrjp0DjAYunj7fS26c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ug67YJdYD7DY401ZcXYXc+X781OZpEwDiLHupaRxVNkZujgROiYyBXip8lC3Kz5j6
	 oZdX0OKV+z/gvns0G3XA3XOeKyJbGDjo6tJ+1gOv9tzKhPpYTjLVTAqYHEnWcSC6sO
	 IEbP/RunMB/ytAchLG8Oant6s2OU9W1lpOSBxw/mjTM+acOWszeMphcyWhhrUTrHqZ
	 XXLteGOz8VPxrtaVKXaxBBt1lLfqiC0QXTQ0PyS4tNfvxvb47NIo8Pla64ySVJ5m2a
	 sm3sdlO27goPOkNLby1UhOLlIP/U+Fq5ykbo4bXDsEcCgsTBydMUJJs9EAzuPNAbWf
	 bGGsSxzZSHuPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B88E781440;
	Wed,  4 Mar 2026 07:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2BF1231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8908440757
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfF3smAQdZNG for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 07:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF8C140735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8C140735
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF8C140735
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:03 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-CXRRI_1772609273 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 04 Mar 2026 15:27:54 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Wed,  4 Mar 2026 15:27:32 +0800
Message-ID: <20260304072733.1779-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304072733.1779-1-cp0613@linux.alibaba.com>
References: <20260304072733.1779-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772609276; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=qzjuGPlfKUGiLC4Tqcg5kL1IJHbXGRwmNtUqz56t71w=;
 b=Ei6fC7DW+nI0yXG8hHEZznnj6SNVCh+HJKErS5cm781IUXrd6jCr2+tqXdiu10qPcOYXjqKgiydJ514W77e477s+gBk+58Rpb3j+fddxUydim56bn7rfLOE1V5EuTBU26yEKIMPXXS47WLDUgrM3tzZ91+HrM5h0CurOwxNlo1Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=Ei6fC7DW
Subject: [Buildroot] [PATCH v2 1/2] package/iniparser: new package
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
index 0000000000..d5e4601d2b
--- /dev/null
+++ b/package/iniparser/iniparser.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# iniparser
+#
+################################################################################
+
+INIPARSER_VERSION = 4.2.6
+INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
+INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
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
