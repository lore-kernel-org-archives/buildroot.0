Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59960F94CB0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D52A41262;
	Tue, 21 Apr 2026 20:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_t4R6mnXnrh; Tue, 21 Apr 2026 20:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F26A40C32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776804636;
	bh=hUMLPpQ1BXOhHPi6pr1o6T5AoUsQBSM49CVPOB/an9Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZmOjZHt+hNjclMFpKZjvZbL/i34lZu6QqhiGNBJVcAJ6jLsRagOi5LfsYkzcqo4jL
	 hkjkTNhPPETxMbYf+X31wHVEVGNhWfUSS7ix8tFQgXCA7trwh00Z1AamU5xVFVEMe8
	 l6vh8fG09OuQm4Ng4je0hTi2BI5vqyAqaQnGChQE2XK9h3yOWi2i32w+LMH5lsJfoO
	 nAMHYbgAUdms1S4AxlFsB9vSlVa36TqHP0C2wlnaOmuW6j44yJjm7C7Y6BQ6Yq4yb7
	 x6nu7+V4VN7BMuPRiYfSDPSp/DQoNTwGz63I925PMQUqVxKBIHePV8hXoyscwD80Bz
	 vtS4CHU40Shig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F26A40C32;
	Tue, 21 Apr 2026 20:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF82F183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C62ED840F5
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTMIhQyoNaDc for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=hellohacker.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8797840F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8797840F2
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8797840F2
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:50:34 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-8eb22d4de2fso31692485a.2
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 13:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776804633; x=1777409433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tq1a5hL/b0waLuX00bHdkrhCCPDqmxwbx0HSk5y7lhQ=;
 b=rkfsoDOzM29hiKcmN4w7uph4qgaxupfpTfQOpjoc/caLd9ojBCCqjqXFrmVqCBxLW9
 cIdW1gMjVUdK8yuixHJk3u4IXmbRYGgxBoc+WtSkG5Jz/AGobg8KUhDoOFTCJDuUdrqt
 sXW19HkXtv7gBtfZKW6fBJe2hcfenolLteHxS7SqVuBuFRhYHG5EDnDj8l5W5hRHkCum
 sIpc6VkQqOF/yOs+aQYco9tAdCHYrO6gkukuo/iPqBZoilnbxvATTJKcIfuBsW9EIkLS
 NuE8O0BRVlQwI+4ovQsSzYSVEq1ODGpCS1LrHfvWvRvWtIXDyHjOGwpnMxYSf+LBgrLp
 4QVQ==
X-Gm-Message-State: AOJu0YzAV8lDRMDkNsLKfFyUP+IzfEiCmxoptTMUwC57OZpo4oWcsWcV
 8klC3s+q58KCqYvP0d9yvIQOXwi+rKe/wFPf3qYjX3vN9jQj5slnY6cswsKt6ATP0a1Y8g==
X-Gm-Gg: AeBDievS+kOxPSbVxvv7lx18ir+hfc9PxgoIaI0/QPo0yQGP3bxelZeYGC8qenTQ7mh
 yQn2OIcEykAZOldB/R6dNjGon5DbqXrWZQAek7TQv/u/Y/gKkVuYiEp3SRPlITdoqdyRu4IP6l8
 lVZs3X4VqaBk/Qz1j3UcEZcuWq5yGUGPCMpuqDY0fs3VUwj5mVfihUazKHfhMYIRAfPAug1ssBp
 MT3oZRQkPA5lFvb59CLU+CH/vRfjBTaEM4k8i84mmNxsqH6iA5iU96Blvt4Haa5k1+txM+Y5k24
 2UAqLMH9SvIK6NRs/8sauNOUw4F+MmPRkWJV18sL63q5BMPErcFoE66qEbV9IJWe+hDjz5kX3p9
 2Lvsodixo9C3v7yZ8c+uVY0TdqbMTqt92ecByN/IsloWkVIAyE8+0PLluZBgBtdLbSSlTHD2yZG
 t7n+ZIeB3x8wTz4I0tYhtXG65VzIXm7LFUSgy7yRXVf/zzzVQ5P1v0q5GdGeA23qvsnsSi5ZQbo
 /V5SoCLDn5qaVduFZgvBb3+Pj8VgA==
