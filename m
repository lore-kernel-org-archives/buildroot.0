Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F5AC87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 17:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD1D60F63;
	Sun, 10 Aug 2025 17:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shqZA_0qbjgj; Sun, 10 Aug 2025 17:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A892560F77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A892560F77;
	Sun, 10 Aug 2025 17:14:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F71B31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 719BA60F76
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXIIMAqL68Bk for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 17:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16E560F4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C16E560F4C
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:14:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC06687138; Sun, 10 Aug 2025 17:14:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 19:00:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bf9eae25ce67937b4b9de89f616a31e17c6327e
X-Git-Newrev: 681b34ea4d72a796d49005688edb1801ec555b96
X-Patchwork-Hint: ignore
Message-Id: <20250810171425.BC06687138@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/daemon: fix build with gcc 15 and
 musl libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=681b34ea4d72a796d49005688edb1801ec555b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

daemon provides its own getopt() declaration for non-GNU libcs. This
declaration is compatible with musl provided one with C standards before
C23. GCC 15 defaults to C23 that makes the empty params declaration
equivalent to getopt(void), which is incompatible with musl declaration.

Set C standard to gnu99 to restore the previous behaviour.

Fixes:
https://autobuild.buildroot.org/results/cc3311c86e2b14bf9a9c1ea00056e0b290ec11a3

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/daemon/daemon.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index d7709e03ef..03f2aad649 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -18,7 +18,8 @@ define DAEMON_CONFIGURE_CMDS
 endef
 
 define DAEMON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" -C $(@D)
 endef
 
 define DAEMON_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
