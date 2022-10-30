Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B8FFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C52606ED;
	Sun, 30 Oct 2022 11:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C52606ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbHS6ENB7NqJ; Sun, 30 Oct 2022 11:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C920605AE;
	Sun, 30 Oct 2022 11:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C920605AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFB31BF5DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ACF240334
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ACF240334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdqZyuK7hS6K for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:44:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 292F940320
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292F940320
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F97B8749E; Sun, 30 Oct 2022 11:44:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 12:42:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69d311687abd005dddf3621b7b52a397e75ad8ab
X-Git-Newrev: e1550ef755c90ccaa63b9d4ed805e1f85f73142f
X-Patchwork-Hint: ignore
Message-Id: <20221030114429.0F97B8749E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: introduce
 BR2_TOOLCHAIN_BUILDROOT_NONE
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1550ef755c90ccaa63b9d4ed805e1f85f73142f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the internal toolchain backend, we have a choice..endchoice block
to allow the user to select the C library, between glibc, uClibc and
musl.

However, there are situations were no C library at all is
supported. In this case, the choice does not appear, and does not
allow to see the Config.in comments that are within the
choice..endchoice block and that may explain why no C library is
available.

For example, on RISC-V 32-bit, the only C library supported is glibc,
and the minimum kernel header version required by glibc on this
architecture is 5.4.0. In a future commit, we are going to add this
dependency on glibc (to fix build issues on configurations that have
headers < 5.4.0). But since glibc is the only supported C library on
RISC-V 32-bit, it means that the choice..endchoice for the C library
contains no entry, preventing from seeing the Config.in comment.

To address this issue, this commit adds a "dummy"
BR2_TOOLCHAIN_BUILDROOT_NONE option that shows up in the
choice..endchoice only when no C library is available. Thanks to this,
the choice..endchoice is never empty, and the Config.in comments can
be seen.

If the user keeps BR2_TOOLCHAIN_BUILDROOT_NONE selected, then the
build will anyway abort early because package/Makefile.in has a check
to verify that a C library is selected, and aborts the build if not.

Some could say that the problem should be resolved by instead
preventing the selection of headers < 5.4.0 on RISC-V 32-bit, but that
is difficult to do as the user can choose a custom header version, or
simply specific that (s)he wants to use the headers of the kernel
being built. In those situations, it's difficult to prevent selecting
headers < 5.4.0.

Prevent random configurations from triggering a build failure in our
autobuilders, by excluding that symbol from accepted configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: update genrandconfig]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-buildroot/Config.in | 12 ++++++++++++
 utils/genrandconfig                     |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 6d55f87435..26d731d976 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -80,6 +80,18 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	  https://www.musl-libc.org/
 
+config BR2_TOOLCHAIN_BUILDROOT_NONE
+	bool "none"
+	depends on !BR2_PACKAGE_UCLIBC_SUPPORTS && \
+		!BR2_PACKAGE_GLIBC_SUPPORTS && \
+		!BR2_PACKAGE_MUSL_SUPPORTS
+	help
+	  This option is visible if no C library is available for the
+	  currently selected configuration. If you select this option,
+	  the build will refuse to start as Buildroot needs a C
+	  library to build a toolchain. Change your configuration
+	  settings to make sure one of the C libraries is selected.
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
diff --git a/utils/genrandconfig b/utils/genrandconfig
index e43452d5b7..257fe7b520 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -301,6 +301,10 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
+    # No C library for internal toolchain
+    if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
+        return False
+
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
