Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9282CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5116D83F47;
	Thu, 21 Apr 2022 18:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asBOhrNrQe2O; Thu, 21 Apr 2022 18:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE9683022;
	Thu, 21 Apr 2022 18:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15F251C1190
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1A1160E00
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b57HFFVz15sh for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317B360B17
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3755683FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1e207f976018e44c964cbe661d5fa315f529527
X-Git-Newrev: bbb3370efbe92132cf4a00fa7bb267f9f4d6bc8a
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.3755683FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: fix FTBFS
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
Content-Type: multipart/mixed; boundary="===============0468087558569685145=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0468087558569685145==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bbb3370efbe92132cf4a00fa7bb267f9f4d6bc8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============0468087558569685145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0468087558569685145==--
