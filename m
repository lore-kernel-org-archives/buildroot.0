Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1108EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91AA9416C2;
	Thu, 12 May 2022 20:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WH0tc_VonKr1; Thu, 12 May 2022 20:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19F94416B4;
	Thu, 12 May 2022 20:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD1FC1BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C56D940445
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BvSlg5guShCM for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E29C2403AE
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 19B5F85D83; Thu, 12 May 2022 20:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:41:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91b10ec79a65fe6bb9668e66c4a37b8e568ee15e
X-Git-Newrev: 91354636e6a535be56990ffea78e483aad56ed05
X-Patchwork-Hint: ignore
Message-Id: <20220512204101.19B5F85D83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: add optional dependency on
 brotli, zlib, zstd
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

commit: https://git.buildroot.net/buildroot/commit/?id=91354636e6a535be56990ffea78e483aad56ed05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 3.7.4 added compression options with brotli, zlib and zstd.
These are automatically discovered, which makes their inclusion depend
on the build order. Therefore, explicitly enable/disable them.

Note that the configure help text says "--without-brotli" and
"--without-zstd", but the options are actually --without-libbrotli and
--without-libzstd. --without-zlib is correct in the help text.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
