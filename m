Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5283EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7616403BF;
	Sat, 10 Dec 2022 16:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7616403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ev_VbTQdeDux; Sat, 10 Dec 2022 16:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E6E7403A4;
	Sat, 10 Dec 2022 16:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E6E7403A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBB71BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6639060A47
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6639060A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfBy1SQqBL17 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA8060806
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BA8060806
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:25:39 +0000 (UTC)
Received: from x230.trabucayre.com (unknown
 [IPv6:2a01:e34:efc8:1080:3e97:eff:fe89:644f])
 by smtp2-g21.free.fr (Postfix) with ESMTP id D2D62200412;
 Sat, 10 Dec 2022 17:25:35 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 17:26:27 +0100
Message-Id: <20221210162627.10466-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/gnuradio: restrict gcc to >= 8
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

With gnuradio 3.10 boost/filesystem was replaced by std::filesystem. This
feature was introduces with gcc 8 (requirering -lstdc++fs (with
gcc 9 explicit -lstdc++fs is no more explicitely required)).

With gcc < 8 build fails with error:

In file included from /home/br-user/work/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/boost/dll/runtime_symbol_info.hpp:11:0,
                 from /home/br-user/work/instance-0/output-1/build/gnuradio-3.10.4.0/buildroot-build/gnuradio-runtime/lib/constants.cc:16:
/home/br-user/work/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/boost/dll/config.hpp:42:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~
compilation terminated.

This patch add the dependency to gcc >= 8 and removes BR2_TOOLCHAIN_HAS_GCC_BUG_64735
dependency because it is only required for gcc < 7.

Also gcc restriction is required because volk needs a toolchain with a gcc > 7.

Tested with bootlin toolchain 2020.02-2 (gcc 8.3.0)

fix:
- http://autobuild.buildroot.net/results/6a82605c58f9ef9eb6c14603777dd8523dd00aa5/
- http://autobuild.buildroot.net/results/c7c4ae76954e388ab639b39fd521d90acfe4edc9/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v333
- rewrite commit message
- add dependency to gcc 8 (std::filesystem) instead of 9.3.0 (ubuntu 20.04 LTS)
Changes v1 -> v2:
- remove depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
- move gcc dependency to main comment
---
 package/gnuradio/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index de19732cfb..b756f61ea3 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,12 +1,12 @@
-comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library gcc >= 8"
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
