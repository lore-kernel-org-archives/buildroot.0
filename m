Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E39C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433E66103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 433E66103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CCA1404FA;
	Tue,  3 Aug 2021 23:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwIsHRM8hhmu; Tue,  3 Aug 2021 23:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127AA4052E;
	Tue,  3 Aug 2021 23:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F208B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12C3C4048D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8W2v2v39kX3i for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F49E40EB2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D208983FEF; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 19:58:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b18d9d6191c3ca1f74115e6395ff8e9ee1b75b89
X-Git-Newrev: 2392f76b6b345308baf8d3d2f075793d30185d76
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.D208983FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usbguard: disable on
 musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2392f76b6b345308baf8d3d2f075793d30185d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

usbguard doesn't build on musl because it uses GNU version of strerror_r
as well as basename resulting in the following build failure:

In file included from ./src/Library/public/usbguard/Rule.hpp:24,
                 from src/CLI/usbguard-rule-parser.cpp:23:
./src/Library/public/usbguard/Exception.hpp: In static member function 'static std::string usbguard::ErrnoException::reasonFromErrno(int)':
./src/Library/public/usbguard/Exception.hpp:129:72: error: no matching function for call to 'std::__cxx11::basic_string<char>::basic_string(int)'
  129 |       return std::string(strerror_r(errno_value, buffer, sizeof buffer));
      |

Fixes:
 - http://autobuild.buildroot.org/results/ac1fd7b8c7bd65c73a9213a40c5ed1c39204dab0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 34e24a2156..58ee5c4b25 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
 	help
@@ -16,7 +17,8 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
