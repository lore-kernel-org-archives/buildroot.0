Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB010C77B6C
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA2641847;
	Tue, 28 Mar 2023 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA2641847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UFEZwpQivxq; Tue, 28 Mar 2023 21:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116384180F;
	Tue, 28 Mar 2023 21:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116384180F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED9FC1BF312
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C03BF40530
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 21:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C03BF40530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwJHe8vez9xm for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 21:00:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A874028D
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 21:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A874028D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B7E83602; Tue, 28 Mar 2023 21:00:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Mar 2023 22:58:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb515a4b284228935a0afb65d73a563f2b2c902c
X-Git-Newrev: 16cd9494ba6496d7f5f873abd307952efea7da78
X-Patchwork-Hint: ignore
Message-Id: <20230328210001.E4B7E83602@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flann: needs C++11 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=16cd9494ba6496d7f5f873abd307952efea7da78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/c92a3df1bc73e00e1e4493500bfb7277cf5064ee

  .../build/flann-1.9.2/src/cpp/flann/util/lsh_table.h:367:5: error: 'random_device' is not a member of 'std'
     std::random_device rd;
     ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flann/Config.in | 6 ++++--
 package/flann/flann.mk  | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index 180d7eae8a..8b32e9077c 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LZ4
 	help
 	  FLANN is a library for performing fast approximate nearest
@@ -22,5 +23,6 @@ config BR2_PACKAGE_FLANN_EXAMPLES
 
 endif
 
-comment "flann needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "flann needs a toolchain w/ C++, dynamic library, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index d1a622e685..dc75b977af 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -18,7 +18,7 @@ FLANN_CONF_OPTS = \
 	-DUSE_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF) \
 	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
-FLANN_CXXFLAGS = $(TARGET_CXXFLAGS)
+FLANN_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 FLANN_CXXFLAGS += -O0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
