Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15D3F5A8A5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA1861010;
	Mon, 20 Apr 2026 17:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IFm3IwVPaYG; Mon, 20 Apr 2026 17:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0D761063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706460;
	bh=swncZoqjcnGdGvXlKTXY41qliLDyVneex/7I201oXEk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBKDbowYDBdAFNUowBgtiqUCl1hMivcP8Isdy1aKOyk7T6o2PpF0fyzIISrQngvZD
	 Ybawa1m+NbWWluV0Ywh9K4r0gtnRXzzFzBZS1QFs9dLEgQRQcpZTiP0qOwHxdpyLuN
	 UgFIjYz7TDm/O3zgDESYHj7JdKFrMCY7stIFCJm0pvN3cVHrTbmpg+qw6LxSfF284K
	 jDzkkTGPnus37uRCh6tke+NtvkiuMIawLug4iG/lBrgUilqOjKLAoqE2+s5MlcWMZx
	 xKoh2wYF8y3VqOPkTHHJDPWJV3hLx4jaSCbg14WcW+ZSGVOcYf5MugRXctyNbT7Sbg
	 LtaJ4SwRmoF3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0D761063;
	Mon, 20 Apr 2026 17:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 619EC257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5310B82F0F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfvf5k8ZXpWO for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E42E982CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42E982CE4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E42E982CE4
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:34:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdab.dip0.t-ipconnect.de [79.214.205.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27F6FA4C3927
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:34:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55302)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEsVi-000000004Fn-2OpP
 for buildroot@buildroot.org; Mon, 20 Apr 2026 17:34:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:34:12 +0200
Message-ID: <20260420173412.3572945-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260420173412.3572945-1-bernd@kuhls.net>
References: <20260420173412.3572945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776706455;
 bh=7i+BfzaUcP34P0A/8cD0bXDM2aKpyuxDBc6xba2fFhI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Gq57iCwrYdr6qAa6nYQQW3i+LA/0Whgbigz7Q17L/wWBhiiu4W7bhQq1kEJ2+KbjS
 nNdcT0nbgjeS92bqNkqjJ4g41Y0HbvGngvfrXovcWceb/lHivCTazCkF96Jlr8ndV7
 rG/rMRPR/1dpBSI1EiE+791hFn7+Z08zG6mGmouZkda3hJHLMc/riCtanD3l08ejWp
 +83xOk1DmXyAfynZFUrmdIG59xeuNufIvcNcxTjCMwhZjj562oPywIFSkKZC3yhFyO
 Q7kT9O1ZkjP5FMrybGdCOPQf8F+OxsesKmwMk8BRujuVO07LMVAqJoWwBuEvGeJwYp
 ssPw639BFsbIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Gq57iCwr
Subject: [Buildroot] [PATCH 2/2] package/libp11: bump version to 0.4.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OpenSC/libp11/blob/libp11-0.4.18/NEWS

Removed all patches which are included in this release.

Switched to sha256 tarball hash provided by upstream.

Apply the fix for enginesdir to the newly introduced configure option
--with-modulesdir, added in version 0.4.14, as well:
https://github.com/OpenSC/libp11/commit/8ff7952a811086110486162fe9c3f167ded4afe3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...rc-p11_attr.c-fix-build-with-gcc-4.8.patch | 42 ------------
 ...ange-bool-attribute-true-false-names.patch | 67 -------------------
 package/libp11/libp11.hash                    |  3 +-
 package/libp11/libp11.mk                      |  5 +-
 5 files changed, 5 insertions(+), 113 deletions(-)
 delete mode 100644 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch
 delete mode 100644 package/libp11/0002-change-bool-attribute-true-false-names.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3b867a994b..c4b4f1c4e8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -535,7 +535,6 @@ package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch lib_patch.Upstream
 package/liboping/0004-Fix-compile-error-on-GCC-7.patch lib_patch.Upstream
 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch lib_patch.Upstream
