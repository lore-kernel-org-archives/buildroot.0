Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D8CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 125B741304;
	Fri, 27 May 2022 08:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-bMPbO-3LEa; Fri, 27 May 2022 08:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC258412EE;
	Fri, 27 May 2022 08:12:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55BC41BF302
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 424EB615F8
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtXX2xmP6Dt1 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C02B61608
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9DAA6865C3; Fri, 27 May 2022 08:00:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:07:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b4eef07babf7668d344bb185a662474cdefa97fb
X-Git-Newrev: d9ccb9a1d1d41eff92050ffa31d54b97e3892bd9
X-Patchwork-Hint: ignore
Message-Id: <20220527080001.9DAA6865C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/netatalk: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9ccb9a1d1d41eff92050ffa31d54b97e3892bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 2e8218f6aa20cb7521c29849f58b43d535989bf1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
