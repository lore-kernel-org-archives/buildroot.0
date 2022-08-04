Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BCDC19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C81541BA7;
	Thu,  4 Aug 2022 15:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C81541BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkCIZoxAkg6h; Thu,  4 Aug 2022 15:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A36E41B61;
	Thu,  4 Aug 2022 15:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A36E41B61
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA25E1C1148
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B616681CA0
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B616681CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMqEsmINwSvh for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E26CF81760
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26CF81760
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A5D386E59; Thu,  4 Aug 2022 14:49:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Aug 2022 17:00:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9267bd192efa95e9df9e886637a2edc2556cf80e
X-Git-Newrev: c5d717492d117ebd6b8b8546d7a26fc0712b08b4
X-Patchwork-Hint: ignore
Message-Id: <20220804144956.4A5D386E59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/openssl: fix
 libressl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5d717492d117ebd6b8b8546d7a26fc0712b08b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libressl can be built with uclibc on noMMU since bump to version 3.0.2
in commit 26f42106e8acfd336d8e902da96cd2ac9e63c09d and
https://github.com/libressl-portable/openbsd/commit/f542e84c859e3fb2728075c702062cce8a0ea93f

However, uclibc-ng doesn't provide __register_atfork without NPTL
resulting in the following libressl build failure:

/nvmedata/autobuild/instance-28/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.3.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: ../../tls/libtls.a(arc4random.c.o): in function `_rs_stir':
arc4random.c:(.text+0x50c): undefined reference to `__register_atfork'

So fix the dependency and, while at it, drop the double negation for
readability

Fixes:
 - http://autobuild.buildroot.org/results/2fa4fa10cf19f1f942b6b49b5f6f05339c008cd4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 33599d5f35bce2b45205bc85cf1eff093f4fadc6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 7bf49b05f6..c7641ecefa 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -34,8 +34,8 @@ config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# uClibc on noMMU doesn't provide __register_atfork()
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
+	# uClibc doesn't provide __register_atfork() without NPTL
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
