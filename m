Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DB2CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4580A80A84;
	Tue,  6 Oct 2026 16:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYuhBBp5tbxI; Tue,  6 Oct 2026 16:38:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3B7E180883
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304715;
	b=qbS2fKJW+W9+AafhspdYTsTKrDZNi69pLb5mwnd/2oBmRuvHDPR5jEa+NiQqpQMBUhbP
	 asD8ToS4A5R7yyBv3R3HjSNZZr65W8gRuQj7hMJbrB/pRIFTX0B5a3pKQHLV5kP3nQ4Wb
	 jQ5FuAIUKmv5LOTn2n8Wp0NV0EnbLFbEZLIfAwWIuGKsRXm1LGfxhS2gYaEQbj+BQr8TO
	 wBVNxX2Yb5yQjGBHl1+4FZbUCCO5LLTmSi1pF5OH1HwN7bC0O183kEOH95bjx2KTcNPML
	 OD+PkvBMfuylavW0c+reDKDXpWAEgoOLsLwXbwdNXza1rO8X8axrzCBTUYUh6MDGtgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hNoOSFdec2526ZPIETCpJyoHLrMQH8ceVp8tGm6A/KU=;
	b=LGk5p4U783YbwGns3lbtFBsD2mGUl76bK38VdEgFLu6i1n/QuYWhkMA3k+5IsnGrUyWI
	 vfN2pmkoGiRAVnIROQfUmz8ECN/BQr9TZmhaMQGqEyEoi81cxGO1oKKwwXOvTZuHv+bG8
	 w0Q1FZ5IUL4TPiIT51XGIRPIrQeEhoztGCRReLNjqAVU7iQ9D9SrLetZt112hUldhtGWs
	 3EBNoNunFawUEnKDKRBXaOHzzP5Yq0L7Oay5C8nYcfHmwc1E/2RsvYc2qYt7TVNFaG10f
	 4Ig8Uec+mCjNjh5jqWWVCPjwgW0mzBOm3r4SUsb9JebPpOZBMMud19PccouDaKjK0dQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304715;
	bh=hNoOSFdec2526ZPIETCpJyoHLrMQH8ceVp8tGm6A/KU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XA72Q8nyKsJi/pCdwTL9a6oyVTzaJik1EEW3vo6Ja9edLD4kpyFwoXr+4IOodHXlk
	 nl74icRmix6nG4uqT7nlqUfnSEAuhNR2VGSzuIWm/4uYpGhEfEVSIuMa4NdVQYCE6c
	 qXxmP3TBionQ5l8d9FSrAVMzr83Pb+PnGPNmo1i3LvOv62Tw3sfn56ZK1yF3vcuRgV
	 jfLAEitpGzlzCvqnmR8i0W/omwzXIU5GR2cJ9K2gxTYqbBS2YY+toH+dlE6WyYHG/3
	 sfiYA2wRnpsZ7aALhB4XafTcJl1EPa9OCo6lnHmBjruExBhyAGx+ZMvhc0C7gy5EeR
	 6uSYzks3JuFSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7E180883;
	Tue,  6 Oct 2026 16:38:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B043534E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1CEC402B9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AT7vLNUmMAMO for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:34:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8DAF9402AF
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304465;
 b=GH4b61snEJXklXlX4gHSmpqlfC4oUljp4/bxqINpMgyYHAd5A0aX3nmmCYHK4Vwj/5oM
 8jcGyBstSBEKJ6+9nOe8XzMk1Lo1F6PDsGCEj3z6vESX1bKXe3q5oGZSakcgQhHpH9wEG
 iDaToVqyge/FWsLOHJv7a2trujhUnKjqzr6M2keqCZFrabSOifsTYOFKgV9wHKVWc8JxE
 ZQCGLiLp7fIsQwvK8q0uMUWxvhVKE1TMKyP8YwCEucqqgxQrBoVNnjDlO90+c0HxXQqQB
 5fmF0yaz7tnmwnxVxfIhSUdqE+mSh39i/KuWPl8C4yPZWDDXJAXE0zPF9Ah4ggoON3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304465;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4z6ttURwrQFXpuSBqaDdkUYn7FxXwqAWGc612OcNMos=;
 b=XF0XXzoQAIvMKD1Qujh+mcC6V5NNv69Da99LSevmwozOMz6Gwc8cVBWJLbQcKWbvXmjB
 eTSIBSTjzaVqhZZn5lTTlfalt1YEAH+GzupwQsnVkmkTTARR4+4XQF6LIkTcP8o3aZNis
 RV6ZcORuqbnE614JVf1SkGUG8JzIkFv7Mr4e6BguvYUfBvBC0WUJ+Fla5HJd9fg4mEehu
 TnCgTQEDJgk1dgWRMOOGwQ1Zu0i7PvBa2jlR5YHPxLirRW9oAe1PghnQUIXgsBAuV9jta
 /XyL7YsgtcDWn1k7Qkh3Z8PPhBUuMcA3bI68muSbJz35xRSJziUQm0k0fQv5qURhJgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RujZoi31; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RujZoi31
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DAF9402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303711;
 bh=4z6ttURwrQFXpuSBqaDdkUYn7FxXwqAWGc612OcNMos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RujZoi31T48Hye3Q5xovdDKgew0VjMzat/Rf99qi/OjL/hJBIRZEK6q9Flo37oQCH
 IfaEOaUkUEKB+loM3pXCclT+YtDhaZWY4nX8DrMdQVtZ+U35s6+7QMl/aPKLd4JhoI
 xdzevzjV79UWWKkA0txO76R0F5t/S4tjACqb+57MJL2X6kcXXmS2DXnUbRFu2FNUUL
 ML98ozuwSefs363igVUzpUkdgXR0OK80ZDd94/d4aivZh7to3e0t95BKMt4ogwMZrG
 zV/bAwaE2yQVBL59WJ8oMVCf/wnrdY3zmQ9FdssbmcouphDyTF0Z4Xou/La42T+NF6
 T9OlETtWT0Bfw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 pnsH9fUvoCKvAx57KVAePHZAGqnd/kmD7t3psE3fLSqcOCPfoo9JDB5Umd2ZN5DN7Pgu+HuZXLE
 C9M+4fItNMYupQ2sCr/FHiTNHz478cmMGCkmJyFXgD9YHPaBeym30P48zg/CGWSfciwSBW2GwAW
 N0I9M5zJfRlE4IS9XrIvjFx1bUd1c1lE4nwqgdd68GyGlRKbEC+UuR333E5nFWrJ7HZ6TqFodeq
 mUqHfE/jM5U708rT4QszYOeOQarRPK1KsKxSOfayLPELAo5XC0scIFozfSrBk38XVT9n1a5mr+o
 +RjgQ8SW3PLy3wi9TbdDZM+rceQy7PO96KQ1ix3ql/xFscy5TnJQP4SZzuGC9fqHGLsejdd5XqV
 oN8Bdb/t16rh5Iv4607FxY5C14n69y7wvsFYQmoL55co/S9QbWDDWH8WmuvoqpjT73hdsZEcm0j
 lCmuxnZSKyio6NJp5gk3+TKQzvgJbCNMzZtrGZGMBaKjF0Xh0uSZONCpcAxESp530mkVLCM8cA+
 HDEy9GyPwusMZY4hhrDtPUCoqWhK9h584dTUeUOk6jQpAgbwS1TSIYU5crfamrcL2WmHtoCFiNx
 Lf+E2RgK1NQKAV8y/RUS73u1MplJgCbvegU6TXiv4vYqvZDy5aJnwnYUP8m/kUmQJoiM9Fc31Zl
 FBxlwOikizB/fZCFhgmb5/pMy/aE=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18B27A4C5538;
 Tue,  6 Oct 2026 18:21:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ul-000000000ir-1kuh;
 Tue, 06 Oct 2026 16:21:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  6 Oct 2026 18:20:21 +0200
Message-ID: <20261006162106.3439373-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 40/84] package/mender-artifact: Fix build
 with OpenSSL 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../0001-openssl-v4-update.patch              | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 package/mender-artifact/0001-openssl-v4-update.patch

diff --git a/package/mender-artifact/0001-openssl-v4-update.patch b/package/mender-artifact/0001-openssl-v4-update.patch
new file mode 100644
index 0000000000..010872e69f
--- /dev/null
+++ b/package/mender-artifact/0001-openssl-v4-update.patch
@@ -0,0 +1,180 @@
+Fix build with OpenSSL 4.0
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
