Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F9FC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C8A741989;
	Tue,  9 Jan 2024 06:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C8A741989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFaW4ur-rn8Q; Tue,  9 Jan 2024 06:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E67341920;
	Tue,  9 Jan 2024 06:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E67341920
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 338F71BF3D8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02D5C4191F
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D5C4191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WY2PwEGcE25P for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:01:34 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0F4A418E2
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F4A418E2
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3606f8417beso10161125ab.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780092; x=1705384892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkycrJ8bC4QgaAegDjVH0I89lSGWbkUiaQoEYH4Gp2M=;
 b=RW5TmAcUEQR3pOBLSJXSU2xhoL7hzWwcvKNtuUJEFZY6X6vxIZB3d/fmsXCzlMPJUi
 qOkLMSraFtbfBVOUXhizEr9hA09BLwWYvdyDTq9krypOLdHcxIzC79gXlGlaycOTCGMB
 kQI+6z8rQHJg6KJEijcDocY5TZQTDQw/Qn1qe8GHn96inHwo02G6FPcWs7cr+Vj2GDFC
 mBJQaVd4obyxeKreZcXng//Td0TXuQ5NkoxRg52dRuoI70xu7wYBwNx1AJOjGt/ywMFn
 FTgdXdnsg6V8llWTJwscJfNU1rGbONN7CjEDJ08AUHQZtceYma5w3u4W9k3R2O35AOOo
 WJ1A==
X-Gm-Message-State: AOJu0YzxNRR6eLD2a9EiB1VxZ31Kdy2fZtvniFsBUGO1FGJYCSz/WyW8
 IZa4s2fudJLZ9rqc9veHxDrnXrwptbF6BA==
X-Google-Smtp-Source: AGHT+IFPG4Em4Xf1ukeww1zPxt16yYkPo0w5EYRVcIsvrcS8w7dXVLOUGqcLCBkwwj6u6Q6JVcL3KQ==
X-Received: by 2002:a05:6e02:1a2f:b0:360:63ad:aea8 with SMTP id
 g15-20020a056e021a2f00b0036063adaea8mr223063ile.23.1704780092166; 
 Mon, 08 Jan 2024 22:01:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92d9cf000000b0036063b51610sm410975ilq.27.2024.01.08.22.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:01:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:01:25 -0700
Message-Id: <20240109060128.3974794-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109060128.3974794-1-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780092; x=1705384892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkycrJ8bC4QgaAegDjVH0I89lSGWbkUiaQoEYH4Gp2M=;
 b=TDXbw5Rx2dneHMOyevNOpKAdeG8HYpQQJaG0xRLmuModVWUpq/0f4IT5BUjdSqhxA5
 1OI4w3ZDnBRFTE+S4JOUOfYa66Pu8lMrie0FpWkBjFpjJ5iaqXVRwh6KbbmBAtsix/km
 0R6M9OYB6+bLdgh2Ej/Lg/pO92nBYaHKO5QkJjec/QxpeHcwe4YdHrUgk+gmCNMb5fR0
 3FwG09HFpFlSe+mnOObD4KgNYLUNKXBbu5z9qIGPi8uBdFL4JBdAFDGwuOeEDuxsrRqI
 K7Ea1I29gh9nWeBRWoP0aTdHNJlqZmeIUxoMOLGye6EJilkfiTzGaJfryurHtfH10YMD
 A06Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TDXbw5Rx
Subject: [Buildroot] [PATCH 3/6] package/python-jaraco-context: new package
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-jaraco-context/Config.in           |  6 ++++++
 .../python-jaraco-context.hash                    |  5 +++++
 .../python-jaraco-context.mk                      | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-jaraco-context/Config.in
 create mode 100644 package/python-jaraco-context/python-jaraco-context.hash
 create mode 100644 package/python-jaraco-context/python-jaraco-context.mk

diff --git a/package/Config.in b/package/Config.in
index d9b97b22a3..45ba7ac389 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
+	source "package/python-jaraco-context/Config.in"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jeepney/Config.in"
diff --git a/package/python-jaraco-context/Config.in b/package/python-jaraco-context/Config.in
new file mode 100644
index 0000000000..afdc8fa940
--- /dev/null
+++ b/package/python-jaraco-context/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JARACO_CONTEXT
+	bool "python-jaraco-context"
+	help
+	  Context managers by jaraco.
+
+	  https://github.com/jaraco/jaraco.context
diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
new file mode 100644
index 0000000000..f8daa91364
--- /dev/null
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jaraco.context/json
+md5  b40aeeda6a07dd283f2a407f622cda5b  jaraco.context-4.3.0.tar.gz
+sha256  4dad2404540b936a20acedec53355bdaea223acb88fd329fa6de9261c941566e  jaraco.context-4.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
new file mode 100644
index 0000000000..668855c98a
--- /dev/null
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jaraco-context
+#
+################################################################################
+
+PYTHON_JARACO_CONTEXT_VERSION = 4.3.0
+PYTHON_JARACO_CONTEXT_SOURCE = jaraco.context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/7c/b4/fa71f82b83ebeed95fe45ce587d6cba85b7c09ef3d9f61602f92f45e90db
+PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
+PYTHON_JARACO_CONTEXT_LICENSE = MIT
+PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
+PYTHON_JARACO_CONTEXT_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
