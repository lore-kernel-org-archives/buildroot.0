Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72F9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 05:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3781260B54;
	Tue, 29 Mar 2022 05:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0ZuRgAayKgR; Tue, 29 Mar 2022 05:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5B9160B2A;
	Tue, 29 Mar 2022 05:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1351BF33B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 05:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BE1A60B2A
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 05:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eWKxowfwlbJu for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 05:04:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9A7060AC2
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 05:04:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9982161457;
 Tue, 29 Mar 2022 05:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6298CC340ED;
 Tue, 29 Mar 2022 05:04:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Aiazy/Yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648530262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gmo9djS/kbmTWTq3g9jv9kdW7/9W4RrUZxaY+FSIh2Y=;
 b=Aiazy/YjY+xsB+Ju6K/pblNU9rMf7C4Vu4sptzRFztLdYZzDPOn72f+S5M5AW9AkuD7NO4
 xVlF2t9QQOv6/npOUSxdr91awkzMNnBryFpMcHngGia1Q2EumpBnZthiIqI4RAcVObU9n1
 3uftw6VcZZNgr7Dp+i3iBNtZm18dIrU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 010a0532
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 29 Mar 2022 05:04:22 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Date: Tue, 29 Mar 2022 01:04:01 -0400
Message-Id: <20220329050401.110856-1-Jason@zx2c4.com>
In-Reply-To: <20220327202415.1248312-1-Jason@zx2c4.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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

The RNG can't actually be seeded from a shell script, due to the
reliance on ioctls. For this reason, the seedrng project provides a
basic script meant to be copy and pasted into projects like buildroot
and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.

This commit imports it into buildroot and wires up the init scripts to
call it. This also is a significant improvement over the current init
script, which doesn't credit entropy and whose hashing in shell scripts
is sort of fragile.

As seedrng.c is a short tiny C program, we include this here in the
package, like a few other packages do. Later we'll investigate adding
this to busybox, but for now, this is a good start and a positive step
in the right direction.

Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Changes v2->v3:
- Some small fixes on the exit path to be a bit cleaner.

 package/urandom-scripts/Config.in          |   4 -
 package/urandom-scripts/S20urandom         |  64 +--
 package/urandom-scripts/seedrng.c          | 458 +++++++++++++++++++++
 package/urandom-scripts/urandom-scripts.mk |   6 +
 4 files changed, 482 insertions(+), 50 deletions(-)
 create mode 100644 package/urandom-scripts/seedrng.c

diff --git a/package/urandom-scripts/Config.in b/package/urandom-scripts/Config.in
index 987e442e22..070ffa5e9a 100644
--- a/package/urandom-scripts/Config.in
+++ b/package/urandom-scripts/Config.in
@@ -4,7 +4,3 @@ config BR2_PACKAGE_URANDOM_SCRIPTS
 	depends on !BR2_PACKAGE_SYSTEMD
 	help
 	  Initscript to preserve the random seed between reboots.
-
-	  WARNING: this is a poor fit to try and get high-quality
-	  entropy at boot. There are better ways, like haveged, or
-	  rng-tools.
diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
index c6b2ebd48f..1959fad93b 100644
--- a/package/urandom-scripts/S20urandom
+++ b/package/urandom-scripts/S20urandom
@@ -6,63 +6,35 @@
 # Quietly do nothing if /dev/urandom does not exist
 [ -c /dev/urandom ] || exit 0
 
-URANDOM_SEED="/var/lib/random-seed"
+# The following knobs can be adjusted by placing uncommented modified lines
+# into /etc/default/urandom:
+#
+# Set these to change where the seed and runtime lock file are stored:
+#
+#     export SEEDRNG_SEED_DIR=/var/lib/seedrng
+#     export SEEDRNG_LOCK_FILE=/var/run/seedrng.lock
+#
+# Set this to true only if you do not want seed files to actually credit the
+# RNG, for example if you plan to replicate this file system image and do not
+# have the wherewithal to first delete the contents of /var/lib/seedrng:
+#
+#     export SEEDRNG_SKIP_CREDIT=false
+#
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/urandom" ] && . "/etc/default/urandom"
 
-if pool_bits=$(cat /proc/sys/kernel/random/poolsize 2> /dev/null); then
-	pool_size=$((pool_bits/8))
-else
-	pool_size=512
-fi
-
-init_rng() {
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
 case "$1" in
 	start|restart|reload)
 		# Carry a random seed from start-up to start-up
 		# Load and then save the whole entropy pool
-		init_rng && save_random_seed;;
+		# Never fail, as this isn't worth making a fuss
+		# over if it doesn't go as planned.
+		seedrng || true;;
 	stop)
 		# Carry a random seed from shut-down to start-up
 		# Save the whole entropy pool
