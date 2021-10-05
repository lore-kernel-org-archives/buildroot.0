Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D732C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1084961216
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1084961216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF45C60BDE;
	Tue,  5 Oct 2021 14:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EiDFERuYhuvw; Tue,  5 Oct 2021 14:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D7A60B38;
	Tue,  5 Oct 2021 14:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 775181BF215
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D3994033F
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9pVdel6_FZ0 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:54:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A8B40769
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:54:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9301790F7A; Tue,  5 Oct 2021 14:51:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 16:47:14 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 02e212f858de246458388fe1b36da28bef059df7
X-Git-Newrev: 94e5a5441dccd5e6ff350637011b0e81454000f7
X-Patchwork-Hint: ignore
Message-Id: <20211005145141.9301790F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] boot/syslinux: add
 missing python dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=94e5a5441dccd5e6ff350637011b0e81454000f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Syslinux use some python scripts during the build and they
are using python interpreter by default. It fail to build
when there is no python interpreter on the host.

[...]/syslinux-6.03/com32/cmenu/menugen.py
make[6]: python: No such file or directory

Since Syslinux 5.00, we can override the python interpreter
used during the build:

https://repo.or.cz/syslinux.git/commitdiff/4dec62ce9c2c0d170f21b3ae2d7c618eb7a30c05

Add the	missing	host-python3 dependency and override
it in SYSLINUX_BUILD_CMDS.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1614446766

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ccfd40711e122c720145044eb4d145a8bacd9db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 67bc69254e..0643f85a99 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -14,7 +14,12 @@ SYSLINUX_LICENSE_FILES = COPYING
 SYSLINUX_INSTALL_IMAGES = YES
 
 # host-util-linux needed to provide libuuid when building host tools
-SYSLINUX_DEPENDENCIES = host-nasm host-upx util-linux host-util-linux
+SYSLINUX_DEPENDENCIES = \
+	host-nasm \
+	host-python3 \
+	host-upx \
+	host-util-linux \
+	util-linux
 
 ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET += bios
@@ -59,6 +64,7 @@ define SYSLINUX_BUILD_CMDS
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+		PYTHON=$(HOST_DIR)/bin/python3 \
 		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
