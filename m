Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1850AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D82360F58
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D82360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1834084BEA;
	Mon,  4 Oct 2021 13:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMFjOxRgVvcu; Mon,  4 Oct 2021 13:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76AFB84BDE;
	Mon,  4 Oct 2021 13:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C55F1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF4FD40012
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIYkrORhlueq for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 13:38:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 038B8405E5
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 13:38:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9978E8DCB4; Mon,  4 Oct 2021 13:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 15:09:46 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9b4544d49d32d424f2760470e2b30e1c6cee2650
X-Git-Newrev: 3847449598f6c649ead796d59fb30cff4a0c3cd8
X-Patchwork-Hint: ignore
Message-Id: <20211004133607.9978E8DCB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libressl: depend
 on threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=3847449598f6c649ead796d59fb30cff4a0c3cd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

If the toolchain does not have threads (e.g. br-arm-full-nothread),
compilation fails:

In file included from /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/cryptlib.c:117:
/home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/../include/compat/pthread.h:114:15: fatal error: pthread.h: No such file or directory
  114 | #include_next <pthread.h>
      |               ^~~~~~~~~~~
compilation terminated.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit da8f069d745de73fb5810c21b2896ff173fa6090)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index daf76e7063..cf64240b34 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -40,6 +40,7 @@ source "package/libopenssl/Config.in"
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc on noMMU doesn't provide __register_atfork()
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
