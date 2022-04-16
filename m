Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE442C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 13:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85DA7409F3;
	Sat, 16 Apr 2022 13:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi2fqMiSYgvk; Sat, 16 Apr 2022 13:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76157409E3;
	Sat, 16 Apr 2022 13:48:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E42C1BF963
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59F57409DE
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysa-HdM0FIX9 for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 13:47:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3549409DD
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 13:47:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 67E2D83BAE; Sat, 16 Apr 2022 13:37:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 15:44:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87b8676fbfe57253696864cc3bf20e85852b9c8b
X-Git-Newrev: e65e9acb201ba2cf3f1b0b209b45d557577d8044
X-Patchwork-Hint: ignore
Message-Id: <20220416133759.67E2D83BAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/urandom-scripts: do not seed if
 initial seed doesn't exist
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

commit: https://git.buildroot.net/buildroot/commit/?id=e65e9acb201ba2cf3f1b0b209b45d557577d8044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By returning a failure in the event that the initial seed doesn't exist,
we'd then skip creating a new seed, which means we'd never in fact have
an initial seed, and this script is therefore useless. Fix this by
checking for the existence of the seed file first, and just returning 0
if it's not there.

Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
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
