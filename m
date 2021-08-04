Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E78C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:50:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6737A60560
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6737A60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358C660A75;
	Thu,  5 Aug 2021 19:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_CwP_iRmZZx; Thu,  5 Aug 2021 19:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB6A60A6C;
	Thu,  5 Aug 2021 19:50:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0908D1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E6360A7C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6GXRKvbK7eZ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0AB460600
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6F6B38B3F4; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:50:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e783d3e4704d770120da8bbbd6acad168b69625
X-Git-Newrev: 17e7863ba9c3b1946754e0f3d29cae00dc6e4d0d
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.6F6B38B3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/php: opcache needs
 dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=17e7863ba9c3b1946754e0f3d29cae00dc6e4d0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

opcache needs dynamic library since version 8.0.0 and
https://github.com/php/php-src/commit/9a06876072b9ccb023d4a14426ccb587f10882f3
otherwise the build will fail on:

/tmp/instance-4/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/instance-4/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
/tmp/instance-4/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: __uClibc_main.c:(.text+0x160): undefined reference to `__fini_array_end'

Fixes:
 - http://autobuild.buildroot.org/results/526d2e3108ff2506482d1665bcc3ed083961430f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php/Config.ext | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 83bb3c481f..4dfdb37f87 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -10,8 +10,12 @@ config BR2_PACKAGE_PHP_EXT_FILEINFO
 	help
 	  File Information support
 
+comment "OPcache needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_OPCACHE
 	bool "OPcache"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable the Zend OPcache accelerator.
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
