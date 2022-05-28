Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4491C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C0CA42696;
	Sat, 28 May 2022 11:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TU6vG5JkUKN; Sat, 28 May 2022 11:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655134266B;
	Sat, 28 May 2022 11:06:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5C491BF37A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF2A66119C
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvV8lt15RI6V for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0397E613DB
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 911EF85EB2; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 12:54:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c74231cc30ce684ad7a188a27814ad44776bfd77
X-Git-Newrev: 38e6ff3ccbcb887d1c3eeb1d33258f555e7fa16c
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.911EF85EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gnutls:
 libunistring is not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=38e6ff3ccbcb887d1c3eeb1d33258f555e7fa16c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since the very beginning, libunistring was a mandatory dependency of
gnutls. However, it would use its internal copy if libunistring was not
selected. We never want that, so make libunistring an actual mandatory
dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3292f8741257019c2b7b791335852d8d438f5a76)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in | 3 +--
 package/gnutls/gnutls.mk | 9 ++-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 28982b15a1..59af32bf1e 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	# https://gitlab.com/gnutls/gnutls/issues/203
 	depends on !BR2_STATIC_LIBS
-	# gnulib requires a library that implements wctomb().
-	# This is noticed only when linking with libgnutls.so.
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	help
 	  GnuTLS is a secure communications library implementing the SSL
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 761a17bd20..f7f3e046e9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -12,7 +12,7 @@ GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
 GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
 
-GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle
+GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
@@ -20,6 +20,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
+	--without-included-unistring \
 	--without-libcrypto-prefix \
 	--without-libdl-prefix \
 	--without-libev-prefix \
@@ -74,12 +75,6 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
-GNUTLS_DEPENDENCIES += libunistring
-else
-GNUTLS_CONF_OPTS += --with-included-unistring
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
