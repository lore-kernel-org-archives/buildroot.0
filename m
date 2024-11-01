Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC08E6F08E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E476071F;
	Fri,  1 Nov 2024 22:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIFhF5ibsMrO; Fri,  1 Nov 2024 22:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1FD46072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FD46072B;
	Fri,  1 Nov 2024 22:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48CD8979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29FE5813ED
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_vnSykeVxq3 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37578813E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37578813E9
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37578813E9
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:14:27 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a6be9bd626so562115ab.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730499266; x=1731104066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EpvqQgmDIH4Nwj4lCUtf7/q4fWuKKsd1De8VCTjtkKA=;
 b=IYPWLSDrWF0NR53qBQ/bQvdqQL9FcTvnGlUgH34xaW3ArYttg4hkYlsn9i/H6r+C4U
 ttBgiQYnZP+V9N9dPmB0WOCDf7nvEH1quEvWYIbj/2wFF/IHx/YMNZC/gnrPxkZEwYsv
 6AuLYhU35r0RXHUG+uuuywzoic6ifsBPZFbJgtUtO8dIlx5fH0U7tuGEJcHns+hHF9bB
 Bh4FvhbMtjchfDORydMi3OaHvQFTXhVZjYSAZmd4cDOffHYIzJwKcet7Op7ERFvY5+wq
 kR+rIs6tO9m4aFnBNCksVzim7+mtofv95Ftnk2Pem/ZUOCnFv8kMP9QC/cJ8V6hQh5lT
 il4w==
X-Gm-Message-State: AOJu0YxjcqS+GZ4H10ZzuV9Z6vbAZ8wcM2s1CSn2EDfHoaPM4RruqmxE
 fZ3S/BIzD2UaBxwng+d5oF+lDvwWOmZ+rUK+7dLMQP/0x6+SyqYx+5fOaA==
X-Google-Smtp-Source: AGHT+IHYwT5vqis/ejh13Wdx6uXWpgrWJBe+P3iT+FnFdQzct8UQoyj1faOQXS0Tbf7v4X/d2a3TAw==
X-Received: by 2002:a92:ca4f:0:b0:3a6:ac17:13d5 with SMTP id
 e9e14a558f8ab-3a6ac1717c6mr66775925ab.11.1730499265826; 
 Fri, 01 Nov 2024 15:14:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048bf432sm928025173.44.2024.11.01.15.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 15:14:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 16:14:22 -0600
Message-Id: <20241101221423.1303398-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730499266; x=1731104066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EpvqQgmDIH4Nwj4lCUtf7/q4fWuKKsd1De8VCTjtkKA=;
 b=ZEM02N2K+5aeT7mA5a8KCOXT3U4t5T4ScaQo4fzGqbiN6dzu7BhqOFTE3eLhsLKJnz
 TKR0BWKfiwRPrhABALZ6U2tIZeM2426StzFHffaQuaezAUy98rCeF3NUFw46VFY5DZS9
 RxX1KbUZok9dtCwtyuJtNZYrpMDvW5F011Gykf2KEktFSihkc23ZXRZ4BlScGwM0D9XY
 sxzOWGRjzuztZp74ZvB+67Fon7cJTL1lQTEzTCM+BCZVGipIKYJZcYULfeiYacziRXTr
 PZW3FsLfYA7yvxq743UJ/ccvKWKPE55QoBzC70nOT7aHH8ubxrll/48CTqRdn6FFS0Gj
 PQLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZEM02N2K
Subject: [Buildroot] [PATCH 1/2] package/python-tinyhtml5: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-tinyhtml5/Config.in             |  7 +++++++
 package/python-tinyhtml5/python-tinyhtml5.hash |  5 +++++
 package/python-tinyhtml5/python-tinyhtml5.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-tinyhtml5/Config.in
 create mode 100644 package/python-tinyhtml5/python-tinyhtml5.hash
 create mode 100644 package/python-tinyhtml5/python-tinyhtml5.mk

diff --git a/package/Config.in b/package/Config.in
index 876b340a8a..15b35fb55d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "External python modules"
 	source "package/python-tftpy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
+	source "package/python-tinyhtml5/Config.in"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tinyhtml5/Config.in b/package/python-tinyhtml5/Config.in
new file mode 100644
index 0000000000..3243d143e7
--- /dev/null
+++ b/package/python-tinyhtml5/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TINYHTML5
+	bool "python-tinyhtml5"
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  HTML parser based on the WHATWG HTML specification.
+
+	  https://github.com/CourtBouillon/tinyhtml5
diff --git a/package/python-tinyhtml5/python-tinyhtml5.hash b/package/python-tinyhtml5/python-tinyhtml5.hash
new file mode 100644
index 0000000000..55afa09597
--- /dev/null
+++ b/package/python-tinyhtml5/python-tinyhtml5.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tinyhtml5/json
+md5  c5fa2991d6d1ea65e923279c435b816e  tinyhtml5-2.0.0.tar.gz
+sha256  086f998833da24c300c414d9fe81d9b368fd04cb9d2596a008421cbc705fcfcc  tinyhtml5-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-tinyhtml5/python-tinyhtml5.mk b/package/python-tinyhtml5/python-tinyhtml5.mk
new file mode 100644
index 0000000000..373ab8aa54
--- /dev/null
+++ b/package/python-tinyhtml5/python-tinyhtml5.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tinyhtml5
+#
+################################################################################
+
+PYTHON_TINYHTML5_VERSION = 2.0.0
+PYTHON_TINYHTML5_SOURCE = tinyhtml5-$(PYTHON_TINYHTML5_VERSION).tar.gz
+PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/fd/03/6111ed99e9bf7dfa1c30baeef0e0fb7e0bd387bd07f8e5b270776fe1de3f
+PYTHON_TINYHTML5_SETUP_TYPE = flit
+PYTHON_TINYHTML5_LICENSE = MIT
+PYTHON_TINYHTML5_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
