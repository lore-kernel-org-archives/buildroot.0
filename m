From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:14:38 +0200
Subject: [Buildroot] [PATCH] wireguard: bump to 0.0.20180708
In-Reply-To: <20180710193554.4394-1-Jason@zx2c4.com> (Jason A. Donenfeld's
 message of "Tue, 10 Jul 2018 21:35:54 +0200")
References: <20180710193554.4394-1-Jason@zx2c4.com>
Message-ID: <87wotray9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > * chacha20poly1305: use slow crypto on -rt kernels on arm too
 > Leftover from the last commit of the previous snapshot that we forgot to
 > handle.

 > * tools: getentropy requires macOS 10.12

 > Small build time fixup for old versions of macOS.

 > * queueing: remove useless spinlocks on sc
 > * queueing: re-enable preemption periodically to lower latency
 > * simd: encapsulate fpu amortization into nice functions
 > * simd: no need to restore fpu state when no preemption

 > This will improve general system latency on preempt-enabled systems, like
 > desktops.

 > * dns-hatchet: apply resolv.conf's selinux context to new resolv.conf

 > Fixes wg-quick's dns hatchet on CentOS.

 > * qemu: bump default kernel

 > By bumping to 4.17.2, we actually uncovered a bug in the SLUB allocator, which
 > upstream is now fixing: https://lkml.org/lkml/2018/6/18/1407

 > * noise: take locks for ss precomputation
 > * netlink: maintain static_identity lock over entire private key update

 > Minor locking correctness fixes and optimizations.

 > * noise: wait for crng before taking locks

 > We now make sure that an outgoing packet which needs a potentially unseeded
 > rng won't block a call to wg(8), which takes similar locks for retrieving
 > data.

 > * receive: drop handshake packets if rng is not initialized

 > If the rng is unseeded, we drop incoming handshake packets, so that it's not
 > possible for an attacker to fill the handshake queue thereby provoking
 > cookies.

 > * ratelimiter: mitigate reference underflow
 > * ratelimiter: do not allow concurrent init and uninit

 > Minor correctness and hardening fixes, which don't fix anything particular in
 > WireGuard, but might be useful if our ratelimiter is ever used elsewhere.

 > * compat: use stabler lkml links
 > * poly1305: add missing string.h header

 > Minor fixups.

 > * receive: don't toggle bh

 > The last snapshot caused a big performance regression, which we partially
 > revert here. This general matter, though, will be revisited in the future,
 > perhaps by switching to NAPI.

 > * main: test poly1305 before chacha20poly1305
 > * poly1305: give linker the correct constant data section size

 > While the default bfd linker did the right thing, gold would sometimes merge
 > section incorrectly because of an incorrect section length field, resulting in
 > wrong calculations.

 > * simd: add missing header

 > Fixes a compile error on a few odd kernels.

 > * global: fix a few typos
 > * manpages: eliminate whitespace at the end of the line
 > * tools: fix misspelling of strchrnul in comment

 > Cosmetic fixups.

 > * global: use ktime boottime instead of jiffies
 > * global: use fast boottime instead of normal boottime
 > * compat: more robust ktime backport

 > We now use the equivalent of clock_gettime(CLOCK_BOOTTIME) for doing age
 > checks on time-limited objects, such as ephemeral keys, so that on systems
 > where we don't clear before sleep (like Android), we make sure to invalidate
 > the objects after the proper amount of time, taking into account time spent
 > asleep.

 > * wg-quick: android: prevent outgoing handshake packets from being dropped

 > Recent android phones block outgoing packets using iptables while the system
 > is asleep. This makes sense for most services, but not for a tunnel device
 > itself, so we work around this by inserting our own iptables rule.

 > * device: print daddr not saddr in missing peer error
 > * receive: style

 > Debug messages now make sense again.

 > * wg-quick: android: support excluding applications

 > Android now supports excluding certain apps (uids) from the tunnel.

 > * selftest: ratelimiter: improve chance of success via retry
 > * qemu: bump default kernel version
 > * qemu: decide debug kernel based on KERNEL_VERSION

 > Some improvements to our testing infrastructure.

 > * receive: use NAPI on the receive path

 > This is a big change that should both improve preemption latency (by not
 > disabling it unconditionally) and vastly improve rx performance on most
 > systems by using NAPI. The main purpose of this snapshot is to test out this
 > technique.

 > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
