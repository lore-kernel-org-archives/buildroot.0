Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12331C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45824173D;
	Sun,  4 Feb 2024 15:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45824173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eUy-Hmyhj6u7; Sun,  4 Feb 2024 15:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D7B41735;
	Sun,  4 Feb 2024 15:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D7B41735
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2791BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74EFE4017A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74EFE4017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-PCedhNkUxU for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:09:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7764A4011F
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7764A4011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65B3C868FB; Sun,  4 Feb 2024 15:09:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 16:07:16 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 7964cf52a0f3137ca3359deef46bcd3e9472f504
X-Git-Newrev: 7d35d445a1ae2f9fe1682540159c2c32cb2114c1
X-Patchwork-Hint: ignore
Message-Id: <20240204150917.65B3C868FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/micropython: fix
 building after dropping GIT_DIR=. workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d35d445a1ae2f9fe1682540159c2c32cb2114c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The MICROPYTHON_MAKE_ENV variable contained two things;
  - the comon target environment variables CC, CFLAGS et al. defined in
    TARGET_MAKE_ENV,
  - the GIT_DIR workaround

Commit 9024e1866523 (package/micropython: drop GIT_DIR=. workaround)
totally dropped the assignment to MICROPYTHON_MAKE_ENV, but did not
replace its expansin with TARGET_MAKE_ENV.

This yields build error like:

    LINK build-standard/micropython
    arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib64/../lib64'

Fix this by expanding TARGET_MAKE_ENV in lieu of MICROPYTHON_MAKE_ENV.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6c9be611a8b7b4caac746920c08035761a9b9d9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 6e0af59f06..41bd32099b 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -37,13 +37,13 @@ MICROPYTHON_MAKE_OPTS += \
 	CWARN=
 
 define MICROPYTHON_BUILD_CMDS
-	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
-	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
 		$(MICROPYTHON_MAKE_OPTS)
 endef
 
 define MICROPYTHON_INSTALL_TARGET_CMDS
-	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
 		$(MICROPYTHON_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		PREFIX=/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
