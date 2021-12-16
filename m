Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EE4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E1C6101B;
	Thu, 16 Dec 2021 19:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yW57xvl63d6c; Thu, 16 Dec 2021 19:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1085461050;
	Thu, 16 Dec 2021 19:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3371C113E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B5E7417B6
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvcCEyQAwA38 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8544417AF
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5DD92821EB; Thu, 16 Dec 2021 19:04:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:07:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03943b9b492a9405fd8b494f265ee72780b010ce
X-Git-Newrev: 7cd070e4f0ebe1b566b33d3bbdfa7bef05c4b4e4
X-Patchwork-Hint: ignore
Message-Id: <20211216190423.5DD92821EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: fix build on sparc
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cd070e4f0ebe1b566b33d3bbdfa7bef05c4b4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on sparc raised since bump to version
1.12 in commit b4bdf704fea59db81433bbc07585e4c4db258d9a:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/taglib-1.12/taglib/toolkit/trefcounter.cpp:55:21: error: duplicate 'volatile'
   55 | # define ATOMIC_INT volatile int
      |                     ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/387feeb6bcc190b3908e405ba5f8a888d7e1f348

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...latile-on-systems-without-HAVE_GCC_ATOMIC.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
new file mode 100644
index 0000000000..d8af73cb08
--- /dev/null
+++ b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
@@ -0,0 +1,34 @@
+From 1d24bd3399f2284104cbe87d017f87325b1797ab Mon Sep 17 00:00:00 2001
+From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
+Date: Thu, 13 May 2021 16:41:35 +0200
+Subject: [PATCH] =?UTF-8?q?Fix=20"error:=20duplicate=20=E2=80=98volatile?=
+ =?UTF-8?q?=E2=80=99"=20on=20systems=20without=20HAVE=5FGCC=5FATOMIC=20in?=
+ =?UTF-8?q?=201.12=20(#1012)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* fix error: duplicate volatile
+
+* fix volatile ATOMIC_INT in constructor
+
+[Retrieved from:
+https://github.com/taglib/taglib/commit/1d24bd3399f2284104cbe87d017f87325b1797ab]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ taglib/toolkit/trefcounter.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/taglib/toolkit/trefcounter.cpp b/taglib/toolkit/trefcounter.cpp
+index 18cb596c0..5b089abf9 100644
+--- a/taglib/toolkit/trefcounter.cpp
++++ b/taglib/toolkit/trefcounter.cpp
+@@ -52,7 +52,7 @@
+ # define ATOMIC_INC(x) __sync_add_and_fetch(&x, 1)
+ # define ATOMIC_DEC(x) __sync_sub_and_fetch(&x, 1)
+ #else
+-# define ATOMIC_INT volatile int
++# define ATOMIC_INT int
+ # define ATOMIC_INC(x) (++x)
+ # define ATOMIC_DEC(x) (--x)
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
