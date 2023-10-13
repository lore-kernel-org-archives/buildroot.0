Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF09CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B4761504;
	Fri, 13 Oct 2023 10:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B4761504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5-leNWjFOkc; Fri, 13 Oct 2023 10:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C2561513;
	Fri, 13 Oct 2023 10:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C2561513
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A26981BF99A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86FC861518
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86FC861518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fb4IdAA9maPm for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A299B6F531
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A299B6F531
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B9D5846E4; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 12:13:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fd28c24131fc5471de3ef6776c11ace91f139987
X-Git-Newrev: 46ec2b32f74797f2f1c81a2445679b5b97ab7d63
X-Patchwork-Hint: ignore
Message-Id: <20231013102537.8B9D5846E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/urandom-scripts:
 move seedrng init script to S01
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

commit: https://git.buildroot.net/buildroot/commit/?id=46ec2b32f74797f2f1c81a2445679b5b97ab7d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

We want to initialize the kernel random number generator as soon as
possible, as early init scripts may also need random numbers (E.G.
syslog-ng in S01syslog-ng does).

Seedrng was presumably only using S20 because the previos urandom script
used S20, which (after som moves) dates all the way back to:

commit 8262508fc4456b5230216473ea14c897268ba791
Author: Eric Andersen <andersen@codepoet.org>
Date:   Fri Apr 26 22:01:43 2002 +0000

    With this update, everything now works as expected.
     -Erik

Seedrng needs persistent storage, but mount -a is run before executing the
init scripts, so S01 should be as good as S20 - Atleast with the scripts in
upstream Buildroot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11a46002ae11a0766a4ec9d3d8ccafe7be42c2fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/urandom-scripts/{S20seedrng => S01seedrng} | 0
 package/urandom-scripts/urandom-scripts.mk         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/urandom-scripts/S20seedrng b/package/urandom-scripts/S01seedrng
similarity index 100%
rename from package/urandom-scripts/S20seedrng
rename to package/urandom-scripts/S01seedrng
diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 32f3e09343..89abdfff72 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20seedrng \
-		$(TARGET_DIR)/etc/init.d/S20seedrng
+	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
+		$(TARGET_DIR)/etc/init.d/S01seedrng
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
