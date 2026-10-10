Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CF5CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10DB240621;
	Sat, 10 Oct 2026 09:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKF2B_6vpNtQ; Sat, 10 Oct 2026 09:40:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8EAFC40C08
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791625255;
	b=VQQ3PEMLUpBGxrky0FLKKoLJvWAVGLn4KiH9G12iUG1/6porPcjNws0xdBodBZ9/fNg0
	 n2/eMMVEl7Euu63yPkKsDusGasbYFbsbMY5G0SpbHXH3kAhhDu8DS5xLwSfs9+IR6hTys
	 tshNaiY4TjahfRw9rJbQyoZbieuKd5XVGf0+rhRLpWO5tAhBbJHrrXZpHcHH6sMDE6LD8
	 63WENvhkeckLpilKndiLnFmZ6VUhUQrm8oKNtpTk6ktUXITpCFB2G5Qy8tSQ9GOqHkouP
	 3yQfN1K9pBvHUB3k7I9QeHdRR/1PrDBYyyRLctksgD6BgSm19EYf4RY3hxq/oWH3n3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791625255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ar7i5sQCDNTLb6Rcqi+jntDHVF4/xFL8kKyi2UTZGXI=;
	b=nTDVCso6AlRRX4U1ySqjmiFbCvKsOCMclfLL9K0DUXyLrgwAWQPjFSUhUICutPVOHory
	 VQAr31cLQHcMJ5HcGTc0rnMHRJbh7E4iiPY0H7Q23fMIBdtpbBKXtSiJnRyP1LqFVj17I
	 UmHj+3zDzCHheuLU/S7F0KjYjmXvFUUMDWLGF9VPtPJYYCAgDbNrVPQOP1ZN4PqzCsBV7
	 95V8yhlE5HMmSOywJHKUb5pYTI/kSSDh6186IiwUINGOJBGJLL4k8BbuiaRE4KyTfGX+t
	 d85D6/Ejd8o2+TtC241h9pSboMaDPn/+IqWbTDlvWiK7xV6WOuPqZjwtM8l1XFDmBqw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791625255;
	bh=Ar7i5sQCDNTLb6Rcqi+jntDHVF4/xFL8kKyi2UTZGXI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AShOuOS0eZIthwD0qMpfzM+ZL4AkT/mepdGMGyIaYqXg8+y/yU6p0ScjmVgdCSMVc
	 YK7b3rqneKvwSBwYN375VQ9zYHMhPSCzOifyiVOy2h3ho9OWNBflc/s8RYSxsCuUfX
	 ty9UiYQkbAXpWxu6njzFyAbTpx67rfiAx+csO2PHyypjSvcBd6p9JYxTRSTCyy0Z76
	 vTGnajP7xU00yxq8/UAija6E6Kj39/0etwRO0MgKEFwZiTBRWlvu8G62p1brzYf0fm
	 sT5haX/jbDMRHbAvQ4PtOtg7MP4zSRWE9f+RZ5FQwE7Qf606KY4PUs6v14ETOSnP0/
	 nwwI35zmNi+0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EAFC40C08;
	Sat, 10 Oct 2026 09:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40F2D9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2730F400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3CxANXAvLB2 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:40:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0F9A840004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791625253;
 b=g7P4R7sQJfv9yPaDxg29XB9nIev9pYoAgqjK2s8gKOar8K/uLCyNckQZLqOUuvNkrZTg
 BLEDU/Nbuf5HESfTtPv4wtNvtEKPZGB7tmD3Dp4RE2JXscNh9EnwduyISuirlKOOLsHlZ
 YFwN1bbb1dk0HG0dw0m5jK5uYGF1R80AYA/JgxGnnsIsaUCSYKyyhlVzIwCnonhlMNyc6
 xTOG7Bdsc/PaMXqgPDL+apmcSx/JZv/OOT34pbvM/sTc0i//2Kt+96un3S/8KBobL2fQ/
 iiZKQA7ADq41i5LhWA5Y3t1bjOnC0JxHtwHTnQ1LMxO7aiWvdVUFj84hE+KeRvmGRaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791625253;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0MsqGsyqq9I0bGjyGormeMTbVUUzetk2cZ2H7P+9CVo=;
 b=K2VoV99fHbX1xBvxEQcdBm9htU8V66Od61fXBeNOXz02KhwDxuQE4VQZSps/Z8dT9Ynt
 ZvtMych41UhXOLQumg0IwVeCLzg7awD/Nfy0qfnts79GFGwnkPu630ouD8JRVsq/j6yu2
 Boo5V3NM1/RDu5W3/qVvlXc5KGZFuitAhEsSEtnkMjk4xxnDltZvD2iADSFqgGi8gXBDR
 EZBAmQWO90nuskIRwG5IH8YuncLuIO11f5JZ+vRAwiDkg4LWroKfVtpKxdYMANbkKrxIK
 Ri2Q6FOd1AAlF2sCPg+yjIepjDII1VWfjeNqwcZUET0BNRdw5GT1fvVZRJnAVjPqr1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F9A840004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB8428F955; Sat, 10 Oct 2026 09:39:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:40:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 543cba029e9f6e548eb8e9e14e2e7043eaf4ef64
