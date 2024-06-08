Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE2EC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 617DD60831;
	Sat,  8 Jun 2024 14:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Hws7vZf8n5F; Sat,  8 Jun 2024 14:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A896087E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A896087E;
	Sat,  8 Jun 2024 14:02:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16CF91BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 593DB607BC
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8KbpAQsXmPb for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70653607D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70653607D6
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67B17817DB; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:53:38 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2cd1932935a6cf3e405c83f3a21d663b938d778a
X-Git-Newrev: 70455e092e41d8d4118e27b382278055fd917092
X-Patchwork-Hint: ignore
Message-Id: <20240608140142.67B17817DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/putty: security
 bump to version 0.81
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70455e092e41d8d4118e27b382278055fd917092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The only change between 0.80 and 0.81 is one security fix:

 - ECDSA signatures using 521-bit keys (the NIST P521 curve, otherwise
   known as ecdsa-sha2-nistp521) were generated with biased random
   numbers. This permits an attacker in possession of a few dozen
   signatures to RECOVER THE PRIVATE KEY.

   Any 521-bit ECDSA private key that PuTTY or Pageant has used to
   sign anything should be considered compromised.

   This vulnerability has the identifier CVE-2024-31497.

Update hash of LICENCE file (update in year with
https://git.tartarus.org/?p=simon/putty.git;a=commit;h=f2f28ac0386eebbd45ea605818d31d62d219f589)

https://lists.tartarus.org/pipermail/putty-announce/2024/000038.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bd6fa8d13b69ca85cc1a9add538b94cf5e5cdb68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 84569a31e5..30b749c47b 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
 # Hashes from: http://the.earth.li/~sgtatham/putty/0.80/{sha1,sha256,sha512}sums
-sha1  9c4a96f63ee3e927472191c935cc89228693c03a  putty-0.80.tar.gz
-sha256  2013c83a721b1753529e9090f7c3830e8fe4c80a070ccce764539badb3f67081  putty-0.80.tar.gz
-sha512  c8a6b6fa54ecd8bcf4ec274fef51343dd9996e6458b250b5555c4dc88ded25e87f97277da482c29858510e65635112d541f559ab683635bd950572d850129f90  putty-0.80.tar.gz
+sha1  8c88d871855d3730a0473bb1cb1006654e73b680  putty-0.81.tar.gz
+sha256  cb8b00a94f453494e345a3df281d7a3ed26bb0dd7e36264f145206f8857639fe  putty-0.81.tar.gz
+sha512  d86f2fd0e126b18275d58cf64334b3b27c450899a1c2be2502de9faa2ef58f7fc8efc5d45f25c8395623f1e21917aa02407343bb2fee44c4c00b9f81267d5ecd  putty-0.81.tar.gz
 
 # Locally calculated
-sha256  7ede37f344ee03436c155a375ecb6cdb42a77105baa6e7804bf43260dc4a0c54  LICENCE
+sha256  e0410341c5e45f7479c28d79298edbf615589cdfc115b2d69683d4ccd0425ce0  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index bff6e78074..617518e647 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.80
+PUTTY_VERSION = 0.81
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
