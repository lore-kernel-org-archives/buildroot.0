Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857FDC433FE
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394BE41675;
	Mon, 11 Apr 2022 09:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pT4ya93Hp2P; Mon, 11 Apr 2022 09:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130E74161B;
	Mon, 11 Apr 2022 09:47:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD8271BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47FD3600B4
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14V_m-WRpiNU for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8663E6058D
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 03A11838C1; Mon, 11 Apr 2022 09:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:42:19 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1424a67d0a8279a126f4bd87accbd5de8718be2b
X-Git-Newrev: 26564c4427e3d27cb31f751b3a1b5c7f58e5cbf0
X-Patchwork-Hint: ignore
Message-Id: <20220411093637.03A11838C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/stunnel: doesn't
 build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=26564c4427e3d27cb31f751b3a1b5c7f58e5cbf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl:

In file included from tls.c:39:
prototypes.h:774:8: error: unknown type name 'CRYPTO_RWLOCK'
  774 | extern CRYPTO_RWLOCK *stunnel_locks[STUNNEL_LOCKS];
      |        ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c48ba8e71dc917b2e11051088dd252be81b3609f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4032672736614397c803584ba7bb8a20ae1896e)
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
