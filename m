Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB5AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 22:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F10F640B88;
	Sat, 28 May 2022 22:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwmxrCOCveLc; Sat, 28 May 2022 22:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DEDB4014C;
	Sat, 28 May 2022 22:12:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 201061BF580
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E873417E1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVurnOpZWbmA for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 22:12:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B7D9417D8
 for <buildroot@buildroot.org>; Sat, 28 May 2022 22:12:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9AA74864B9; Sat, 28 May 2022 22:00:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 00:10:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31962ae9383bf47c5632ced82ddaaf25b8625c49
X-Git-Newrev: d81a99cc7cf2373b28bc06da4d3c543982b312b1
X-Patchwork-Hint: ignore
Message-Id: <20220528220041.9AA74864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: fix build without atomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=d81a99cc7cf2373b28bc06da4d3c543982b312b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without atomic raised since commit
fde21979427ffeb4fe9c0068310be195f2dec5ec:

/nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dhcp/dhcp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index cbc95cb152..183c8322d6 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -62,9 +62,14 @@ else
 DHCP_BIND_EXTRA_CONFIG += --without-zlib
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
+DHCP_BIND_EXTRA_CONFIG += --enable-atomic
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DHCP_CONF_ENV += LIBS=-latomic
 endif
+else
+DHCP_BIND_EXTRA_CONFIG += --disable-atomic
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCP_CONF_OPTS += --disable-libtool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
