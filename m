Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FD9C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FC360F22
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3FC360F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9154240539;
	Wed,  4 Aug 2021 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezPotQbtfnSo; Wed,  4 Aug 2021 20:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EA9240147;
	Wed,  4 Aug 2021 20:50:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 164891BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 053D640147
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDhIFn_TrrUC for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:50:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15FF1400D9
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:50:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 119C084387; Wed,  4 Aug 2021 20:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e783d3e4704d770120da8bbbd6acad168b69625
X-Git-Newrev: 17e7863ba9c3b1946754e0f3d29cae00dc6e4d0d
X-Patchwork-Hint: ignore
Message-Id: <20210804205031.119C084387@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: opcache needs dynamic library
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
