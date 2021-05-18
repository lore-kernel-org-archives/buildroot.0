Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13259C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:07:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F5A60187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8F5A60187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A62466065D;
	Tue,  3 Aug 2021 22:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PG71hdYR4Pz; Tue,  3 Aug 2021 22:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D3B1606DA;
	Tue,  3 Aug 2021 22:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB291BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C5340542
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8wTL0YBQgma for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1166D40488
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F6A785E95; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 14:07:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6e780387b4a901f243c85b5fb1dd0d12e4f0b23b
X-Git-Newrev: 88007f9acc63c5b459003ee712f5ebb30b9157c3
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.5F6A785E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cutelyst: fix linking
 with -latomic
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=88007f9acc63c5b459003ee712f5ebb30b9157c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build is broken since commit 7333207eaf2900076185cba6641c6406d61c235e
because upstream overrides CMAKE_EXE_LINKER_FLAGS when building with
jemalloc:
https://github.com/cutelyst/cutelyst/commit/7d73eba273be365f15f1ffcb3d3ee7f1d44e10fb

Fixes:
 - http://autobuild.buildroot.org/results/ba9bccaae2cad487a66b6eb9851fc206c32d7c82

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...eLists.txt-don-t-override-CMAKE_EXE_LINKE.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch b/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
new file mode 100644
index 0000000000..45b1fcd146
--- /dev/null
+++ b/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
@@ -0,0 +1,31 @@
+From c347aeb43775109cbc2824b99cb10b1b3440c191 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 17 May 2021 21:27:11 +0200
+Subject: [PATCH] server/CMakeLists.txt: don't override CMAKE_EXE_LINKER_FLAGS
+
+Don't override CMAKE_EXE_LINKER_FLAGS as this could break the build if
+CMAKE_EXE_LINKER_FLAGS is already set by the user (for example to pass
+-latomic)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cutelyst/cutelyst/pull/312]
+---
+ wsgi/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/CMakeLists.txt b/server/CMakeLists.txt
+index ec5689f7..1ed56859 100644
+--- a/wsgi/CMakeLists.txt
++++ b/wsgi/CMakeLists.txt
+@@ -95,7 +95,7 @@ install(TARGETS Cutelyst${PROJECT_VERSION_MAJOR}Qt${QT_VERSION_MAJOR}Server
+     cxx_generalized_initializers
+ )
+ if (JEMALLOC_FOUND)
+-    set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} " -Wl,--no-as-needed")
++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed")
+     target_link_libraries(cutelyst-wsgi2 PRIVATE ${JEMALLOC_LIBRARIES})
+ endif()
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
