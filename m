Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22520C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 15:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF84D40C42;
	Sun, 24 Jul 2022 15:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF84D40C42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhP0HdCrbWsx; Sun, 24 Jul 2022 15:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91A0C4053C;
	Sun, 24 Jul 2022 15:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91A0C4053C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858051BF282
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63E6360F69
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E6360F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id St87oZeCF6Qz for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 15:10:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 900B660C11
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 900B660C11
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 36B1E85C8E; Sun, 24 Jul 2022 14:57:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 17:00:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daec24cfb8fcbcca42371bc4077880b478d28472
X-Git-Newrev: a36b947d52d289ec6aad50a12b99232fcab3368e
X-Patchwork-Hint: ignore
Message-Id: <20220724145712.36B1E85C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: auto-select safeclib to
 avoid use of bundled copy of library
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

commit: https://git.buildroot.net/buildroot/commit/?id=a36b947d52d289ec6aad50a12b99232fcab3368e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for libsafec can not be completely disabled - currently,
--disable-safec does not exactly allow for compiling libest on
systems without libsafec, but instead just uses bundled copy of
library from safe_c_stub/

To avoid that, do automatically select the full-featured safeclib
package and always use --with-system-libsafec

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libest/Config.in |  1 +
 package/libest/libest.mk | 14 +++++---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index 6abe9d2848..bd5f40afae 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBEST
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_SAFECLIB
 	help
 	  libest is a C implementation of RFC 7030 (Enrollment over
 	  Secure Transport).
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index d9f3cf87bc..0dd3e7d0e4 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -12,14 +12,17 @@ LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
 LIBEST_LICENSE_FILES = LICENSE
 LIBEST_INSTALL_STAGING = YES
 LIBEST_AUTORECONF = YES
-LIBEST_DEPENDENCIES = openssl host-pkgconf
+LIBEST_DEPENDENCIES = openssl host-pkgconf safeclib
 # libcoap support is explicitly disabled because it breaks the build
+# libsafec support is explicitly enabled because we want to avoid
+# possible hidden use of bundled copy of library.
 LIBEST_CONF_OPTS = \
 	--with-ssl-dir=$(STAGING_DIR)/usr \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
 	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
 	--disable-examples \
-	--without-libcoap-dir
+	--without-libcoap-dir \
+	--with-system-libsafec
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 LIBEST_DEPENDENCIES += libexecinfo
@@ -55,13 +58,6 @@ else
 LIBEST_CONF_OPTS += --without-uriparser-dir
 endif
 
-ifeq ($(BR2_PACKAGE_SAFECLIB),y)
-LIBEST_CONF_OPTS += --with-system-libsafec
-LIBEST_DEPENDENCIES += safeclib
-else
-LIBEST_CONF_OPTS += --without-system-libsafec
-endif
-
 define LIBEST_INSTALL_PC
 	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
