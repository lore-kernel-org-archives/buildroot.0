Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D684E8307C
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FDB605A5;
	Wed,  4 Feb 2026 13:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8u8u77dznB5o; Wed,  4 Feb 2026 13:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24378605AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770212903;
	bh=fygTtbzt+e0FQhRHo97m/54vZlRIhn7KGmSfyBBrRFQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NmS8EqPnZbXLnKQ6HtBoi+JNMhqujbgTzb1Hv0HH8W1KUfBo3Vf1xul6DtFVHl9fY
	 gzSNQ9S578cB0HAk2qSqKP881oLgJ1qw3l36H4+RMFh7/GVpraOXLN5CMJCQARz89y
	 DEPiwiGFHSiB4NsaJOq2k0u46WuRUnrraCTmskot92Jrw8pDXbOiZe1PScC7w80Gyl
	 wqmRCGpuyMRXFc86TxoTtBfTDA1dfiewscU37gJ8k/rAaG7rq6K/jDu+tuypyhynfr
	 BOS78Eq2GlzYy13YJ8VEGP64Ex9HyqSTdV2Cn7Kmx+RraKsqBXR9dK7u1vW9RBf/I5
	 lm+9cZjuOb2DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24378605AD;
	Wed,  4 Feb 2026 13:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC95EF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6FDB405F7
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPD8KRiOoERR for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 824B340363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824B340363
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824B340363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:48:20 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8543831E0B83; Wed, 04 Feb 2026 14:48:18 +0100 (CET)
Date: Wed, 4 Feb 2026 14:48:18 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYNOIjYboYd9f-Uj@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770212898; bh=6Oq/Yo6OlcXEczwQCZBFcplk5YJLszTDwyK4LerCEkc=;
 h=Date:From:To:Subject:From;
 b=wMnHGflq/GhUfo9gH4SDgvWxw2GOgPkuAdg7jYSoqzf7VpH6rngR+XF4MGFkYJAve
 mUyHwVQsLies3cZkwtAlrhuy2oKWQUYwbL3O7dZWS8oieE7PRAoZGVPBZTcdFpb14N
 dyYTxJu2Qf3p6Ea/DLDbZ9hBvJzplp8aMCeA5EELr45r/fI+uJxu7+pm9KiEdM1x0i
 6AhlN+KMteK+arCZiA2MgYnzKmjBkPcWc+h9bGScZY+EKjZPvUMrxgZXuFfRshtYVK
 265dmFZcnfCU67EERzDIxfC76B9sxBauwbO68Gq6IniupTZnjvjAKU+3al+vxORbS4
 PdRdH0tfHwa3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH for 2025.02.x] package/libpam-pkcs11: new package
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

The Linux-PAM login module for X.509 certificate based user login.

https://github.com/OpenSC/pam_pkcs11

[ cherry-picked from commit e3812ea5142bf0092a7d0f9830f0cd4c478b6431 ]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
As discussed in IRC I try to add some packages to LTS branch.
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libpam-pkcs11/Config.in          | 19 +++++++++++++++++++
 package/libpam-pkcs11/libpam-pkcs11.hash |  3 +++
 package/libpam-pkcs11/libpam-pkcs11.mk   | 21 +++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/libpam-pkcs11/Config.in
 create mode 100644 package/libpam-pkcs11/libpam-pkcs11.hash
 create mode 100644 package/libpam-pkcs11/libpam-pkcs11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index eba18334e0..069c846be6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3318,6 +3318,7 @@ F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libjwt/
+F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index d64d915997..bd44e8e988 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2256,6 +2256,7 @@ menu "Other"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-nfc/Config.in"
+	source "package/libpam-pkcs11/Config.in"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
diff --git a/package/libpam-pkcs11/Config.in b/package/libpam-pkcs11/Config.in
new file mode 100644
index 0000000000..8db34090b2
--- /dev/null
+++ b/package/libpam-pkcs11/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBPAM_PKCS11
+	bool "libpam-pkcs11"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # pcsc-lite -> fork()
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite -> _Atomic keyword
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  The Linux-PAM login module for X.509 certificate
+	  based user login.
+
+	  https://github.com/OpenSC/pam_pkcs11
+
+comment "libpam-pkcs11 needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash b/package/libpam-pkcs11/libpam-pkcs11.hash
new file mode 100644
index 0000000000..95747afc08
--- /dev/null
+++ b/package/libpam-pkcs11/libpam-pkcs11.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  pam_pkcs11-0.6.13.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk b/package/libpam-pkcs11/libpam-pkcs11.mk
new file mode 100644
index 0000000000..4bad47f69a
--- /dev/null
+++ b/package/libpam-pkcs11/libpam-pkcs11.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libpam-pkcs11
+#
+################################################################################
+
+LIBPAM_PKCS11_VERSION = 0.6.13
+LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
+LIBPAM_PKCS11_SITE = https://github.com/OpenSC/pam_pkcs11/archive/refs/tags
+LIBPAM_PKCS11_LICENSE = LGPL-2.1
+LIBPAM_PKCS11_LICENSE_FILES = COPYING
+
+LIBPAM_PKCS11_AUTORECONF = YES
+
+LIBPAM_PKCS11_CONF_OPTS = \
+	--libdir=/lib \
+	--without-docbook \
+	--without-ldap
+LIBPAM_PKCS11_DEPENDENCIES = linux-pam openssl pcsc-lite
+
+$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
