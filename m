Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D301EEC2B3
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 01:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC506086C;
	Tue, 24 Feb 2026 01:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roTh3VWWCXtI; Tue, 24 Feb 2026 01:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77331608B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771896235;
	bh=wBi+A0Gu7eptCQmgLErosp8Tyf85sEkIOjhcAIQnxcw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qQ9Lknj/6gdfVgHW3do9uh8tfbWCYdQ764QPQ2Qr6RMWLuha2fCVowXrIOh/ZOjlk
	 ipfkDQOP8i3fmFeBWgY0MB+J1BS1brZG7Vk1/GjnEQHQtIV4vUSzFX0JVSUI+CBYT2
	 rMtM9WyDjynU9+yBi/pmhg3D+WZv2W8M4T3J8GyxdOGg1UGP4HLTHbWeT0cVDcTfCP
	 hPS1QM4JHp2DkLdD0h7KTCZXbF28SAxqV2xTXFPNwTxE7BMFN2qXKeTNFyegNCXn9j
	 zVcYItjivFu4UCz7jLqNeozyxm4MjO3UKPsGBwrHPtEh4DfiG2pB3YvRXtD9nTe7Lg
	 UkTVFZLVDBrpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77331608B6;
	Tue, 24 Feb 2026 01:23:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC956249
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 01:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE261608EB
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 01:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b_KihGHenPh for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 01:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB5AA6086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB5AA6086C
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB5AA6086C
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 01:23:52 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8249fc726e9so2560779b3a.2
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 17:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771896232; x=1772501032;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oWre3E05vTBTBukCi1pBmdYd1ca9i33v95iTmHjqGE=;
 b=ZQKPwUdYxnh2X3alGcR7XDq65hSBNhMdW5ZruYj7YjaA0OrEieNXeoFL29xI567wCg
 S4hyGachy5Q8KXdooe8OMSE0fW4bqTsZTgjKmAFHvoAM96AH7AKmIEMm2JxtcwzN1oBq
 ODy8YvWKdNih4OkAmHSPN8tHpcjns/b9MASRjVE2cd0X2Io1wU1K4P+uLPdmMn7NFbfb
 q8xom101qRz21j85wgBI0eA4/Tpd2dHRkZLTZNSS6KgKqXb0c3xLc9iMF7cb0kp6ssS4
 Nb7iSBeL7adGQTBACf3gGSglEKI6DHeOii6mOVaKqwWOSKz/woUHQ4pgCOjnOCrWTyWS
 CuLQ==
X-Gm-Message-State: AOJu0Yzjy1a7bP7xzrYiNEriEzU61xvrWBsdWaG9uqTg92+9noq1ZHua
 /m9aMx26uG9qKOC14S9Yz4OudU0wiL5Yn9U85w8BAx+mSc2TRNwnJZIh
X-Gm-Gg: AZuq6aK+57ETF9SgK+j8dt23f0qJWexYhtsj6OxMWyuHQwV8mhR2Ce2JBpOof1gd3P6
 MMq9UEb6vIZBJnpqzpLadFj0HPxFCr9XaBHTTNBXBBjw4uyRN1Pxz9+EbJVpoZsv/X2v/7+zPYP
 BXHedWc3GL/x8j4nqDpNCx0eYFgF8odxfaFETPEC4gzRp3DuZ9z12W3NjXVGACpme+UFOa/PKT2
 qIv+5jg4Rs48AYhfdTcFgBggsvCUpUJKIIm7Z+74belX9T9BlHAvGqwpK0ZXWobQzg2afhAMMPr
 yoxZCDt3StS1Ix4c1bqDmiF8hN8J1PgvoNX+CqyNyJUlD4S1TcAF9p/bdFWGmjEMvl1c/QN+BOt
 OcpVFlKC1kDJ+fGlDvchTGV1k4Ua7Z3S/kgF9ZAumwb84K/QDoolGhnn4ri3ACydI5gLCJQLAJr
 p8H65qZr2HePiQ/kFjYnhyqkofvg==
X-Received: by 2002:a05:6a20:7488:b0:38d:ebdc:3555 with SMTP id
 adf61e73a8af0-39545fc606amr8973183637.66.1771896231907; 
 Mon, 23 Feb 2026 17:23:51 -0800 (PST)
Received: from wash-8.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70b725309bsm8664095a12.23.2026.02.23.17.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 17:23:51 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 23 Feb 2026 17:23:37 -0800
MIME-Version: 1.0
Message-Id: <20260223-llama-cpp-b8117-v2-1-9a2ef7e47bb1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQqDMBBFryJZd0oyErVd9R7FRRKnOqAxJCIW8
 e6N7rt88P77u0gUmZJ4FruItHLi2WfAWyHcYHxPwF1mgRIriShhHM1kwIUAtlGqBsKy09UDS1t
 qkVch0oe3q/huM1uTCGw03g1nx9O2nNrAaZnj9/pd1Sn/v1gVKEBJVUNG11LrVz8ZHu9unkR7H
 McPwO9axMUAAAA=
