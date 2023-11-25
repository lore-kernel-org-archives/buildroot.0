Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ECDC61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FD4421FB;
	Sat, 25 Nov 2023 01:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FD4421FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lj44pGp71P8u; Sat, 25 Nov 2023 01:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A78A642073;
	Sat, 25 Nov 2023 01:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A78A642073
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1AA81BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B1A782246
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B1A782246
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjRdLVKIaaG2 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:01:23 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5BF782241
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5BF782241
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cfa36bfe0cso8089115ad.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700874081; x=1701478881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+Cl+SGYkZG/gWfWJ3hCJjUks66mWsOnbQiiTKOsjQw=;
 b=fKRNuzt2qgANB2xaVnSeBepb7G6sDspqVEnPe6Y8A+GN/PwXqvBpff6RLC5T3YZtVL
 ahLJgIrepK10xi1jm2fdEtfPZTLQhhmhGHwdImFbBQcXxFuLPANdVH4KGqfs0qhA8Yv2
 T/eac2UNNTQK55b7/5z9IiGRMAf4Ln6YsS6lt85OwVf3hFRxtSywIgh32c4KcXOAdtmL
 Je2CBkD35XurntIpnf4fgFPeZ7uxwlZQZrbrJ9Y0BbQMRxTNVBjJHKzkj01go0SvdyBj
 0LUcxxMFKGOROZwXD46Le+KTa19rT83rrsmkU4rHR8vNU5KXNHMCnfMxIejcsdsFAhhz
 BbtQ==
X-Gm-Message-State: AOJu0Yy387HXTL7o+NJxZnsNinMc2OOMgn/iMMsT/CEwJAFPqFXuOK+k
 CM+RtTL/xd6BalMKKZlxdUpCAaMdXFqoidp0brI=
X-Google-Smtp-Source: AGHT+IHKMQkGgBv9AyxmyvWOtFJWp1yVVGqx7DEsTMfNxVwglStGZ0CTAHNQ9XDy5AxJCJDZYb6sHw==
X-Received: by 2002:a17:903:41c1:b0:1cf:8dcb:8eac with SMTP id
 u1-20020a17090341c100b001cf8dcb8eacmr9073126ple.17.1700874081496; 
 Fri, 24 Nov 2023 17:01:21 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 jk2-20020a170903330200b001b8b1f6619asm3807749plb.75.2023.11.24.17.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:01:21 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:01:11 -0700
Message-ID: <20231125010113.1758786-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
References: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700874081; x=1701478881;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+Cl+SGYkZG/gWfWJ3hCJjUks66mWsOnbQiiTKOsjQw=;
 b=l9kuYNh9J7KRVX5A2Me+2GkOlgwhBfETeGb+l1LEJ0qqh9+YtPEgR6PikQjRjuH6BH
 TKdy5GNPClijbd2V9RwUTSd8WGlJ6eXnxsUKzZXxt9MG/mXezbBqRYNcDTaz/TwFh765
 aL/f4cnor3QrLZrLwxzcyg25MlBueffdl4gwQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=l9kuYNh9
Subject: [Buildroot] [PATCH/next v2 3/5] package/itstool: new host-package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Translate XML with PO files using W3C Internationalization Tag Set rules.
This is needed for the zenity package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                   |  1 +
 package/itstool/itstool.hash |  3 +++
 package/itstool/itstool.mk   | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/itstool/itstool.hash
 create mode 100644 package/itstool/itstool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..d207f6ae22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/itstool/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	support/testing/tests/package/test_firewalld.py
diff --git a/package/itstool/itstool.hash b/package/itstool/itstool.hash
new file mode 100644
index 0000000000..937185ec2b
--- /dev/null
+++ b/package/itstool/itstool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fba78a37dc3535e4686c7f57407b97d03c676e3a57beac5fb2315162b0cc3176  itstool-2.0.7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL3
diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
new file mode 100644
index 0000000000..d9aa016f50
--- /dev/null
+++ b/package/itstool/itstool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# itstool
+#
+################################################################################
+
+ITSTOOL_VERSION = 2.0.7
+ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
+ITSTOOL_LICENSE = GPL-3.0+
+ITSTOOL_LICENSE_FILES = COPYING.GPL3
+HOST_ITSTOOL_AUTORECONF = YES
+HOST_ITSTOOL_DEPENDENCIES = host-python3
+
+$(eval $(host-autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
