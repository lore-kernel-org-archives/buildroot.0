Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94BFCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 734FF8437C;
	Wed,  5 Nov 2025 22:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5HrJzJglfcD; Wed,  5 Nov 2025 22:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BD8845D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BD8845D5;
	Wed,  5 Nov 2025 22:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06E31B00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218BA411D5
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tZXDgfo5IAl for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C1AD412C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C1AD412C2
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A54F83D96; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 812e7e43becbb8bea632016284ea641a3edd888b
X-Git-Newrev: 28694dcec72b11faca6e9d9371fb0f65c590de8b
X-Patchwork-Hint: ignore
Message-Id: <20251105222950.1A54F83D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/external: support merged-bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=28694dcec72b11faca6e9d9371fb0f65c590de8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When an external toolchain does not have a merged-bin, we can end up
with a situation where the toolchain installs an staging/usr/sbin/
directory, overriding the sbin symlink with an actual directory. When
not using PPD, this does not cause any harm.

However, with PPD, the build fails when preparing the staging (the
host/) for packages when the skeleton is eventually rsynced, e.g.:

    $ cat defconfig
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_INIT_NONE=y
    BR2_ROOTFS_MERGED_USR=y
    BR2_ROOTFS_MERGED_SBIN=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_ZLIB=y
    # BR2_TARGET_ROOTFS_TAR is not set

    $ make zlib
    [...]
    >>> zlib  Configuring
    mkdir -p [...]/per-package/zlib/host
    rsync -a --hard-links --link-dest=[...]/per-package/host-skeleton/host/ [...]/per-package/host-skeleton/host/ [...]/per-package/zlib/host
    rsync -a --hard-links --link-dest=[...]/per-package/libzlib/host/ [...]/per-package/libzlib/host/ [...]/per-package/zlib/host
    rsync -a --hard-links --link-dest=[...]/per-package/skeleton/host/ [...]/per-package/skeleton/host/ [...]/per-package/zlib/host
    could not make way for new symlink: aarch64-buildroot-linux-gnu/sysroot/usr/sbin
    cannot delete non-empty directory: aarch64-buildroot-linux-gnu/sysroot/usr/sbin
    rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1338) [sender=3.3.0]
    make[1]: *** [package/pkg-generic.mk:256: [...]/build/zlib/.stamp_configured] Error 23
    make: *** [Makefile:23: _all] Error 2

The root cause is that, in the skeleton, we end up with
[staging]/usr/sbin as a synlink to bin, but when the external toolchain
gets installed, the symlinbk is replaced by a directory. Later, when we
aggregate the PPD before configuring a package, it often happens that a
dependant package be rsynced before the toolchain and the skeleton, as
seen above, in which case the sbin directory from the toolchain, by way
of the dependency to a package, is already present when rsync wants to
create a symlink as rsynced from the skeleton.

In the example above, this plays in this order:

 1. skeleton gets installed, provides a symlink
 2. toolchain-external-bootlin rsyncs from skeleton, gets a symlink
 3. toolchain-external-bootlin gets installed, replaces symlink with a
    directory
 4. libzlib rsyncs from skeleton, gets a symlink, then rsyncs from
    toolchain-e-b, gets a directory
 5. zlib rsyncs from libzlib first (because alphabetical ordering), gets
    a directory, then rsyncs from skeleton, which rsyncs from a symlink,
    but the destination is a non-empty directory, so rsync fails.

It is perfectly legit that an external toolchain does not use a
merged-bin setup, so we must accept that as input. We do so by treating
the /usr/sbin entry specially, like we already do for a few others, of
which /sbin itself for example.

Note that the merged-usr setup has no issue, because we already handle
the lib*/ directories specially too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 toolchain/helpers.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07..21c710d0fb 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -96,6 +96,10 @@ copy_toolchain_lib_root = \
 # Note that the 'locale' directories are not copied. They are huge
 # (400+MB) in CodeSourcery toolchains, and they are not really useful.
 #
+# usr/sbin may be a directory in the source toolchain, but a symlink
+# in the destination sysroot, when we are using a merged-bin. Account
+# for that.
+#
 # $1: main sysroot directory of the toolchain
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
@@ -109,13 +113,13 @@ copy_toolchain_sysroot = \
 	ARCH_SUBDIR="$(strip $3)"; \
 	ARCH_LIB_DIR="$(strip $4)" ; \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
-	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
+	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR} usr/sbin; do \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			continue ; \
 		fi ; \
 		if [ "$$i" = "usr" ]; then \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
-				--include '/libexec*/' --exclude '/lib*/' \
+				--include '/libexec*/' --exclude '/lib*/' --exclude '/sbin' \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		else \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
