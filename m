Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDA0E7E365
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C257A60876;
	Fri,  3 Apr 2026 10:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ba0pdzM7Vlsc; Fri,  3 Apr 2026 10:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFADE60883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775211660;
	bh=4P6EVfGhDW2VVGZaymDsO8oDJed1B/70g5vAhjXIQz4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s0U60/HLstTTObV8keWJce2M8+ic8Bcuv4P2BCyhqaCs7QEo2PDswnNsi76QMN1xb
	 aq2QeH9ETHoZcQkQrkxOlWc64BEn0Hoxu4G3PoX6obt2Mp7jHlSU1/GlV8sG7ERoWz
	 KDeCRw1gNORN5HA2zGDerH+1peFn6WfBlhXWMMNgSXcOvhKKNT9GfEX/+76W5RKgUy
	 Qd1CqLXdTypDEJLHsPM41nBpdRRGcTPd61WN0LpJpm4GmiwpkyZQb7zmow9qrDaKoe
	 fsavq0U7EVuQasNF68v8DITTCN0Mzaemzr9X8NwGHsuUcjjQUHVJcoTWqn33C9MvkK
	 LBUFBKQo3jRXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFADE60883;
	Fri,  3 Apr 2026 10:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 142141A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED99C60883
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz5wEvIbS2O1 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 532C060876
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 532C060876
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 532C060876
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:20:58 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-35c206f0481so1616000a91.0
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775211657; x=1775816457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFftF1M2s2nRsWRZ1pc6Hwz3KbCMK+52xOrp4DRKDbY=;
 b=HVYcXJyP7CeFJ0d5Rx6eJT5bM6jNSoklE//QHhm+jIf9cplsYIchUkslJ9mzivQIC5
 t4lb7I62evt7g3yylpq5GhuJ5G7hcnrIxDYJFRCWFu8iKOxgtfJxh4uDXBfuaS3DIifa
 UkUiuWBfEFZzW18sguwYo3kxLj6Dgtqw0yZmM+TCjZps6av+ky2MTS1ZeND2rOYT9gcH
 F2yxUoO2YDNWtaf8114qTHxahdFOXMjExBqKtfOL6zwyK4DApT/CTgF10DLlOU5BBoy5
 ENVQ9yXcX4ClTDcFNynwnBIogRgSRVLp1iUIIByk20PtAysTfuY+x2G7cXmlug0eQ0Hg
 THpg==
X-Gm-Message-State: AOJu0YyEqp3zw5Dmh2ZxKbc3Rvt8aPwOiFW4uyX5nahjN0ysn+kL6DZ+
 XBBbfjxO0SJH4nmfYmqgX5ckwJSNfZfDnLNC+DNEUPRKFo0QsiqN5BuJ651puA==
X-Gm-Gg: AeBDiesJaanz15emwJSdl0jo4pumknvkmiEJddzoRRleR7UaucoAkX/X9ZU5rYCmj6+
 8moMq/KhB2DYJ4ewMW5T7+tsmPzREh+6ySwiEhWMjoN/KDQ07EwO+5rvI3Eb1/COgg/27RMqH6u
 kLkRmLEUoqZqS5jk5es4eB3pJ+rxcq4l8VcmLs/RWSxtpin+CI2smlLwHEZyHV+OmwqZaQYr28N
 yd2OdXt9av9IJI7jdCqPOYVBPi6WXlM4+2wvy5rOfxD0mrcmtbwp1ykUephfjyhZc25FpS+euZ7
 OprZ/kfWQUqxJz/LLoLKdUFNOqfCjvtfKhl7VqFBlMpYUlkUfjo6/xS3tsjNqpizYJEdSU+J8Es
 ljkHopjpMJsTehbGWXGRih+JT7Z28OovNyZFP6eWLIEM9RXmdPJvQi6jGo8yXE7Q76cjeenc9WW
 3G8OpLDW9QMU3qonz8UD9aWx7UdIRlMomSthI=
X-Received: by 2002:a17:90b:35c8:b0:35b:ea35:c3ce with SMTP id
 98e67ed59e1d1-35de6952e00mr2223874a91.27.1775211657137; 
 Fri, 03 Apr 2026 03:20:57 -0700 (PDT)
