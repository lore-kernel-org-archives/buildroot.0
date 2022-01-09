Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA9CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBC640288;
	Sun,  9 Jan 2022 22:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8L_sUhvcJN5u; Sun,  9 Jan 2022 22:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE63B40252;
	Sun,  9 Jan 2022 22:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64C2C1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45A08813F1
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ce2xbpPOnDfn for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:26:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A342E813F0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3C1C1829F7; Sun,  9 Jan 2022 22:20:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:26:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f35a4b4ae22046fb04edc165edbb27ee5439aa4b
X-Git-Newrev: b7a00b39bca0df9737890145b7f59b9c1c3d2e4c
X-Patchwork-Hint: ignore
Message-Id: <20220109222042.3C1C1829F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: force -fno-lto
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7a00b39bca0df9737890145b7f59b9c1c3d2e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc requires compilation barriers between files, and will fail with
LTO enabled.

So force LTO off by appending -fno-lto to the flags, but only if the GCC
version is recent enough that an LTO build would be possible.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3862e0624b..5c26b0e6df 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -53,6 +53,11 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
 GLIBC_EXTRA_CFLAGS += -g
 endif
 
+# glibc explicitly requires compile barriers between files
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+GLIBC_EXTRA_CFLAGS += -fno-lto
+endif
+
 # The stubs.h header is not installed by install-headers, but is
 # needed for the gcc build. An empty stubs.h will work, as explained
 # in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
