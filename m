Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F160C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01EEB41E9E;
	Tue,  6 Feb 2024 21:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enROMNJkLZio; Tue,  6 Feb 2024 21:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03DDF41F1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03DDF41F1F;
	Tue,  6 Feb 2024 21:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73EA51BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E85E83404
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Xac5c2QFWPW for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA3E83408
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AA3E83408
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:43:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85E3187403; Tue,  6 Feb 2024 21:43:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 22:41:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81fab735aee5d052e02a1304fb537b001c7d69c4
X-Git-Newrev: f622944bc88a895601955d5ce13a2b7015e54232
X-Patchwork-Hint: ignore
Message-Id: <20240206214329.85E3187403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libp11: drop libressl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f622944bc88a895601955d5ce13a2b7015e54232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libressl dropped engine support since version 3.8.1 resulting in the
following build failure since bump of libressl to version 3.8.2 in
commit 21eca49ed5110872407b76ab9337d2877c4cda24:

eng_front.c: In function 'IMPLEMENT_DYNAMIC_CHECK_FN':
eng_front.c:262:1: error: expected declaration specifiers before 'IMPLEMENT_DYNAMIC_BIND_FN'
  262 | IMPLEMENT_DYNAMIC_BIND_FN(bind_fn)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/389ed112f082a4917f777f3e236211059c4c6d6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/Config.in | 1 +
 package/libp11/libp11.mk | 8 +-------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index ef1e5b4703..3c7ccdee27 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBP11
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
 	  project.
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 7718573ace..cd4ed34297 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -11,16 +11,10 @@ LIBP11_INSTALL_STAGING = YES
 LIBP11_LICENSE = LGPL-2.1+
 LIBP11_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-LIBP11_ENGINESDIR = enginesdir
-else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-LIBP11_ENGINESDIR = libdir
-endif
-
 # pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
 # so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable $(LIBP11_ENGINESDIR) libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
