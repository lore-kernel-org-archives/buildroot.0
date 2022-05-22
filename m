Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1415C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F0E60D5E;
	Sun, 22 May 2022 10:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaBUXBSCGheD; Sun, 22 May 2022 10:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF1F60C0F;
	Sun, 22 May 2022 10:24:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBD671BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C826825C7
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqqrIrpoNhji for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7ED82605
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B87E785FD4; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:11:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c47ac4aa466de8e8b6ffc592f5fffbef4c8b73e7
X-Git-Newrev: 8a2eb6ec69b6c0292b0a9c1bb487feed55d2a7f1
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.B87E785FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/urandom-scripts:
 do not seed if initial seed doesn't exist
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a2eb6ec69b6c0292b0a9c1bb487feed55d2a7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

By returning a failure in the event that the initial seed doesn't exist,
we'd then skip creating a new seed, which means we'd never in fact have
an initial seed, and this script is therefore useless. Fix this by
checking for the existence of the seed file first, and just returning 0
if it's not there.

Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e65e9acb201ba2cf3f1b0b209b45d557577d8044)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/urandom-scripts/S20urandom | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
index c6b2ebd48f..6c6aea9eee 100644
--- a/package/urandom-scripts/S20urandom
+++ b/package/urandom-scripts/S20urandom
@@ -18,6 +18,7 @@ else
 fi
 
 init_rng() {
+	[ -f "$URANDOM_SEED" ] || return 0
 	printf 'Initializing random number generator: '
 	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
 	status=$?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