-package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch lib_patch.Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch lib_patch.Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch lib_patch.Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch lib_patch.Upstream
diff --git a/package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch b/package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 60fc16d9d0..0000000000
--- a/package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ba44b87318ed89e489fa3ce0a5d66002afa2bd6c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Aug 2022 11:54:54 +0200
-Subject: [PATCH] src/p11_attr.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 raised since version 0.4.12
-and
-https://github.com/OpenSC/libp11/commit/639a4b6463278c0119a2ec60b261da3e5330fb33:
-
-p11_attr.c: In function 'pkcs11_zap_attrs':
-p11_attr.c:167:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (unsigned i = 0; i < 32; i++) {
-  ^
-p11_attr.c:167:2: note: use option -std=c99 or -std=gnu99 to compile your code
-
-Fixes:
- - http://autobuild.buildroot.org/results/4391020fb5738cc8c26dc53783a6228bbf76473a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/OpenSC/libp11/commit/ba44b87318ed89e489fa3ce0a5d66002afa2bd6c]
----
- src/p11_attr.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/p11_attr.c b/src/p11_attr.c
-index d49456ff..d425241a 100644
---- a/src/p11_attr.c
-+++ b/src/p11_attr.c
-@@ -162,9 +162,11 @@ void pkcs11_addattr_obj(PKCS11_TEMPLATE *tmpl, int type, pkcs11_i2d_fn enc, void
- 
- void pkcs11_zap_attrs(PKCS11_TEMPLATE *tmpl)
- {
-+	unsigned int i;
-+
- 	if (!tmpl->allocated)
- 		return;
--	for (unsigned i = 0; i < 32; i++) {
-+	for (i = 0; i < 32; i++) {
- 		if (tmpl->allocated & (1<<i))
- 			OPENSSL_free(tmpl->attrs[i].pValue);
- 	}
diff --git a/package/libp11/0002-change-bool-attribute-true-false-names.patch b/package/libp11/0002-change-bool-attribute-true-false-names.patch
deleted file mode 100644
index d63ec74590..0000000000
--- a/package/libp11/0002-change-bool-attribute-true-false-names.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 89ccb1f097f56a0933f881af051422b8d67e457f Mon Sep 17 00:00:00 2001
-From: dlegault <dlegault@blackberry.com>
-Date: Fri, 2 Sep 2022 12:01:23 -0400
-Subject: [PATCH] Change bool attribute true/false names to _true/_false
-
-This prevents conflicts with true/false defined in stdbool.h
-
-fixes #472
-
-Upstream: https://github.com/OpenSC/libp11/commit/89ccb1f097f56a0933f881af051422b8d67e457f
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/p11_attr.c |  6 +++---
- src/p11_ec.c   | 14 +++++++-------
- 2 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/p11_attr.c b/src/p11_attr.c
-index d425241a..a420efad 100644
---- a/src/p11_attr.c
-+++ b/src/p11_attr.c
-@@ -123,9 +123,9 @@ unsigned int pkcs11_addattr(PKCS11_TEMPLATE *tmpl, int type, void *data, size_t
- 
- void pkcs11_addattr_bool(PKCS11_TEMPLATE *tmpl, int type, int value)
- {
--	static CK_BBOOL true = CK_TRUE;
--	static CK_BBOOL false = CK_FALSE;
--	pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
-+	static CK_BBOOL _true = CK_TRUE;
-+	static CK_BBOOL _false = CK_FALSE;
-+	pkcs11_addattr(tmpl, type, value ? &_true : &_false, sizeof(CK_BBOOL));
- }
- 
- void pkcs11_addattr_s(PKCS11_TEMPLATE *tmpl, int type, const char *s)
-diff --git a/src/p11_ec.c b/src/p11_ec.c
-index 4fb4efc3..16e3b3af 100644
---- a/src/p11_ec.c
-+++ b/src/p11_ec.c
-@@ -590,22 +590,22 @@ static int pkcs11_ecdh_derive(unsigned char **out, size_t *outlen,
- 	CK_MECHANISM mechanism;
- 	int rv;
- 
--	CK_BBOOL true = TRUE;
--	CK_BBOOL false = FALSE;
-+	CK_BBOOL _true = TRUE;
-+	CK_BBOOL _false = FALSE;
- 	CK_OBJECT_HANDLE newkey = CK_INVALID_HANDLE;
- 	CK_OBJECT_CLASS newkey_class= CKO_SECRET_KEY;
- 	CK_KEY_TYPE newkey_type = CKK_GENERIC_SECRET;
- 	CK_ULONG newkey_len = key_len;
- 	CK_OBJECT_HANDLE *tmpnewkey = (CK_OBJECT_HANDLE *)outnewkey;
- 	CK_ATTRIBUTE newkey_template[] = {
--		{CKA_TOKEN, &false, sizeof(false)}, /* session only object */
-+		{CKA_TOKEN, &_false, sizeof(_false)}, /* session only object */
- 		{CKA_CLASS, &newkey_class, sizeof(newkey_class)},
- 		{CKA_KEY_TYPE, &newkey_type, sizeof(newkey_type)},
- 		{CKA_VALUE_LEN, &newkey_len, sizeof(newkey_len)},
--		{CKA_SENSITIVE, &false, sizeof(false) },
--		{CKA_EXTRACTABLE, &true, sizeof(true) },
--		{CKA_ENCRYPT, &true, sizeof(true)},
--		{CKA_DECRYPT, &true, sizeof(true)}
-+		{CKA_SENSITIVE, &_false, sizeof(_false) },
-+		{CKA_EXTRACTABLE, &_true, sizeof(_true) },
-+		{CKA_ENCRYPT, &_true, sizeof(_true)},
-+		{CKA_DECRYPT, &_true, sizeof(_true)}
- 	};
- 
- 	memset(&mechanism, 0, sizeof(mechanism));
diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 0e42bdd4cf..8a31a6f39e 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,3 +1,4 @@
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
+sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
 # Locally computed:
-sha256  1e1a2533b3fcc45fde4da64c9c00261b1047f14c3f911377ebd1b147b3321cfd  libp11-0.4.12.tar.gz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index cd4ed34297..51a44f5b3d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.12
+LIBP11_VERSION = 0.4.18
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
@@ -14,7 +14,8 @@ LIBP11_LICENSE_FILES = COPYING
 # pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
 # so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'` \
+	--with-modulesdir=`$(PKG_CONFIG_HOST_BINARY) --variable modulesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
