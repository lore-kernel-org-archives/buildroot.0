Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F038ACAC5A5
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 06:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F26760F77;
	Fri, 19 Sep 2025 06:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VR_nnIPJ1DS7; Fri, 19 Sep 2025 06:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAFB460F60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFB460F60;
	Fri, 19 Sep 2025 06:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19830150
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C08440D7C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6chA9t7Tfsb for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 06:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D95CD40CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D95CD40CB3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D95CD40CB3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:53:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45df7dc1b98so10116305e9.1
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 23:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758264785; x=1758869585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PYe41yuLYfPYcghgFCWlLYJTJ8Gr/YNr8beK79CC6Ck=;
 b=ANQQK1n6Bhr222H01B49rer97ykvRvYNMjHYIM2kRdI6cdSnmIXydq1gt7e+HrWI5c
 lnFOUI3qMWyV3zvG8bHeGsNUGwWpBNpCeM/zAnhged+wm7fyNr/nHQPr8yg1ryz0/uZB
 BJR5kG/LrTO52a5Ggh4ahLSHpWHxF/2XKi7dtMf7o0baUliYQn3pkmyCzovpjnzLFS2G
 Nh4BX+kY9pIRrtJfXLP+bSciV1TGU2/8RJrm94+1cwCO0JlDcj/x4pkUlgwjxz4I7wSs
 fwQmsJAyl4eztqI+biuwZYof0zazIveLsaFC69cW7pf7JTuhGLttXZspcX+9QUw3r4XF
 yoqQ==
X-Gm-Message-State: AOJu0YwBJ1m9Y1o7ktMXSRqGND0bZtnxyik8hhnvXYTCnZDup/ySL4F8
 gzKxXGvY5l9FJ755QYPYFhGOJFXnPIQZLQ5xiE2LPEI0tD8jTtL2qQNjlEuS6cu+A96bCgDOL3y
 DqrYEnMM=
X-Gm-Gg: ASbGnct5suNJy8eMtb8VNfs7uAriKAe4lFRXohWywbF7S2ZzdU3K9NeRqn8cpKhPmjn
 xivOa/7j7113Aofqxh3yNodmqgIIfj3jG9jrPHqE+E/eJy23LmX0QHo8TiuI2Xap52nfGMS7CI6
 9PKkUAQqd/7AducNMgefN/6FN3Q+x2WHigBQEdl+gmrjLcao52ENZsEJnG762rLkbDY03K6hVjB
 C4kz2K+OAvXwd6cqWrW5Tumj2CzxAtsqTvC1uNk5jY+jBWPE9TTjEQiZZ1xtO9RvzBJP/e8dubg
 3q5GO+9WgskJRI3KGsRXgBJG6U7fzmtWfqPEo8QwA7nZvlUpYVrYtmRkaywK/PCbZeuduTpn796
 yvWIIPRlbRSELWVc=
X-Google-Smtp-Source: AGHT+IG1C7eP2glkico7LfQwMy3EQqVE/TX2+X7UK1KmyaiCkD8Y6kHSZmVNsql4hgZUkg0qlFZyNA==
X-Received: by 2002:a05:600c:4e8c:b0:456:1824:4808 with SMTP id
 5b1f17b1804b1-467ebbc04a4mr10924065e9.32.1758264784798; 
 Thu, 18 Sep 2025 23:53:04 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f4f9f339sm82858895e9.14.2025.09.18.23.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 23:53:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 19 Sep 2025 08:53:02 +0200
Message-ID: <20250919065303.60285-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758264785; x=1758869585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PYe41yuLYfPYcghgFCWlLYJTJ8Gr/YNr8beK79CC6Ck=;
 b=SEL4Zh8IfCrYkuNSs1lPHgjPCRDrFMP8qsji6qEo12ZLqtmwG1TJhfv1IeA42Vo0AT
 a+59eezw2vYX2KG1xtjTPfMj+I02ef4zC/eJAviZZV994oljImk+cW3ZRIJhkeX8PRui
 iwmIFMaTP8+7DkkeCbHGH/uSeWT+bhnFVHFuDx+CchF7ZXAnJ+1N6uw1xCs3YTaVrDrd
 MB+3i51kOax9abcyqW5SRC+S4/gld3a9EIrPIrWKRCBzLf5+vmJ3hPI3fP9BG1rzVH00
 tzSf8MbK5Y1gDIFtAyVbwgwCsZEsaesWYfYnGCgHirlCUSByuQs+NLtIFcZjB439A3DI
 OPCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SEL4Zh8I
Subject: [Buildroot] [PATCH 1/2] package/poco: add patch for CVE-2025-6375
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:

- CVE-2025-6375:

A vulnerability was found in poco up to 1.14.1. It has been rated as
problematic. Affected by this issue is the function MultipartInputStream
of the file Net/src/MultipartReader.cpp. The manipulation leads to null
pointer dereference. The attack needs to be approached locally. The
exploit has been disclosed to the public and may be used. Upgrading to
version 1.14.2 is able to address this issue. The patch is identified as
6f2f85913c191ab9ddfb8fae781f5d66afccf3bf. It is recommended to upgrade
the affected component.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-6375
  - https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-SEGV-at-Net-src-MultipartReader-cpp.patch | 34 +++++++++++++++++++
 package/poco/poco.mk                          |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch

diff --git a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
new file mode 100644
index 0000000000..cfb22d690a
--- /dev/null
+++ b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
@@ -0,0 +1,34 @@
+From 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
+Date: Wed, 16 Apr 2025 09:15:33 +0200
+Subject: [PATCH] fix(Net): A SEGV at Net/src/MultipartReader.cpp:164:1 #4915
+ (move assertion out of ctor)
+
+Upstream: https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
+CVE: CVE-2025-6375
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ Net/src/MultipartReader.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Net/src/MultipartReader.cpp b/Net/src/MultipartReader.cpp
+index f3a2f2bba2..f4aa27dd86 100644
+--- a/Net/src/MultipartReader.cpp
++++ b/Net/src/MultipartReader.cpp
+@@ -36,7 +36,6 @@ MultipartStreamBuf::MultipartStreamBuf(std::istream& istr, const std::string& bo
+ 	_boundary(boundary),
+ 	_lastPart(false)
+ {
+-	poco_assert (!boundary.empty() && boundary.length() < STREAM_BUFFER_SIZE - 6);
+ }
+ 
+ 
+@@ -47,7 +46,7 @@ MultipartStreamBuf::~MultipartStreamBuf()
+ 
+ int MultipartStreamBuf::readFromDevice(char* buffer, std::streamsize length)
+ {
+-	poco_assert_dbg (length >= _boundary.length() + 6);
++	poco_assert (!_boundary.empty() && _boundary.length() < length - 6);
+ 
+ 	static const int eof = std::char_traits<char>::eof();
+ 	std::streambuf& buf = *_istr.rdbuf();
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index ee740b2377..f7d9cdc009 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,6 +11,9 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
+# 0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
+POCO_IGNORE_CVES += CVE-2025-6375
+
 POCO_DEPENDENCIES = \
 	pcre2 \
 	zlib \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
