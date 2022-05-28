Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC345C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8289F428E0;
	Sat, 28 May 2022 11:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPyS01LhQz7C; Sat, 28 May 2022 11:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6319A428C6;
	Sat, 28 May 2022 11:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 033AF1BF37A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98EAA84796
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlp3Yx-i91uk for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC906847EC
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 86DFD84BCC; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 12:54:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1819ab9622a89d8c7c80ad15be884a2a28b48331
X-Git-Newrev: c74231cc30ce684ad7a188a27814ad44776bfd77
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.86DFD84BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gnutls: add
 optional dependency on brotli, zlib, zstd
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

commit: https://git.buildroot.net/buildroot/commit/?id=c74231cc30ce684ad7a188a27814ad44776bfd77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Version 3.7.4 added compression options with brotli, zlib and zstd.
These are automatically discovered, which makes their inclusion depend
on the build order. Therefore, explicitly enable/disable them.

Note that the configure help text says "--without-brotli" and
"--without-zstd", but the options are actually --without-libbrotli and
--without-libzstd. --without-zlib is correct in the help text.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 91354636e6a535be56990ffea78e483aad56ed05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 2d37cfc65f..761a17bd20 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -48,6 +48,13 @@ else
 GNUTLS_CONF_OPTS += --disable-openssl-compatibility
 endif
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+GNUTLS_CONF_OPTS += --with-libbrotli
+GNUTLS_DEPENDENCIES += brotli
+else
+GNUTLS_CONF_OPTS += --without-libbrotli
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
@@ -73,6 +80,20 @@ else
 GNUTLS_CONF_OPTS += --with-included-unistring
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GNUTLS_CONF_OPTS += --with-zlib
+GNUTLS_DEPENDENCIES += zlib
+else
+GNUTLS_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+GNUTLS_CONF_OPTS += --with-libzstd
+GNUTLS_DEPENDENCIES += zstd
+else
+GNUTLS_CONF_OPTS += --without-libzstd
+endif
+
 # Provide a default CA cert location
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 GNUTLS_CONF_OPTS += --with-default-trust-store-pkcs11=pkcs11:model=p11-kit-trust
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
