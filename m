Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A35C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:20:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD0960F6D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FD0960F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F79C400BA;
	Sat,  9 Oct 2021 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEPh6KvCtxB7; Sat,  9 Oct 2021 20:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9394F40015;
	Sat,  9 Oct 2021 20:20:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF831BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E31140015
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4IEXbXyNYW5 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:20:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 814B540012
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:20:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E93EE94C56; Sat,  9 Oct 2021 20:17:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 22:20:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dec95d8d79923fbf96f5692b24ea987eeec1d516
X-Git-Newrev: cf912e852a01fffc2b1bfe1de3d68dbca939a18d
X-Patchwork-Hint: ignore
Message-Id: <20211009201738.E93EE94C56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: disable package if
 affected from gcc bug 43744
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf912e852a01fffc2b1bfe1de3d68dbca939a18d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is affected by gcc bug 43744 and I have not found a work
around for it(i.e. the common -O0 we use or other), so let's disable it if
gcc has such bug.

Fixes:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 77163c611d..1896d1326a 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -4,7 +4,8 @@ comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
-comment "gnuradio needs a toolchain not affected by GCC bug 64735"
+comment "gnuradio needs a toolchain not affected by GCC bug 43744 and 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_GNURADIO
@@ -15,6 +16,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
