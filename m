Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B741C28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 10:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0147640823;
	Wed, 12 Mar 2025 10:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lIQzMALfadD; Wed, 12 Mar 2025 10:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3C0407DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3C0407DE;
	Wed, 12 Mar 2025 10:10:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEEDF943
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 10:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D64360BC5
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 10:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vie_43iOrBZV for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 10:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F4960B15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7F4960B15
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 10:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD5B787DE4; Wed, 12 Mar 2025 10:10:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Mar 2025 11:01:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ea3365b61045d3e41adf79b474993dbb28b7a00
X-Git-Newrev: b7f154eab797eb9e3f30ee364ec27fc3629e02d5
X-Patchwork-Hint: ignore
Message-Id: <20250312101013.AD5B787DE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: json extension enabled by
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7f154eab797eb9e3f30ee364ec27fc3629e02d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since SQLite 3.38 [0] the JSON extension is enabled by default.
A new Option was introduced to actively disable the extension. [1]

The JSON support is very small (<4%) compared to the rest of sqlite, so
enable it unconditionally:

-rwxr-xr-x 1 peko peko 1470368 Mar 12 10:50 output-without/target/usr/lib/libsqlite3.so.0.8.6
-rwxr-xr-x 1 peko peko 1530232 Mar 12 10:46 output-with/target/usr/lib/libsqlite3.so.0.8.6

E.G. a delta of 59864 bytes or 3.9%

[0] https://sqlite.org/releaselog/3_38_0.html
[1] https://sqlite.org/json1.html#compiling_in_json_support

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Peter: unconditionally include JSON support]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy         | 6 ++++++
 package/sqlite/Config.in | 6 ------
 package/sqlite/sqlite.mk | 4 ----
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f94a7db7b0..44ee749329 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_SQLITE_ENABLE_JSON1
+	bool "Enable the JSON extensions for SQLite has been removed"
+	select BR2_LEGACY
+	help
+	  Since SQLite 3.38 the JSON Extension is enabled by default.
+
 config BR2_PACKAGE_ANGULARJS
 	bool "angularjs has been removed"
 	select BR2_LEGACY
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index ce1e369b20..12fb8b9415 100644
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
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c8f12a427a..218b3f0a1d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -25,10 +25,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
