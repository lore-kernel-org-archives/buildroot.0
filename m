Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEAFC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 11:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C971940DD3;
	Sun, 27 Sep 2026 11:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MAs1Hfx1tHK; Sun, 27 Sep 2026 11:00:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A9C1F40DD6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506806;
	b=YlCgdHQIjfXuXr/dcx8L1/GVKSKyXd8EWv/v2K7lcYFeYIdRbrnLKQ2YjtaW5e71SigN
	 cqJUv1ll6jalrJ4hjP30ghLpQZnSlTQdFA5Bl3WZPFfeo1lL0/1uOA30IBB33mvKHigAt
	 aMLewuCmY+1OA7oC05P1YWOaH9QaSWPl5fB85EoF8T5UH49sW/nBpQuwJjDT6E4KvmPL5
	 LSQsVPqMfCK7kPfuBbZEt5xg0dHLk8M10qmo8tFntPUxPmLh58MJC+aYeAFx3wY1THuOZ
	 wxdK7xFSG09O4Qcr6LWZ+gg+xMkJ9t0GCl/tQab3QM0OolOEYmLGi8xbZLUxejYUHNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RpELp7fPqZK0GKrTFYbXJgv2JJQp48TQyU1ga+X68e8=;
	b=Ah4PkN7yjIP3P3o65ITt4vZRkO7K5QamrKm1ZA+LUjtWO3cDPFsoAgrvK/qcgGLsyCKN
	 EtFOF8jMBsaetpHP5Bs/ZvBR8dFnEwYP7ZG+FoNyX06rM3JhYnDT9/ePnm/77xZ2WNyuC
	 IHpogpTxQuqIY2aigs1QSps38gXR7QZjlVmj0bRptBmn419T3TX0H/NwPeqYBFtOMGgSr
	 1i6SH0Xi6Xz2r3rfUl37qJ9eLXxkV1wUKbaKGIEJiP9+6Z3s0k27txOljcCsQj461xYuO
	 xXOv9MvelcpM6yDDS84qmbwYeo+CGBoAKRrGSN3odSOpdPJEHksVHU/C08G6Tw+xl7Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506806;
	bh=RpELp7fPqZK0GKrTFYbXJgv2JJQp48TQyU1ga+X68e8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MNCi8TgZS7Xw1nnHV3c5qTaHrgTdGpTkOI/zGtaZO/CH9VDJ9VhSf6u6N1W8BciKr
	 uUxQ6TXNZbtsoFldIz6g56qcrLEFUZZ81n3KMuHBxSXvkEmSjtgW2s633fqPt0PFh9
	 XF7KEWOde7nOpodTnp6jYmtcNXt/yJrUXBsJcU4c8h2vEwB1kwjhQBKsH3a+bRg6Pj
	 8EAgAIJFRvGNNPZHOnRGvj46BwgKRkHoGcx4Lf59JCTnYrple8ywj7k2zjW0WWh8jn
	 wrRknu2QH6a5UjEL8lZbZMd21CcWJKnChTRme1xIPd4QM+NLE3y9fihHq6o3OJu42T
	 BHrjv2TSyAllA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C1F40DD6;
	Sun, 27 Sep 2026 11:00:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6617D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B35DD8100C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2XklRhpphA1 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 11:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 583DD81006
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506803;
 b=Hzwxz236QyQNmfNtUQYKX6h5IOPvSCRmM+wriE3KnGILn87i+ognFFv84frnQ+XL1o7J
 TbbEfLx1/V8SEfevGmDfkxHYOF9/bBN/wa7a+K6DBD9ouLVGYtK82NRv3X51Rr0VgvXb0
 iDIqb4+p6rHE+VJbBCQo15fWJSVlg4PMMKvs2Fqlfv8dAFCzcaqVRMlwnzLtq357G2lEm
 KZifcl1aPgJ9IorGjFaH2r2PSceXse9zFca/LlepVN3dT/3e+d/4A3eVCqv55lWEYpbZz
 JsUn2ocABS/n3VEFPripfJm6W/267KuYJp/C7yZxq8UbTsUpuoclyI+on+VuWlu5UsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506803;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+i5lgpMo2Dxxs70DvH62jyuptYOqcjaXlGHpdSRlC1k=;
 b=EY9j4NzwfTJ3PPYa4C2O1PK4HNtUf6j3zgxZRvs7Zycq3m+rq0byRVmHhcKIR0TjokAP
 10X8dLgeo9p+quVgPx8KJecKScBjBi7G9UumnZUsZZ8YtyIQFFZLGAWFeJPVjGc0nB5Ws
 WO6VWbZovz+2LunSHpHS7ozYQA+jD760gFtcwna6MQWRTWLyt4Nz39DVig/ADgwQogZrg
 +779jQKPBIDxCaGpk+UPsrvXifzThcBYVaUfCniAEQvqV9yj5WSDhhJmKMKkbGEpvA7pO
 9f/2Qvx15i6WNrwBXc13gxiV5M0woGsJiCktVKptk7mYMR6z/A5nwbEWMUodsIlE2Vg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=odxZ3VSC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=odxZ3VSC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 583DD81006
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505872;
 bh=+i5lgpMo2Dxxs70DvH62jyuptYOqcjaXlGHpdSRlC1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=odxZ3VSC2FiNOCLg95RnyO9BT6x+lUHnnKS6OWpe0mgGLyOMNI1Ms8vJljHo/nTkL
 PeMhfMomO2wp1n33u7apS5xETiDl+NeS4E38mJ3eTdG0lx4A3LWP+5F46wvIWQTTU2
 IRxyZwN7uPZDsEO6UnFfBTSYhvuO90YgneVLWxzt3Utpvt0Czj4t/gasRxL/JwU9in
 pQFi2R25Aid/XcFtr8KtvAl1ZSFhrHZ7uegv5J6G2IZ2bNMz9yM12e6stIflqWdO5o
 8bUMRJWV/zWJ75cbCTpj5AjYWpbY/nFz7od3EoCSirwJghORLTBfHihNopNS6aAk1I
 h5q+yKBc0mQAw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 mAKybbo1UDAFnzKUarToaznxbC2Nkpt/PdKowzXlZq+d2Id7RWMakdDNcc6pSchXd4a8wSSuXUf
 NzlxB+D41s5cKVPGzgaL5n6GBobsfbzMRiu04JhP1UcECvDd5gDE0+oKdFBFFB+FZFXp/YKGdqd
 r+BuEgkYS6tKLlRS2pOw91PSYsICGWKX4ItKyxEDQ6/5eH5b/BA7jXbIw6jo/6110nWeRjgvwXh
 FFauITv+T4idqTUeJ+m6kmq6N6jAri4zsQu3ARA7Lk4x0MUlxlF3LNxLFc3m4rbImto30MTLGhx
 cTT0E9ehJICSKfmvQMm6zPkzOrMOjT5MY7Zmx0lMExtbdTHJFOZtD72C1RTYUqqZlvlW3enmpMF
 NOekC6ZDHtbKe6nCiGwJDk9TDePCZmX3Po8VfObHy0wy0TibhZEGygivClSb7klWHmX3s/YCrbb
 RPrwCFQql3yEeLsqFWyq5VJ12X/X3qP2WokvkrvluCx4Ha14OTKQbJ622LE8qMSUKK48SAXkyKW
 yYbVY8bKhVtXHe78zoDed+EWBh2RiCrpcDNtVvMKky8KT0ABJGxMI1fLOsmFfvfENU3NJgRQDx1
 Y8p8z+fCwCt59+ng9pR0bYJe7bq4BQW8e/Gp+zhljhC6ivtNc/Nokt4yHSf2XVZ/afoHE25hZ8i
 TmGcWTVpPGxK3An2QGXGofI8s8p64Ft2uWmUGVS5w9C2UugOadx3nHWgx2+FF8w==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26088A4C50A1;
 Sun, 27 Sep 2026 12:44:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLf-0000000007a-0h0Z;
 Sun, 27 Sep 2026 10:43:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:33 +0200
Message-ID: <20260927104301.1801638-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 55/82] package/mender: Fix build with OpenSSL
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mender/0001-openssl-v4-update.patch | 180 ++++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 package/mender/0001-openssl-v4-update.patch

diff --git a/package/mender/0001-openssl-v4-update.patch b/package/mender/0001-openssl-v4-update.patch
new file mode 100644
index 0000000000..010872e69f
--- /dev/null
+++ b/package/mender/0001-openssl-v4-update.patch
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
