Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4997C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA4D60F91
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FA4D60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20B0440291;
	Fri, 27 Aug 2021 22:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gg2yqfNPw58M; Fri, 27 Aug 2021 22:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C86402A0;
	Fri, 27 Aug 2021 22:05:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 210A71BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D31C833A3
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-mMaoxjzIE7 for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:05:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B4A882B8C
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:05:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i6so12538762wrv.2
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NEIvJbcrpReE9dQdL11yfI6ENzR6dZhUf+Zkg+A+FKw=;
 b=vDAp+MSx5jQXBsqLFKXCAvkKMM1xFL2ujLnEhlI9D12PB5i7bIurF/NBi84O2wp+pg
 TELjyz58O9x583N5zgh9ajPIH4KdGQxDL8gO0u7/JV71wx6qYIMcvdGOqUpz9GsCU1A/
 KbHghG2eReol197Z0fhfJnbzacKlkKDqO7p91IYcE3d0vaB0DpMpUSr2VSJLoS4YnaOW
 SvrtMU4urwAsNFgcnRf0N8V44Lf7g+3emqKVVr0KhoCkpw8xrGAAMoENM0knaSP/6a+H
 95bRk+RsSaLh05DqEyUdqBtqSHkiuE/XIsb6bLjWH4S14KtHSf3ubcE/f1xoo/cAbn7c
 Upsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NEIvJbcrpReE9dQdL11yfI6ENzR6dZhUf+Zkg+A+FKw=;
 b=EVBC75UaG5seY79p1MW06SnAaYafbufMVxQuc1g/EWgK7+TPJbTb6JNURafqqEEFUN
 GXLAcTi1sxS4WLEK7xz7l8HvQYolLOLu1pdEt2efSluc0XRBaLx832/+am7HpfFMgKYY
 o2b6qmtBhpBNQ8XDoYaMTxJO2sF2S46auPr6gLSj6Yv0hASenK25Pm32+NoYln/WH4Uh
 43xIzCr2nRPPVbKIJyKJ3MHGFv0MTRJd/SaA4Sgqjs8nKtw7yBeuviplLikI9J+9qKLQ
 6yY8To3Z+QJyxYdCuF/kBL9z9NmVekphT+YIcGLSf+3eroyhFU2GLLpW7MagN1M8/a2z
 prHQ==
X-Gm-Message-State: AOAM533FYdLxdeGyVlLoy2kktDSlcdH3GbZz7mP6p0S7FyW98fHeZkjT
 dfScaXvJx6GF7zHaKDFaViNqLjAFK6/pqw==
X-Google-Smtp-Source: ABdhPJwBXGvkiibRmrlD/eiFgUg1qX2r3JoJfITPyCJCW6hE0iHXk6EvDXjxyWT9InEONozDrFELvQ==
X-Received: by 2002:adf:c149:: with SMTP id w9mr4173942wre.126.1630101934475; 
 Fri, 27 Aug 2021 15:05:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id p11sm6952452wma.16.2021.08.27.15.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 15:05:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 00:05:31 +0200
Message-Id: <20210827220531.273104-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/qemu: fix fuse-lseek on uclibc-ng and musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on uclibc-ng raised since bump to
version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9:

../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Fix build instead of disabling fuse-lseek on uclibc-ng and musl

 ...e.c-fix-fuse-lseek-on-uclibc-or-musl.patch | 44 +++++++++++++++++++
 package/qemu/qemu.mk                          |  8 +---
 2 files changed, 45 insertions(+), 7 deletions(-)
 create mode 100644 package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch

diff --git a/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch b/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
new file mode 100644
index 0000000000..137371c51f
--- /dev/null
+++ b/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
@@ -0,0 +1,44 @@
+From 8c3fcbf23fe31cf56f21ce1737bf22fe65fc553b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Aug 2021 23:40:01 +0200
+Subject: [PATCH] block/export/fuse.c: fix fuse-lseek on uclibc or musl
+
+Include linux/fs.h to avoid the following build failure on uclibc or
+musl raised since version 6.0.0:
+
+../block/export/fuse.c: In function 'fuse_lseek':
+../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
+  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
+      |                   ^~~~~~~~~
+../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
+../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
+  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
+      |                                          ^~~~~~~~~
+      |                                          SEEK_SET
+
+Fixes:
+ - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to qemu-devel@nongnu.org]
+---
+ block/export/fuse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/block/export/fuse.c b/block/export/fuse.c
+index fc7b07d2b5..2e3bf8270b 100644
+--- a/block/export/fuse.c
++++ b/block/export/fuse.c
+@@ -31,6 +31,9 @@
+ #include <fuse.h>
+ #include <fuse_lowlevel.h>
+ 
++#ifdef __linux__
++#include <linux/fs.h>
++#endif
+ 
+ /* Prevent overly long bounce buffer allocations */
+ #define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
+-- 
+2.32.0
+
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0bd3eafadd..a58bc9024a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -92,14 +92,8 @@ QEMU_OPTS += --disable-tools
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
-QEMU_OPTS += --enable-fuse
+QEMU_OPTS += --enable-fuse --enable-fuse-lseek
 QEMU_DEPENDENCIES += libfuse3
-# musl does not support SEEK_HOLE/SEEK_DATA
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-QEMU_OPTS += --disable-fuse-lseek
-else
-QEMU_OPTS += --enable-fuse-lseek
-endif
 else
 QEMU_OPTS += --disable-fuse --disable-fuse-lseek
 endif
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
