Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1807C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A748826BF;
	Wed, 20 Jul 2022 11:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A748826BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ph7eOceQXaR; Wed, 20 Jul 2022 11:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3868267C;
	Wed, 20 Jul 2022 11:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D3868267C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8039B1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58141401ED
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58141401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sekquFQmJcA2 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:51:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F8D40139
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F8D40139
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 938EC83FD2; Wed, 20 Jul 2022 11:38:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 13:51:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03022329e02332c22f44e0e0a9b17d8454ba26ae
X-Git-Newrev: a7c4f8e485abb91683268eb4fe543a9e882f0552
X-Patchwork-Hint: ignore
Message-Id: <20220720113814.938EC83FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: fix BR2_OPTIMIZE_FAST
 build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7c4f8e485abb91683268eb4fe543a9e882f0552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop unneeded SED hacks (including build_tests) to fix the following
build failure with BR2_OPTIMIZE_FAST:

In file included from crypto/async/arch/../async_local.h:30,
                 from crypto/async/arch/async_null.c:11:
crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
   32 |     ucontext_t fibre;
      |     ^~~~~~~~~~

While at it, also "drop parentheses as all it does is spawn a useless
sub-shell" as noticed by Yann E. Morin

Fixes:
 - http://autobuild.buildroot.org/results/3ce202f11a821940ff55eafa1dc7cea54b8c0da2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/libopenssl.mk | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 135129d47f..c7a2d65cc4 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -52,7 +52,7 @@ LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
 endif
 
 define HOST_LIBOPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
+	cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		./config \
 		--prefix=$(HOST_DIR) \
@@ -61,15 +61,14 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		no-fuzz-libfuzzer \
 		no-fuzz-afl \
 		shared \
-		zlib-dynamic \
-	)
-	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
+		zlib-dynamic
 endef
 
 define LIBOPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
+	cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
+		 CFLAGS="$(LIBOPENSSL_CFLAGS)" \
 		./Configure \
 			$(LIBOPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
@@ -108,11 +107,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
-			$(if $(BR2_STATIC_LIBS),no-dso) \
-	)
-	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
-	$(SED) "s# build_tests##" $(@D)/Makefile
+			$(if $(BR2_STATIC_LIBS),no-dso)
 endef
 
 # libdl is not available in a static build, and this is not implied by no-dso
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
