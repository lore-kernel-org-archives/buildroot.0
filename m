Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1981C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:08:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049E860F6B
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 049E860F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A93DC40277;
	Mon, 20 Sep 2021 19:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJ2wMi3IINFa; Mon, 20 Sep 2021 19:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6228401B6;
	Mon, 20 Sep 2021 19:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D04A1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D3B9823FB
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJKZZXy6-PUT for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:08:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0C02823F6
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:08:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 537ED8B824; Mon, 20 Sep 2021 19:06:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 21:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 929cb205bb83c30bf838517f654af546c57c19e6
X-Git-Newrev: da8f069d745de73fb5810c21b2896ff173fa6090
X-Patchwork-Hint: ignore
Message-Id: <20210920190639.537ED8B824@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: depend on threads
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da8f069d745de73fb5810c21b2896ff173fa6090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the toolchain does not have threads (e.g. br-arm-full-nothread),
compilation fails:

In file included from /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/cryptlib.c:117:
/home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/../include/compat/pthread.h:114:15: fatal error: pthread.h: No such file or directory
  114 | #include_next <pthread.h>
      |               ^~~~~~~~~~~
compilation terminated.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index f79bac28fa..7bf49b05f6 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -33,6 +33,7 @@ source "package/libopenssl/Config.in"
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc on noMMU doesn't provide __register_atfork()
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	help
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
