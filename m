Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FF1C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 22:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB834089B;
	Mon, 25 Dec 2023 22:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB834089B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqmTg9pXO6hK; Mon, 25 Dec 2023 22:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B542B408C4;
	Mon, 25 Dec 2023 22:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B542B408C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBA8B1BF82C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 22:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 672F9403EA
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 22:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 672F9403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8cCLsFF2t94 for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 22:54:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0285E40018
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 22:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0285E40018
Received: by mail.gandi.net (Postfix) with ESMTPA id C80D5240004;
 Mon, 25 Dec 2023 22:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 23:54:19 +0100
Message-ID: <20231225225420.2531967-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703544861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EI3qq9arQbXA/bXl0jZrR8Mvom4fAPvTU3BxTH4sZd8=;
 b=UNwhxYl+5yL+i4vcW3ML2AIo354RlheMR70FuaB3YXLSb+7b4st8ia2fyduTs8m6qLV80T
 n5OY6tKeCk7AmXo6XAofxNt+DWI54XjSkFTvrjWatfCavSvig7CiDCrB8tZyTE1/K7MI2V
 KN7KrN4BmGudDP0u9X/MjQhdIGAulaqt4a/xD+WbFSj7ErxJ2HvN4dEoCLBpIqWaOVpbro
 fgo0qO6HOXYbzE68g1swvmAukGRqoOjw8PpivnOFVZa2bFjEVhH1+1y/JYbbFOiJRotlgd
 oq2YhSUjDnurtIEcGiCDoOy8eIjuv/tLuSFa/VrCA6O6n2tDrzC2CmNu2ZnVIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UNwhxYl+
Subject: [Buildroot] [PATCH] package/gdb: build and link libbfd and
 libopcodes as static libraries
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since GDB 13.x and upstream commit
b686ecb5b10be9a33ab8f1bfdcff22eef920d1a5 ("gdb: link executables with
libtool"), gdb will be linked against the shared variants of libbfd
and libopcodes if they exist. However, this causes host gdb and target
gdb to not work, because our gdb package does not install libbfd and
libopcodes (to not clash with the ones potentially installed by
binutils).

In order to get around this, this commit proposes to get back to the
situation we had before GDB 13.x: libbfd and libopcodes are only
compiled as static libraries, so that they are linked directly inside
the gdb binary, avoiding the problem entirely.

This resolves:

 # gdb --version
 gdb: error while loading shared libraries: libopcodes-2.39.50.so: cannot open shared object file: No such file or directory

for target gdb, and:

 $ ./host/bin/arm-linux-gdb --version
 ./host/bin/arm-linux-gdb: error while loading shared libraries: libopcodes-2.39.50.so: cannot open shared object file: No such file or directory

for host gdb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 070598b385..ea710f0c1f 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -121,8 +121,10 @@ GDB_MAKE_ENV += \
 GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
 GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
 
-# The shared only build is not supported by gdb, so enable static build for
-# build-in libraries with --enable-static.
+# We want the built-in libraries of gdb (libbfd, libopcodes) to be
+# built and linked statically, as we do not install them on the
+# target, to not clash with the ones potentially installed by
+# binutils. This is why we pass --enable-static --disable-shared.
 GDB_CONF_OPTS = \
 	--without-uiout \
 	--disable-gdbtk \
@@ -132,6 +134,7 @@ GDB_CONF_OPTS = \
 	--without-included-gettext \
 	--disable-werror \
 	--enable-static \
+	--disable-shared \
 	--without-mpfr \
 	--disable-source-highlight
 
@@ -248,10 +251,14 @@ endif
 # A few notes:
 #  * --target, because we're doing a cross build rather than a real
 #    host build.
-#  * --enable-static because gdb really wants to use libbfd.a
+#  * --enable-static --disable-shared because we want host gdb to
+#    build and link against a static version of libbfd and
+#    libopcodes, because we don't install the shared variants of
+#    those libraries in $(HOST_DIR), as it might clash with binutils
 HOST_GDB_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-static \
+	--disable-shared \
 	--without-uiout \
 	--disable-gdbtk \
 	--without-x \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
