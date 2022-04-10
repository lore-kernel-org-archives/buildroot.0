Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40944C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016B4416C6;
	Sun, 10 Apr 2022 15:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5dBhSbe_AMv; Sun, 10 Apr 2022 15:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99548409E8;
	Sun, 10 Apr 2022 15:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8621BF995
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A6CE4109B
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBqXYjuJkss4 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58569409FA
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7C49D8388A; Sun, 10 Apr 2022 15:29:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:32:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 314074e743133043674a1558d6819dfa047f0ea9
X-Git-Newrev: 97fcc6ef0e07337dd419128663f4c0e95d1150ee
X-Patchwork-Hint: ignore
Message-Id: <20220410152900.7C49D8388A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libp11: fix build
 with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=97fcc6ef0e07337dd419128663f4c0e95d1150ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl:

p11_rsa.c:355:14: error: static declaration of 'RSA_meth_get_finish' follows non-static declaration
  355 | static int (*RSA_meth_get_finish(const RSA_METHOD *meth)) (RSA *rsa)
      |              ^~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/de3b1e97796f717eac47d291911e3e1517cb557b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 581d397ec0c437aac06a9eaeca01de4ed9249faf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/0001-Update-wp11_rsa.c.patch | 26 ++++++++++++++++++++++++++
 package/libp11/libp11.mk                    |  8 +++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/package/libp11/0001-Update-wp11_rsa.c.patch b/package/libp11/0001-Update-wp11_rsa.c.patch
new file mode 100644
index 0000000000..0a2d6e65ce
--- /dev/null
+++ b/package/libp11/0001-Update-wp11_rsa.c.patch
@@ -0,0 +1,26 @@
+From 4968cfc64dbaa39bb479a24d9578d75099e2f337 Mon Sep 17 00:00:00 2001
+From: patchMonkey156 <pagorman@asu.edu>
+Date: Mon, 19 Oct 2020 17:12:15 -0400
+Subject: [PATCH] Update p11_rsa.c
+
+Bugfix for new LibreSSL version 3.2.2
+[Retrieved from:
+https://github.com/OpenSC/libp11/commit/4968cfc64dbaa39bb479a24d9578d75099e2f337]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/p11_rsa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/p11_rsa.c b/src/p11_rsa.c
+index b6beef0..ff12ed7 100644
+--- a/src/p11_rsa.c
++++ b/src/p11_rsa.c
+@@ -336,7 +336,7 @@ int pkcs11_get_key_size(PKCS11_KEY *key)
+ 	return RSA_size(rsa);
+ }
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100005L || defined(LIBRESSL_VERSION_NUMBER)
++#if ( ( defined (OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100005L ) || ( defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3020199L ) )
+ 
+ int (*RSA_meth_get_priv_enc(const RSA_METHOD *meth))
+ 		(int flen, const unsigned char *from,
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 45a718ee99..c1873a920c 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -11,10 +11,16 @@ LIBP11_INSTALL_STAGING = YES
 LIBP11_LICENSE = LGPL-2.1+
 LIBP11_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+LIBP11_ENGINESDIR = enginesdir
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBP11_ENGINESDIR = libdir
+endif
+
 # pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
 # so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable $(LIBP11_ENGINESDIR) libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
