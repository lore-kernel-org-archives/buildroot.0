Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258F2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E021F60524
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E021F60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9AC540554;
	Tue,  3 Aug 2021 21:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trmakFCktSpc; Tue,  3 Aug 2021 21:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19EEC40384;
	Tue,  3 Aug 2021 21:38:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80A2E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE0E404BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5GqbQ0-DZAc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D502F404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2BF9085F62; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 22:36:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5a075b47a86e4e2b147256bd946c9cfd1d3bc15e
X-Git-Newrev: cb6fd050cde0eaf6b9b3c8f4cab2b6d925974922
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.2BF9085F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/directfb: disable on
 riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb6fd050cde0eaf6b9b3c8f4cab2b6d925974922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

directfb unconditionally uses __NR_futex which will raise the following
build failure on riscv32:

system.c:242:21: error: '__NR_futex' undeclared (first use in this function)
  242 |      ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );
      |                     ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/directfb/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 20481f56da..f4d6b8cbd1 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
+	depends on !BR2_RISCV_32
 	depends on !BR2_STATIC_LIBS # static link issues
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -161,6 +162,7 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 endif # BR2_PACKAGE_DIRECTFB
 
 comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5, dynamic library"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL || \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
