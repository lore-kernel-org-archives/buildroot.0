Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CE8C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 11:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6ED60714;
	Sun, 27 Sep 2026 11:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DL_oeOLjMnRY; Sun, 27 Sep 2026 11:00:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F20D260719
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506817;
	b=sQ8En/8RGfi3PYCMNAdmDcGGE+2V8EqWMPrj+lRK+DuxiRfThAe3Q43b/sFkSEvG0YkT
	 3j0Q4JHy3C42/RIit3XViTW4Qtg6+AQL5jRxgidryYK3onMMDu7AU4PQBhjEaTfoL0kjW
	 v+VCI/yEVhFKbrE1oW8lD8YUFrCoMzE3hCp/pIuTRVnN0/23uzyL+vZN4wYTb1GLjQpSn
	 203FxQT6TLuUQcAviHhxN9tLFo3TicujXq4ZQtb+7YHQU8/qGwbUDiyh8lO0c57+MYiVd
	 rtTkEDpol9h0cF6f4hZvh3QWF/PAX16bBdZjoQsAZvXSqyiTvUnL1bPStnE2/x3ytzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h9V9DvEsO7x8jI2ITNb4wkkMGrVBZHdRYLgIHVxuCfo=;
	b=jPfmHASHNGAPB29EIcfxeHGTG+J+GnrbgtqHUgsW4a5Cnlv8Kk2Zmn3HigYq4ANb09h4
	 TrdpK7up8FW6wyrs5KqFv+luNbUP/+MkloLRnsOF0KUAb+ta0FvAGeWWtC2hLIHa2tinf
	 q6WcG88/jMNmvmfTzcRWrqVQuJVWUbSVhnEmSo4+RoIH7cDE4RBEBG73axs3A8UaikZGL
	 Cuf9yXXPWjPWrw0iWGv8/3hU2NXWWjBxNVFhrwUZm0HwMG07viiy1iVLQsk7Hf+5PdlgO
	 MrJ4AAU5iI7UjaMGMmbZUYVvl/VO2+Qragmmvx/1bvYSg3a5Ykx0sfb6udZjBfNIr6g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506817;
	bh=h9V9DvEsO7x8jI2ITNb4wkkMGrVBZHdRYLgIHVxuCfo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q1K34eQt7tQ2zluIdTV3AQxRTmxpBY4A7kXZ9VC88479VCe/IevLHb3hlcJZm5kga
	 VcT/VGRGwPTQQXkuwMRJVfcMDUWmFfpwUQla5aA/4BzAm+DPx+PcSq6BrUho2X2YJj
	 RQN4Lk3L2QddsV5jdmbPIG6fd8gmlDAd9E+odDgP1MDYEh9yCsw1QLU39187FcBbWK
	 D26gIUxTz0hioV+uPjbLGjXb8WpTtpC/hew8v7/r2CFfTQSBFOk+au2LHA1RE7DZIv
	 CFeXKog+Ot22hMTzS1Pjn7mDwEzd7DTRKiELu7CevntDPU5HqbkRTN9hDU79dBs25u
	 Kh1SK9venZ7tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F20D260719;
	Sun, 27 Sep 2026 11:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B593335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E1B40DDF
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agxrpk376yTA for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 11:00:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20EE940DD6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506815;
 b=fa+/wkc4Zx/p2aliwD5sp2ZgTRYOCWrnBvWPaX5G7ToOu2YzoqztPiEoJiBHF9opN9dB
 IsmHdNYx+UIUezQ6PiAkcDmS3VSzwjzLluh82cKTvDvwucWdHb4w4d7GTBbpRLQzd7RzJ
 JuCKG9mjJqP8ZiEtSNJgiJZV7up9MIjt8Jn5UxtXFJPsWSiP0ivoiH4qFAK9kNeKNkB5N
 9NSIpI8yHgpBWu9y+TaTKqGpL/2UigP62KSjBR1EvCD43HcRhgZprQzai6mFbM0mvA6K0
 I2ujU0uSHZ7eMBrsBqYCtWdzDDptX6aptcAytmO1y+eAojROjeO+HBqgeqSr4HmPZsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506815;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tNcWLgZUF0uKr3pKBT9yNpyNdkYQrZgjcsM3anDk9R4=;
 b=TAJWGdqZR3COoKZXQZiJYKNWBgHmrU60Xtm49XDGqAapA03UHGAfnWfuA8xXKETk6JBw
 q0cdiBeATelLjgPAQrghgIUsJs91/eWfbBZWV5Q87jXiGtJhMJXuOycOtlb4iqPLbUHfC
 9jgMuozcPxJ5Sr0rpGiyTsSGX8J1Y7lJmgvgXkERL2dn4GzjfBgxPaTCAocLw56TMzhE5
 ZkhFZyZ4xVSxJVl71UNv3nwf2mV2PMxpA1uMKNUeTCXZL/YOVTRgCQuUCv3b30dqEN0yv
 +eyC48z9+u3wT+ui3koVgStibXgaYmBio3gUvUq8fVSrUY/H72XCux6r/KFUhW54hJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lm5r2xNt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lm5r2xNt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20EE940DD6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505872;
 bh=tNcWLgZUF0uKr3pKBT9yNpyNdkYQrZgjcsM3anDk9R4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Lm5r2xNt/5QDZqlXwZdfL5GdUeo/MB7mSZV9yqFOZphcQoYhsMezk7391KPAjeMJB
 8lrMUf1/7D9ZMw6c/21k+vaOJhxAeKvh90org/mgA69nPUWmAew/c4zPjPHI6oxNE4
 oA9AyyTrl2kyKEMf7VL4I+O9V7kTLfJJKqPo+OTkYo1cl5cUKtIET49tP9KK08gT/4
 TAVWX6ZDb3jG/yNQT5K72w7VrYzElZNiG3DCpybz9DbDepxlRdTz6U3Bczf6kLNhc5
 anAzB7XXN/mw1bxBw7NT+WdZ4NMWmfp2dIQb+2ubWYzYyFDNFmLU3IWMF1sTihD3Ld
 6OWAqVJCQV6nw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 mgVxOUHxroONX9FxK33d1iiuHBpFWcMlb7178ymlWegepK67r7Ae0MF3yI0Unyh2geeC1q7rOv+
 R5Sm8PAIekcSkhl9VDvhszqOjUn6dc7vXakThqLYGwewz43NfpTXPBUEzu8bwB9HuEy6y5GPNgK
 SpyK5O0j9JEcTEejony+DpnuDqBDVMBk/KyCBn5z8r+YuY0/VVy1PG5kQLPAN+DKUOYNhai6m7s
 28C8LrVo2H9xaCZMCe0QHuZJP8GYkWEeIgmVH4wfc1xwGjOB8lbq8Fi6spMttzlbQXIVX3njisp
 kujAZ306MXXUzjfGnTxebe8Ng7LVCMLtZjHGMdwH4X1wyt0aOTuAUPqvAaJtnQgt8rZ+ln77w5Q
 3SWcKXH0TscK+UK+oQsP+6wSCSOU5zAwAs2VTwurTAKotHWPEPQ1HV1kNSQC1KqHUnY9lomKEL/
 9g81c6b30/8xgMKyBvOEo0rQseV0MGr2YSR5uqKm8Gz/Z4itNXtLBNsTV3djlStYfvPeuR/p3yr
 m0nguPMVd/CTfunZOg54ivyj/44RW6tlHSbt0ESAkEoOK31a6rLEMEawzjXwbYpMGGx4tpVC9gs
 5DObCVvu6vZxeY/VuFDqZ870Xr3F8PEfYboSkkJVPYgBf+JxLLmITmQf3x/5SJIYrWIkMkGHA95
 wOLQznLengaqSCNmHLzhh4I1mYiqAtfiztoVQy9rsjFdafHIWyT3WRx83yKC/3Q==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C191A4C50A4;
 Sun, 27 Sep 2026 12:44:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLf-0000000007a-1RyO;
 Sun, 27 Sep 2026 10:43:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:34 +0200
Message-ID: <20260927104301.1801638-57-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 56/82] package/mender-artifact: Fix build
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
