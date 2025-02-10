Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556FC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149D184C07;
	Fri, 28 Feb 2025 17:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q6dBAjQZ6LJ; Fri, 28 Feb 2025 17:18:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BDD4857ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDD4857ED;
	Fri, 28 Feb 2025 17:18:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 050951DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2333A44C77
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loOwJCsM-dzv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E682642D4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E682642D4F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD836875EA; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Feb 2025 23:00:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7f432324bd48ec985465810f1ba72e25c6d769f9
X-Git-Newrev: 8b7982357728eeeaf7ce9992c5362bbfe429891e
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.DD836875EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go/go-bin:
 re-introduce go-src hash
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b7982357728eeeaf7ce9992c5362bbfe429891e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The commit b4006287f8 "package/go: security bump to version 1.23.6"
removed the go source from the go-bin package `.hash` file.
Since that commit, a number of autobuild errors for the host-go-bin
package started spawning during the 'legal-info' step.
Because the package 'go-bin' defines the '_ACTUAL_SOURCE_TARBALL'
variable the source hash is still required for the legal-info.

Similarly to the 'nodejs' package, the hash files for both the `go-bin`
and `go-src` package are shared in the `package/go` directory with the
help of a symbolic link used to make the subdirectories point to that
common `.hash` file.

Fixes:
https://autobuild.buildroot.org/results/337/33763441a065ddb07e944e26ad8f1f6d43b68592

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/go/go-bin/go-bin.hash              | 9 +--------
 package/go/go-src/go-src.hash              | 4 +---
 package/go/{go-bin/go-bin.hash => go.hash} | 1 +
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
deleted file mode 100644
index 50d2be239f..0000000000
--- a/package/go/go-bin/go-bin.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# sha256 checksum from https://go.dev/dl/
-sha256  e61f87693169c0bbcc43363128f1e929b9dff0b7f448573f1bdd4e4a0b9687ba  go1.23.6.linux-386.tar.gz
-sha256  9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d  go1.23.6.linux-amd64.tar.gz
-sha256  561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202  go1.23.6.linux-arm64.tar.gz
-sha256  27a4611010c16b8c4f37ade3aada55bd5781998f02f348b164302fd5eea4eb74  go1.23.6.linux-armv6l.tar.gz
-sha256  0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99  go1.23.6.linux-ppc64le.tar.gz
-sha256  321e7ed0d5416f731479c52fa7610b52b8079a8061967bd48cec6d66f671a60e  go1.23.6.linux-s390x.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
new file mode 120000
index 0000000000..0531a32c5c
--- /dev/null
+++ b/package/go/go-bin/go-bin.hash
@@ -0,0 +1 @@
+../go.hash
\ No newline at end of file
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
deleted file mode 100644
index b60995fedc..0000000000
--- a/package/go/go-src/go-src.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://go.dev/dl
-sha256  039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222  go1.23.6.src.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
new file mode 120000
index 0000000000..0531a32c5c
--- /dev/null
+++ b/package/go/go-src/go-src.hash
@@ -0,0 +1 @@
+../go.hash
\ No newline at end of file
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go.hash
similarity index 88%
copy from package/go/go-bin/go-bin.hash
copy to package/go/go.hash
index 50d2be239f..fd2cd71c59 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go.hash
@@ -1,4 +1,5 @@
 # sha256 checksum from https://go.dev/dl/
+sha256  039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222  go1.23.6.src.tar.gz
 sha256  e61f87693169c0bbcc43363128f1e929b9dff0b7f448573f1bdd4e4a0b9687ba  go1.23.6.linux-386.tar.gz
 sha256  9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d  go1.23.6.linux-amd64.tar.gz
 sha256  561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202  go1.23.6.linux-arm64.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
