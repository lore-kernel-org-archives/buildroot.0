Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F934C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B782440541;
	Sun, 12 Dec 2021 12:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ShbZeQIs5vz; Sun, 12 Dec 2021 12:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 202574063E;
	Sun, 12 Dec 2021 12:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB2F1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFBE741E40
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9d5GvIxRYtxX for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F3C42050
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B204D82B70; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a21c61ad0a5313c6edf21f20c5d542e9e7f6f7f3
X-Git-Newrev: 4efeea55ea6a07b795a2f002a3d4b51b5ef9c366
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.B204D82B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang: needs __sync_*_4
 intrinsics
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

commit: https://git.buildroot.net/buildroot/commit/?id=4efeea55ea6a07b795a2f002a3d4b51b5ef9c366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libyang needs __sync_*_4 intrinsics since bump to version 2.0.112 in
commit 2a3edc5e00b38f4f927894d0911990c9060e4415 and
https://github.com/CESNET/libyang/commit/080064b7906aecd7454e58e1c34c1c2198809e4e:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ../../libyang.so.2.13.7: undefined reference to `__sync_fetch_and_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/c1f090bde4891ac1cc84e59c51ff9561869d42b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/Config.in         | 2 +-
 package/libnetconf2/Config.in | 2 ++
 package/libyang/Config.in     | 2 ++
 package/netopeer2/Config.in   | 2 ++
 package/sysrepo/Config.in     | 2 ++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index 911913292f..877b75b107 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_FRR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_C_ARES
diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 0a735b5ed6..7865f9e487 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNETCONF2
 	bool "libnetconf2"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
@@ -12,4 +13,5 @@ config BR2_PACKAGE_LIBNETCONF2
 
 comment "libnetconf2 needs a toolchain w/ threads, dynamic libraray"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libyang/Config.in b/package/libyang/Config.in
index 54df061b58..d08f8fd42f 100644
--- a/package/libyang/Config.in
+++ b/package/libyang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBYANG
 	bool "libyang"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrinsics
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PCRE2
@@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBYANG
 	  https://github.com/CESNET/libyang
 
 comment "libyang needs a toolchain w/ threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
index 763b1f234b..db31a786a1 100644
--- a/package/netopeer2/Config.in
+++ b/package/netopeer2/Config.in
@@ -1,11 +1,13 @@
 comment "netopeer2 needs a toolchain w/ gcc >= 4.8, C++, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_NETOPEER2
 	bool "netopeer2"
 	depends on BR2_USE_MMU # libnetconf2, libssh, sysrepo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
 	depends on !BR2_STATIC_LIBS # libnetconf2, libssh, libyang, sysrepo
 	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 52df1bc4c3..b1535bed9f 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSREPO
 	bool "sysrepo"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -24,5 +25,6 @@ endif
 
 comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
