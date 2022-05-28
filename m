Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FB0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471A360BB1;
	Sat, 28 May 2022 11:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPWzdvUA9slI; Sat, 28 May 2022 11:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47ADE60B65;
	Sat, 28 May 2022 11:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41D751BF37A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBB2442638
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02hdt0OQKK_W for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBEEF42623
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6364284BCC; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 12:53:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bd9246aad32c1531d8545f77a7da6f0f37b78bcd
X-Git-Newrev: beca59fefc228fccd7d7fdc1b2ce6ec8944cdb46
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.6364284BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gnutls: disable
 library search in /usr/lib
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

commit: https://git.buildroot.net/buildroot/commit/?id=beca59fefc228fccd7d7fdc1b2ce6ec8944cdb46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

gnutls's configure script has a weird approach where it first searches
for dependent libraries in the path specified by --prefix, before
searching in the default search path. Since we set --prefix to /usr,
and it doesn't take into account DESTDIR (which is anyway not set at
configure time), that means it will first search /usr/lib before
searching $(STAGING_DIR)/usr/lib.

Ideally, this would be fixed in the configure script itself. However,
the m4 file that does this is pretty complex, it's not immediately clear
where to add $DESTDIR. In addition it comes from gnulib which is a
somewhat annoying upstream.

Therefore, instead, bypass the prefix lookup with
--without-libfoo-prefix. Note that we could set
--with-libfoo-prefix=$(STAGING_DIR)/usr (the latter is already done for
librt and libpthread), but that's pretty pointless -
--without-libfoo-prefix in fact reverts to what should have been done in
the first place, i.e. use the toolchain search path.

Add --without-libfoo-prefix for all options defined in configure (found
with ./configure --help | grep without-.*-prefix). Most of these are
only used in tests (e.g. libcrypto) or even not at all (e.g. libiconv),
but it's fairly hard to discover this and to be sure that they are
indeed not needed, so better pass all of them.

Remove the now-redundant arguments for librt and libpthread.

Add a comment to remind people to revisit these when bumping the
version.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b707a67daa31da6bd4bca19096c74febfd54375a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0e461cd44c..b5503b1fc9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
@@ -26,7 +27,15 @@ GNUTLS_CONF_OPTS = \
 	--disable-tests \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
-	--with-librt-prefix=$(STAGING_DIR) \
+	--without-libcrypto-prefix \
+	--without-libdl-prefix \
+	--without-libev-prefix \
+	--without-libiconv-prefix \
+	--without-libintl-prefix \
+	--without-libpthread-prefix \
+	--without-libseccomp-prefix \
+	--without-librt-prefix \
+	--without-libz-prefix \
 	--without-tpm \
 	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
@@ -39,9 +48,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-# libpthread autodetection poison the linkpath
-GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
-
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
 GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
@@ -70,7 +76,6 @@ GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
-GNUTLS_CONF_OPTS += --with-libunistring-prefix=$(STAGING_DIR)/usr
 GNUTLS_DEPENDENCIES += libunistring
 else
 GNUTLS_CONF_OPTS += --with-included-unistring
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
