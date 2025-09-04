Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8535CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 862006060A;
	Thu,  4 Sep 2025 16:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZmBRk1fh9mP; Thu,  4 Sep 2025 16:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D23260609
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D23260609;
	Thu,  4 Sep 2025 16:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55F4C1137
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4624B605D0
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmxofIQhPqi0 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93DC9605DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93DC9605DB
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FE6F87F41; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:10:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b5e1205dca03f20225eb9ee9d185c35bf6af15f
X-Git-Newrev: 3618f6b6f97597623bd54946a9574820daa9c2fc
X-Patchwork-Hint: ignore
Message-Id: <20250904161210.8FE6F87F41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bat: fix build with GCC 15
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

commit: https://git.buildroot.net/buildroot/commit/?id=3618f6b6f97597623bd54946a9574820daa9c2fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bat pulls in the onig crate (version 6.4.0) through syntect with the
default "regex-onig" feature. This crate depends on the Oniguruma C
library (via onig_sys), which fails to build with GCC 15 due to C23
keyword conflicts. Newer versions of onig fix this issue, but bat
cannot directly update the onig version because it is pinned by syntect.

To resolve the build failure, apply a patch that replaces the
"regex-onig" feature with "regex-fancy" in bat's minimal-application
feature set. This switches bat to use the pure-Rust fancy-regex engine
instead of Oniguruma, avoiding the problematic onig_sys dependency.

Fixes:

  https://autobuild.buildroot.net/results/ecc/ecc3b0c83e691e9a8ed5c7ff9d0a92ee06409f20

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ex-onig-by-regex-fancy-in-minimal-applica.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
new file mode 100644
index 0000000000..de6a3fc70c
--- /dev/null
+++ b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
@@ -0,0 +1,47 @@
+From 9b6727df25e45222b3863dbe5f5bc58237b68ab9 Mon Sep 17 00:00:00 2001
+From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+Date: Tue, 2 Sep 2025 14:02:11 +0200
+Subject: [PATCH] Replace regex-onig by regex-fancy in minimal-application
+
+The default "application" feature enables "minimal-application", which
+in turn pulls in the "regex-onig" feature of syntect. This brings in the
+onig crate (version 6.4.0) and its dependency onig_sys, which fail to
+build with GCC 15 due to C23 keyword conflicts.
+
+It is not possible to simply update the onig crate from bat itself,
+since its version is pinned indirectly by syntect. To avoid this
+dependency and fix the build, replace "regex-onig" with "regex-fancy" in
+"minimal-application". This makes bat use the pure-Rust fancy-regex
+engine instead of Oniguruma, removing the need for onig_sys and allowing
+the package to build with GCC 15.
+
+There is an an ongoing discussion about removing Oniguruma from bat
+since Oniguruma has been declared archived:
+
+see https://github.com/sharkdp/bat/issues/3285
+
+The Upstream project for now is refusing to use fancy-regex as default.
+
+Upstream: not submitted
+
+Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+---
+ Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index 80d19321..93a07a1d 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -29,7 +29,7 @@ minimal-application = [
+     "clap",
+     "etcetera",
+     "paging",
+-    "regex-onig",
++    "regex-fancy",
+     "wild",
+ ]
+ git = ["git2"] # Support indicating git modifications
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
