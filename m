From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:14:00 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] wireguard: bump to
 0.0.20180708
Message-ID: <20180719180927.2666188FB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebd0d3f806e9e7ee8dccf91a7ebd3e498d0c3f3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

* chacha20poly1305: use slow crypto on -rt kernels on arm too

Leftover from the last commit of the previous snapshot that we forgot to
handle.

* tools: getentropy requires macOS 10.12

Small build time fixup for old versions of macOS.

* queueing: remove useless spinlocks on sc
* queueing: re-enable preemption periodically to lower latency
* simd: encapsulate fpu amortization into nice functions
* simd: no need to restore fpu state when no preemption

This will improve general system latency on preempt-enabled systems, like
desktops.

* dns-hatchet: apply resolv.conf's selinux context to new resolv.conf

Fixes wg-quick's dns hatchet on CentOS.

* qemu: bump default kernel

By bumping to 4.17.2, we actually uncovered a bug in the SLUB allocator, which
upstream is now fixing: https://lkml.org/lkml/2018/6/18/1407

* noise: take locks for ss precomputation
* netlink: maintain static_identity lock over entire private key update

Minor locking correctness fixes and optimizations.

* noise: wait for crng before taking locks

We now make sure that an outgoing packet which needs a potentially unseeded
rng won't block a call to wg(8), which takes similar locks for retrieving
data.

* receive: drop handshake packets if rng is not initialized

If the rng is unseeded, we drop incoming handshake packets, so that it's not
possible for an attacker to fill the handshake queue thereby provoking
cookies.

* ratelimiter: mitigate reference underflow
* ratelimiter: do not allow concurrent init and uninit

Minor correctness and hardening fixes, which don't fix anything particular in
WireGuard, but might be useful if our ratelimiter is ever used elsewhere.

* compat: use stabler lkml links
* poly1305: add missing string.h header

Minor fixups.

* receive: don't toggle bh

The last snapshot caused a big performance regression, which we partially
revert here. This general matter, though, will be revisited in the future,
perhaps by switching to NAPI.

* main: test poly1305 before chacha20poly1305
* poly1305: give linker the correct constant data section size

While the default bfd linker did the right thing, gold would sometimes merge
section incorrectly because of an incorrect section length field, resulting in
wrong calculations.

* simd: add missing header

Fixes a compile error on a few odd kernels.

* global: fix a few typos
* manpages: eliminate whitespace at the end of the line
* tools: fix misspelling of strchrnul in comment

Cosmetic fixups.

* global: use ktime boottime instead of jiffies
* global: use fast boottime instead of normal boottime
* compat: more robust ktime backport

We now use the equivalent of clock_gettime(CLOCK_BOOTTIME) for doing age
checks on time-limited objects, such as ephemeral keys, so that on systems
where we don't clear before sleep (like Android), we make sure to invalidate
the objects after the proper amount of time, taking into account time spent
asleep.

* wg-quick: android: prevent outgoing handshake packets from being dropped

Recent android phones block outgoing packets using iptables while the system
is asleep. This makes sense for most services, but not for a tunnel device
itself, so we work around this by inserting our own iptables rule.

* device: print daddr not saddr in missing peer error
* receive: style

Debug messages now make sense again.

* wg-quick: android: support excluding applications

Android now supports excluding certain apps (uids) from the tunnel.

* selftest: ratelimiter: improve chance of success via retry
* qemu: bump default kernel version
* qemu: decide debug kernel based on KERNEL_VERSION

Some improvements to our testing infrastructure.

* receive: use NAPI on the receive path

This is a big change that should both improve preemption latency (by not
disabling it unconditionally) and vastly improve rx performance on most
systems by using NAPI. The main purpose of this snapshot is to test out this
technique.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 150fa57ed0765e20a7199fa9743e56689d44d5d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-poly1305-add-missing-string.h-header.patch | 26 ----------------------
 package/wireguard/wireguard.hash                   |  4 ++--
 package/wireguard/wireguard.mk                     |  2 +-
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/wireguard/0001-poly1305-add-missing-string.h-header.patch b/package/wireguard/0001-poly1305-add-missing-string.h-header.patch
deleted file mode 100644
index 8f1bfecb5c..0000000000
--- a/package/wireguard/0001-poly1305-add-missing-string.h-header.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ed04799b1868f45e05d788e614b9b8cfa4fcab46 Mon Sep 17 00:00:00 2001
-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
-Date: Wed, 20 Jun 2018 14:55:24 +0200
-Subject: [PATCH] poly1305: add missing string.h header
-
-Reported-by: Peter Korsgaard <peter@korsgaard.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/crypto/poly1305.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/crypto/poly1305.c b/src/crypto/poly1305.c
-index 26af4ad..65a37d9 100644
---- a/src/crypto/poly1305.c
-+++ b/src/crypto/poly1305.c
-@@ -7,6 +7,7 @@
- #include "poly1305.h"
- 
- #include <linux/kernel.h>
-+#include <linux/string.h>
- 
- #if defined(CONFIG_X86_64)
- #include <asm/fpu/api.h>
--- 
-2.11.0
-
diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index f7c5e65475..d0cd65ad4f 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-June/002984.html
-sha256 c120cdedc3967dcb4ad5c1c7eadd2a1b04ef5dbf2fe60cc8e7c0db337bcda7dc  WireGuard-0.0.20180613.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-July/003112.html
+sha256 5e38d554f7d1e3a64e3a5319ca1a3b790c84ed89c896586c490a93ac1f953a91  WireGuard-0.0.20180708.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index e1c43beea7..cc8ad7c4cc 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180613
+WIREGUARD_VERSION = 0.0.20180708
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
