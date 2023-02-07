Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14848C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1BBF70015;
	Tue, 21 Feb 2023 01:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1BBF70015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIuawvWqaSbC; Tue, 21 Feb 2023 01:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9687B700E2;
	Tue, 21 Feb 2023 01:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9687B700E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 906A01BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA0BD6FFEF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0BD6FFEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aSOKgTbfBSF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B396FBE4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0B396FBE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3366828C8; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:03:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7231701a290ba447fde9807ba9d260022ddfc8e4
X-Git-Newrev: 4a6f9d2516820c296a8af788b259ca96926cd60d
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.C3366828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/urandom-scripts:
 actually credit seed files via seedrng
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a6f9d2516820c296a8af788b259ca96926cd60d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The RNG can't actually be seeded from a shell script, due to the
reliance on ioctls. For this reason, Busybox 1.36.0 contains SeedRNG, a
tiny program meant to be called at startup and shutdown (and at
arbitrary other points in between if desired). Note that initially,
the way seedrng was included in busybox broke things quite severely, but
now it's been reverted to a reasonably acceptable version.

This is a significant improvement over the current init script, which
doesn't credit entropy and whose hashing in shell scripts is sort of
fragile.

Because seedrng is part of busybox, urandom-scripts now depends on
BR2_PACKAGE_BUSYBOX. This can be removed again if later we add a
standalone seedrng package.

Add a decent explanation to the init script about the need for a
persistent directory to make this actually work.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[Arnout:
 - Remove busybox patch, it's now part of busybox 1.36.0.
 - Depend on busybox.
 - Fix shellcheck errors.
 - Use DAEMON and SEEDRNG_ARGS.
 - Don't bother with "seed_dir" and "skip_credit" variables.
 - Rename to S20seedrng.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/urandom-scripts/Config.in          |  5 +--
 package/urandom-scripts/S20seedrng         | 40 +++++++++++++++++
 package/urandom-scripts/S20urandom         | 70 ------------------------------
 package/urandom-scripts/urandom-scripts.mk |  4 +-
 4 files changed, 43 insertions(+), 76 deletions(-)

diff --git a/package/urandom-scripts/Config.in b/package/urandom-scripts/Config.in
index 987e442e22..6b4a609f95 100644
--- a/package/urandom-scripts/Config.in
+++ b/package/urandom-scripts/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_URANDOM_SCRIPTS
 	bool "urandom-initscripts"
 	default y if BR2_PACKAGE_INITSCRIPTS
+	depends on BR2_PACKAGE_BUSYBOX
 	depends on !BR2_PACKAGE_SYSTEMD
 	help
 	  Initscript to preserve the random seed between reboots.
-
-	  WARNING: this is a poor fit to try and get high-quality
-	  entropy at boot. There are better ways, like haveged, or
-	  rng-tools.
diff --git a/package/urandom-scripts/S20seedrng b/package/urandom-scripts/S20seedrng
new file mode 100644
index 0000000000..0fea0bea83
--- /dev/null
+++ b/package/urandom-scripts/S20seedrng
@@ -0,0 +1,40 @@
+#! /bin/sh
+#
+# Preserve the random seed between reboots. See urandom(4).
+#
+# This script can be called multiple times during operation (e.g. with
+# "reload" argument) to refresh the seed.
+
+# The following arguments can be added to SEEDRNG_ARGS in
+# /etc/default/seedrng:
+#   --seed-dir=/path/to/seed/directory
+#     Path to the directory where the seed and the lock files are stored.
+#     for optimal operation, this should be a persistent, writeable
+#     location. Default is /var/lib/seedrng
+#
+#  --skip-credit
+#     Set this to true only if you do not want seed files to actually
+#     credit the RNG, for example if you plan to replicate this file
+#     system image and do not have the wherewithal to first delete the
+#     contents of /var/lib/seedrng.
+#
+# Example:
+# SEEDRNG_ARGS="--seed-dir=/data/seedrng --skip-credit"
+#
+
+DAEMON="seedrng"
+SEEDRNG_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+case "$1" in
+	start|stop|restart|reload)
+		# Never fail, as this isn't worth making a fuss
+		# over if it doesn't go as planned.
+		# shellcheck disable=SC2086 # we need the word splitting
+		seedrng $SEEDRNG_ARGS || true;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
deleted file mode 100644
index 6c6aea9eee..0000000000
--- a/package/urandom-scripts/S20urandom
+++ /dev/null
@@ -1,70 +0,0 @@
-#! /bin/sh
-#
-# Preserve the random seed between reboots. See urandom(4).
-#
-
-# Quietly do nothing if /dev/urandom does not exist
-[ -c /dev/urandom ] || exit 0
-
-URANDOM_SEED="/var/lib/random-seed"
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/urandom" ] && . "/etc/default/urandom"
-
-if pool_bits=$(cat /proc/sys/kernel/random/poolsize 2> /dev/null); then
-	pool_size=$((pool_bits/8))
-else
-	pool_size=512
-fi
-
-init_rng() {
-	[ -f "$URANDOM_SEED" ] || return 0
-	printf 'Initializing random number generator: '
-	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-save_random_seed() {
-	printf 'Saving random seed: '
-	status=1
-	if touch "$URANDOM_SEED.new" 2> /dev/null; then
-		old_umask=$(umask)
-		umask 077
-		dd if=/dev/urandom of="$URANDOM_SEED.tmp" bs="$pool_size" count=1 2> /dev/null
-		cat "$URANDOM_SEED" "$URANDOM_SEED.tmp" 2>/dev/null \
-			| sha256sum \
-			| cut -d ' ' -f 1 > "$URANDOM_SEED.new" && \
-		mv "$URANDOM_SEED.new" "$URANDOM_SEED" && status=0
-		rm -f "$URANDOM_SEED.tmp"
-		umask "$old_umask"
-		if [ "$status" -eq 0 ]; then
-			echo "OK"
-		else
-			echo "FAIL"
-		fi
-
-	else
-		echo "SKIP (read-only file system detected)"
-	fi
-	return "$status"
-}
-
-case "$1" in
-	start|restart|reload)
-		# Carry a random seed from start-up to start-up
-		# Load and then save the whole entropy pool
-		init_rng && save_random_seed;;
-	stop)
-		# Carry a random seed from shut-down to start-up
-		# Save the whole entropy pool
-		save_random_seed;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 2c09728c46..32f3e09343 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20urandom \
-		$(TARGET_DIR)/etc/init.d/S20urandom
+	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20seedrng \
+		$(TARGET_DIR)/etc/init.d/S20seedrng
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