-		save_random_seed;;
+		seedrng;;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
diff --git a/package/urandom-scripts/seedrng.c b/package/urandom-scripts/seedrng.c
new file mode 100644
index 0000000000..2a9df3c914
--- /dev/null
+++ b/package/urandom-scripts/seedrng.c
@@ -0,0 +1,458 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT OR Apache-2.0)
+/*
+ * Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+ *
+ * This is based on code from <https://git.zx2c4.com/seedrng/about/>.
+ */
+
+#define _GNU_SOURCE
+#include <linux/random.h>
+#include <sys/random.h>
+#include <sys/ioctl.h>
+#include <sys/file.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <unistd.h>
+#include <time.h>
+#include <errno.h>
+#include <endian.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <string.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#ifndef GRND_INSECURE
+#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
+#endif
+
+
+static const char *SEED_DIR;
+static const char *LOCK_FILE;
+static char *CREDITABLE_SEED;
+static char *NON_CREDITABLE_SEED;
+
+enum blake2s_lengths {
+	BLAKE2S_BLOCK_LEN = 64,
+	BLAKE2S_HASH_LEN = 32,
+	BLAKE2S_KEY_LEN = 32
+};
+
+enum seedrng_lengths {
+	MAX_SEED_LEN = 512,
+	MIN_SEED_LEN = BLAKE2S_HASH_LEN
+};
+
+struct blake2s_state {
+	uint32_t h[8];
+	uint32_t t[2];
+	uint32_t f[2];
+	uint8_t buf[BLAKE2S_BLOCK_LEN];
+	unsigned int buflen;
+	unsigned int outlen;
+};
+
+#define le32_to_cpup(a) le32toh(*(a))
+#define cpu_to_le32(a) htole32(a)
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+#endif
+#ifndef DIV_ROUND_UP
+#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
+#endif
+
+static inline void cpu_to_le32_array(uint32_t *buf, unsigned int words)
+{
+        while (words--) {
+		*buf = cpu_to_le32(*buf);
+		++buf;
+	}
+}
+
+static inline void le32_to_cpu_array(uint32_t *buf, unsigned int words)
+{
+        while (words--) {
+		*buf = le32_to_cpup(buf);
+		++buf;
+        }
+}
+
+static inline uint32_t ror32(uint32_t word, unsigned int shift)
+{
+	return (word >> (shift & 31)) | (word << ((-shift) & 31));
+}
+
+static const uint32_t blake2s_iv[8] = {
+	0x6A09E667UL, 0xBB67AE85UL, 0x3C6EF372UL, 0xA54FF53AUL,
+	0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL
+};
+
+static const uint8_t blake2s_sigma[10][16] = {
+	{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
+	{ 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 },
+	{ 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4 },
+	{ 7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8 },
+	{ 9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13 },
+	{ 2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9 },
+	{ 12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11 },
+	{ 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
+	{ 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
+	{ 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 },
+};
+
+static void blake2s_set_lastblock(struct blake2s_state *state)
+{
+	state->f[0] = -1;
+}
+
+static void blake2s_increment_counter(struct blake2s_state *state, const uint32_t inc)
+{
+	state->t[0] += inc;
+	state->t[1] += (state->t[0] < inc);
+}
+
+static void blake2s_init_param(struct blake2s_state *state, const uint32_t param)
+{
+	int i;
+
+	memset(state, 0, sizeof(*state));
+	for (i = 0; i < 8; ++i)
+		state->h[i] = blake2s_iv[i];
+	state->h[0] ^= param;
+}
+
+static void blake2s_init(struct blake2s_state *state, const size_t outlen)
+{
+	blake2s_init_param(state, 0x01010000 | outlen);
+	state->outlen = outlen;
+}
+
+static void blake2s_compress(struct blake2s_state *state, const uint8_t *block, size_t nblocks, const uint32_t inc)
+{
+	uint32_t m[16];
+	uint32_t v[16];
+	int i;
+
+	while (nblocks > 0) {
+		blake2s_increment_counter(state, inc);
+		memcpy(m, block, BLAKE2S_BLOCK_LEN);
+		le32_to_cpu_array(m, ARRAY_SIZE(m));
+		memcpy(v, state->h, 32);
+		v[ 8] = blake2s_iv[0];
+		v[ 9] = blake2s_iv[1];
+		v[10] = blake2s_iv[2];
+		v[11] = blake2s_iv[3];
+		v[12] = blake2s_iv[4] ^ state->t[0];
+		v[13] = blake2s_iv[5] ^ state->t[1];
+		v[14] = blake2s_iv[6] ^ state->f[0];
+		v[15] = blake2s_iv[7] ^ state->f[1];
+
+#define G(r, i, a, b, c, d) do { \
+	a += b + m[blake2s_sigma[r][2 * i + 0]]; \
+	d = ror32(d ^ a, 16); \
+	c += d; \
+	b = ror32(b ^ c, 12); \
+	a += b + m[blake2s_sigma[r][2 * i + 1]]; \
+	d = ror32(d ^ a, 8); \
+	c += d; \
+	b = ror32(b ^ c, 7); \
+} while (0)
+
+#define ROUND(r) do { \
+	G(r, 0, v[0], v[ 4], v[ 8], v[12]); \
+	G(r, 1, v[1], v[ 5], v[ 9], v[13]); \
+	G(r, 2, v[2], v[ 6], v[10], v[14]); \
+	G(r, 3, v[3], v[ 7], v[11], v[15]); \
+	G(r, 4, v[0], v[ 5], v[10], v[15]); \
+	G(r, 5, v[1], v[ 6], v[11], v[12]); \
+	G(r, 6, v[2], v[ 7], v[ 8], v[13]); \
+	G(r, 7, v[3], v[ 4], v[ 9], v[14]); \
+} while (0)
+		ROUND(0);
+		ROUND(1);
+		ROUND(2);
+		ROUND(3);
+		ROUND(4);
+		ROUND(5);
+		ROUND(6);
+		ROUND(7);
+		ROUND(8);
+		ROUND(9);
+
+#undef G
+#undef ROUND
+
+		for (i = 0; i < 8; ++i)
+			state->h[i] ^= v[i] ^ v[i + 8];
+
+		block += BLAKE2S_BLOCK_LEN;
+		--nblocks;
+	}
+}
+
+static void blake2s_update(struct blake2s_state *state, const void *inp, size_t inlen)
+{
+	const size_t fill = BLAKE2S_BLOCK_LEN - state->buflen;
+	const uint8_t *in = inp;
+
+	if (!inlen)
+		return;
+	if (inlen > fill) {
+		memcpy(state->buf + state->buflen, in, fill);
+		blake2s_compress(state, state->buf, 1, BLAKE2S_BLOCK_LEN);
+		state->buflen = 0;
+		in += fill;
+		inlen -= fill;
+	}
+	if (inlen > BLAKE2S_BLOCK_LEN) {
+		const size_t nblocks = DIV_ROUND_UP(inlen, BLAKE2S_BLOCK_LEN);
+		blake2s_compress(state, in, nblocks - 1, BLAKE2S_BLOCK_LEN);
+		in += BLAKE2S_BLOCK_LEN * (nblocks - 1);
+		inlen -= BLAKE2S_BLOCK_LEN * (nblocks - 1);
+	}
+	memcpy(state->buf + state->buflen, in, inlen);
+	state->buflen += inlen;
+}
+
+static void blake2s_final(struct blake2s_state *state, uint8_t *out)
+{
+	blake2s_set_lastblock(state);
+	memset(state->buf + state->buflen, 0, BLAKE2S_BLOCK_LEN - state->buflen);
+	blake2s_compress(state, state->buf, 1, state->buflen);
+	cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));
+	memcpy(out, state->h, state->outlen);
+}
+
+static size_t determine_optimal_seed_len(void)
+{
+	size_t ret = 0;
+	char poolsize_str[11] = { 0 };
+	int fd = open("/proc/sys/kernel/random/poolsize", O_RDONLY);
+
+	if (fd < 0 || read(fd, poolsize_str, sizeof(poolsize_str) - 1) < 0) {
+		fprintf(stderr, "WARNING: Unable to determine pool size, falling back to %u bits: %s\n", MIN_SEED_LEN * 8, strerror(errno));
+		ret = MIN_SEED_LEN;
+	} else
+		ret = DIV_ROUND_UP(strtoul(poolsize_str, NULL, 10), 8);
+	if (fd >= 0)
+		close(fd);
+	if (ret < MIN_SEED_LEN)
+		ret = MIN_SEED_LEN;
+	else if (ret > MAX_SEED_LEN)
+		ret = MAX_SEED_LEN;
+	return ret;
+}
+
+static int read_new_seed(uint8_t *seed, size_t len, bool *is_creditable)
+{
+	ssize_t ret;
+	int urandom_fd;
+
+	*is_creditable = false;
+	ret = getrandom(seed, len, GRND_NONBLOCK);
+	if (ret == (ssize_t)len) {
+		*is_creditable = true;
+		return 0;
+	} else if (ret < 0 && errno == ENOSYS) {
+		struct pollfd random_fd = {
+			.fd = open("/dev/random", O_RDONLY),
+			.events = POLLIN
+		};
+		if (random_fd.fd < 0)
+			return -errno;
+		*is_creditable = poll(&random_fd, 1, 0) == 1;
+		close(random_fd.fd);
+	} else if (getrandom(seed, len, GRND_INSECURE) == (ssize_t)len)
+		return 0;
+	urandom_fd = open("/dev/urandom", O_RDONLY);
+	if (urandom_fd < 0)
+		return -errno;
+	ret = read(urandom_fd, seed, len);
+	if (ret == (ssize_t)len)
+		ret = 0;
+	else
+		ret = -errno ? -errno : -EIO;
+	close(urandom_fd);
+	return ret;
+}
+
+static int seed_rng(uint8_t *seed, size_t len, bool credit)
+{
+	struct {
+		int entropy_count;
+		int buf_size;
+		uint8_t buffer[MAX_SEED_LEN];
+	} req = {
+		.entropy_count = credit ? len * 8 : 0,
+		.buf_size = len
+	};
+	int random_fd, ret;
+
+	if (len > sizeof(req.buffer))
+		return -EFBIG;
+	memcpy(req.buffer, seed, len);
+
+	random_fd = open("/dev/random", O_RDWR);
+	if (random_fd < 0)
+		return -errno;
+	ret = ioctl(random_fd, RNDADDENTROPY, &req);
+	if (ret)
+		ret = -errno ? -errno : -EIO;
+	close(random_fd);
+	return ret;
+}
+
+static int seed_from_file_if_exists(const char *filename, bool credit, struct blake2s_state *hash)
+{
+	uint8_t seed[MAX_SEED_LEN];
+	ssize_t seed_len;
+	int fd, dfd, ret = 0;
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0 && errno == ENOENT)
+		return 0;
+	else if (fd < 0) {
+		ret = -errno;
+		fprintf(stderr, "ERROR: Unable to open seed file: %s\n", strerror(errno));
+		return ret;
+	}
+	dfd = open(SEED_DIR, O_DIRECTORY | O_RDONLY);
+	if (dfd < 0) {
+		ret = -errno;
+		close(fd);
+		fprintf(stderr, "ERROR: Unable to open seed directory: %s\n", strerror(errno));
+		return ret;
+	}
+	seed_len = read(fd, seed, sizeof(seed));
+	if (seed_len < 0) {
+		ret = -errno;
+		fprintf(stderr, "ERROR: Unable to read seed file: %s\n", strerror(errno));
+	}
+	close(fd);
+	if (ret) {
+		close(dfd);
+		return ret;
+	}
+	if ((unlink(filename) < 0 || fsync(dfd) < 0) && seed_len) {
+		ret = -errno;
+		fprintf(stderr, "ERROR: Unable to remove seed after reading, so not seeding: %s\n", strerror(errno));
+	}
+	close(dfd);
+	if (ret)
+		return ret;
+	if (!seed_len)
+		return 0;
+
+	blake2s_update(hash, &seed_len, sizeof(seed_len));
+	blake2s_update(hash, seed, seed_len);
+
+	fprintf(stdout, "Seeding %zd bits %s crediting\n", seed_len * 8, credit ? "and" : "without");
+	ret = seed_rng(seed, seed_len, credit);
+	if (ret < 0)
+		fprintf(stderr, "ERROR: Unable to seed: %s\n", strerror(-ret));
+	return ret;
+}
+
+static bool skip_credit(void)
+{
+	const char *skip = getenv("SEEDRNG_SKIP_CREDIT");
+	return skip && (!strcmp(skip, "1") || !strcasecmp(skip, "true") ||
+			!strcasecmp(skip, "yes") || !strcasecmp(skip, "y"));
+}
+
+static void populate_global_paths(void)
+{
+	SEED_DIR = getenv("SEEDRNG_SEED_DIR");
+	if (!SEED_DIR || !*SEED_DIR)
+		SEED_DIR = "/var/lib/seedrng";
+	LOCK_FILE = getenv("SEEDRNG_LOCK_FILE");
+	if (!LOCK_FILE || !*LOCK_FILE)
+		LOCK_FILE = "/var/run/seedrng.lock";
+	if (asprintf(&CREDITABLE_SEED, "%s/seed.credit", SEED_DIR) < 0 ||
+	    asprintf(&NON_CREDITABLE_SEED, "%s/seed.no-credit", SEED_DIR) < 0) {
+		fprintf(stderr, "ERROR: Unable to allocate paths: %s\n", strerror(errno));
+		exit(1);
+	}
+}
+
+int main(int argc __attribute__((unused)), char *argv[] __attribute__((unused)))
+{
+	static const char seedrng_prefix[] = "SeedRNG v1 Old+New Prefix";
+	static const char seedrng_failure[] = "SeedRNG v1 No New Seed Failure";
+	int ret, fd = -1, lock, program_ret = 0;
+	uint8_t new_seed[MAX_SEED_LEN];
+	size_t new_seed_len;
+	bool new_seed_creditable;
+	struct timespec realtime = { 0 }, boottime = { 0 };
+	struct blake2s_state hash;
+
+	umask(0077);
+	if (getuid()) {
+		fprintf(stderr, "ERROR: This program requires root\n");
+		return 1;
+	}
+
+	populate_global_paths();
+	blake2s_init(&hash, BLAKE2S_HASH_LEN);
+	blake2s_update(&hash, seedrng_prefix, strlen(seedrng_prefix));
+	clock_gettime(CLOCK_REALTIME, &realtime);
+	clock_gettime(CLOCK_BOOTTIME, &boottime);
+	blake2s_update(&hash, &realtime, sizeof(realtime));
+	blake2s_update(&hash, &boottime, sizeof(boottime));
+
+	if (mkdir(SEED_DIR, 0700) < 0 && errno != EEXIST) {
+		fprintf(stderr, "ERROR: Unable to create \"%s\" directory: %s\n", SEED_DIR, strerror(errno));
+		return 1;
+	}
+
+	lock = open(LOCK_FILE, O_WRONLY | O_CREAT, 0000);
+	if (lock < 0 || flock(lock, LOCK_EX) < 0) {
+		fprintf(stderr, "ERROR: Unable to open lock file: %s\n", strerror(errno));
+		program_ret = 1;
+		goto out;
+	}
+
+	ret = seed_from_file_if_exists(NON_CREDITABLE_SEED, false, &hash);
+	if (ret < 0)
+		program_ret |= 1 << 1;
+	ret = seed_from_file_if_exists(CREDITABLE_SEED, !skip_credit(), &hash);
+	if (ret < 0)
+		program_ret |= 1 << 2;
+
+	new_seed_len = determine_optimal_seed_len();
+	ret = read_new_seed(new_seed, new_seed_len, &new_seed_creditable);
+	if (ret < 0) {
+		fprintf(stderr, "ERROR: Unable to read new seed: %s\n", strerror(-ret));
+		new_seed_len = BLAKE2S_HASH_LEN;
+		strncpy((char *)new_seed, seedrng_failure, new_seed_len);
+		program_ret |= 1 << 3;
+	}
+	blake2s_update(&hash, &new_seed_len, sizeof(new_seed_len));
+	blake2s_update(&hash, new_seed, new_seed_len);
+	blake2s_final(&hash, new_seed + new_seed_len - BLAKE2S_HASH_LEN);
+
+	fprintf(stdout, "Saving %zu bits of %s seed for next boot\n", new_seed_len * 8, new_seed_creditable ? "creditable" : "non-creditable");
+	fd = open(NON_CREDITABLE_SEED, O_WRONLY | O_CREAT | O_TRUNC, 0400);
+	if (fd < 0) {
+		fprintf(stderr, "ERROR: Unable to open seed file for writing: %s\n", strerror(errno));
+		program_ret |= 1 << 4;
+		goto out;
+	}
+	if (write(fd, new_seed, new_seed_len) != (ssize_t)new_seed_len || fsync(fd) < 0) {
+		fprintf(stderr, "ERROR: Unable to write seed file: %s\n", strerror(errno));
+		program_ret |= 1 << 5;
+		goto out;
+	}
+	if (new_seed_creditable && rename(NON_CREDITABLE_SEED, CREDITABLE_SEED) < 0) {
+		fprintf(stderr, "WARNING: Unable to make new seed creditable: %s\n", strerror(errno));
+		program_ret |= 1 << 6;
+	}
+out:
+	if (fd >= 0)
+		close(fd);
+	if (lock >= 0)
+		close(lock);
+	return program_ret;
+}
diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 2c09728c46..e8526e248a 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -4,7 +4,13 @@
 #
 ################################################################################
 
+define URANDOM_SCRIPTS_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) -std=gnu99 $(TARGET_LDFLAGS) \
+		$(URANDOM_SCRIPTS_PKGDIR)/seedrng.c -o $(@D)/seedrng
+endef
+
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/seedrng $(TARGET_DIR)/sbin/seedrng
 	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20urandom \
 		$(TARGET_DIR)/etc/init.d/S20urandom
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