X-Received: by 2002:a05:620a:40cb:b0:8ef:6d2d:c3 with SMTP id
 af79cd13be357-8ef6d2d013bmr140132785a.8.1776804633156; 
 Tue, 21 Apr 2026 13:50:33 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8e7d69ad48asm1116004785a.19.2026.04.21.13.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 13:50:32 -0700 (PDT)
From: Alexandre Ondet <hellohacker.dev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 16:50:31 -0400
Message-ID: <20260421205031.2237-1-hellohacker.dev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776804633; x=1777409433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tq1a5hL/b0waLuX00bHdkrhCCPDqmxwbx0HSk5y7lhQ=;
 b=IkPND7Oi7mkLeFm9LnF2jynNOTCliJysVmu/Ou6k0cy3T/q6I+XiJb934xbNQ+MRv6
 3EJGN7R2hTjmXBSeLwF1D0cjU0iUbi+9X+0CldQz5OyicaefOGu2GU0dWVSnQHpGBskT
 dZRFfqj3qaf9imn/IxdtawcODxxib1LKVpsOhg3pnz4ouUq6k1ba99bLzqelW22pJxl+
 PBER2grQFX+WoOQjApnjl40VQVMc/G9vuTnDHjfjmXkwBU1vdkCHV+NVaEdi8j442tng
 Xr8vVaJ3DUQVc304rJdsZSVgJShf63EpTfg1Qrc7p9foo8HSHriSnUuowJhG02DPZnw4
 Wi2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IkPND7Oi
Subject: [Buildroot] [PATCH 2/2] package/python-isodate: new package
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
 package/Config.in                          |  1 +
 package/python-isodate/Config.in           |  7 +++++++
 package/python-isodate/python-isodate.hash |  2 ++
 package/python-isodate/python-isodate.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-isodate/Config.in
 create mode 100644 package/python-isodate/python-isodate.hash
 create mode 100644 package/python-isodate/python-isodate.mk

diff --git a/package/Config.in b/package/Config.in
index a2bd4a2e4a..5f07294b3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1180,6 +1180,7 @@ menu "External python modules"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-ipython-pygments-lexers/Config.in"
 	source "package/python-iso8601/Config.in"
+	source "package/python-isodate/Config.in"
 	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-iwlib/Config.in"
diff --git a/package/python-isodate/Config.in b/package/python-isodate/Config.in
new file mode 100644
index 0000000000..77ce259891
--- /dev/null
+++ b/package/python-isodate/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ISODATE
+	bool "python-isodate"
+	help
+	  An ISO 8601 date/time/duration parser and formatter for Python.
+	  Useful for parsing and formatting ISO 8601 dates, times, and durations.
+
+	  https://github.com/gweis/isodate/
diff --git a/package/python-isodate/python-isodate.hash b/package/python-isodate/python-isodate.hash
new file mode 100644
index 0000000000..16af316781
--- /dev/null
+++ b/package/python-isodate/python-isodate.hash
@@ -0,0 +1,2 @@
+# From https://pypi.org/pypi/isodate/0.7.2/json
+sha256  4cd1aa0f43ca76f4a6c6c0292a85f40b35ec2e43e315b59f06e6d32171a953e6  isodate-0.7.2.tar.gz
diff --git a/package/python-isodate/python-isodate.mk b/package/python-isodate/python-isodate.mk
new file mode 100644
index 0000000000..e658ddceee
--- /dev/null
+++ b/package/python-isodate/python-isodate.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-isodate
+#
+################################################################################
+
+PYTHON_ISODATE_VERSION = 0.7.2
+PYTHON_ISODATE_SOURCE = isodate-$(PYTHON_ISODATE_VERSION).tar.gz
+PYTHON_ISODATE_SITE = https://files.pythonhosted.org/packages/source/i/isodate
+PYTHON_ISODATE_SETUP_TYPE = setuptools
+PYTHON_ISODATE_LICENSE = BSD-3-Clause
+PYTHON_ISODATE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
