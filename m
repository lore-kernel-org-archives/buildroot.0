Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B83C00528
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9D861107;
	Mon, 31 Jul 2023 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA9D861107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbGwK1HWYUud; Mon, 31 Jul 2023 20:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE072610E9;
	Mon, 31 Jul 2023 20:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE072610E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 366D91BF3B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F7C80FFE
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F7C80FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3I3Hxm4RqWX for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:49:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7711881366
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7711881366
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D3DEA4C068C;
 Mon, 31 Jul 2023 22:49:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38104)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQZpr-0007Gg-0o;
 Mon, 31 Jul 2023 22:49:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 22:49:46 +0200
Message-Id: <20230731204947.2275706-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690836587;
 bh=+eVfzbQDmzr67Gqj7ETncEruecYKB6RmB/I/ieJu0mw=;
 h=From:To:Cc:Subject:Date:From;
 b=KC0g3HpavoQK8CHDaGnxQibrhqXXPneX3g4/r+UzjN1DHJeBu1oGVO1d+OApUWiW9
 Uil/xRLv4FFyBtZQU5UJDLnHAdGBzHhhwCMzOH7VJST/RqR9T/F+zQAXNhYcLYGN4g
 O0YlNVL0HGgcIPCqhivl34Vrq9sfuC5oFNCuWYIwyo5oGViYYXV/lNWfZAQSEnd7rL
 pOUSBxy++LdfRVcSPA10TORWBDWvb+Ifo6y4wVCDooeWQGcrcJyoy1qi7jEpf3omVn
 r8MxhV25h+Wxjw0GQ6+NSjnZRw9MnOg5wT7uhEc8nWM3ABNPlftQ69KdRTFNxAqNFd
 54TI9iksFHSKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KC0g3Hpa
Subject: [Buildroot] [PATCH 1/2] package/sentry-cli: fix build with OpenSSL
 3.x
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/4e2/4e24cb67402bad35ab57833d72e6c857b3eb4e07/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...able-SSL-support-for-the-curl-module.patch | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch

diff --git a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch b/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
new file mode 100644
index 0000000000..e68401da78
--- /dev/null
+++ b/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
@@ -0,0 +1,62 @@
+From a3754088b4cf7d19ff4f9a98412dd132d5baf1c1 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 31 Jul 2023 22:34:04 +0200
+Subject: [PATCH] Disable SSL support for the curl module
+
+Fixes build with OpenSSL v3.
+
+Downloaded Cargo.toml patch from
+https://cgit.freebsd.org/ports/tree/devel/sentry-cli/files/patch-Cargo.toml
+
+Upstream: https://github.com/getsentry/sentry-cli/issues/1706
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Cargo.lock | 10 ----------
+ Cargo.toml |  2 +-
+ 2 files changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index 75e1c8c..5121211 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -1557,15 +1557,6 @@ version = "0.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
+ 
+-[[package]]
+-name = "openssl-src"
+-version = "111.22.0+1.1.1q"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "8f31f0d509d1c1ae9cada2f9539ff8f37933831fd5098879e482aa687d659853"
+-dependencies = [
+- "cc",
+-]
+-
+ [[package]]
+ name = "openssl-sys"
+ version = "0.9.74"
+@@ -1575,7 +1566,6 @@ dependencies = [
+  "autocfg",
+  "cc",
+  "libc",
+- "openssl-src",
+  "pkg-config",
+  "vcpkg",
+ ]
+diff --git a/Cargo.toml b/Cargo.toml
+index abd6839..ddc141f 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -19,7 +19,7 @@ clap = { version = "3.2.22", default-features = false, features = [
+   "wrap_help",
+ ] }
+ console = "0.15.2"
+-curl = { version = "0.4.44", features = ["static-curl", "static-ssl"] }
++curl = { version = "0.4.44" }
+ dirs = "4.0.0"
+ dotenv = "0.15.0"
+ elementtree = "1.2.2"
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
