Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB19C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC9760EB9
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDC9760EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7850C401E2;
	Sun,  8 Aug 2021 19:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFgt_6dON0ep; Sun,  8 Aug 2021 19:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 702A44012D;
	Sun,  8 Aug 2021 19:35:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E82371BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6FFC600C4
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDNOYtwJ1XbB for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A0C2600C6
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 33C5E8D254; Sun,  8 Aug 2021 19:33:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:18:45 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 35965edff48e460b642ab32d329471a81e01ac61
X-Git-Newrev: 57c1cd136d8976e1a916a433772d9e957e03ac8a
X-Patchwork-Hint: ignore
Message-Id: <20210808193333.33C5E8D254@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mpd: needs gcc >=
 8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=57c1cd136d8976e1a916a433772d9e957e03ac8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Since bump to version 0.22.3 in commit b6576a458ca0 (package/mpd: bump
to version 0.22.3), mpd needs gcc >= 8, as documented in their manual
[0], to avoid the following build failure with gcc 7.3.1:

/tmp/instance-7/output-1/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/bits/stl_tree.h:2091:28: error: no matching function for call to 'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> >, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > > >::_M_get_insert_unique_pos(std::pair<std::basic_string_view<char>, std::basic_string_view<char> >::first_type&)'
  = _M_get_insert_unique_pos(_KeyOfValue()(__v));
    ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4888d99404cc4273349ab036035c5ff7e086b83e

[0] https://mpd.readthedocs.io/en/stable/user.html#compiling-from-source)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: reword commit log to reference the manual]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8f7d7d9d86ecd4d43abaeed742ce691e46302276)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9748c7d0a5..7a2597558b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -5,8 +5,8 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	depends on BR2_HOST_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -403,5 +403,5 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
