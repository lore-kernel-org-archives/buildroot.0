Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D387FC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 689DB606C0;
	Mon, 12 Aug 2024 21:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQByA5-iL7KG; Mon, 12 Aug 2024 21:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C5860632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C5860632;
	Mon, 12 Aug 2024 21:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 651211BF330
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 21:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FF6260632
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkUnBk6Vi2yS for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 21:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E236460628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E236460628
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E236460628
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 21:40:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0A6DFB00563;
 Mon, 12 Aug 2024 23:40:23 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 23:40:14 +0200
Message-ID: <20240812214014.2434246-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723498825;
 bh=N4mcIjAz3vMpgD6j/fwILOLvWNOIIrp85zryGmExyMg=;
 h=From:To:Cc:Subject:Date:From;
 b=O44UHXP2P1eio/2A51C2rShuNA4HFU3tklcMX+YgwzDKtQIip1jDCBf4gRNLXh7QH
 de8r7fm21MY1s1cAPLcN/x473LIXCYQAOGFGJfghygz9uHdnTG9ZYLVs09ZytAcdVC
 pN+AzCGpn59woBvDfCOHr1zhgxWDY4JlQ7iY2emObfnZmV587Hnsfcf5FwwX1MNAW6
 F0cwlPn/w9WyJYMlQuQOzAGk9jLr9ucN7SlXbDYz53q39PKC4/gbN6Co+snmUKjEhy
 8u//Lk4ZhU8amMY4BhPeVNug0kFRbiAdFSVbJ7bWclP3zD7kdWanaURlwHREyAYb/B
 kNt2qngzG+zxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=O44UHXP2
Subject: [Buildroot] [PATCH v2 1/1] package/libgpg-error: needs MMU
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgpg-error imported code using fork() in commit [1] and enabled it
soon after in [2]. Those commits were first included in libgpg-error
version 1.28.

For reference, the libgpg-error Buildroot package was updated to that
version in commit [3].

When Buildroot configuration has no MMU support (e.g. BR2_USE_MMU is
not set), libgpg-error fails to build with error:

    /build/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./.libs/libgpg-error.a(libgpg_error_la-spawn-posix.o): in function '_gpgrt_process_spawn':
    spawn-posix.c:(.text+0x630): undefined reference to 'fork'

This issue can be observed with the command:

    utils/test-pkg -a -p libgpg-error

It will show few build failures:

    ...
       bootlin-armv7m-uclibc [ 6/41]: FAILED
    ...
    bootlin-m68k-5208-uclibc [ 8/41]: FAILED
    ...

This commit fixes the issue by adding the dependency on BR2_USE_MMU
in BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS. Doing so will
automatically propagates this dependency to all packages using
libgpg-error (and thus, already depending on this _ARCH_SUPPORTS).

Fixes:
http://autobuild.buildroot.org/results/dbc82ba08e6a30c2f558c8c36ad7eeb0e3cab090/
http://autobuild.buildroot.org/results/074a803de0f48cd86b9135cca50f136cccf1bcea/
http://autobuild.buildroot.org/results/4c1966a71020af31c1dc1b0a13a3928c84e75874/
...and many others.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=8f41cc23b12485404203be5881aaaadb78696b4d
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=1865c0ba1769b407a3c504f1ab0a4278704a9fc1
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/692d191c8b0b3c86022e6a6ba3bd2d8f53b39f03

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2: Suggested by Thomas:
- Moved the BR2_USE_MMU dependency in _ARCH_SUPPORTS
- Removed all package updates, since they are now unneeded
---
 package/libgpg-error/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 5a2c14ead8..a0ee7ec531 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 		BR2_sh4a	|| BR2_sh4aeb		|| \
 		BR2_sparc	|| BR2_sparc64		|| \
 		BR2_x86_64
+	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
