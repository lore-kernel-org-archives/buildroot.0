Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CDFC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D0F41713;
	Mon,  8 Aug 2022 14:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D0F41713
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpA-Z7mrF9VC; Mon,  8 Aug 2022 14:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9540C409EC;
	Mon,  8 Aug 2022 14:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9540C409EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 838281BF982
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C79D409DE
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C79D409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApJ1oNKoTvBg for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:37:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F19B40222
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F19B40222
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F16F086FCA; Mon,  8 Aug 2022 14:22:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 16:36:47 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 943ec68988898352e5a66d52714f7596160332ae
X-Git-Newrev: 10a192a07e1ac309cede246694f6756cdc2dbea4
X-Patchwork-Hint: ignore
Message-Id: <20220808142255.F16F086FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libwebsockets:
 fix openssl build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=10a192a07e1ac309cede246694f6756cdc2dbea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following openssl build failure without threads raised since
bump to version 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
https://github.com/warmcat/libwebsockets/commit/471dbf5280b2d0770cdf2803642586cee37a335d:

In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
/home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
   85 |         HMAC_CTX ctx;
      |                  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 490768cc8ca746a4a3956dee7a39853e868d8510)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-CMakeLists.txt-fix-build-without-threads.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
new file mode 100644
index 0000000000..ae46602a53
--- /dev/null
+++ b/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
@@ -0,0 +1,47 @@
+From c83cf48b9095a6914a0844bec4439763bb0c9138 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 28 May 2022 23:15:40 +0200
+Subject: [PATCH] lib/tls/CMakeLists.txt: fix build without threads
+
+openssl can be built without threads resulting in the following build
+failure:
+
+-- Looking for HMAC_CTX_new
+-- Looking for HMAC_CTX_new - not found
+
+[...]
+
+In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
+/home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
+   85 |         HMAC_CTX ctx;
+      |                  ^~~
+
+To fix this build failure, don't unconditionally add pthread if openssl
+has been found through pkg-config as openssl.pc will contain the
+appropriate dependencies (i.e. -lpthread but also -lz or -latomic)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/warmcat/libwebsockets/commit/c83cf48b9095a6914a0844bec4439763bb0c9138]
+---
+ lib/tls/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
+index 559be9abb..a2b78c252 100644
+--- a/lib/tls/CMakeLists.txt
++++ b/lib/tls/CMakeLists.txt
+@@ -311,7 +311,7 @@ endif()
+ if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
+ 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_DL_LIBS})
+ endif()
+-if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
++if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT ((${CMAKE_SYSTEM_NAME} MATCHES "QNX") OR PC_OPENSSL_FOUND))
+ 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} pthread)
+ endif()
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
