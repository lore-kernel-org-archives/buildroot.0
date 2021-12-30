Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C03C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B644660BFE;
	Thu, 30 Dec 2021 14:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpNNVAHh6Jc0; Thu, 30 Dec 2021 14:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E9260BD8;
	Thu, 30 Dec 2021 14:08:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40C141BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC19840494
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gRDl5MWwjFj for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0AC94022C
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD46082DD8; Thu, 30 Dec 2021 14:01:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:06:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f02cdc1917abd99016fbc4d1a26ee825d117321
X-Git-Newrev: 76c251e943092000fb317997ac83878784c58d09
X-Patchwork-Hint: ignore
Message-Id: <20211230140124.AD46082DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minetest: add missing header
 "memory" required since gcc 11
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
Content-Type: multipart/mixed; boundary="===============3453267590197215704=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3453267590197215704==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=76c251e943092000fb317997ac83878784c58d09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport from upstream.

Fixes:

minetest-5.4.1/src/clientiface.h:444:36: error: ‘shared_ptr’ in namespace ‘std’ does not name a template type
  444 |         ClientInterface(const std::shared_ptr<con::Connection> &con);

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-build-for-newer-versions-of-GCC-11246.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/minetest/0001-Fix-build-for-newer-versions-of-GCC-11246.patch b/package/minetest/0001-Fix-build-for-newer-versions-of-GCC-11246.patch
new file mode 100644
index 0000000000..35102a077b
--- /dev/null
+++ b/package/minetest/0001-Fix-build-for-newer-versions-of-GCC-11246.patch
@@ -0,0 +1,35 @@
+From a327c06f5dee9f432666b503203fd15e4ccafc1b Mon Sep 17 00:00:00 2001
+From: lhofhansl <larsh@apache.org>
+Date: Thu, 6 May 2021 10:24:30 -0700
+Subject: [PATCH] Fix build for newer versions of GCC (#11246)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 7c2826cbc0f36027d4a9781f433150d1c5d0d03f)
+
+Fixes:
+
+minetest-5.4.1/src/clientiface.h:444:36: error: ‘shared_ptr’ in namespace ‘std’ does not name a template type
+  444 |         ClientInterface(const std::shared_ptr<con::Connection> &con);
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/clientiface.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/clientiface.h b/src/clientiface.h
+index cc5292b71..dfd976741 100644
+--- a/src/clientiface.h
++++ b/src/clientiface.h
+@@ -31,6 +31,7 @@ with this program; if not, write to the Free Software Foundation, Inc.,
+ #include <list>
+ #include <vector>
+ #include <set>
++#include <memory>
+ #include <mutex>
+ 
+ class MapBlock;
+-- 
+2.31.1
+

--===============3453267590197215704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3453267590197215704==--
