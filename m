Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8C1EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2347540BD1;
	Mon, 21 Aug 2023 20:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2347540BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mg3k4QTElmEI; Mon, 21 Aug 2023 20:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3180F40BFC;
	Mon, 21 Aug 2023 20:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3180F40BFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 444421BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E81BC409FE
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E81BC409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3IGYLuwtJvu for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E79409FB
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2E79409FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C44686025; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 15:44:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d79f9c9f416ac5da90cd428916cff0b5288cb03a
X-Git-Newrev: d0349d5ba02df26c9f3d98b1e34ebd2c5c34192c
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.9C44686025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/elf2flt: fix build
 with binutils >= 2.41 due to libbfd location
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0349d5ba02df26c9f3d98b1e34ebd2c5c34192c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

elf2flt needs to link against libbfd.a and libiberty.a which are
provided by host-binutils, but not installed, so we poke directly
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
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elf2flt/elf2flt.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 6cd0786c3d..b970de48f2 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -14,12 +14,27 @@ HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
 # 0001-elf2flt-handle-binutils-2.34.patch
 HOST_ELF2FLT_AUTORECONF = YES
 
+# elf2flt needs to link against libbfd.a and libiberty.a which are
+# provided by host-binutils, but not installed, so we poke directly
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
