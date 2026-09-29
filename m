Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A33DCA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7D7F6071B;
	Tue, 29 Sep 2026 18:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLqjM7lzESgb; Tue, 29 Sep 2026 18:47:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B76FC607B6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707653;
	b=jB66HdX1B9DLsRnlHQX3YEJBbnhl5ywYLUa0RGjV1nrsHbZti2df+cIDJuMqblwaydNJ
	 z+wavBCG9CM/3opWA1J1epwt0OIboINWFw5HwPTjAgL8nzQ0u9KGZi5+i126PgAQBu0Cd
	 Rn3twdy/TZu4ZZUWDlLtbddtPz+ROBLAivxeGUTaiatDXtzaZEtHfPi87rwWmXq9uywG4
	 XQoKWePBMEP4zQorBg01/nK9fiJzQbtqh7zxuTcGP2beQ9G9bZ0phF2ruhUhdjeuksSko
	 lhG2q32/Nmv6g/iQBIj+VxVTf/qUt1J1s/oRjUitRzq1GcCIZB2zIcsV4yhialFoABQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hNoOSFdec2526ZPIETCpJyoHLrMQH8ceVp8tGm6A/KU=;
	b=VC3AWu8bl9AtzWnHgUUZUm2xpuay5z8qBGQlAgjIhNS8tX6qtD/jvron/5fYznNqpjmn
	 hiHbLG05n+4bg/Vl0Zx8GniYNusABwP30qZuYL/fjBfet6d9qNK869Naw27WfS8dI8/vA
	 gi6a1jLoBRSLYle2xLcKTn68jTYReLWk7/FsRR2UOSJrqd/uHHNc/Z6NHc/6Uo4D779bV
	 ftGgSogbPD5xHW29D76BMmyH246mBJHIUuhQilk08Bc6OBDhp0sG8CPDqGJxnA5aqRRvq
	 LDf8NtJ1t+UWQ7Jjzmw33+GncvZdL40EpReeidGO7FNSGX0+y9kH0jqKItA7YOLoX0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707653;
	bh=hNoOSFdec2526ZPIETCpJyoHLrMQH8ceVp8tGm6A/KU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7zWff4UXfiDxwXxHpEz5mXu3oDbWMBXTQKZnsQBaS3GXGOznIkbA3eA4qg37gTJE
	 8IT1ByMuYRXK6OQaYXDy6N+0x0Jub8z4yfDGmYNIk1qWvNGtm+49yWTxL9FtCqt8Fl
	 9/gutD2K+BIRhmtbzAycQAjPSDy3M+cfXgVilkS9iOfNrX42fRHfBsNLJgeB9GBg4T
	 KQRbQ15Dkgki5J97wS2laf9RGfGRBBn9sAltj6IsJy1CrovC+aMTGe/cg5HnTZjdWf
	 NvlIKytNzblK81p5FTKOPnswzWkNAkvxMYzgbkIfXLpvfl9UuV9WL1PFr1jLP1dXLR
	 PsW4vSlEX5XVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B76FC607B6;
	Tue, 29 Sep 2026 18:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CDBB3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E93C81036
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfg-W-MqgSmA for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:47:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0CCD780FFD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707651;
 b=mKRT2i2i8quGfTHtxT+XNbWpjiZRkwvAtDCgaMWaRQvG2JwNFJHT1Isi5D7IdxilH7Kg
 qTTqpU7zwpYlbMnvqLs626flTQVmRVahXnHhTlij3oJmEjyaPhoVVBdlNXgYI0I/F4YGn
 jjGat7JHRzqb1QpTvBwP452PoKz7FYwD3cjulV4/qZROPdKsEACxIBewwjc8WPyqG6Kuq
 CVFazsfJPGBBbUj2GtFSpGFXdubjEKy3C9qgHBJ21iLZDZmH0lBCzbUmjGMc+AqY4xGGz
 6x6PcWIof40kpMi2l8dqpYcuBnF28HFky4QoZu0ijdF7tgAcFrbWKnKScqeCL8L+Wtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707651;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4z6ttURwrQFXpuSBqaDdkUYn7FxXwqAWGc612OcNMos=;
 b=IfRerzuY6yIS7MmBpQgmzAhDzvA5V/jC2vVHxC8NFgL8iTWKOBg98jMMogMMRPd5uhBW
 yaP53o0zYikY84N/Ur3Jpmhi5BJxewIyEuyj21gBQziaS1Gwm+L5iCe0ZeoSTF4h+P9bX
 a8S13CjmjeTbkvyuS2Gbdd4RtwrltqoIVe/03vpKUGHqLInruV83ehHbDG8EnBD+/6tnk
 lkdBTlhjUDLGXiycR5lcCrvKTv8adgSLX97uaNCvab5h6aQ+OcB+iGOnrnAgYj+e6wu5d
 gVTiwkPdl15dGB0pFy4RqSlmo/mtLAiFpjOOvedizmcdXrqFPanK00lasDOZEtptlBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="VU/1w7Nv"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VU/1w7Nv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CCD780FFD
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707031;
 bh=4z6ttURwrQFXpuSBqaDdkUYn7FxXwqAWGc612OcNMos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VU/1w7NvLUgneZroK7JeElJkAaYRn4ZGzIb0U9uMXZQA05sXc/9yizAA11jFrbj/K
 H9mUOY9gk79GX3+uDJ+XJx5o/wDzxtTL8LrjMfcybYchBWTMZ3LFvHrzaBcm4TPzj8
 v/S2iVmZ6GzX86A+bPEsypwHfLB0mh6bzSL8BOhiw2ZQdoPTeRH+OU5Ig8zboNjCvl
 bnQLVYxHxMrqh88quTibp8r6aHZATeHiqE6p92DDlIHo5ecA0qfhVf4adenmpGk6yx
 4fakKx1G4VFKSeaOjIfcHM4B0hJzdyOd3SICgoO8ofRmQmh1TvI7eHD3Am8VUNIbsz
 piWF0GRfmEGNg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 4ibD5MbEvlCPp7rDRxK30VtZ3Y+aZRVbLB4gwwUYjkRLUr7cQYVGJ+FsQcfKH1yNR3uvIW2dDYD
 DFJKyOTaRLlOBcXewO6vnWIearRkCOOolV2FBNS2PxnuqfOzZOa5GoLP890WZ81bMBlqYVAihjV
 vBozIeeKr05+XZOckLpeolFLb0T+j689leqSWq1t/b/cghfZJQycg9sdLQvFc2r3a9IOannLPmU
 up4VD8dv0ZvGkaFg5YP2m9y5eW4iwnsv+WctMFMr1mj01Fm/RKrfLz3d8rTCT0BY8hVA4tfiI6H
 NI/Hv4k+mwVJdkWDMjl81Lnx6pNEpczwDSv74tBV/iukoujSKR/TABymqGGBsZ9acHy/WMi7wTQ
 D0g56uECbrMiFf/AtsJ6Dc+3SDTuY3shk9f7gJFsMAgYHnyLIDjsfLBeBLzkcP+k21EzaBwd7wy
 xGe530EtMBT5PQHPbWEFmC9O4J/MbZBcMpsQCijUD0PM7Aoi7YaBU+Xk8nRfqz4Z3dCL/bAbE7b
 EU5EcI98/vj1492dduXm6ZeUjnf1fgzIJg0d2K/RBRzefL/0KDyE0gpePKLhj3nslFezsM49Iog
 VDDa+7M+eINjvJTcvDnjpcbdq7QafFbLt0lpEmhdDyvuawVEeySMHnh/HbCvJqsNjh+x4Up8LP0
 NejOxy0Y0Uyr6hzL2u2IdnRPHjtk=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C354A4C51EE;
 Tue, 29 Sep 2026 20:37:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgj-000000006Jn-3gNW;
 Tue, 29 Sep 2026 18:36:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 29 Sep 2026 20:35:45 +0200
Message-ID: <20260929183607.1849293-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 46/66] package/mender-artifact: Fix build
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
