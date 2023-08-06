Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09445C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 10:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FFBB4037C;
	Sun,  6 Aug 2023 10:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FFBB4037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNLGuqaA9LEb; Sun,  6 Aug 2023 10:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C73403F8;
	Sun,  6 Aug 2023 10:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C73403F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 419971BF47E
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E52260A8D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E52260A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6wr40yKgn6m for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 10:26:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51C9360E2D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 10:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C9360E2D
Received: by mail.gandi.net (Postfix) with ESMTPA id 623331C0005;
 Sun,  6 Aug 2023 10:26:10 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun,  6 Aug 2023 12:25:53 +0200
Message-ID: <20230806102554.46261-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
References: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691317570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3zyfgqYU2qx5RjesSnDJweNlYaztZ9IW1C0sTTKA3I=;
 b=UIb41eSQJ9DtAd3XDCEYB4RLGsXuaeMllJq0QhDcBCJ9ysyvUf8R7oV9IQ5I64zbH7GRby
 /A45wPwdOQ1V5KtTHivc+F1LrNjwkjN0U7DdCxQDZy+Dv9RNmd2g3m2OT0yDCR9CVEIMa5
 vGnG1nW6MS+DMuzgr2tizKTbxpoXgYDoLB1JAQfGok4DHt6NrixNIzrmDMz5J+vTjrxHOc
 YIH4kQ/w18wYY55u3GporfT622dQ9//Bx3EGzmZWKqD97IJrVQMPLND/DunrTB3f8RvBIN
 R4FCFbmjKbarN7KenMcYzXcuOclsicbjjBjZX9kooy2CWIKTTL3SCsGAj2oojA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UIb41eSQ
Subject: [Buildroot] [PATCH 3/3] package/elf2flt: fix build with binutils >=
 2.41 due to libbfd location
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

elf2flt needs to link against libbfd.a and libiberty.a which are
provided by host-binutils, but not installed, so we poke directory
into the host-binutils build directory. While not very nice, it has
already been like this for a long time. We could build host-binutils
with --enable-install-libbfd and --enable-install-libiberty so that
those libraries are installed, but we prefer to do this separately,
and there is a serious potential for perturbations to other packages
by having libbfd/libiberty installed in $(HOST_DIR).

In the mean time, an issue of poking directly into the host-binutils
build directory is that the location of libbfd.a has changed in
binutils >= 2.41, so we special case binutils 2.39 and 2.40, which are
the two remaining versions still using the "old" path".

Note: the ARC-special binutils version is not considered because
Buildroot only supports ARC CPUs with a MMU and therefore host-elf2flt
is never used on ARC.

Fixes:

gcc: error: /builds/buildroot.org/toolchains-builder/build/output/build/host-binutils-2.41/bfd/libbfd.a: No such file or directory

When build host-elf2flt against host-binutils 2.41.

This issue is not visible in the autobuilders as it is hidden by the
BFD_VMA_FMT issue fixed in the previous commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elf2flt/elf2flt.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 6cd0786c3d..a524b1b737 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -14,12 +14,27 @@ HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
 # 0001-elf2flt-handle-binutils-2.34.patch
 HOST_ELF2FLT_AUTORECONF = YES
 
+# elf2flt needs to link against libbfd.a and libiberty.a which are
+# provided by host-binutils, but not installed, so we poke directory
+# into the host-binutils build directory. Turns out that the location
+# of libbfd.a has changed in binutils >= 2.41, so we special case
+# binutils 2.39 and 2.40, which are the two remaining versions still
+# using the "old" path". Note: the ARC-special binutils version is not
+# considered because Buildroot only supports ARC CPUs with a MMU and
+# therefore host-elf2flt is never used on ARC. libiberty.a has
+# remained at the same location.
+ifeq ($(BR2_BINUTILS_VERSION_2_39_X)$(BR2_BINUTILS_VERSION_2_40_X),y)
+HOST_ELF2FLT_LIBBFD_PATH = $(HOST_BINUTILS_DIR)/bfd/libbfd.a
+else
+HOST_ELF2FLT_LIBBFD_PATH = $(HOST_BINUTILS_DIR)/bfd/.libs/libbfd.a
+endif
+
 # It is not exactly a host variant, but more a cross variant, which is
 # why we pass a special --target option.
 HOST_ELF2FLT_CONF_OPTS = \
 	--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
 	--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
-	--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
+	--with-libbfd=$(HOST_ELF2FLT_LIBBFD_PATH) \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
 	--target=$(GNU_TARGET_NAME) \
 	--disable-werror
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
