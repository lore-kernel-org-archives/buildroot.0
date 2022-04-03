Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF431C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 21:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6794B60E97;
	Sun,  3 Apr 2022 21:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uu1mq4hLqKR7; Sun,  3 Apr 2022 21:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9177E60E22;
	Sun,  3 Apr 2022 21:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2CF81BF2CA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 21:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A6F383096
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 21:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GumgEUygxLq0 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 21:48:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDBC582CD4
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 21:48:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2532F86109; Sun,  3 Apr 2022 21:38:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 22:36:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d806891cb0dc0fd2d30171d14bc9e911abbe76e
X-Git-Newrev: 192dfc68c0e43d0865beb16250582b3b4e5ed178
X-Patchwork-Hint: ignore
Message-Id: <20220403213840.2532F86109@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: fix build on powerpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=192dfc68c0e43d0865beb16250582b3b4e5ed178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/zlib-ng/zlib-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fb497b8c11..938acd4181 100644
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
