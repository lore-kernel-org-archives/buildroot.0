Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE53C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E318B818D0;
	Mon, 25 Apr 2022 20:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycpngVkzMSbL; Mon, 25 Apr 2022 20:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1BEB828F7;
	Mon, 25 Apr 2022 20:26:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC9A21BF982
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB36C60F9A
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0M8Ju5E0vZb8 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F69660EA3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4ABF8448B; Mon, 25 Apr 2022 20:15:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 22:09:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2832d0dfccc931f75c37bb9017749d2e411c872
X-Git-Newrev: 2e8218f6aa20cb7521c29849f58b43d535989bf1
X-Patchwork-Hint: ignore
Message-Id: <20220425201531.D4ABF8448B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netatalk: fix build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e8218f6aa20cb7521c29849f58b43d535989bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl >= 2.7.0:

In file included from uams_dhx_passwd.c:35:
openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
   15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
      |                   ^~~~~~~~~~~
In file included from uams_dhx_passwd.c:33:
/home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
  195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
      |     ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...enssl_compat.h-fix-build-with-libressl-2..patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
new file mode 100644
index 0000000000..05913862f6
--- /dev/null
+++ b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
@@ -0,0 +1,43 @@
+From 58ddc137021a938f37c3794305a839f8df449d3f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Apr 2022 23:59:15 +0200
+Subject: [PATCH] etc/uams/openssl_compat.h: fix build with libressl >= 2.7.0
+
+Fix the following build failure with libressl >= 2.7.0 which added
+DH_set0_pqg with
+https://github.com/libressl-portable/openbsd/commit/848e2a019c796b685fc8c5848283b86e48fbe0bf:
+
+In file included from uams_dhx_passwd.c:35:
+openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
+   15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
+      |                   ^~~~~~~~~~~
+In file included from uams_dhx_passwd.c:33:
+/home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
+  195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
+      |     ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ etc/uams/openssl_compat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/uams/openssl_compat.h b/etc/uams/openssl_compat.h
+index ded377bc..5cc8de34 100644
+--- a/etc/uams/openssl_compat.h
++++ b/etc/uams/openssl_compat.h
+@@ -11,7 +11,7 @@ http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
+ #ifndef OPENSSL_COMPAT_H
+ #define OPENSSL_COMPAT_H
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
+ inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
+ {
+    /* If the fields p and g in d are NULL, the corresponding input
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
