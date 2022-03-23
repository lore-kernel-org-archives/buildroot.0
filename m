Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D2DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A641184A92;
	Wed, 23 Mar 2022 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-dV72Q5OBDO; Wed, 23 Mar 2022 20:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A689584A86;
	Wed, 23 Mar 2022 20:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F2411BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EF0B41B68
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1r3jlJ72XZO for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AB2141B2D
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34AF961529;
 Wed, 23 Mar 2022 20:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48225C340E8;
 Wed, 23 Mar 2022 20:07:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="j2yyBwKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648066056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Afpa0sbRB+bG9tKIXmIHmyIZvJmKFcpJfZENXc8vL6g=;
 b=j2yyBwKVLp2ZyTAgogWi9YlphDYXUOzWfVsq+3Wc/w4PpSKWvAc2zb+DfSRxA0rxsf+C5l
 Q9Vce63coI44UgM06WI/NdXghU4gEuXUcOOeRRCz7MxTegPisdobt13BkR3KTRUcAhZZgT
 JmA8/eod/k5S+MIIPuQJIpnJVY50P/g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba5c8568
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 23 Mar 2022 20:07:36 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: yann.morin.1998@free.fr,
	buildroot@buildroot.org
Date: Wed, 23 Mar 2022 14:07:31 -0600
Message-Id: <20220323200731.170409-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed with
 new seed when saving
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
file, the RNDADDENTROPY ioctl must be used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 package/urandom-scripts/S20urandom | 39 +++++++++++++-----------------
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
