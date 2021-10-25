Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62620C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:57:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD0360F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBD0360F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80484403BC;
	Mon, 25 Oct 2021 18:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUIDQ4mwersA; Mon, 25 Oct 2021 18:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99426403B8;
	Mon, 25 Oct 2021 18:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 851BA1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7547D80EFE
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVWpB_qwywIJ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0493080F24
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 77333887A9; Mon, 25 Oct 2021 18:53:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51682c03a8b99d42c1b4e253da80c127d9146c9f
X-Git-Newrev: 50da37281fa02d64bb1e35da1186770756960a1d
X-Patchwork-Hint: ignore
Message-Id: <20211025185305.77333887A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gqrx: add missing reverse
 dependency for gnuradio
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

commit: https://git.buildroot.net/buildroot/commit/?id=50da37281fa02d64bb1e35da1186770756960a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnuradio suffers from gcc bug 43744 but gqrx that depends on it doesn't
take into account the gcc bug. So let's add it as:
'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio'

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gqrx/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 60942c36c8..adcdbb0896 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -8,8 +8,8 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
 
-comment "gqrx needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 || BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
@@ -21,6 +21,7 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
