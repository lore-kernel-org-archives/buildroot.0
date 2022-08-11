Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A3C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A750C417E6;
	Thu, 11 Aug 2022 11:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A750C417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2OMKCso3TX6; Thu, 11 Aug 2022 11:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8A3414C5;
	Thu, 11 Aug 2022 11:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8A3414C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73C721BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C75160F58
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C75160F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIzGnnYjgYoE for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D68A60F3E
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D68A60F3E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6216E87121; Thu, 11 Aug 2022 11:29:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:42:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0053bbbeaf7e1c36d6a947f3aadfaeb480911461
X-Git-Newrev: b520cfec89e9ae1522d728c5a2fe9ccd8ef4ab09
X-Patchwork-Hint: ignore
Message-Id: <20220811112941.6216E87121@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libopenssl: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=b520cfec89e9ae1522d728c5a2fe9ccd8ef4ab09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