X-Change-ID: 20260220-llama-cpp-b8117-e23d56923b35
To: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771896231; l=3983;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=OYf2ndRlsiBGVBvzFb2NS+zGFGRaWdo77i2xwNoaHLQ=;
 b=HMgr2PR/5cPOOxZl6dv6YLw9LBSLVklNEPg7lvPEId2IrgUjfNlpkeXNwAvkMTgdOY9rWtO85
 2P3vqv3nAj0DI4XfYbRLbyClsYGV7rLJHJ04S6tjiwZfMIr7rxro0h/
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771896232; x=1772501032; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4oWre3E05vTBTBukCi1pBmdYd1ca9i33v95iTmHjqGE=;
 b=Nle//Nb76HOo384Yi16FF+j1EnOPwOamLG/IO0kRv0evMNkcxNbFYY9rEYHwxqWJtv
 7IDVD8KZekdCIAfgsWXrW51eC3334JO9RzRRzazmYwvx5uP8/Tht9opqK2clmVnDsGi5
 1sQie++GkMnwcVYVGzcuaNXv2a0QhnYl+eCJa1UvgYj65NaUGAQF5llNQaDQlUfHY9t7
 +6DkumFNqFWddpPX5hNhlee8cR2dzKPfMY5SQTXtx/8ABEgqchuajdRf2lU3e9YsRdKd
 Q72OtU2OCLj1AdfTSCKDwYDgCVlZlj9jQedaB0ERZHnrbnO6SUYxs2ot+odJElpgXoil
 95Ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nle//Nb7
Subject: [Buildroot] [PATCH v2] package/llama.cpp: bump to version b8117
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

Release notes: https://github.com/ggml-org/llama.cpp/releases

Merge BR2_PACKAGE_LLAMA_CPP_SERVER into BR2_PACKAGE_LLAMA_CPP_TOOLS, as
both of these options must be enabled to build tools like llama-cli and
llama-server.

https://github.com/ggml-org/llama.cpp/commit/a180ba78c710f52af7c7edee562fbe98c36d6ddd

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Changes in v2:
- Fix LICENSE hash
- Merge BR2_PACKAGE_LLAMA_CPP_SERVER into BR2_PACKAGE_LLAMA_CPP_TOOLS
- Deprecate BR2_PACKAGE_LLAMA_CPP_SERVER
- Link to v1: https://lore.kernel.org/r/20260220-llama-cpp-b8117-v1-1-20e68ea57055@gmail.com
---
 Config.in.legacy                 |  9 +++++++++
 package/llama-cpp/Config.in      |  8 ++------
 package/llama-cpp/llama-cpp.hash |  4 ++--
 package/llama-cpp/llama-cpp.mk   | 14 +++++---------
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4f5275b917..be32c1bca7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LLAMA_CPP_SERVER
+	bool "llama-cpp option removed"
+	select BR2_PACKAGE_LLAMA_CPP_TOOLS
+	select BR2_LEGACY
+	help
+	  Several tools (server, cli) now require building both
+	  tools and server, so enable both with the same config
+	  BR2_PACKAGE_LLAMA_CPP_TOOLS
+
 config BR2_BINUTILS_VERSION_2_43_X
 	bool "binutils 2.43 has been removed"
 	select BR2_LEGACY
diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
index c3eaa2a4ea..fa7da609de 100644
--- a/package/llama-cpp/Config.in
+++ b/package/llama-cpp/Config.in
@@ -25,12 +25,8 @@ if BR2_PACKAGE_LLAMA_CPP
 config BR2_PACKAGE_LLAMA_CPP_TOOLS
 	bool "Enable tools"
 	help
-	  Build CLI tools like llama-cli, llama-bench, etc.
-
-config BR2_PACKAGE_LLAMA_CPP_SERVER
-	bool "Enable server"
-	help
-	  Build OpenAI API-compatible web server, llama-server.
+	  Build CLI tools like llama-cli, llama-server, llama-bench,
+	  etc.
 
 config BR2_PACKAGE_LLAMA_CPP_VULKAN
 	bool "Vulkan support"
diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 765025f180..3967bc2fbc 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  b7271.tar.gz
+sha256  4f9fdf018339783722936d537573d40cca596262e42714f597b1c93299113cea  b8117.tar.gz
 # License
-sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
+sha256  94f29bbed6a22c35b992c5c6ebf0e7c92f13b836b90f36f461c9cf2f0f1d010d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index 5112022656..c450820747 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b7271
+LLAMA_CPP_VERSION = b8117
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
@@ -42,15 +42,11 @@ LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON \
+		       -DLLAMA_BUILD_SERVER=ON
 else
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON
-else
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=OFF
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF \
+		       -DLLAMA_BUILD_SERVER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)

---
base-commit: 6c83a0b8e5658b901dd35ae23217075f035af998
change-id: 20260220-llama-cpp-b8117-e23d56923b35

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
