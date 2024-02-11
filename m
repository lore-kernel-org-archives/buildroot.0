Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F59CC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A5D4025D;
	Sun, 11 Feb 2024 15:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JePPYKNyDGdH; Sun, 11 Feb 2024 15:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C6040414
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C6040414;
	Sun, 11 Feb 2024 15:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94D1F1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 808BE40414
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4v6_lmGVaXYt for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92387403CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92387403CA
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C9C28755D; Sun, 11 Feb 2024 15:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:11:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74ffd0a4df3f321b5d5ac6b14b52174b3e7ef2de
X-Git-Newrev: 79f38212c5fc95f64fc59c96b651024dc39cc0ae
X-Patchwork-Hint: ignore
Message-Id: <20240211151227.7C9C28755D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minisign: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=79f38212c5fc95f64fc59c96b651024dc39cc0ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit d90ac63d9b3448a239bb9aa8030326699a3fdc3d:
  Could NOT find Threads (missing: Threads_FOUND)

Fixes:
 - http://autobuild.buildroot.org/results/8d63a88291de945661a936d2437917a3428de276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minisign/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/minisign/Config.in b/package/minisign/Config.in
index b852903921..a211177925 100644
--- a/package/minisign/Config.in
+++ b/package/minisign/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MINISIGN
 	bool "minisign"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_LIBSODIUM_FULL
 	help
@@ -7,3 +8,6 @@ config BR2_PACKAGE_MINISIGN
 	  signatures.
 
 	  https://github.com/jedisct1/minisign
+
+comment "minisign needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
