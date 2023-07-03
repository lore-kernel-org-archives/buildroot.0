Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8673AC001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293F9817B1;
	Mon,  3 Jul 2023 19:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 293F9817B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTkGAUwq4sPY; Mon,  3 Jul 2023 19:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AB5381882;
	Mon,  3 Jul 2023 19:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB5381882
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B04991BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85F7A404C8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F7A404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFcreISn2WsJ for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:35:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99D85402B2
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D85402B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84232864EB; Mon,  3 Jul 2023 19:35:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:34:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94370ed250cba1f5cf01f4e8090df3ef0ca01337
X-Git-Newrev: 409a5f98767d5bb117504597f83446cb134586d8
X-Patchwork-Hint: ignore
Message-Id: <20230703193511.84232864EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh2: disable rpath
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

commit: https://git.buildroot.net/buildroot/commit/?id=409a5f98767d5bb117504597f83446cb134586d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping libssh2 to 1.11.0 with buildroot commit
af87ad197caf434936fe239f2718fd17b60fcb8b
causes build errors with libcurl due to "-R" being added to libssh2.pc.

Quoting autobuilder build-end.log

checking for recv... no
configure: error: Unable to link function recv

Quoting autobuilder libcurl-8.1.2/config.log

arc-buildroot-linux-uclibc-gcc.br_real: error: unrecognized command-line option '-R'

Fixes:
http://autobuild.buildroot.net/results/78f/78ffda92d51f8abdbcef93f968ace432d0d44979/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libssh2/libssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 8bedbdffba..a42be46a7a 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -11,7 +11,7 @@ LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
-LIBSSH2_CONF_OPTS = --disable-examples-build
+LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
