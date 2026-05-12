Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52915CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 17:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E02812E9;
	Tue, 12 May 2026 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLiOv7xqUuA7; Tue, 12 May 2026 17:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33F580EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778606047;
	bh=xOGtccLo28l943owOL6alDzI75fajndC/9uSydj44p4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B0uIIxorVHUsISSgAb7iglHS5rz/qw5QtAIBnIrqPGoTcSsMnab5eePLMu5TuDs37
	 7KthD+tI+dJrFfqYkCYbfSNPs3sNcRdfBBlogB1G6MfeRtYzYuL31IvjueM8czvUwT
	 23zj9XTa1ZZA7sQ97FYTe5VVB4p3/VH/cfJLQM3Cimy7yFYnaDjRrARvQL1rrVei3A
	 YfQz08QKv/tXT0Q1mKxcPUO12hc7O7HpgtyOkJ2y7N3WcZXfS7YXR8Q3ziqiMRqY6Z
	 JNQMEfw4eRJjsmyBKVl5Wh8XzvW/Po5tWe+W2Vkqw+auMkmG0mKjVGBbDutbd974SP
	 XOjvcrw9fiLrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33F580EBE;
	Tue, 12 May 2026 17:14:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECC93223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 17:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D28374067C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 17:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzmM4P983yB2 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 17:14:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D40C9406C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D40C9406C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D40C9406C7
 for <buildroot@buildroot.org>; Tue, 12 May 2026 17:14:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69443A4C0A3F;
 Tue, 12 May 2026 19:14:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49820)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMqgD-000000003og-0B3I;
 Tue, 12 May 2026 17:14:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Knight <james.knight@collins.com>
Date: Tue, 12 May 2026 19:14:00 +0200
Message-ID: <20260512171401.1972057-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778606041;
 bh=rCswRgHl0mTXoUKnJuW1ju08+C8AjU9oBtGCn3EwxSg=;
 h=From:To:Cc:Subject:Date:From;
 b=dI0MEJlLmvq4IFNC1u8zfZb5DpgT/JurQumgp5nBGOLz2EupXfRkOSb0/JtjKsY5B
 86Z4pER9Yi+59yGD9Ku7kmo9km5UKHB9oEHZm58Uqlqfqt5nGU39tkOBaILVAafwCm
 xwXqkduaaS0Dki5S9dD8zqWhszgkZ0/XsSzsyN9Dndu6YrTmGh54Y6PgQZIecGh0Sb
 qbilyhUxRC9xn0KJVqyJHbatRFplLBXd+WBd5949JNHom39ZS9Yyh7PiIYrd3vKlHi
 sleqmvcN4XgGqu4wHqz7wBazs40ciYzyxascPbX3/ltbvdBFdhvgDsj5rm00EBoVfN
 6QBBWuMILu5iA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dI0MEJlL
Subject: [Buildroot] [PATCH/next 1/1] package/libpqxx: bump version to 8.0.1
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

https://github.com/jtv/libpqxx/blob/8.0.1/NEWS

https://github.com/jtv/libpqxx/blob/8.0.1/UPGRADING.md
"You will need at least C++20 to compile libpqxx. Compiler support for
 C++20 does not need to be absolutely complete, but the basics must be
 there: concepts, ranges, spans, various utility functions in the
 standard library, the new object lifetime rules, and so on."

Raise minimum gcc version to 10 because concepts were implemented in gcc
10.x: https://en.cppreference.com/cpp/compiler_support#cpp20

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpqxx/Config.in    | 6 +++---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index 845692eae6..bbe29a9adf 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17/charconv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20 concepts
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++, gcc >= 9, threads"
+comment "libpqxx needs toolchain w/ C++, gcc >= 10, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 067a2c8d2a..ca26eec4cf 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e578677d0c1b0f7ad37ac2d9ac373bc9738a3732083c70672da5f2c3028e6b03  libpqxx-7.10.4.tar.gz
-sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
+sha256  24f878a1b4249035e4b6c07d49351506bf99f88df584d36bf198d58ebf293823  libpqxx-8.0.1.tar.gz
+sha256  b3410630dd87e37eb7a6e9c49eea2b3cf71f394e8921b7cd92ea2a42f9aea90f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 492370f7f5..f2b40e094c 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.10.4
+LIBPQXX_VERSION = 8.0.1
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
