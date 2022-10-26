Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737FAC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 12:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAABC401DB;
	Wed, 26 Oct 2022 12:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAABC401DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwNG7YghL1lG; Wed, 26 Oct 2022 12:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C52F4019A;
	Wed, 26 Oct 2022 12:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C52F4019A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A218E1BF82C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 12:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78C174019A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 12:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78C174019A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1VlLKlSh8aX for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 12:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCEF40141
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBCEF40141
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 12:58:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B6F92E000B;
 Wed, 26 Oct 2022 12:58:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 14:58:35 +0200
Message-Id: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666789121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HyDnL8haaI1G5KPdxi4A4gUVDl+ZRtu3y8pTFJiET/E=;
 b=ASAWuALxASzX+nJB6zjBanxiEiP5/0hOJFAuhcZ62rGX86M5JIRyPi0+Qs4zpYhjS8gyg4
 15bxrk/qC20edXZ24uusRlPH2ChfCRW5spijMhj5uM0904M+6/yYEfXuT0cZl2x20R4MF+
 vM0Dr5ffbTy76pHyx26TBQM48ceG/DXvzTt31jYi1cw+ze3uCnaL/jFM1cHsoHOhxF/xDz
 3S1liYiVDhh/obePOSlD9C5mJOvQfMS/MZdLeZUvYy0m9tnc7j8PAdleqIvP1BsR2XelRx
 jQl3PO8hKOie90r64ChhzHS2pmUzH4ToEoXEZee/2XMS9LKHURJcwSQbqXClYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ASAWuALx
Subject: [Buildroot] [PATCH] package/musl: fixup the dynamic loader symlink
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: hello.skyclo@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Cc: hello.skyclo@gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/musl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 44c79da6f7..30c3c2fbc0 100644
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
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
