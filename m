Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC03C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 410D540465;
	Sun,  9 Jan 2022 10:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mw7n5I2RSZEC; Sun,  9 Jan 2022 10:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB8C404EF;
	Sun,  9 Jan 2022 10:29:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B82111BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A505B404EF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94TaJTdoIjoC for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:29:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91DDC40465
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4052482963; Sun,  9 Jan 2022 10:23:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 11:28:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfd1a31d0e590c8545df7159a9e61febbd220370
X-Git-Newrev: bf01e51f3c626c2235f587b561af4bfac192c05e
X-Patchwork-Hint: ignore
Message-Id: <20220109102332.4052482963@busybox.osuosl.org>
Subject: [Buildroot] [git commit] skeleton + init: prepare /run/lock and
 adjust compat symlinks
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf01e51f3c626c2235f587b561af4bfac192c05e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux distros changed /var/run and /var/lock to reside on an tmpfs in
/run a long time ago, and buildroot seems to agree by providing this
tmpfs on all supported init systems.

Packages on the other hand are currently free to either use /var/run
or /run, and similarly using /var/lock should be identical to the
replacement /run/lock.

This series aims to ensure that *if* /var/lock is needed, then
it will be a symlink to /run/lock. Allowing packages to continue
working and allowing them to migrate to using /run/lock.

If all relevant packages are fixed,
the compatibility symlinks in /var can be dropped.

Status before this patch:

*   Systemd

    /run will be mounted by PID1, /var/run will be recreated by
    /usr/lib/tmpfiles.d/var.conf.

    Creating /run/lock/subsys and the compatibility symlink is handled
    in /usr/lib/tmpfiles.d/legacy.conf.
    But this is *currently not installed* by Buildroot, see [1].

*   OpenRC

    Seems to check for existence of a /run directory and does all
    necessary setup.

*   SysV

    /var/lock is currently a symlink to /tmp.

*   Busybox

    Same as sysv (Buildroot uses the sysv skeleton)

Note that we create /run/lock/subsys, so sysv scrips could expect this
directory to exist. Apart from simplifying scripts, creating the dir
early as root adds some security.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/inittab                        |  1 +
 package/skeleton-init-openrc/skeleton/var/lock |  2 +-
 package/skeleton-init-sysv/skeleton/var/lock   |  2 +-
 package/sysvinit/inittab                       | 13 +++++++------
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index ff1725c775..f2b4df801b 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -18,6 +18,7 @@
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
+::sysinit:/bin/mkdir -p /run/lock/subsys
 ::sysinit:/sbin/swapon -a
 null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
 null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
diff --git a/package/skeleton-init-openrc/skeleton/var/lock b/package/skeleton-init-openrc/skeleton/var/lock
index 1431b0e432..386c09e727 120000
--- a/package/skeleton-init-openrc/skeleton/var/lock
+++ b/package/skeleton-init-openrc/skeleton/var/lock
@@ -1 +1 @@
-../tmp
\ No newline at end of file
+../run/lock
\ No newline at end of file
diff --git a/package/skeleton-init-sysv/skeleton/var/lock b/package/skeleton-init-sysv/skeleton/var/lock
index 1431b0e432..386c09e727 120000
--- a/package/skeleton-init-sysv/skeleton/var/lock
+++ b/package/skeleton-init-sysv/skeleton/var/lock
@@ -1 +1 @@
-../tmp
\ No newline at end of file
+../run/lock
\ No newline at end of file
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index a31471031f..afc28e6c03 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -8,12 +8,13 @@ si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -o remount,rw /
 si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 si3::sysinit:/bin/mount -a
-si4::sysinit:/sbin/swapon -a
-si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
-si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
-si7::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
-si8::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
-si9::sysinit:/bin/hostname -F /etc/hostname
+si4::sysinit:/bin/mkdir -p /run/lock/subsys
+si5::sysinit:/sbin/swapon -a
+si6::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
+si7::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
+si8::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
+si9::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
+si10::sysinit:/bin/hostname -F /etc/hostname
 rcS:12345:wait:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
