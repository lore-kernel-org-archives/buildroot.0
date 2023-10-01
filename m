Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CCE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 04:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23F481ED3;
	Sun,  1 Oct 2023 04:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23F481ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0ic78aGOqxe; Sun,  1 Oct 2023 04:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC6A81EF3;
	Sun,  1 Oct 2023 04:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC6A81EF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4D01BF5B5
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 04:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E16D081EF3
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 04:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16D081EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4oNIr6kBCLB for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 04:35:17 +0000 (UTC)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DFC881ED3
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 04:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DFC881ED3
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1dd0526b5easo7070676fac.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 21:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696134916; x=1696739716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PT72bc1Yt2yv+bw6TH3MymFRfvEACEH1W4R3dRjVVA=;
 b=exLmkUqBfJ4ibjfrDj3xDEqirFsJH7iwJHkBgLGUL6f2GzZJBW0RjlRrLHikLJFCft
 P3TrhcZ6Zs+7onh4fmlPa4jqdt5BEMUN4uZiExUd8mcoTnT9/fJAamzlES4Z410HqLgE
 9KH/gUVLuytk18LxbVmki+p2Zf3z3EOvJct4TlJb14fLuZ8j/Gv5m0qWi66RUbVkXdG7
 X3S82Emdc8BlDOu9saJm/60IlcD4MOuYSgEJbVARUTLNyAP+Tp8WAUkPNEDszQ5AlhH1
 2UPm2vuQozb3MLMJ7RjX8lr580V2nWCaM2kHDBryueTXXBBba7LnCdLYOQnv2wzZpbS0
 VyxA==
X-Gm-Message-State: AOJu0YyX3bsYDSEJEQXhcdsGHlovYNiyQevAq2mW3HukO2s9syz1FVi7
 0f45Hfs5TjylEd0Kh1UfR5hNkQUpXhg=
X-Google-Smtp-Source: AGHT+IHdgDyRCuSvit5RiBek2mO0aUJQnKofDF7NZa9nJh+TD3eJ1XTU3pOQRWV9ut92dXM5+BxTaA==
X-Received: by 2002:a05:6870:a2c9:b0:1d6:b7aa:c6ed with SMTP id
 w9-20020a056870a2c900b001d6b7aac6edmr7892904oak.56.1696134916532; 
 Sat, 30 Sep 2023 21:35:16 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:976f:4611:4b54:1f71])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa7820c000000b0068fda1db80bsm17283355pfi.75.2023.09.30.21.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 21:35:16 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 13:35:05 +0900
Message-ID: <20231001043505.19301-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <1841628>
References: <1841628>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696134916; x=1696739716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PT72bc1Yt2yv+bw6TH3MymFRfvEACEH1W4R3dRjVVA=;
 b=Z1/JQ2KKo+0ZWn75Kbv/CGW0kWoqdzSFgcYc3MHViyl23XLE1SH9JXXjP/Tt9jNlB6
 nBbQmUY3TQJLQZ0ka+vefS5k3UPig9RbiJSZ8k/eNPj/mXrCXbeyJnNDxEVYQXWCA2bM
 WQH5g7flxbkh/rZzDVM0VHEhMy7xtIk4loLS5Yfmi+uPjMhL3Eck1gzBcws7t25WZWr8
 SImBdu/0Zr27DDT4wf0g4uo08fI6wgtoK9Nwxe3+6puhgVxP03NCebujrIeYIvg524PC
 oOnWExllPIrsw3HKnZuILyiaThZz+fd1w55+QrczIs+4IN/3zMpDyUWixApl4l593Jn0
 ZUxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z1/JQ2KK
Subject: [Buildroot] [PATCH v2] package/itstool: new host package
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
 Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ITS Tool allows you to translate your XML documents with PO files,
using rules from the W3C Internationalization Tag Set (ITS) to
determine what to translate and how to separate it into
PO file messages.

- This package is primarily used by documentation tools such as gtk-doc
  - After this patch is merged, a patch to add gtk-doc will be submitted
- This package requires python bindings for libxml2
  - This change has already been merged

See below for libxml2 Python bindings:
https://patchwork.ozlabs.org/project/buildroot/patch/20230930155548.1609970-1-takumiiinn@gmail.com/

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>

---
Changes v1 -> v2:
  - add entry to DEVELOPERS
  - add entry to package/Config.in.host
  - add file to package/itstool/Config.in.host
  - change commit log messages

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in.host         |  1 +
 package/itstool/Config.in.host | 11 +++++++++++
 package/itstool/itstool.hash   |  4 ++++
 package/itstool/itstool.mk     | 15 +++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/itstool/Config.in.host
 create mode 100644 package/itstool/itstool.hash
 create mode 100644 package/itstool/itstool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bc4027932c..688d3ebce2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2821,6 +2821,9 @@ F:	package/reproc/
 F:	package/termcolor/
 F:	package/tl-expected/
 
+N:	Takumi Takahashi <takumiiinn@gmail.com>
+F:	package/itstool/
+
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..6bc1857df2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -51,6 +51,7 @@ menu "Host utilities"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
+	source "package/itstool/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
diff --git a/package/itstool/Config.in.host b/package/itstool/Config.in.host
new file mode 100644
index 0000000000..c64bcddc6a
--- /dev/null
+++ b/package/itstool/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_ITSTOOL
+	bool "host itstool"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_LIBXML2
+	help
+	  ITS Tool allows you to translate your XML documents with
+	  PO files, using rules from the W3C Internationalization
+	  Tag Set (ITS) to determine what to translate and how to
+	  separate it into PO file messages.
+
+	  https://itstool.org/
diff --git a/package/itstool/itstool.hash b/package/itstool/itstool.hash
new file mode 100644
index 0000000000..7bd533c0d2
--- /dev/null
+++ b/package/itstool/itstool.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  fba78a37dc3535e4686c7f57407b97d03c676e3a57beac5fb2315162b0cc3176  itstool-2.0.7.tar.gz
+sha256  f907bf6e8a3f4911af6904597c9dcb6b415ab2facf8d403fa3c5afa1f533ab90  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL3
diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
new file mode 100644
index 0000000000..3b738c2f01
--- /dev/null
+++ b/package/itstool/itstool.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# itstool
+#
+################################################################################
+
+ITSTOOL_VERSION = 2.0.7
+ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
+ITSTOOL_LICENSE = GPL-3.0+
+ITSTOOL_LICENSE_FILES = COPYING COPYING.GPL3
+HOST_ITSTOOL_DEPENDENCIES = host-python3 host-libxml2
+
+ITSTOOL_AUTORECONF = YES
+
+$(eval $(host-autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
