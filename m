Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE76C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58736416C7;
	Sun, 10 Apr 2022 21:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pw9Zguo5b1bq; Sun, 10 Apr 2022 21:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B734160B;
	Sun, 10 Apr 2022 21:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8621BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A94260BFF
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t16eZoNI-tGx for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CE9860BB0
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 07CC98396D; Sun, 10 Apr 2022 21:02:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35be926c97836989d6cecbc7ecb49f9c9bd46eba
X-Git-Newrev: e4032672736614397c803584ba7bb8a20ae1896e
X-Patchwork-Hint: ignore
Message-Id: <20220410210202.07CC98396D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: doesn't build with
 libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4032672736614397c803584ba7bb8a20ae1896e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl:

In file included from tls.c:39:
prototypes.h:774:8: error: unknown type name 'CRYPTO_RWLOCK'
  774 | extern CRYPTO_RWLOCK *stunnel_locks[STUNNEL_LOCKS];
      |        ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c48ba8e71dc917b2e11051088dd252be81b3609f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index 087fecd930..a46e2f0316 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
