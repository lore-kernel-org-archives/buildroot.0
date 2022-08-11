Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9343CC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BCB41795;
	Thu, 11 Aug 2022 11:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BCB41795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SxvgQKiDd1v; Thu, 11 Aug 2022 11:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23489414C5;
	Thu, 11 Aug 2022 11:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23489414C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D78A01BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B39244032A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B39244032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5sCqHht-7TG for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:44:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAB0C4023B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAB0C4023B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C24AE8712A; Thu, 11 Aug 2022 11:29:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:41:44 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: df044f07508e25b0a35c3e3ca94c88ca6ea6e229
X-Git-Newrev: bb5c40b896135be524c80b52860aa43cc4604fb2
X-Patchwork-Hint: ignore
Message-Id: <20220811112945.C24AE8712A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libopenssl: fix
 BR2_OPTIMIZE_FAST build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb5c40b896135be524c80b52860aa43cc4604fb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit a7c4f8e485abb91683268eb4fe543a9e882f0552)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
