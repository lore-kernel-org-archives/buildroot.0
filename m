Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE99E77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9352401EC;
	Wed,  8 Jan 2025 22:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMok9NvWgXbm; Wed,  8 Jan 2025 22:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5618840200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5618840200;
	Wed,  8 Jan 2025 22:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46CA51FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A37C80F7A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlDJLTfMaW-i for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C61E380F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61E380F74
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C61E380F74
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 28D581BF208;
 Wed,  8 Jan 2025 22:43:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Jan 2025 23:43:17 +0100
Message-ID: <20250108224320.2241826-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
References: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736376204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eY21iFtuKyjUDRkoMIt3AkuqHM9oCNl4cdQobCNpORc=;
 b=F8r2P1lek1aYCsPp5VM28v7ZXW3fGAO6/5+tu2AdkPaDS51UT/y1wmFL7FJ7KwFvw++L0l
 2z2XsU8usB5dzRj9swFufLVglBxIazzaFMj8syClwVbZ+vkKLpCnvv+8qAVBm0DtuME6YE
 VOo31h6yZ0ghfao/uD7fd2Vi3zACPzB4qjGcMswx2x7V32hO4dLSWzR3KeCUq8KdQw5w1z
 t3jT5EpUO8nOJXUvIKEsKFik/zCD5Vip+unuIPwbiey1d3r4jLSqZmN3pIOID6DEZZRCSt
 vtIHUk/xIqBf07fIA3ojtTm4EXXZDfLc8+OKkNblEZlC6s4UCCUvlWMmr/imBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F8r2P1le
Subject: [Buildroot] [PATCH 4/4] package/libiberty: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-libiberty was only used by host-prelink-cross, which has now been
removed.

The dependency of host-gdb on host-libiberty was not because it was
needed, but because if both host-libiberty and host-gdb were built,
host-gdb should be built after host-liberty. See commit
f0a583ddc4c2cab121330284e316f54229dee492 ("package/gdb: depend on
libiberty")

Fixes:

  http://autobuild.buildroot.net/results/82d2d7d30c8e00bf6e9918c3d989f65a7330d381/ (host-binutils)
  http://autobuild.buildroot.net/results/a4674122a683e4842c1fd913da80a3e6e484d5a5/ (host-binutils-bare-metal)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb.mk               |  4 +---
 package/libiberty/libiberty.hash |  1 -
 package/libiberty/libiberty.mk   | 32 --------------------------------
 3 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 120000 package/libiberty/libiberty.hash
 delete mode 100644 package/libiberty/libiberty.mk

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index c966cdc10b..69f7979149 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -30,9 +30,7 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-# As for libiberty, gdb may use a system-installed one if present, so
-# we must ensure ours is installed first.
-HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
+HOST_GDB_DEPENDENCIES = host-expat host-ncurses host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
deleted file mode 120000
index e0655d3af3..0000000000
--- a/package/libiberty/libiberty.hash
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
deleted file mode 100644
index ac6afc44ca..0000000000
--- a/package/libiberty/libiberty.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# libiberty
-#
-################################################################################
-
-LIBIBERTY_VERSION = 2.41
-LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
-LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
-HOST_LIBIBERTY_DL_SUBDIR = binutils
-
-# We're only building libiberty here, not the full binutils suite
-LIBIBERTY_LICENSE = LGPL-2.1+
-LIBIBERTY_LICENSE_FILES = COPYING.LIB
-
-LIBIBERTY_SUBDIR = libiberty
-
-# We explicitly disable multilib, as we do in binutils.
-# By default, libiberty installs nothing, so we must force it.
-HOST_LIBIBERTY_CONF_OPTS = \
-	--disable-multilib \
-	--enable-install-libiberty
-
-# Some packages (e.g. host-gdb) will pick this library and build shared
-# objects with it. But libiberty does not honour the --enable-shared and
-# --disable-static flags; it only ever builds a static library no matter
-# what. So we must force -fPIC in build flags.
-HOST_LIBIBERTY_CONF_ENV = \
-	CFLAGS="$(HOST_CFLAGS) -fPIC" \
-	LDFLAGS="$(HOST_LDFLAGS) -fPIC"
-
-$(eval $(host-autotools-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
