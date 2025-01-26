Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C516EC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6F540E43;
	Sun, 26 Jan 2025 15:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xj3OEHKJ91Gw; Sun, 26 Jan 2025 15:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C7C540EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C7C540EC1;
	Sun, 26 Jan 2025 15:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B6F941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 758E180F7E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfUn0MYL5rMt for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FA1080F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA1080F74
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FA1080F74
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:48 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3ce4b009465so8861535ab.0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906467; x=1738511267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nauvZYbmk3f4GEiVFcCnLjHzq2itZmtWXhxv/a1jbtc=;
 b=BzeYTP/A5ZBKVq4SH0DnBLKpJnecSTy6Z7zSmc5fOzfbXiDVd6kObJcnhfwtZGjUh6
 FXKZkpajWGLTqc3kCE5tBwAlbjPaqHV3vn/BsAovzB3ovhDoS0/gOLW+A97czgl7eZiK
 AsgryKtctCK0QulRLXfO7JgvmM3v7SuzrAmz5v3RIrE+PUrlODGk+ApK0pro7D0MD5ev
 EwY3NRgMmtt7g+utFFq2GUiORQryXISsRtiGJ6/bGFAriq9Fa/o07iQrK1rstc48pwJH
 v7IgV8Q3s+tzn48Smd1Z905bMg5RYPCKwmrbRhnlx+wzByX0s77IPne8mogRdzH3mCm1
 8sJw==
X-Gm-Message-State: AOJu0YxuPLesforTAjxpLk+p8kRgcOsH909j8focJoK2w4OnUME9/6hP
 a8Tvn6bdT/Z3sVjDYdSBO06YWywP16szrXUpQHjqYGPXVt558R/gykb9K9DB
X-Gm-Gg: ASbGncs+XsSe1vxpe8d1d9D4aDOvKt8xSwCRt16etlgchSiMjUk0kaW79ZTi/X6Me5l
 Gn/q/aeZs6tFclzZ/GIXFniMqbkeL5js36mE3ow6AxYS1KGYKRg5/AvPjCCHYNRMQ6djb86jSjA
 YSOhtxh8M/OuB+YPgG9LO3OfMlmRoFvP7t90JBW+170mBk1waLL15rCCWiEeJ6kogDXPp6iQvt1
 0LqwL+6MXhQNry0TPTUxSZGz1IJUjbX/4V0ttegdJRztM3Mho1zaA0mUkZIYqYBkGVQnyynlixO
 NyC9Ol/hxXkUu8snX6cRXP/ZcyHK8+RmSy9rL5FeRFSBGEEc85ShIu4=
X-Google-Smtp-Source: AGHT+IGXW896y9phmAQATrWePgawN2E0K96CZS0itP8peE6ca2ZytnAqMSnSmfOlapx2nNi9JT1Dkw==
X-Received: by 2002:a05:6e02:1a67:b0:3ce:80b8:7328 with SMTP id
 e9e14a558f8ab-3cf743a9a61mr300809195ab.3.1737906467010; 
 Sun, 26 Jan 2025 07:47:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:27 -0700
Message-Id: <20250126154732.405055-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906467; x=1738511267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nauvZYbmk3f4GEiVFcCnLjHzq2itZmtWXhxv/a1jbtc=;
 b=jDycmRfuyZs/sp9fyIBvLIBS1N6OgU5TNzGQFFfygoERnFTxGmxxSWi6217eoczxX9
 nFi2RUGFPa9s1CRnfOCmAJsAMzdNi+lFjOTqIWXhU6Wera0XuHWwZl7zGQ9UUp30hP4f
 T7/ldR4traXahJxBHztl3gB9ZuPsCF3dzpUMFSqR232rCpRgZrsvZCKeAkwwGzpag8UO
 ULqdzhZYPIIgS09AM47T2g6ZVDF3IUYCP9fFUBKcywFc1iDQiRhdz5Fb7iO0k9o+eTYi
 GcDSOVSOAClCCtQMP0dAFF2oS/Xl9EOx8r+FkNVVkIFFq3WvUTC3G/7bjUsXzlOyv2hS
 qvZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jDycmRfu
Subject: [Buildroot] [PATCH v7 05/10] package/psimd: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/psimd/Config.in  |  6 ++++++
 package/psimd/psimd.hash |  4 ++++
 package/psimd/psimd.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/psimd/Config.in
 create mode 100644 package/psimd/psimd.hash
 create mode 100644 package/psimd/psimd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c3a348cf86..789e86ce3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
 
diff --git a/package/Config.in b/package/Config.in
index 13caddec34..beb6f08064 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2297,6 +2297,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/psimd/Config.in"
 	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
diff --git a/package/psimd/Config.in b/package/psimd/Config.in
new file mode 100644
index 0000000000..c5c51ca2ef
--- /dev/null
+++ b/package/psimd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PSIMD
+	bool "psimd"
+	help
+	  Portable 128-bit SIMD intrinsics.
+
+	  https://github.com/Maratyszcza/psimd
diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
new file mode 100644
index 0000000000..5692e79bd6
--- /dev/null
+++ b/package/psimd/psimd.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+# License files, locally calculated
+sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
new file mode 100644
index 0000000000..be0090a32f
--- /dev/null
+++ b/package/psimd/psimd.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# psimd
+#
+################################################################################
+
+PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
+PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_LICENSE = MIT
+PSIMD_LICENSE_FILES = LICENSE
+PSIMD_INSTALL_STAGING = YES
+# Only installs a header
+PSIMD_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