Received: from fedora ([2409:4064:2d9c:554:d9db:ca4d:ea7f:ffa9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dd367c142sm5339103a91.11.2026.04.03.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:20:56 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Ayoub Zaki <ayoub.zaki@embetrix.com>
Date: Fri,  3 Apr 2026 15:50:39 +0530
Message-ID: <20260403102040.522314-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775211657; x=1775816457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xFftF1M2s2nRsWRZ1pc6Hwz3KbCMK+52xOrp4DRKDbY=;
 b=M3lNQ/tHRlkWXo+LrucO6k8srWtl31LRjCk8E+rlV7ZyYf8vO1rPqECRaGF3IZhOCl
 MwV9noqvNchM8PNGGCrEtrfcYwGk4Za/hpCG/B5v4d94Om8YtdXxXHTR7he67UWVRY0z
 iy3GofsM3NOU1mUZQQFgtxFtvOlxv6QeAWb2vJNukBJ8z3ZQ598ec6X15dJKwE8V/OS3
 apD/F9AreXJo2RAB3MJPMIk81GMwDNmD+cHHkVGhph3GnQ0AfoK1hxSdSwv59Qh2pvRG
 yihHf/QfCR2SqVFVROsqL120qaoJooHgfQs2/kDudj6NLFobnymBvXhMtcjjywTFs+LJ
 8WyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=M3lNQ/tH
Subject: [Buildroot] [PATCH] package/bmap-writer: fix static link with
 libarchive
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

Use a package patch to switch bmap-writer from CMake's
FindLibArchive module to pkg-config for libarchive.

In static Buildroot builds, FindLibArchive only links
libarchive itself. That drops libarchive's private
dependencies from the final link command and causes
undefined references to compression backends such as
zlib, bzip2, lz4, liblzma and zstd.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...ts.txt-use-pkg-config-for-libarchive.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.patch

diff --git a/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.patch b/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.patch
new file mode 100644
index 0000000000..bb2df1224b
--- /dev/null
+++ b/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.patch
@@ -0,0 +1,49 @@
+From 5931b090c7ebe61a1bbc9a3e3c58edae5e90d71b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Fri, 3 Apr 2026 14:33:19 +0530
+Subject: [PATCH] CMakeLists.txt: use pkg-config for libarchive
+
+CMake's FindLibArchive module only passes libarchive itself to the
+final link command.
+
+In static Buildroot builds that is not enough, because libarchive.a
+also needs its private compression backend dependencies such as zlib,
+bzip2, lz4, liblzma and zstd.
+
+Switch libarchive discovery to pkg-config so the link command includes
+the full static dependency list instead of just libarchive.
+---
+ CMakeLists.txt | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 787fc69..086b127 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,10 +19,10 @@ else()
+ endif()
+ 
+ 
+-# Find libarchive
+-find_package(LibArchive REQUIRED)
+-if (LibArchive_FOUND)
+-    include_directories(${LIBARCHIVE_INCLUDE_DIR})
++# Find libarchive via pkg-config so static builds pull in private libs too.
++pkg_check_modules(LIBARCHIVE REQUIRED libarchive)
++if (LIBARCHIVE_FOUND)
++    include_directories(${LIBARCHIVE_INCLUDE_DIRS})
+ else()
+     message(FATAL_ERROR "libarchive not found")
+ endif()
+@@ -47,7 +47,7 @@ add_executable(bmap-writer bmap-writer.cpp sha256.cpp)
+ target_compile_options(bmap-writer PUBLIC -Wformat -Wformat-security -Wconversion -Wsign-conversion -pedantic -Werror)
+ 
+ # Link the libraries
+-target_link_libraries(bmap-writer ${TINYXML2_LIBRARIES} ${LibArchive_LIBRARIES})
++target_link_libraries(bmap-writer ${TINYXML2_LIBRARIES} ${LIBARCHIVE_LIBRARIES})
+ 
+ # Specify the install rules
+ install(TARGETS bmap-writer DESTINATION bin)
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
