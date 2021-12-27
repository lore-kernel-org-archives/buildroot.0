Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B241FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5DC813A4;
	Mon, 27 Dec 2021 10:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2V8yaLF65qYf; Mon, 27 Dec 2021 10:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A151080C15;
	Mon, 27 Dec 2021 10:22:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 582E11BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5418E40354
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fz2PlrjhMVYo for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A46C40210
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8F27482ACE; Mon, 27 Dec 2021 10:16:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:22:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 617e3f74700968e3541648e5481129fbfc60c9b3
X-Git-Newrev: ac3bb80b1ff80296c6495393e2465b511a7a605f
X-Patchwork-Hint: ignore
Message-Id: <20211227101640.8F27482ACE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac3bb80b1ff80296c6495393e2465b511a7a605f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on musl raised since bump to version
1.78.0 in commit ebef6189141c0070730fce46c1305c030d4cad44:

In file included from libs/log/src/permissions.cpp:18:
./boost/interprocess/permissions.hpp:73:14: error: 'mode_t' in namespace '::' does not name a type
   73 |    typedef ::mode_t    os_permissions_type;
      |              ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ca22263cef24b0240f7e5c374c0aeebb01ecc63e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-sys-stat-h-include-on-musl-based-systems.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch b/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
new file mode 100644
index 0000000000..9b86b816bf
--- /dev/null
+++ b/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
@@ -0,0 +1,31 @@
+From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
+From: Leonardo Neumann <leonardo@neumann.dev.br>
+Date: Mon, 13 Dec 2021 01:07:20 -0300
+Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
+
+Boost 1.78.0 fails to build on musl-based systems because musl does
+not include sys/stat.h by default.
+
+Fixes #161 ("Boost compiler error")
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/boostorg/interprocess/pull/162]
+---
+ include/boost/interprocess/permissions.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
+index ab55411e..0b21a685 100644
+--- a/boost/interprocess/permissions.hpp
++++ b/boost/interprocess/permissions.hpp
+@@ -29,6 +29,10 @@
+ 
+ #include <boost/interprocess/detail/win32_api.hpp>
+ 
++#else
++
++#include <sys/stat.h>
++
+ #endif
+ 
+ #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
