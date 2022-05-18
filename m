Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4FAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 802156126A;
	Wed, 18 May 2022 19:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmeHJLOHtC8E; Wed, 18 May 2022 19:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F35B61276;
	Wed, 18 May 2022 19:21:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E25921BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF11840579
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-02vLnT1fkU for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EDB04021C
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BC9F286065; Wed, 18 May 2022 19:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae4e99aa9e36ca4cf51a853b5b1f74574bd78af4
X-Git-Newrev: cfd974c340e704a167e3940d4b79d44ae1ac90eb
X-Patchwork-Hint: ignore
Message-Id: <20220518190952.BC9F286065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: fix build with
 libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfd974c340e704a167e3940d4b79d44ae1ac90eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

dtls-bio.c:40:1: error: variable 'janus_dtls_bio_agent_methods' has initializer but incomplete type
   40 | static BIO_METHOD janus_dtls_bio_agent_methods = {
      | ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/92fe19446b40551c0139254d9efc6b3904fa287a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-Fix-build-with-libressl-3.5.0.patch       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..6d75318a45
--- /dev/null
+++ b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,25 @@
+From 8e450a097f5f0c7e9c034e954fbc709797521f1c Mon Sep 17 00:00:00 2001
+From: Lorenzo Miniero <lminiero@gmail.com>
+Date: Fri, 13 May 2022 18:42:38 +0200
+Subject: [PATCH] Fix build with libressl >= 3.5.0 (see #2980)
+
+[Retrieved from:
+https://github.com/meetecho/janus-gateway/commit/8e450a097f5f0c7e9c034e954fbc709797521f1c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dtls-bio.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dtls-bio.h b/dtls-bio.h
+index 92f06d7c0a..fbfd4c37bf 100644
+--- a/dtls-bio.h
++++ b/dtls-bio.h
+@@ -35,7 +35,7 @@ void janus_dtls_bio_agent_set_mtu(int start_mtu);
+ int janus_dtls_bio_agent_get_mtu(void);
+ 
+ #if defined(LIBRESSL_VERSION_NUMBER)
+-#define JANUS_USE_OPENSSL_PRE_1_1_API (1)
++#define JANUS_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #else
+ #define JANUS_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
