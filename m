Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86320C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 22:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C56840DD9;
	Mon, 10 Mar 2025 22:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rBvie4vW1A8; Mon, 10 Mar 2025 22:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9352406D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9352406D0;
	Mon, 10 Mar 2025 22:26:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 565A294A
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A1E060AF6
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM787NbUSDCa for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 22:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7879160AE1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7879160AE1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:26:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6378B87DDA; Mon, 10 Mar 2025 22:26:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Mar 2025 23:24:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fbc4e583fa97be4c68eae2c378d598286c8ee66
X-Git-Newrev: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
X-Patchwork-Hint: ignore
Message-Id: <20250310222646.6378B87DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: add uuidd user and
 group
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4809690d42f9b395ccb76ee7583c199fdd8d42c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When util-linux is compiled with the uuidd daemon and with systemd
init, the rootfs creation fails in fakeroot as follows:

    printf 'host/bin/systemctl --root=build/buildroot-fs/ext2/target preset-all\n' >> build/buildroot-fs/ext2/fakeroot
    [...]
    FAKEROOTDONTTRYCHOWN=1 host/bin/fakeroot -- build/buildroot-fs/ext2/fakeroot
    rootdir=build/buildroot-fs/ext2/target
    table='build/buildroot-fs/full_devices_table.txt'
    ignored spec: h /var/log/journal/%m - - - - +C
    ignored spec: x /var/tmp/systemd-private-%b-*
    ignored spec: X /var/tmp/systemd-private-%b-*/tmp
    ignored spec: x  /var/lib/systemd/coredump/.#core*.%b*
    ignored spec: z /var/log/journal/%m 2755 root systemd-journal - -
    ignored spec: z /var/log/journal/%m/system.journal 0640 root systemd-journal - -
    <stdin>:37: Failed to resolve user 'uuidd': No such process
    make[1]: *** [fs/ext2/ext2.mk:66: images/rootfs.ext2] Error 65
    make: *** [Makefile:83: _all] Error 2

This error can be reproduced with the commands:

    cat <<EOF >.config
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_UTIL_LINUX=y
    BR2_PACKAGE_UTIL_LINUX_UUIDD=y
    BR2_INIT_SYSTEMD=y
    BR2_TARGET_ROOTFS_EXT2=y
    EOF
    make olddefconfig
    make

The error comes from systemctl, which cannot find the uuidd user in
the target rootfs, needed in the uuidd.service unit file [1].

This commit fixes the issue by adding the uuidd user and group in
support/scripts/mkusers syntax.

[1] https://web.git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/misc-utils/uuidd.service.in?h=v2.40.2

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[Julien: add commands to reproduce the issue in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/util-linux/util-linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7a143290eb..ed30c0b107 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -60,6 +60,12 @@ HOST_UTIL_LINUX_CONF_OPTS = \
 	--with-systemdsystemunitdir=no \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_UUIDD),y)
+define UTIL_LINUX_USERS
+	uuidd -1 uuidd -1 * - - - uuidd user
+endef
+endif
+
 ifneq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_CRAMFS)$(BR2_PACKAGE_UTIL_LINUX_FSCK)$(BR2_PACKAGE_UTIL_LINUX_LOSETUP),)
 UTIL_LINUX_SELINUX_MODULES = fstools
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
