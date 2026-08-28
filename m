Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F7C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E52281193;
	Fri, 28 Aug 2026 14:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6Vd3k4N7PYN; Fri, 28 Aug 2026 14:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927167;
	bh=X+fn6LQ6x9KvHjj8Z8EuB+PO1hwGI2NglfaBbOxV88U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RXQnDTfLLY7/eH08FM6Q7aeMhQwtNrRd2/bkYCXPJP49Occglb74Xma7drz8OLFu2
	 IzESPA5vl5+7/v4kRKOX6WKOFMzaa0G3RAZvet1LGusT7ox39I1StZ5EpS4GivQb9n
	 UudaVnyjfD1kkIjSO0nM3rpCpKvqqEW78RZTj7IxTwA5fH4GlfICJUkhhSSlkL2mBi
	 AFQgO2NzwMJ2bBsQx/+2Jv8CXm2Uot4UpgiznL1oIWb6jrnmRAPxKADFWc5jikcSyQ
	 oV7ZxaDtMENVYH/KvOV8XhVi/QEgOMTh8j9cOlSdz4EaA63jxf2TgyAJjOi5ks+NML
	 Gk9urxqV85BAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BF78119E;
	Fri, 28 Aug 2026 14:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF26127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FCA36081A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOnKLlackz9A for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 896656078A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87CE4921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 140b534bc26ae017a3d329fb70d7063a518b8e4c
X-Git-Newrev: bf04be147bff4f0548a5c05b2e178cba93fc7ea9
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.87CE4921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dracut: disable
 dracut-cpio if host-rustc is not available
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf04be147bff4f0548a5c05b2e178cba93fc7ea9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Since upstream commit 89a86dcb0a3248606824de50f5c63f61cfe0369c (first
release: 106) if cargo exists on PATH the Dracut configure script
enables building dracut-cpio by default, and calls "cargo --version"
to check if cargo works. This fails on the autobuilders:

error: rustup could not choose a version of cargo to run, because one wasn't specified explicitly, and no default is configured.
help: run 'rustup default stable' to download the latest stable release of Rust and set it as your default toolchain.
dracut couldn't find cargo for dracut-cpio build

The affected configs either don't have BR2_PACKAGE_HOST_RUSTC enabled,
or build-time.log.gz shows host-rustc was not installed before the
host-dracut build, so presumably the "cargo" that produces the rustup
error is an external one already installed on the autobuilders.

To fix this, enable dracut-cpio only if BR2_PACKAGE_HOST_RUSTC=y, and
add a dependency on host-rustc in that case. According to the
documentation [1, see "enhanced_cpio"] dracut-cpio is supposed to
optimize archive creation for copy-on-write filesystems, so it should
not matter much for Buildroot. The --disable-dracut-cpio option was
added in upstream commit 4a4ab928a49e81e02104ec5466160664e59c3965
(same release).

Fixes: https://autobuild.buildroot.org/results/5f557d708cce997e7f039f17e30640b02ba9180a/
Fixes: https://autobuild.buildroot.org/results/f04ca3c4598f62a7e87d84bc111eb8b161b34a70/
(and more)

[1] https://dracut-ng.github.io/dracut/man/dracut.conf.5.html#_configuration_options

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ff7f973a16036d21da708137875eff6efa8765df)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/dracut/dracut.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bf755319e..1b356a5092 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -13,6 +13,13 @@ DRACUT_CPE_ID_VALID = YES
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="" install
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+HOST_DRACUT_CONF_OPTS += --enable-dracut-cpio
+HOST_DRACUT_DEPENDENCIES += host-rustc
+else
+HOST_DRACUT_CONF_OPTS += --disable-dracut-cpio
+endif
+
 define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
 	sed -e "s%@@TARGET_CROSS@@%$(TARGET_CROSS)%" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
