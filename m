Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36498C28B30
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F5381EAA;
	Sun, 16 Mar 2025 20:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoMRCozc4bJ0; Sun, 16 Mar 2025 20:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D9E81EAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D9E81EAE;
	Sun, 16 Mar 2025 20:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34DA061
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F6A3802E7
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6FVGZRLXHZB for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCF781E7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CCF781E7D
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AD9C88054; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 21:08:23 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 1666a565e7f28bf5b48c0301e8b85499de6709c0
X-Git-Newrev: 4ad66243dc0fb8d6514c25a5f33e17c86e954731
X-Patchwork-Hint: ignore
Message-Id: <20250316202646.4AD9C88054@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/util-linux: add
 uuidd user and group
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ad66243dc0fb8d6514c25a5f33e17c86e954731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit 4809690d42f9b395ccb76ee7583c199fdd8d42c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
