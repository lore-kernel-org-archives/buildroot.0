Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABD3C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 18:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAB5828AA;
	Sat,  2 Mar 2024 18:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7GOiZ3e9rwR; Sat,  2 Mar 2024 18:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E900683065
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E900683065;
	Sat,  2 Mar 2024 18:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76DBB1BF38D
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 18:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6419483065
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 18:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unGO8cWYVvuX for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 18:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A85A828AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A85A828AA
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 18:32:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8528887E4F; Sat,  2 Mar 2024 18:32:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 19:31:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6d96266a174024c5f6f8647cf19617056aef56c
X-Git-Newrev: 2934a4692c4f1f3649b7781263ae655fcb3d780a
X-Patchwork-Hint: ignore
Message-Id: <20240302183220.8528887E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/parted: needs gcc >= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2934a4692c4f1f3649b7781263ae655fcb3d780a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.5 in
commit 57817fe05a4250a260a08201812c6652b306a0e5 and
https://git.savannah.gnu.org/cgit/parted.git/commit/?id=15c49ec04f7eaff014d2e1eddd0aecf4150db63d:

gpt.c:181:5: error: initializer element is not constant
     { PED_PARTITION_APPLE_TV_RECOVERY,  PARTITION_APPLE_TV_RECOVERY_GUID },
     ^
gpt.c:181:5: error: (near initialization for 'flag_uuid_mapping[0].type_uuid')

Fixes: 57817fe05a4250a260a08201812c6652b306a0e5
 - http://autobuild.buildroot.org/results/1f0af75ec55da9052fbfb195a0699f84619eac81
 - http://autobuild.buildroot.org/results/438b5f40e8b393801f36c691d239e298998cb9d2

Note that udisks also select parted, but it already has a more stringent
dependency on GCC >= 7.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libblockdev/Config.in     | 15 +++++++++------
 package/parted/Config.in          |  6 ++++--
 package/python-pyparted/Config.in |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index e0449628b4..7494b0f6b7 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -32,12 +32,13 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_E2FSPROGS
 
-comment "filesystem plugin needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "filesystem plugin needs a toolchain w/ locale, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_LIBBLOCKDEV_LOOP
 	bool "loop"
@@ -45,11 +46,12 @@ config BR2_PACKAGE_LIBBLOCKDEV_LOOP
 config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 	bool "lvm2"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LVM2
 
-comment "lvm2 support needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "lvm2 support needs a toolchain w/ locale, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
 	bool "mdraid"
@@ -62,11 +64,12 @@ config BR2_PACKAGE_LIBBLOCKDEV_NVME
 config BR2_PACKAGE_LIBBLOCKDEV_PART
 	bool "part"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 
-comment "part plugin needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "part plugin needs a toolchain w/ locale, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	bool "swap"
diff --git a/package/parted/Config.in b/package/parted/Config.in
index f48b365a2d..ea6c3db2bf 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted needs a toolchain w/ locale, wchar"
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "parted needs a toolchain w/ locale, wchar, gcc >=5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 60f54a5484..430bf204a1 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PARTED
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 
 	  https://github.com/rhinstaller/pyparted
 
-comment "pyparted needs a toolchain w/ locale, wchar"
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "pyparted needs a toolchain w/ locale, wchar, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
