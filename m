Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8D2C9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE02405E5;
	Mon, 28 Sep 2026 11:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnZtzbYswjnI; Mon, 28 Sep 2026 11:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9E11E4054F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790595179;
	b=KH1T1JolZBfr59rxAcEdN9zPqQJDr49pM2Olh1/3lU/pMW2zjQeoxO14WtH+tANFPEOo
	 qOZubL6yf+fnM/g5/5CoROWeTn6dCyZw7VbzdbMz8Vc7WCf09HcSV6nZ2Rp0VZK6xioVm
	 glY91YCds5unQ1aqMXC1Jog6i8zSBhLjNlIuAiHyxcRezfwBTJ8LLLlOR8hKg/Tq61XRC
	 IZtDLw6Y/ux5WiTV95LkDfSQ3TcW0ZSdU5G1JO2rteRLp4KQlFkAVXpaDg4gOlaS/ykMJ
	 yj2Fww6gwrUHGNPHtZaPtBv61k0NL9MtJyB+jihDDLFA6+MkvtHfhqI2mdanci0+9ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790595179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9G0ZxSxHz453kELW0jNM5CU3SRRqoVlb8ro5BOIlsOY=;
	b=jzpVfdvvxU6AYLSj6sTI97QyCcwtrOKKpda3wEZBYD15+t5Y1TktGVQkl8b/dK2IYdTw
	 Tr42gr4VhAFYG/4dFYtQnFLUzamShB2ezs7uEWDE698f12EXC//zFmOh2Htj5tdb0KMN4
	 3Z9lLlVHZSINGFABUbdREMC7ceQY8hHK4g3LObE5Wemd5rdS79xsqaQqDVMoUqsLPPSby
	 9z/kfQGzMd27XAZBMtameZoDXeM7Zc9SGhOd0lf+irqms66O47RtumP21SE5P6h9oSjmx
	 RxSZK/1tT+acgA3fc9oJO7sasrEMh5ThOJdH6tiruT9pyRnvhxN9qXLiIQrX4XSwWHQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790595179;
	bh=9G0ZxSxHz453kELW0jNM5CU3SRRqoVlb8ro5BOIlsOY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dpyLX6CnKpwy+uCdEvJget7a8kWMb2my+E8eu8XSLYIt50MNGC53txIPgjqpV3X9K
	 KTTX6B4qgzKmXfc8O//W0ZroymUvKGsLwBc0OHA5eyN00q+062hVl5gNBPeVzYQzgH
	 rvuzFiyzbu3DUDhYmdDsmG8t6hBPXQik1G3pGdW3DEMN6QWL/jTOQMsZbinnFu26FG
	 VcrYRuWfZb0L+4CDh2tMyBYBkH3YCTPLLp3USe9JQqbmmYSzcM0pORJs/uIsV4ti0G
	 X4fLU+AA56Ou/wWZZU6MsjIp+OStnX5L9CqZb2AsEA0xBOArM7/oC0NbpHBMQLLhb+
	 Y5BqkIgi44eUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E11E4054F;
	Mon, 28 Sep 2026 11:32:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BF9B3D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 823C04054F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pH9qOx-IjH4M for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 90F2E40545
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790595177;
 b=Y5mkdA1Y73Q0bJ0nAM3iL/Ebb/D17EQqVoeBRl+gRouy9nZ42l5Kd8sLDYNoUut1Ccxd
 AqhSP/+aBPAJjxzeIGgBWI2YIcdGubWBg4P45mq7OTdbXGECEL1wzByKJAxet0yFRFKYr
 IW6aGkGa6d6d0wMKOx/bKe/QjnRm+y9H5D8TirbSTrF4rmnUbA9x2AZNg52eEIoD3Lgui
 8JULiVZhjVS5BwKG5MuogL7LuYQNZtUNyglDOMOdktF+IE5zqKbjCqdHP4ycihx8Tjdfq
 z5KbM8D2FuFcg0jUWAdav01YNzonmG47iKjkLWW78Q6FsgGkF7ilXmdwFRM3aIbC/Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790595177;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XY5J5LT8EhZeQv/UOYAIlUl8Ui+Dl5YkZMuUmExzzBM=;
 b=Iam39bWe6e3TYBGOBbn07+3MisLLTE39jZ2nqQTRnOVvHojOIabxBUGaeyD2PDWUTfB1
 XO/L1VLIsOa9xZiEO5CP9TTLrhUf/2szo7Ncd7rorvoInfqbUF5P4C4CoOXbkFUxlXekZ
 Nw44ERgF6oJ91yxnyLGBmtrJxyWSlgcu1MEkX1Lx+PxzKQq1aaHdiylcE8f2NlUa+CBN+
 Z8chmPfmYYDzYlHnTo4hL7RIFX9kbz+56OVlAl1wWEcndwxP5Yit2aWVwz0SWaEbiL6z6
 bkGNzfPBtk7bl7KpPZ3R1XfjkMa0l0KUAXHh4EnKJqsLMVoYVi8XJkvUNCdQ6H73VAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90F2E40545
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51EF69830F; Mon, 28 Sep 2026 11:31:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:26:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3caf39eb798addc6f5022a1e90225a5981356b0b
X-Git-Newrev: 061a33b36a5887f3e1101de687b2b77ac6cbb198
X-Patchwork-Hint: ignore
Message-Id: <20260928113145.51EF69830F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: fix build with OpenSSL
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/061a33b36a5887f3e1101de687b2b77ac6cbb198
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/0001-openssl-v4-update.patch | 191 ++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/package/mender/0001-openssl-v4-update.patch b/package/mender/0001-openssl-v4-update.patch
new file mode 100644
index 0000000000..65443614d5
--- /dev/null
+++ b/package/mender/0001-openssl-v4-update.patch
@@ -0,0 +1,191 @@
+Description: Fix build compatibility with OpenSSL 4.0
+ Include <openssl/x509v3.h> in hostname.c and hostname.go before checking
+ #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT, preventing fallback to
+ legacy OpenSSL < 1.0.2 code that attempts to directly access opaque
+ ASN1_STRING fields.
+ Also add preprocessor guards around deprecated protocol methods
+ (SSLv3_method, TLSv1_method, TLSv1_1_method, TLSv1_2_method) in shim.c
+ and ENGINE functions (ENGINE_by_id, ENGINE_init, ENGINE_free,
+ ENGINE_finish, ENGINE_load_private_key, ENGINE_load_builtin_engines)
+ in shim.c, shim.h, engine.go, key.go to prevent implicit declaration
+ and undefined reference errors when building against OpenSSL 4.0.
+Author: Frank Heimes <frank.heimes@canonical.com>
+
+Downloaded from Ubuntu:
+https://git.launchpad.net/ubuntu/+source/golang-github-mendersoftware-openssl/tree/debian/patches/0004-openssl-v4-update.patch?h=applied/ubuntu/stonking-devel
+
+Upstream: not applicable, upstream moved to c++ in newer versions
+
+[Bernd: rebased for vendored download by buildroot infra]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go	2026-09-20 18:37:50.270612314 +0200
+@@ -15,6 +15,7 @@
+ package openssl
+ 
+ /*
++#include "shim.h"
+ #include "openssl/engine.h"
+ */
+ import "C"
+@@ -33,18 +34,18 @@
+ 	cname := C.CString(name)
+ 	defer C.free(unsafe.Pointer(cname))
+ 	e := &Engine{
+-		e: C.ENGINE_by_id(cname),
++		e: C.X_ENGINE_by_id(cname),
+ 	}
+ 	if e.e == nil {
+ 		return nil, fmt.Errorf("engine %s missing", name)
+ 	}
+-	if C.ENGINE_init(e.e) == 0 {
+-		C.ENGINE_free(e.e)
++	if C.X_ENGINE_init(e.e) == 0 {
++		C.X_ENGINE_free(e.e)
+ 		return nil, fmt.Errorf("engine %s not initialized", name)
+ 	}
+ 	runtime.SetFinalizer(e, func(e *Engine) {
+-		C.ENGINE_finish(e.e)
+-		C.ENGINE_free(e.e)
++		C.X_ENGINE_finish(e.e)
++		C.X_ENGINE_free(e.e)
+ 	})
+ 	return e, nil
+ }
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c	2026-09-20 18:32:37.854514981 +0200
+@@ -6,6 +6,7 @@
+  */
+ 
+ #include <openssl/x509.h>
++#include <openssl/x509v3.h>
+ 
+ #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT
+ 
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go	2026-09-20 18:38:13.462370202 +0200
+@@ -303,7 +303,7 @@
+ 	keyID := C.CString(id)
+ 	defer C.free(unsafe.Pointer(keyID))
+ 
+-	key := C.ENGINE_load_private_key(e.e, keyID, nil, nil)
++	key := C.X_ENGINE_load_private_key(e.e, keyID, nil, nil)
+ 	if key == nil {
+ 		return nil, errors.New("cannot load private key, ENGINE_load_private_key error")
+ 	}
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c	2026-09-20 18:36:02.855038372 +0200
+@@ -382,7 +382,9 @@
+ 	int rc = 0;
+ 
+ 	OPENSSL_config(NULL);
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
+ 	ENGINE_load_builtin_engines();
++#endif
+ 	SSL_load_error_strings();
+ 	SSL_library_init();
+ 	OpenSSL_add_all_algorithms();
+@@ -403,6 +405,46 @@
+ 	return 0;
+ }
+ 
++ENGINE *X_ENGINE_by_id(const char *id) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_by_id(id);
++#else
++	return NULL;
++#endif
++}
++
++int X_ENGINE_init(ENGINE *e) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_init(e);
++#else
++	return 0;
++#endif
++}
++
++int X_ENGINE_free(ENGINE *e) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_free(e);
++#else
++	return 0;
++#endif
++}
++
++int X_ENGINE_finish(ENGINE *e) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_finish(e);
++#else
++	return 0;
++#endif
++}
++
++EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_METHOD *ui_method, void *callback_data) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_load_private_key(e, key_id, ui_method, callback_data);
++#else
++	return NULL;
++#endif
++}
++
+ void * X_OPENSSL_malloc(size_t size) {
+ 	return OPENSSL_malloc(size);
+ }
+@@ -480,7 +522,7 @@
+ }
+ 
+ const SSL_METHOD *X_SSLv3_method() {
+-#ifndef OPENSSL_NO_SSL3_METHOD
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_SSL3_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return SSLv3_method();
+ #else
+ 	return NULL;
+@@ -488,11 +530,15 @@
+ }
+ 
+ const SSL_METHOD *X_TLSv1_method() {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return TLSv1_method();
++#else
++	return NULL;
++#endif
+ }
+ 
+ const SSL_METHOD *X_TLSv1_1_method() {
+-#if defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return TLSv1_1_method();
+ #else
+ 	return NULL;
+@@ -500,7 +546,7 @@
+ }
+ 
+ const SSL_METHOD *X_TLSv1_2_method() {
+-#if defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_2_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return TLSv1_2_method();
+ #else
+ 	return NULL;
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h	2026-09-20 18:38:33.117854985 +0200
+@@ -40,6 +40,13 @@
+ /* shim  methods */
+ extern int X_shim_init();
+ 
++/* Engine methods */
++extern ENGINE *X_ENGINE_by_id(const char *id);
++extern int X_ENGINE_init(ENGINE *e);
++extern int X_ENGINE_free(ENGINE *e);
++extern int X_ENGINE_finish(ENGINE *e);
++extern EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_METHOD *ui_method, void *callback_data);
++
+ /* Library methods */
+ extern void X_OPENSSL_free(void *ref);
+ extern void *X_OPENSSL_malloc(size_t size);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
