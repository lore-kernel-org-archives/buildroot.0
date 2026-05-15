Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C23CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A85D8845D5;
	Fri, 15 May 2026 17:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jX0Sa85sr34A; Fri, 15 May 2026 17:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F733846DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867227;
	bh=0u6I5l/e5zOZsmap5OiYU7wB1ylORBa4BWr2ySlkjfs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=raU+dqYm+OUg7GtgCBFraHnO/1VggqYoP67Pd9ANGnzxvCrgBUE8IDBjeFWyHjy1B
	 z3LXgpEs7/f3nWalWYziFZIrU1rEtTeyzJMX0W+LsLjAz5xa12BRTZx+d4n9Afn6Zy
	 qApDFOSlT+CvRn0FKvA2r4IomvW7hpKdwF9RAl7LHcjgZwKxmkGdYK6cfTvxNiRik/
	 ynkKxAqpmmrHKCiRgABC3Bww0j47OXG9WkxlP3P2ityok3Xb9cTABasvoGqSj4i0Oc
	 maSqkJyGjhvpVib9QwcSz9ltGy3yxzE/JRACXExk0URGeK7CS2SwAbnj8pIRYtB9Nd
	 9gItunMXzNRvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F733846DA;
	Fri, 15 May 2026 17:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DAB845B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 517F740FB2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edLDi5Tx6HCZ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98ABA40FAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98ABA40FAC
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7119863D7; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:20:22 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 0d8372b7e0c66626185fde3a563f03130ccf4a5a
X-Git-Newrev: 699d4cfd7f09f18efafd1c9343392c59ae526c16
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.D7119863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/eudev: fix
 install with BR2_ROOTFS_MERGED_BIN=y
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/699d4cfd7f09f18efafd1c9343392c59ae526c16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Eudev install creates a symlink from $(sbindir)/udevadm to
$(bindir)/udevadm if sbindir and bindir are different [1].
Unfortunately the check considers only the configured values as
strings and does not resolve symlinks. This means that in a merged-bin
setup with sbindir=/sbin (symlink to /usr/sbin, which is a symlink to
/usr/bin) and bindir=/usr/bin the /usr/bin/udevadm binary gets
overwritten with a link to itself.

Set sbindir according to the merge setup to avoid the problem, bindir
defaults to /usr/bin in any case.

[1] https://github.com/eudev-project/eudev/blob/9e7c4e744b9e7813af9acee64b5e8549ea1fbaa3/src/udev/Makefile.am#L139-L140

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit a063c89dc2d3af3f98d9679571a4972210e3390c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/eudev/eudev.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 1a56cfd2f0..3c22b13d86 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -12,7 +12,6 @@ EUDEV_INSTALL_STAGING = YES
 
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
-	--sbindir=/sbin \
 	--libexecdir=/lib \
 	--enable-kmod \
 	--enable-blkid
@@ -21,8 +20,14 @@ EUDEV_CONF_OPTS = \
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
 EUDEV_PROVIDES = udev
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),)
-EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+EUDEV_CONF_OPTS += --sbindir=/usr/bin
+else
+EUDEV_CONF_OPTS += --sbindir=/usr/sbin
+endif
+else
+EUDEV_CONF_OPTS += --sbindir=/sbin --with-rootlibdir=/lib --enable-split-usr
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_MODULE_LOADING),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
