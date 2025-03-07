Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0247C282DE
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 14:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 456C440852;
	Fri,  7 Mar 2025 14:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alg57hwe1pMk; Fri,  7 Mar 2025 14:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D7940C82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D7940C82;
	Fri,  7 Mar 2025 14:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8428B944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6781940F2A
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVOtfIpfECYX for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 14:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98E4B4060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E4B4060D
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98E4B4060D
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29EC01814B9; Fri,  7 Mar 2025 15:32:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  7 Mar 2025 15:32:09 +0100
Message-ID: <20250307143212.144351-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; t=1741357937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WeqiwWAXctvrCnhgGS63bBBmBBVGdCKhjvJFplffAgM=;
 b=athy0mFz3hy1EMCFP0F0JoF1pO0kKX7uQ78xV2dyJkPF1RcLAJDjLddkjeOalQpG9kKmDU
 3MlQPiq0qHt6fB0yMHqDUn0DYnBn0MuJgMnxI7bMlzt4HamAIBYCgAU0CdfWPjSwJDabjt
 C/0QC+StiYxqZ6Zxh+frqe+VIAtkkfo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=athy0mFz
Subject: [Buildroot] [PATCH] package/sqlite: json extension enabled by
 default
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since SQLite 3.38 [0] the JSON extension is enabled by default.
A new Option was introduced to actively disable the extension. [1]

I chose to deprecate the old option and replace it by one to disable it.
This should avoid breakage for setups where the json extension is used
but was never actively activated.

- drop BR2_PACKAGE_SQLITE_ENABLE_JSON1
- add BR2_PACKAGE_SQLITE_ENABLE_JSON1 to the deprecation list
- add new option BR2_PACKAGE_SQLITE_OMIT_JSON

[0] https://sqlite.org/releaselog/3_38_0.html
[1] https://sqlite.org/json1.html#compiling_in_json_support

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 Config.in.legacy         |  7 +++++++
 package/sqlite/Config.in | 12 ++++++------
 package/sqlite/sqlite.mk |  8 ++++----
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f94a7db7b0..c7d1c988a1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_SQLITE_ENABLE_JSON1
+	bool "Enable the JSON extensions for SQLite has been removed"
+	select BR2_LEGACY
+	help
+	  Since SQLite 3.38 the JSON Extension is enabled by default.
+	  Use BR2_PACKAGE_SQLITE_OMIT_JSON to disable it.
+
 config BR2_PACKAGE_ANGULARJS
 	bool "angularjs has been removed"
 	select BR2_LEGACY
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index ce1e369b20..69bc6916ab 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -30,12 +30,6 @@ config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	  http://www.sqlite.org/amalgamation.html), version 3 of the
 	  full-text search engine is added to the build automatically.
 
-config BR2_PACKAGE_SQLITE_ENABLE_JSON1
-	bool "Enable the JSON extensions for SQLite"
-	help
-	  When this option is defined in the amalgamation, the JSON
-	  extensions are added to the build automatically.
-
 config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 	bool "Enable sqlite3_unlock_notify() interface"
 	help
@@ -44,6 +38,12 @@ config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 	  http://www.sqlite.org/unlock_notify.html for additional
 	  information.
 
+config BR2_PACKAGE_SQLITE_OMIT_JSON
+	bool "Disable JSON support"
+	help
+	  This option disables the SQLite JSON support.
+	  https://sqlite.org/json1.html#compiling_in_json_support
+
 config BR2_PACKAGE_SQLITE_SECURE_DELETE
 	bool "Set the secure_delete pragma on by default"
 	help
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c8f12a427a..941eed0699 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -25,14 +25,14 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_OMIT_JSON),y)
+SQLITE_CFLAGS += -DSQLITE_OMIT_JSON
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
 SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
