Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5321BC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B4A83C1B;
	Wed, 27 Dec 2023 21:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B4A83C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y70RpnZ0TkD4; Wed, 27 Dec 2023 21:17:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3214882F03;
	Wed, 27 Dec 2023 21:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3214882F03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DDF11BF3E1
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCCA0808AC
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCCA0808AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzRHlX4TO75Z for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:13:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF26A83A92
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF26A83A92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D760836E5; Wed, 27 Dec 2023 21:13:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 22:11:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a760645bfb3fa74253d24462a39e29d4c54ee5ea
X-Git-Newrev: e5729d3008e4f958324fbbd9ea742badb3f41de4
X-Patchwork-Hint: ignore
Message-Id: <20231227211322.9D760836E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: build and link libbfd and
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5729d3008e4f958324fbbd9ea742badb3f41de4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
