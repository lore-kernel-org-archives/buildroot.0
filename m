Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD38AC4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C9BF418AD;
	Wed, 10 Jan 2024 15:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C9BF418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMz9lB8KOdcO; Wed, 10 Jan 2024 15:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A114A41710;
	Wed, 10 Jan 2024 15:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A114A41710
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 369FB1BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DCBE41823
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DCBE41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TcbKDjAoubO for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD34415F6
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD34415F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33893841C4; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:24:52 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c0c62f8cf03c2fd25e4efec114474ac8263416c0
X-Git-Newrev: 3b07e4b0df2385aff0cf9642b7dd334c5ad620a6
X-Patchwork-Hint: ignore
Message-Id: <20240110154603.33893841C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gdb: build and
 link libbfd and libopcodes as static libraries
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b07e4b0df2385aff0cf9642b7dd334c5ad620a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit e5729d3008e4f958324fbbd9ea742badb3f41de4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
