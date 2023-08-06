Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBCBC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22AA44148D;
	Sun,  6 Aug 2023 14:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22AA44148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVISO09vziJF; Sun,  6 Aug 2023 14:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCA9414E4;
	Sun,  6 Aug 2023 14:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBCA9414E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30A7F1BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14EB8404D0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14EB8404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eI1bYjzMsL2T for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:28:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD9CB403CA
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD9CB403CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDA3E8448B; Sun,  6 Aug 2023 14:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:26:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dff67170f73959e6826ec3e87e892747f8d3a5fb
X-Git-Newrev: 961dc9d397c136181982a9c3add17f737e1b9e82
X-Patchwork-Hint: ignore
Message-Id: <20230806142816.BDA3E8448B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sentry-cli: fix build
 with OpenSSL 3.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=961dc9d397c136181982a9c3add17f737e1b9e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/4e2/4e24cb67402bad35ab57833d72e6c857b3eb4e07/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Disable-SSL-support-for-the-curl-module.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
