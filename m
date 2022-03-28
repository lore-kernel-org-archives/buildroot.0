Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD43C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 13:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF9C60BCD;
	Mon, 28 Mar 2022 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rx6Z1LKxe0oc; Mon, 28 Mar 2022 13:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B662760B17;
	Mon, 28 Mar 2022 13:17:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6CD1BF297
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 13:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0937260B17
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 13:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2jWkCT6QLMk for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 13:17:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B7E607A3
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 13:17:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B77F85E9B; Mon, 28 Mar 2022 13:08:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 15:17:12 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 14d329ee1c52563d46165dadd06e923444a01594
X-Git-Newrev: afe309d54e5b63bb33dc84443345716dc8d6d2ea
X-Patchwork-Hint: ignore
Message-Id: <20220328130807.7B77F85E9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/urandom-scripts:
 hash old seed with new seed when saving
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

commit: https://git.buildroot.net/buildroot/commit/?id=afe309d54e5b63bb33dc84443345716dc8d6d2ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Writing into /dev/urandom doesn't actually credit any entropy bits. And
while it adds that data to the entropy pool, it won't actually be
immediately used when reading from /dev/urandom subsequently. This is
how the kernel's /dev/urandom has always worked, unfortunately.

As a result of this behavior, which may be understandably surprising,
writing a good seed file into /dev/urandom and then saving a new seed
file immediately after is dangerous, because the new seed file may wind
up being entirely deterministic, even if the old seed file was quite
good.

This has been fixed in systemd with
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
file, the RNDADDENTROPY ioctl must be used but there's currently no way
to do that from a shell script for now.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f0986de551f46e72268857fd817986e9be697cd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/urandom-scripts/S20urandom | 39 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
index e4fd125721..c6b2ebd48f 100644
--- a/package/urandom-scripts/S20urandom
+++ b/package/urandom-scripts/S20urandom
@@ -17,43 +17,38 @@ else
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
 	printf 'Saving random seed: '
-	if touch "$URANDOM_SEED" 2> /dev/null; then
+	status=1
+	if touch "$URANDOM_SEED.new" 2> /dev/null; then
 		old_umask=$(umask)
 		umask 077
-		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
-		status=$?
+		dd if=/dev/urandom of="$URANDOM_SEED.tmp" bs="$pool_size" count=1 2> /dev/null
+		cat "$URANDOM_SEED" "$URANDOM_SEED.tmp" 2>/dev/null \
+			| sha256sum \
+			| cut -d ' ' -f 1 > "$URANDOM_SEED.new" && \
+		mv "$URANDOM_SEED.new" "$URANDOM_SEED" && status=0
+		rm -f "$URANDOM_SEED.tmp"
 		umask "$old_umask"
 		if [ "$status" -eq 0 ]; then
 			echo "OK"
 		else
 			echo "FAIL"
 		fi
+
 	else
-		status=$?
 		echo "SKIP (read-only file system detected)"
 	fi
 	return "$status"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
