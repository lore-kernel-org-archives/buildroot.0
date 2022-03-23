Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8472C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 03:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A9C41A19;
	Wed, 23 Mar 2022 03:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1Df-iyxlKKD; Wed, 23 Mar 2022 03:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493F241869;
	Wed, 23 Mar 2022 03:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3504F1BF27A
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 03:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23DCE41869
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 03:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPg1fXoxFxoR for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 03:52:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EF2841864
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 03:52:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71128B81AFE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 03:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC54C340E8
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 03:52:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Df9ot4jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648007557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=K3XVAd8wS1X1b7t2IWH/wkitfnvjz31KWnkUNlsn0/U=;
 b=Df9ot4jIo1imPh3HAi5+jxtBIC1MVwmID4ihDpvBDQFTDywc/u5UpkuOlLrHtjWrqKyK6d
 veefJ7S2aTkvn1OfF6iIbFBXrv7DPeqnqnT4uDXGFlcZGq8HghJ/kgtyALx5a4ELe5V+3+
 ompXx8Q9+7H1gXCKIEbYes4eNyzN3Mk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bbe5d32b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 23 Mar 2022 03:52:36 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 21:52:33 -0600
Message-Id: <20220323035233.140997-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/urandom-scripts: hash old seed with new
 seed when saving
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Writing into /dev/urandom doesn't actually credit any entropy bits. And
while it adds that data to the entropy pool, it won't actually be
immediately used when reading from /dev/urandom subsequently. This is
how the kernel's /dev/urandom has always worked, unfortunately.

As a result of this behavior, which may be understandably surprising to
you, writing a good seed file into /dev/urandom and then saving a new
seed file immediately after is dangerous, because the new seed file may
wind up being entirely deterministic, even if the old seed file was
quite good.

I fixed this in systemd with
<https://github.com/systemd/systemd/commit/da2862ef06f22fc8d31dafced6d2d6dc14f2ee0b>,
and fortunately it's possible to do the same thing in shell script here.
Specifically, instead of just saving new /dev/urandom output straight
up, we hash the new /dev/urandom together with the old seed, in order to
produce the new seed. This way the amount of entropy in the new seed
will stay the same or get better, but not appreciably regress.

At the same time, the pool size check in this script is useless. Writing
to /dev/urandom never credits bits anyway, so no matter what, writing
into /dev/urandom is useful and not harmful. There's also not much of a
point in seeding with more than 256 bits, which is what the hashing
operation above produces. So this commit removes the file size check.

As a final note, while this commit improves upon the status quo by
removing a vulnerability, this shell script still does not actually
initialize the RNG like it says it does. For initialization via a seed
file, the RNDADDENTROPY ioctl must be used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 package/urandom-scripts/S20urandom | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
index e4fd125721..f971ea905a 100644
--- a/package/urandom-scripts/S20urandom
+++ b/package/urandom-scripts/S20urandom
@@ -17,26 +17,16 @@ else
 	pool_size=512
 fi
 
-check_file_size() {
-	[ -f "$URANDOM_SEED" ] || return 1
-	# Try to read two blocks but exactly one will be read if the file has
-	# the correct size.
-	size=$(dd if="$URANDOM_SEED" bs="$pool_size" count=2 2> /dev/null | wc -c)
-	test "$size" -eq "$pool_size"
-}
-
 init_rng() {
-	if check_file_size; then
-		printf 'Initializing random number generator: '
-		dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
-		status=$?
-		if [ "$status" -eq 0 ]; then
-			echo "OK"
-		else
-			echo "FAIL"
-		fi
-		return "$status"
+	printf 'Initializing random number generator: '
+	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
 	fi
+	return "$status"
 }
 
 save_random_seed() {
@@ -44,7 +34,9 @@ save_random_seed() {
 	if touch "$URANDOM_SEED" 2> /dev/null; then
 		old_umask=$(umask)
 		umask 077
-		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
+		dd if=/dev/urandom of="$URANDOM_SEED.new" bs="$pool_size" count=1 2> /dev/null
+		cat "$URANDOM_SEED" "$URANDOM_SEED.new" 2>/dev/null | sha256sum | cut -d ' ' -f 1 > "$URANDOM_SEED"
+		rm "$URANDOM_SEED.new"
 		status=$?
 		umask "$old_umask"
 		if [ "$status" -eq 0 ]; then
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
