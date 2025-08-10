Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D43C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F080861044;
	Sun, 10 Aug 2025 20:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCfOIlXW7M9W; Sun, 10 Aug 2025 20:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC7561038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC7561038;
	Sun, 10 Aug 2025 20:04:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C73F631
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADDA440F56
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvP6EJ2d_wp8 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08DE040F5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08DE040F5F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA1248616A; Sun, 10 Aug 2025 20:04:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 21:58:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50cac72f73f7eee9136aa9cc48dbd5a5a12a0625
X-Git-Newrev: e58b052072a072618d7afbf986b87b0eb13bed1d
X-Patchwork-Hint: ignore
Message-Id: <20250810200448.EA1248616A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=e58b052072a072618d7afbf986b87b0eb13bed1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This issue has been fixed in the Bootlin toolchains thanks to the
Microblaze "atomic fix" in GCC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 502411d4cc..42e1c995f5 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -479,11 +479,6 @@ def get_toolchains():
                 variant = "bleeding-edge"
                 version = parts[2][len("bleeding-edge-"):]
 
-            # GCC 14.x on Microblaze is very broken, see
-            # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-            if arch in ["microblazeel", "microblazebe"] and variant == "bleeding-edge":
-                continue
-
             tmp[(arch, libc, variant)] = version
 
         if len(tmp) == 0:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
