Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D66C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 11:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0082260A9B;
	Mon, 14 Jul 2025 11:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6k8Nnh3jZtMG; Mon, 14 Jul 2025 11:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF8D608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF8D608A0;
	Mon, 14 Jul 2025 11:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCA70DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 11:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE3E240414
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 11:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frCdmqse9MsH for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 11:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E71964009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71964009E
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E71964009E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 11:38:10 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so4377026b3a.3
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 04:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752493090; x=1753097890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eh6LACzhXsQixN3bUxiGxO3/6B6XxRIHZSjtwQUgGOU=;
 b=lOrJhzKPyUnI2I1r8TCwnLe7D1dczT3AUQBTv8h4XXFq1id2T5h8mGqIWDwUzmQobF
 p6rOk0jWAL7K0eZSz2sQtWbbabXhZD0QG5QB2O01MbHcanQee8UGsgs+qOd/amuJ+I7B
 cW5nzpvXldKRBKLzxhoCaFtUnpB73Xquua1JjCoipcA6iYHhtSMhHS3cHUq8hq7Oggko
 6HSrhcrCRCABCAd2g20X/BfdETQdyKV7xGWtI/E15LTWRCLQgtcYn1QsaWj8mNAx0bR/
 2hMXBufCkNWBadlSb3Q40HnnOKKAt2j9TzauIBjxJzisOqRRaW5biK3ZWZzEgGEcdvWC
 EioQ==
X-Gm-Message-State: AOJu0Yy8i77QQel0z3i8CQFuHldmhnjpf3ghP6KUCnd14iKLvgjppzZ6
 cPAfMAQO8SSxstbueQw5PpEqCVbl8ibmWRj6op2lpkJsYT5FWw9gUzX2CNZ0/A==
X-Gm-Gg: ASbGncv8Qgw5sJPim0+9RsIfFCicbOFD4ZFkz9IrX3tWGPxpHs4ba769uLXKb9KQrX2
 YEkqe8wtUgGgSpq7wnW80otdz/sIUR/hCINLfThhdnwi/N59lIhZZdorJUwKwPf3kv1dShHsNol
 vVPI5Ly1GDRLeZogGojG54ey+QudYbLgD2osrSydi54ZsqLxeu8CDBA+7dhkJrYlRBSSbOr2Kok
 qcV7aPafDe/pp+YVmsLfNh/XbJ+GmCJxTLWyt//L2hD7ZqyjpnD1O176oaJp1urzQ2qVx238JsS
 ETP+DCXtnSQlwFudIKvTyVVATt2ZUUwzTRDQ7hvEypM0I4vAXCNpAXmYzozBXYWTut5KBR9bT7b
 ezKHRovI7CIgzHyMAego=
X-Google-Smtp-Source: AGHT+IESzkzGtWMrVrS3J4HTjPtszU9ivTVg3SMpwHXAU5URh6dxfyEM4wp32vh9zuimYEa1jCEO3w==
X-Received: by 2002:a05:6a21:7a44:b0:220:8ce7:d6b8 with SMTP id
 adf61e73a8af0-2314986baf0mr22258651637.37.1752493089731; 
 Mon, 14 Jul 2025 04:38:09 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6f4fc8sm10066120a12.51.2025.07.14.04.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:38:09 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Mon, 14 Jul 2025 19:37:53 +0800
Message-ID: <20250714113755.214202-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713040046.105851-1-fancp2007@gmail.com>
References: <20250713040046.105851-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752493090; x=1753097890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eh6LACzhXsQixN3bUxiGxO3/6B6XxRIHZSjtwQUgGOU=;
 b=mEe4rUhW1lb7j95XU/LvZORMtx4CpsffErDnTUfmtNuX0ReL15NSDtWLoe2ARh8z4c
 XoTvt8IEKRtzxnzg1fL25/XUXEH7gAuas/9BNAVDzX5yL2gDfhESlHEGvYrfjhk5y7hL
 tOUHwoL5aGs7jlmxT/A3WmSz1/x8rbCoPl5/OUts5CSbQeZDCIV9QpbXtIbJzraEGRyQ
 BrLxXC050aQUX/pQe6UJMmR4NRDWxlKVksDMXw5VQlL2c+uzW9TB0wwqu5zVDq3Rjo7X
 qas139zx7NOlCqhGtbebznxOXO9L704939eii8RxqPvPELaA4j3R7Jtt753VXKev0iGn
 JXMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mEe4rUhW
Subject: [Buildroot] [PATCH v2] package/chrony: bump to version 4.7
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

Release notes: https://chrony-project.org/news.html

Since this release, building without POSIX threads is no longer supported.
So add a depends on BR2_TOOLCHAIN_HAS_THREADS.

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - add toolchain threads dependency for pthread
---
 package/chrony/Config.in   | 5 +++++
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 453e4f6c3f..d08b0ba6e9 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CHRONY
 	bool "chrony"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Chrony is a pair of programs which are used to maintain the
@@ -18,3 +19,7 @@ config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
 	  not be compiled in.
 
 endif
+
+comment "chrony needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 25535e723e..75555fed9e 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
-sha256  571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  chrony-4.6.1.tar.gz
+# https://chrony-project.org/releases/chrony-4.7-tar-gz-asc.txt
+sha256  c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b  chrony-4.7.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 642e1d8fd6..f2aca81d60 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.6.1
+CHRONY_VERSION = 4.7
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
