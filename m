Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8669C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 11:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE19405EC;
	Mon, 23 May 2022 11:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SERJD53cytcL; Mon, 23 May 2022 11:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86661404B7;
	Mon, 23 May 2022 11:02:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFF5E1BF30A
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 11:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC42607F9
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 11:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BZo_3ci_fDq for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 11:02:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 046E660C1D
 for <buildroot@buildroot.org>; Mon, 23 May 2022 11:02:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 120F586384; Mon, 23 May 2022 10:50:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 12:59:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6289b788e3148ddef501311d8bfea8b314677054
X-Git-Newrev: bceccda3fd48a00bbe8263fd3b846dfb4cd79ac3
X-Patchwork-Hint: ignore
Message-Id: <20220523105059.120F586384@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tvheadend: fix
 FTBFS
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
Content-Type: multipart/mixed; boundary="===============6552544837533350493=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6552544837533350493==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bceccda3fd48a00bbe8263fd3b846dfb4cd79ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the folloing build failure raised since commit
04164b81e76e29fb9482245e808b46af2aa67bc6:

src/utils.c: In function 'sha512sum256':
src/utils.c:619:45: error: token " " is not valid in preprocessor expressions
  619 | #if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
      |                                             ^

Fixes:
 - http://autobuild.buildroot.org/results/caf0f5e4c6ad0f2764f07d33f594b6121cea87bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bbb3370efbe92132cf4a00fa7bb267f9f4d6bc8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch b/package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch
new file mode 100644
index 0000000000..2caa281490
--- /dev/null
+++ b/package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch
@@ -0,0 +1,28 @@
+From fd01737270d98c28465c86a688bd7d1c640486c5 Mon Sep 17 00:00:00 2001
+From: Michael Marley <michael@michaelmarley.com>
+Date: Wed, 6 Apr 2022 21:47:49 -0400
+Subject: [PATCH] Fix FTBFS in utils.c
+
+U+0020 SPACE and U+00A0 NO-BREAK SPACE look the same, but they
+aren't the same.
+
+[Retrieved from:
+https://github.com/tvheadend/tvheadend/commit/fd01737270d98c28465c86a688bd7d1c640486c5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/utils.c b/src/utils.c
+index eecb10e116..bc6401d22f 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -616,7 +616,7 @@ sha256sum ( const char *str, int lowercase )
+ char *
+ sha512sum256 ( const char *str, int lowercase )
+ {
+-#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
+   return openssl_hash_hexstr(str, lowercase, EVP_sha512_256(), 32);
+ #else
+   return NULL;

--===============6552544837533350493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6552544837533350493==--