X-Git-Newrev: db2f1fcc43e31e7a2cbbfb934b730f87bd0738c0
X-Patchwork-Hint: ignore
Message-Id: <20261010093934.DB8428F955@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: add support for
 OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db2f1fcc43e31e7a2cbbfb934b730f87bd0738c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Support for OpenSSL 4 was added to the Qt 6.x OpenSSL plugin by commit
https://invent.kde.org/qt/qt/qtbase/-/commit/e806630e694d89f567cffa9c982d1f471089ecd8
contained in the 6.12 branch.

OpenSSL support in Qt 5.x is not plugin-based, the move occured in
version 6.2.0:
https://invent.kde.org/qt/qt/qtbase/-/commit/d385158d5213ef568b7629e2aa4a818016bbffac

The upstream repo is not updated anymore:
https://community.kde.org/Qt5PatchCollection
https://mail.kde.org/pipermail/distributions/2026-May/001690.html

To enable support for OpenSSL 4 in qt5base we add a patch set mentioned
in the OpenSSL issue https://github.com/openssl/openssl/issues/29117

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/0009-openssl4.patch |  52 ++++++++++++
 package/qt5/qt5base/0010-openssl4.patch | 139 ++++++++++++++++++++++++++++++++
 package/qt5/qt5base/0011-openssl4.patch |  89 ++++++++++++++++++++
 3 files changed, 280 insertions(+)

