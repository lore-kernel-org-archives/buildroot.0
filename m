Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1909FC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A594AAEE;
	Mon, 20 Feb 2023 21:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A594AAEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njFn9GOSiM_i; Mon, 20 Feb 2023 21:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB604EC5B;
	Mon, 20 Feb 2023 21:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB604EC5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 427091BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A7CE416A0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A7CE416A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7nh1fVRStTO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50D5E40C26
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D5E40C26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 416BC86495; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 18:13:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 712ee21876562b46947142f35dfe1186d88ad241
X-Git-Newrev: 34cea39024bf8dedaa071bc5f2d903755501215c
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.416BC86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuradio: restrict gcc
 to >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=34cea39024bf8dedaa071bc5f2d903755501215c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With gnuradio 3.10 boost/filesystem was replaced by std::filesystem.
This feature was introduced with gcc 8 (requirering -lstdc++fs (with
gcc 9 explicit -lstdc++fs is no more explicitely required)).

With gcc < 8 build fails with error:

In file included from /home/br-user/work/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/boost/dll/runtime_symbol_info.hpp:11:0,
                 from /home/br-user/work/instance-0/output-1/build/gnuradio-3.10.4.0/buildroot-build/gnuradio-runtime/lib/constants.cc:16:
/home/br-user/work/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/boost/dll/config.hpp:42:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~
compilation terminated.

Add a dependency to gcc >= 8.

BR2_TOOLCHAIN_HAS_GCC_BUG_64735 only affects gcc <7, so we drop it.

Adding this restriction on gcc >= 8 also covers the dependency for volk,
which requires gcc >= 7, which was not propagated to gnuradio so far.

Tested with bootlin toolchain 2020.02-2 (gcc 8.3.0)

Fixes:
- http://autobuild.buildroot.net/results/6a82605c58f9ef9eb6c14603777dd8523dd00aa5/
- http://autobuild.buildroot.net/results/c7c4ae76954e388ab639b39fd521d90acfe4edc9/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnuradio/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index de19732cfb..1824589263 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,12 +1,12 @@
-comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-comment "gnuradio needs a toolchain not affected by GCC bug 43744 and 64735"
+comment "gnuradio needs a toolchain not affected by GCC bug 43744"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
@@ -16,8 +16,8 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
