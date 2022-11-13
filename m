Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06DAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 15:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8863860BB5;
	Sun, 13 Nov 2022 15:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8863860BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywmEJtzb4jAZ; Sun, 13 Nov 2022 15:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE42760BAB;
	Sun, 13 Nov 2022 15:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE42760BAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC881BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 15:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AA828175E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 15:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AA828175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8rxWpzwcoQV for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 15:12:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C20681757
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 15:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C20681757
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B8DF83697; Sun, 13 Nov 2022 15:12:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 16:10:01 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d30bd21b5e4a11e43b16cafe36fcd6f5cb0ca180
X-Git-Newrev: be05e009f00ecd4ba174c7ebced206d3327421a9
X-Patchwork-Hint: ignore
Message-Id: <20221113151230.7B8DF83697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/musl: fixup the
 dynamic loader symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=be05e009f00ecd4ba174c7ebced206d3327421a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The musl Makefile installs the dynamic loader as a symlink to libc.so
with the following rule:

$(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
        $(INSTALL) -D -l $(libdir)/libc.so $@ || true

While it works, the drawback is that ld-musl-<arch>.so ends up being a
symlink to /lib/libc.so. While it works on the target, it means we
have a broken symlink in $(STAGING_DIR) and $(TARGET_DIR) as
/lib/libc.so doesn't make sense on the build machine. This generally
doesn't cause any problem *except* when we tell Qemu to use
$(STAGING_DIR) as the library directory when running target programs
through the Qemu user emulation mode. This is for example node inside
the NodeJS build. Due to this broken symlink, Qemu can't find libc.so
that is pointed to be the dynamic loader symlink causing this build
error:

qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or directory

Since this is not really a bug in the musl build system, we address
this issue by overriding the symlink to be a relative path. The
dynamic loader is always installed in /lib, and libc.so is also always
installed in /lib because we pass libdir=/lib when configuring
musl. So we can simply have a ld-musl* -> libc.so symbolic link. We
use ld-musl* as a wildcard so that we don't need to have extra logic
to determine the exact name of the dynamic loader symlink, and simply
override the one that exists.

Fixes:

  http://autobuild.buildroot.net/results/9ff23f2e3c97e9af410617de3e7376f9d45a7d63/
  https://bugs.busybox.net/show_bug.cgi?id=15061

Note that, for external toolchain, we already have a generic fixup that
makes symlinks relative [0]. So in the external toolchain, even if the
symlink is broken, it gets fixed when we import the toolchain into
STAGING_DIR.

[0] https://lore.kernel.org/buildroot/20221026205312.3f729eb8@windsurf/

Cc: hello.skyclo@gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - add summary of Thomas' explanations for external toolchains
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7935e427bce601f16ee194978583e533213f78c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index b89945e3be..a07041c02d 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -60,12 +60,14 @@ endef
 define MUSL_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(STAGING_DIR) install-libs install-tools install-headers
+	ln -sf libc.so $(STAGING_DIR)/lib/ld-musl*
 endef
 
 define MUSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install-libs
 	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o rcrt1.o Scrt1.o)
+	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl*
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
