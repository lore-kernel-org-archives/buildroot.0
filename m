Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE6EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A08BE40393;
	Mon,  4 Apr 2022 19:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLCc19gb3bNh; Mon,  4 Apr 2022 19:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F07B40201;
	Mon,  4 Apr 2022 19:42:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89B621BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D1840201
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55eDR1rfpDKw for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46177401DF
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 971EA8267E; Mon,  4 Apr 2022 19:32:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:40:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5558c8c866aaf3ca85deccf9bee6b0747d16d75f
X-Git-Newrev: 6de440a5c533b68d45614e13bba5fc296ca5d483
X-Patchwork-Hint: ignore
Message-Id: <20220404193241.971EA8267E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/zlib-ng: fix
 build on powerpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=6de440a5c533b68d45614e13bba5fc296ca5d483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Handle WITH_POWER8 to fix the following build failure with powerpc and
libglib2 raised since bump to version 1.9.9-b1 in commit
1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and
https://github.com/zlib-ng/zlib-ng/commit/b81f4ee96dcbdf1db34b00727b6f1829a2ba1edb:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/11.2.0/../../../../powerpc-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/powerpc-buildroot-linux-musl/sysroot/usr/lib/libz.a(adler32_power8.c.o): in function `adler32_power8':
/home/autobuild/autobuild/instance-9/output-1/build/zlib-ng-2.0.6/arch/power/adler32_power8.c:106: undefined reference to `vec_sumsu'

Fixes:
 - http://autobuild.buildroot.org/results/f864a0e2307e25342b45c90a5b4fb57a0f5c1c93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 192dfc68c0e43d0865beb16250582b3b4e5ed178)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib-ng/zlib-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index c56fa72d6f..19bb9a9b5e 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -23,4 +23,10 @@ ifeq ($(BR2_arm),y)
 ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
 endif
 
+ifeq ($(BR2_powerpc_power8),y)
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
