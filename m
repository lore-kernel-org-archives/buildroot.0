Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FDAC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6C4610A6;
	Tue, 21 Feb 2023 00:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D6C4610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBIf3wUMSKBm; Tue, 21 Feb 2023 00:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9918E61100;
	Tue, 21 Feb 2023 00:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9918E61100
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5615B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9950C41822
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9950C41822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzP5EcE1FZOv for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACCAF41805
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACCAF41805
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AAF086495; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:00:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0b5b92019ba30aecdaa7ba34c255d15e0c0489e8
X-Git-Newrev: 4433ad8f5c88fafe3f0aebbaff1abdae17aadcb7
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.9AAF086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/helper: check the
 arch sysroot
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

commit: https://git.buildroot.net/buildroot/commit/?id=4433ad8f5c88fafe3f0aebbaff1abdae17aadcb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the commit [1], the utils/genrandconfig script improved the
configuration randomization used by autobuilders. Since then it can
generate a configuration that is not suitable for an external toolchain
such the "Codescape IMG GNU Linux Toolchain".

Indeed this toolchain can be selected for mips32r5 or mips64r5 while only
mips32r2 or mips64r2 are really supported. The toolchain issue will be
fixed in a followup change.

We want to catch such issue in check_unusable_toolchain function otherwise
it is detected late during the sysroot import into staging and trigger
a weird error message:

ln: failed to create symbolic link 'output/host/mips64el-buildroot-linux-gnu/sysroot//nvmedata/autobuild/instance-25/buildroot/libc.a': No such file or directory
ln: failed to create symbolic link 'output/host/mips64el-buildroot-linux-gnu/sysroot/usr//nvmedata/autobuild/instance-25/buildroot/libc.a': No such file or directory

This is similar test than for the main sysroot check but this time we have
to use the toolchain cflags to check the architecture sysroot.

If the architecture sysroot doesn't exist, the toolchain will reply with
"libc.a".

Either the toolchain is really broken or we used a wrong target
architecture variant. In the later case, the toolchain infrastructure will
print a meaningful error message.

Note: We also may get a similar issue using the toolchain-external-custom package
if a toolchain is used with a wrong target architecture	variant.

Fixes:
http://autobuild.buildroot.org/results/701/701e8a5f713f7bdd1f32a4c549cdaac580e2522a/

[1] aeee90ec109b83c42779e6a2617f7d57e25a2b65

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/helpers.mk                                   | 11 +++++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1cd7494fdb..24c482923a 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -422,12 +422,16 @@ check_cross_compiler_exists = \
 #   the host tuple.
 # - Exclude distro-class toolchains which are not relocatable.
 # - Exclude broken toolchains which return "libc.a" with -print-file-name.
+# - Exclude toolchains used with wrong toolchain cflags or broken toolchains
+#   which return "libc.a" with -print-file-name and toolchain cflags.
 # - Exclude toolchains which doesn't support --sysroot option.
 #
 # $1: cross-gcc path
+# $1: toolchain cflags
 #
 check_unusable_toolchain = \
 	__CROSS_CC=$(strip $1) ; \
+	__TOOLCHAIN_CFLAGS=$(strip $2) ; \
 	vendor=`$${__CROSS_CC} -dumpmachine | cut -f2 -d'-'` ; \
 	if test "$${vendor}" = "angstrom" ; then \
 		echo "Angstrom toolchains are not pure toolchains: they contain" ; \
@@ -449,6 +453,13 @@ check_unusable_toolchain = \
 		echo "Unable to detect the toolchain sysroot, Buildroot cannot use this toolchain." ; \
 		exit 1 ; \
 	fi ; \
+	libc_a_archsysroot_path=`$${__CROSS_CC} $${__TOOLCHAIN_CFLAGS} -print-file-name=libc.a` ; \
+	if test "$${libc_a_archsysroot_path}" = "libc.a" ; then \
+		echo "Unable to detect the toolchain architecture sysroot." ; \
+		echo "Please check the Target Architecture Variant selected, the toolchains may not support it." ; \
+		echo "Buildroot cannot use this toolchain." ; \
+		exit 1 ; \
+	fi; \
 	sysroot_dir="$(call toolchain_find_sysroot,$${__CROSS_CC})" ; \
 	if test -z "$${sysroot_dir}" ; then \
 		echo "External toolchain doesn't support --sysroot. Cannot use." ; \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 299b6008aa..c37f3500d9 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -563,7 +563,7 @@ endif
 # kernel headers version, type of C library and all C library features.
 define $(2)_CONFIGURE_CMDS
 	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
-	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
+	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC),"$$(TOOLCHAIN_EXTERNAL_CFLAGS)")
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	$$(call check_kernel_headers_version,\
 		$$(BUILD_DIR),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