diff --git a/package/qt5/qt5base/0009-openssl4.patch b/package/qt5/qt5base/0009-openssl4.patch
new file mode 100644
index 0000000000..19e70e876b
--- /dev/null
+++ b/package/qt5/qt5base/0009-openssl4.patch
@@ -0,0 +1,52 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: src/network/ssl/qsslcertificate_openssl.cpp
+--- a/src/network/ssl/qsslcertificate_openssl.cpp.orig
++++ b/src/network/ssl/qsslcertificate_openssl.cpp
+@@ -123,11 +123,11 @@ QByteArray QSslCertificate::serialNumber() const
+     QMutexLocker lock(QMutexPool::globalInstanceGet(d.data()));
+ #endif
+     if (d->serialNumberString.isEmpty() && d->x509) {
+-        ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
++        const ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
+         QByteArray hexString;
+-        hexString.reserve(serialNumber->length * 3);
+-        for (int a = 0; a < serialNumber->length; ++a) {
+-            hexString += QByteArray::number(serialNumber->data[a], 16).rightJustified(2, '0');
++        hexString.reserve(q_ASN1_STRING_length(serialNumber) * 3);
++        for (int a = 0; a < q_ASN1_STRING_length(serialNumber); ++a) {
++            hexString += QByteArray::number(q_ASN1_STRING_get0_data(serialNumber)[a], 16).rightJustified(2, '0');
+             hexString += ':';
+         }
+         hexString.chop(1);
+@@ -251,10 +251,10 @@ QMultiMap<QSsl::AlternativeNameEntryType, QString> QSs
+                 QHostAddress ipAddress;
+                 switch (len) {
+                 case 4: // IPv4
+-                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<quint32 *>(genName->d.iPAddress->data)));
++                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<const quint32 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress))));
+                     break;
+                 case 16: // IPv6
+-                    ipAddress = QHostAddress(reinterpret_cast<quint8 *>(genName->d.iPAddress->data));
++                    ipAddress = QHostAddress(reinterpret_cast<const quint8 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress)));
+                     break;
+                 default: // Unknown IP address format
+                     break;
+@@ -511,8 +511,8 @@ static QVariant x509ExtensionToValue(X509_EXTENSION *e
+ 
+             // keyid
+             if (auth_key->keyid) {
+-                QByteArray keyid(reinterpret_cast<const char *>(auth_key->keyid->data),
+-                                 auth_key->keyid->length);
++                QByteArray keyid(reinterpret_cast<const char *>(q_ASN1_STRING_get0_data(auth_key->keyid)),
++                                 q_ASN1_STRING_length(auth_key->keyid));
+                 result[QLatin1String("keyid")] = keyid.toHex();
+             }
+ 
diff --git a/package/qt5/qt5base/0010-openssl4.patch b/package/qt5/qt5base/0010-openssl4.patch
new file mode 100644
index 0000000000..8bcd5b1664
--- /dev/null
+++ b/package/qt5/qt5base/0010-openssl4.patch
@@ -0,0 +1,139 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+disable EVP_PKEY_param_check(),
+use the old versions of sk_new(), ..., sk_value()
+disable SSL_CONF_CTX
+
+Index: src/network/ssl/qsslsocket_openssl_symbols.cpp
+--- a/src/network/ssl/qsslsocket_openssl_symbols.cpp.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols.cpp
+@@ -146,16 +146,27 @@ DEFINEFUNC2(int, BN_is_word, BIGNUM *a, a, BN_ULONG w,
+ DEFINEFUNC(int, EVP_CIPHER_CTX_reset, EVP_CIPHER_CTX *c, c, return 0, return)
+ DEFINEFUNC(int, EVP_PKEY_up_ref, EVP_PKEY *a, a, return 0, return)
+ DEFINEFUNC2(EVP_PKEY_CTX *, EVP_PKEY_CTX_new, EVP_PKEY *pkey, pkey, ENGINE *e, e, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, EVP_PKEY_param_check, EVP_PKEY_CTX *ctx, ctx, return 0, return)
++#endif
+ DEFINEFUNC(void, EVP_PKEY_CTX_free, EVP_PKEY_CTX *ctx, ctx, return, return)
+ DEFINEFUNC(int, RSA_bits, RSA *a, a, return 0, return)
+ DEFINEFUNC(int, DSA_bits, DSA *a, a, return 0, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, OPENSSL_sk_num, OPENSSL_STACK *a, a, return -1, return)
+ DEFINEFUNC2(void, OPENSSL_sk_pop_free, OPENSSL_STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
+ DEFINEFUNC(OPENSSL_STACK *, OPENSSL_sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
+ DEFINEFUNC2(void, OPENSSL_sk_push, OPENSSL_STACK *a, a, void *b, b, return, DUMMYARG)
+ DEFINEFUNC(void, OPENSSL_sk_free, OPENSSL_STACK *a, a, return, DUMMYARG)
+ DEFINEFUNC2(void *, OPENSSL_sk_value, OPENSSL_STACK *a, a, int b, b, return nullptr, return)
++#else
++DEFINEFUNC(int, sk_num, STACK *a, a, return -1, return)
++DEFINEFUNC2(void, sk_pop_free, STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
++DEFINEFUNC(_STACK *, sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
++DEFINEFUNC2(void, sk_push, _STACK *a, a, void *b, b, return, DUMMYARG)
++DEFINEFUNC(void, sk_free, _STACK *a, a, return, DUMMYARG)
++DEFINEFUNC2(void *, sk_value, STACK *a, a, int b, b, return nullptr, return)
++#endif // LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, SSL_session_reused, SSL *a, a, return 0, return)
+ DEFINEFUNC2(qssloptions, SSL_CTX_set_options, SSL_CTX *ctx, ctx, qssloptions op, op, return 0, return)
+ DEFINEFUNC(int, SSL_CTX_get_security_level, const SSL_CTX *ctx, ctx, return -1, return)
+@@ -244,7 +255,8 @@ DEFINEFUNC2(void, BIO_set_shutdown, BIO *a, a, int shu
+ 
+ DEFINEFUNC(long, ASN1_INTEGER_get, ASN1_INTEGER *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_INTEGER_cmp, const ASN1_INTEGER *a, a, const ASN1_INTEGER *b, b, return 1, return)
+-DEFINEFUNC(int, ASN1_STRING_length, ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_length, const ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_type, const ASN1_STRING *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_STRING_to_UTF8, unsigned char **a, a, ASN1_STRING *b, b, return 0, return)
+ DEFINEFUNC4(long, BIO_ctrl, BIO *a, a, int b, b, long c, c, void *d, d, return -1, return)
+ DEFINEFUNC(int, BIO_free, BIO *a, a, return 0, return)
+@@ -358,12 +370,14 @@ DEFINEFUNC2(int, SSL_CTX_use_PrivateKey, SSL_CTX *a, a
+ DEFINEFUNC2(int, SSL_CTX_use_RSAPrivateKey, SSL_CTX *a, a, RSA *b, b, return -1, return)
+ DEFINEFUNC3(int, SSL_CTX_use_PrivateKey_file, SSL_CTX *a, a, const char *b, b, int c, c, return -1, return)
+ DEFINEFUNC(X509_STORE *, SSL_CTX_get_cert_store, const SSL_CTX *a, a, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(SSL_CONF_CTX *, SSL_CONF_CTX_new, DUMMYARG, DUMMYARG, return nullptr, return);
+ DEFINEFUNC(void, SSL_CONF_CTX_free, SSL_CONF_CTX *a, a, return ,return);
+ DEFINEFUNC2(void, SSL_CONF_CTX_set_ssl_ctx, SSL_CONF_CTX *a, a, SSL_CTX *b, b, return, return);
+ DEFINEFUNC2(unsigned int, SSL_CONF_CTX_set_flags, SSL_CONF_CTX *a, a, unsigned int b, b, return 0, return);
+ DEFINEFUNC(int, SSL_CONF_CTX_finish, SSL_CONF_CTX *a, a, return 0, return);
+ DEFINEFUNC3(int, SSL_CONF_cmd, SSL_CONF_CTX *a, a, const char *b, b, const char *c, c, return 0, return);
++#endif
+ DEFINEFUNC(void, SSL_free, SSL *a, a, return, DUMMYARG)
+ DEFINEFUNC(STACK_OF(SSL_CIPHER) *, SSL_get_ciphers, const SSL *a, a, return nullptr, return)
+ DEFINEFUNC(const SSL_CIPHER *, SSL_get_current_cipher, SSL *a, a, return nullptr, return)
+@@ -871,15 +885,20 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(AUTHORITY_INFO_ACCESS_free)
+     RESOLVEFUNC(EVP_PKEY_up_ref)
+     RESOLVEFUNC(EVP_PKEY_CTX_new)
++#ifdef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(EVP_PKEY_param_check)
++#endif
+     RESOLVEFUNC(EVP_PKEY_CTX_free)
+     RESOLVEFUNC(RSA_bits)
++
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(OPENSSL_sk_new_null)
+     RESOLVEFUNC(OPENSSL_sk_push)
+     RESOLVEFUNC(OPENSSL_sk_free)
+     RESOLVEFUNC(OPENSSL_sk_num)
+     RESOLVEFUNC(OPENSSL_sk_pop_free)
+     RESOLVEFUNC(OPENSSL_sk_value)
++#endif
+     RESOLVEFUNC(DH_get0_pqg)
+     RESOLVEFUNC(SSL_CTX_set_options)
+     RESOLVEFUNC(SSL_CTX_get_security_level)
+@@ -985,6 +1004,7 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(ASN1_INTEGER_get)
+     RESOLVEFUNC(ASN1_INTEGER_cmp)
+     RESOLVEFUNC(ASN1_STRING_length)
++    RESOLVEFUNC(ASN1_STRING_type)
+     RESOLVEFUNC(ASN1_STRING_to_UTF8)
+     RESOLVEFUNC(BIO_ctrl)
+     RESOLVEFUNC(BIO_free)
+@@ -1096,12 +1116,14 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(SSL_CTX_use_RSAPrivateKey)
+     RESOLVEFUNC(SSL_CTX_use_PrivateKey_file)
+     RESOLVEFUNC(SSL_CTX_get_cert_store);
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(SSL_CONF_CTX_new);
+     RESOLVEFUNC(SSL_CONF_CTX_free);
+     RESOLVEFUNC(SSL_CONF_CTX_set_ssl_ctx);
+     RESOLVEFUNC(SSL_CONF_CTX_set_flags);
+     RESOLVEFUNC(SSL_CONF_CTX_finish);
+     RESOLVEFUNC(SSL_CONF_cmd);
++#endif
+     RESOLVEFUNC(SSL_accept)
+     RESOLVEFUNC(SSL_clear)
+     RESOLVEFUNC(SSL_connect)
+@@ -1254,13 +1276,13 @@ bool q_resolveOpenSslSymbols()
+ //==============================================================================
+ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+ {
+-    size_t lTimeLength = aTime->length;
+-    char *pString = (char *) aTime->data;
++    size_t lTimeLength = q_ASN1_STRING_length(aTime);
++    const char *pString = (const char *) q_ASN1_STRING_get0_data(aTime);
+     auto isValidPointer = [pString, lTimeLength](const char *const probe){
+         return size_t(probe - pString) < lTimeLength;
+     };
+ 
+-    if (aTime->type == V_ASN1_UTCTIME) {
++    if (q_ASN1_STRING_type(aTime) == V_ASN1_UTCTIME) {
+ 
+         char lBuffer[24];
+         char *pBuffer = lBuffer;
+@@ -1333,7 +1355,7 @@ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+         result = result.addSecs(lSecondsFromUCT);
+         return result;
+ 
+-    } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {
++    } else if (q_ASN1_STRING_type(aTime) == V_ASN1_GENERALIZEDTIME) {
+ 
+         if (lTimeLength < 15)
+             return QDateTime(); // hopefully never triggered
diff --git a/package/qt5/qt5base/0011-openssl4.patch b/package/qt5/qt5base/0011-openssl4.patch
new file mode 100644
index 0000000000..23451b2912
--- /dev/null
+++ b/package/qt5/qt5base/0011-openssl4.patch
@@ -0,0 +1,89 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+use compat defines for STACK and INIT_SETTINGS
+disable EVP_PKEY_param_check
+map q_OPENSSL_sk_*() to q_sk_*()
+disable SSL_CONF_CTX
+use old signature of CRYPTO_free()
+
+Index: src/network/ssl/qsslsocket_openssl_symbols_p.h
+--- a/src/network/ssl/qsslsocket_openssl_symbols_p.h.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols_p.h
+@@ -80,6 +80,13 @@ QT_BEGIN_NAMESPACE
+ 
+ #define DUMMYARG
+ 
++#ifdef LIBRESSL_VERSION_NUMBER
++typedef _STACK STACK;
++typedef STACK OPENSSL_STACK;
++typedef void OPENSSL_INIT_SETTINGS; 
++#endif
++
++
+ #if !defined QT_LINKED_OPENSSL
+ // **************** Shared declarations ******************
+ // ret func(arg)
+@@ -236,14 +243,31 @@ int q_EVP_CIPHER_CTX_reset(EVP_CIPHER_CTX *c);
+ Q_AUTOTEST_EXPORT int q_EVP_PKEY_up_ref(EVP_PKEY *a);
+ EVP_PKEY_CTX *q_EVP_PKEY_CTX_new(EVP_PKEY *pkey, ENGINE *e);
+ void q_EVP_PKEY_CTX_free(EVP_PKEY_CTX *ctx);
++#ifndef LIBRESSL_VERSION_NUMBER
+ int q_EVP_PKEY_param_check(EVP_PKEY_CTX *ctx);
++#endif
+ int q_RSA_bits(RSA *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ Q_AUTOTEST_EXPORT int q_OPENSSL_sk_num(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
+ Q_AUTOTEST_EXPORT OPENSSL_STACK *q_OPENSSL_sk_new_null();
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_free(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
++#else // LIBRESSL_VERSION_NUMBER
++int q_sk_num(STACK *a);
++#define q_OPENSSL_sk_num(a) q_sk_num(a)
++void q_sk_pop_free(STACK *a, void (*b)(void *));
++#define q_OPENSSL_sk_pop_free(a, b) q_sk_pop_free(a, b)
++STACK *q_sk_new_null();
++#define q_OPENSSL_sk_new_null() q_sk_new_null()
++void q_sk_push(STACK *st, void *data);
++#define q_OPENSSL_sk_push(st, data) q_sk_push(st, data)
++void q_sk_free(STACK *a);
++#define q_OPENSSL_sk_free q_sk_free
++void *q_sk_value(STACK *a, int b);
++#define q_OPENSSL_sk_value(a, b) q_sk_value(a, b)
++#endif // LIBRESSL_VERSION_NUMBER
+ int q_SSL_session_reused(SSL *a);
+ 
+ #if OPENSSL_VERSION_MAJOR < 3
+@@ -373,7 +397,8 @@ void q_SSL_set_psk_use_session_callback(SSL *s, q_SSL_
+ bool q_resolveOpenSslSymbols();
+ long q_ASN1_INTEGER_get(ASN1_INTEGER *a);
+ int q_ASN1_INTEGER_cmp(const ASN1_INTEGER *x, const ASN1_INTEGER *y);
+-int q_ASN1_STRING_length(ASN1_STRING *a);
++int q_ASN1_STRING_length(const ASN1_STRING *a);
++int q_ASN1_STRING_type(const ASN1_STRING *a);
+ int q_ASN1_STRING_to_UTF8(unsigned char **a, ASN1_STRING *b);
+ long q_BIO_ctrl(BIO *a, int b, long c, void *d);
+ Q_AUTOTEST_EXPORT int q_BIO_free(BIO *a);
+@@ -515,12 +540,14 @@ int q_SSL_CTX_use_PrivateKey(SSL_CTX *a, EVP_PKEY *b);
+ int q_SSL_CTX_use_RSAPrivateKey(SSL_CTX *a, RSA *b);
+ int q_SSL_CTX_use_PrivateKey_file(SSL_CTX *a, const char *b, int c);
+ X509_STORE *q_SSL_CTX_get_cert_store(const SSL_CTX *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ SSL_CONF_CTX *q_SSL_CONF_CTX_new();
+ void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
+ void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
+ unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
+ int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
+ int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
++#endif
+ void q_SSL_free(SSL *a);
+ STACK_OF(SSL_CIPHER) *q_SSL_get_ciphers(const SSL *a);
+ const SSL_CIPHER *q_SSL_get_current_cipher(SSL *a);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
