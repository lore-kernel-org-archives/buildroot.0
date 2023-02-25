Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6329C7EE2E
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E29040913;
	Sat, 25 Feb 2023 09:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E29040913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDLllVBURYLf; Sat, 25 Feb 2023 09:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3C8B40B8D;
	Sat, 25 Feb 2023 09:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3C8B40B8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0C641BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A887381EBC
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A887381EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oyhd5RPp0W4W for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA3FA81ED4
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA3FA81ED4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7CDE86A8C; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:43:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8985cf50cca852cc5cc840a605e01713e758d40
X-Git-Newrev: a6b4217312815379a7c52bf5d53752dbe0838645
X-Patchwork-Hint: ignore
Message-Id: <20230225095001.B7CDE86A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: needs locale
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6b4217312815379a7c52bf5d53752dbe0838645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

locale_t is unconditionally used since version 1.5 and
https://github.com/storaged-project/libblockdev/commit/4ed6f0b3a46fc77554dab661c22150829aa75966
resulting in the following build failure since the addition of the
package in commit 0c52826291d1884db0f8f35130216065fbc7b574:

module.c:33:37: error: unknown type name 'locale_t'
   33 | static char *strerror_l(int errnum, locale_t locale UNUSED)
      |                                     ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ede9eb1f13d56c77005cc448416fb2efa9d16ff0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in | 6 ++++--
 package/udisks/Config.in      | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 4389fd794c..4f98621bd8 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBBLOCKDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -66,7 +67,8 @@ config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 
 endif
 
-comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
+comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library, locale"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 253d5cdc6b..b1d02a31b2 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
-	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_ENABLE_LOCALE # libblockdev, parted
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
