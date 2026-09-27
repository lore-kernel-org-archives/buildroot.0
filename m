Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42E3C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 11:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E42A40DCB;
	Sun, 27 Sep 2026 11:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtusXuACPET9; Sun, 27 Sep 2026 11:00:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3F05540DFC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506830;
	b=btAYlf2EVmmhyRc4Lb0d0v9/3pOO6TUo70iLSPiDYbxz6vLQLfO4Iv7cMgjzNlbbI1f0
	 mXL9BjhYL+zv6pEbcvA1Wzdjr/SkSP8gKmP8b7k/o1O4t5kY2hV+K77nh4XN77tFm4jGG
	 4yB079iJfACC2y2J7HkX91hTGcnr+JbUPhlUdQ0PXvsEXK899HuPe7j/rxdMXcggEG8/b
	 qvio1x74N3uOh1OFEptebo8LEdfyEFyj6kBqVFID76f4vFOzbLKgQ2FFAQ7dpSG75yixZ
	 wMBJ5abqlTjvRMgYvYhPLjxcr1YPDzlmMxhP8cEjpGfDO7dZMVvkwrBDzrv5ZxMnDvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	b=eap+MAeVPQO7gj277BWUvQkVTHepXSaLu4SHtKj7kqnwH5zq/Rn2SZNLiXdM/3+1uUSe
	 uaqOex7oYVr2amFs3uN1n5BlCLe+4Uh17CgqkZal/7Zhgrt+PTBY0sT5x12tYbg6Ao6w/
	 9X27xe4LSuAi951A+SX5lgqiZDf1HlH1JpPpY0i1x0yTI4RGJu9u9k8Vt01tjNHd7SfGB
	 nrfDwhZUcvgVbSRvPBlUDrNfAkx6kUPKq/QTGHcLSIeyzmCxnssktln4Q+U0lmvjYz6li
	 Jg/zwBrPsQnYMcBxXbdHwKKBsr1YoQkpGDlXMkAwk9N0KEm16k3iK2+sz2Ze8R2f6ZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506830;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IOuAijOCbPc6xA+adYDBuWKgBd1brN7hhndVZZ4jQIprRQyKEWBepOeV0UTPp6NES
	 u6X4P2rrHh90WmlVDLofBiPcIGiLAC0mOlxYJbuuOYtGVFEYSMcwlc7IvVwFXAXIzO
	 BA65wZtXSI5vULVoqYtWBCfmiYnlqNcczdLfiYdASqLECWpXZMd8QGCYg2c4yrM4gM
	 E2twCiEDYOiF9IXSZIbDoG09wmu9ceDGoD0qqXXsR5Ppm1Y0xK5yeni90IPyz/9Yoh
	 Mb2N6DyGGSiYbqjYqoFk8/pVT14GOjONpW8CnNAO3ojEJqGe9H89+BiBmlQSVoImxS
	 FIkOxNDatQAGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F05540DFC;
	Sun, 27 Sep 2026 11:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 669DCD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5841F6071D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flXxhg2oRtZ2 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 11:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E879B6071C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506828;
 b=rfMqA1H7f1cYGnghWbSvOiZy9KcD9rZr5SbLKvTzTDEWsv43iQad3mECyM+MPC1DKgpw
 yCKZyepcFzQQdsOOsyJPL49cuHDZA9d50cTE0PvtjRz4iJW6FwOUaVcaA9x8S0UULFU+I
 VcG7uty76WcviXqCpe0rxkzPtzxNi8Ln94Y8xAsYSTTaFb6s6ZCiK+swwyGjY4u+szoJp
 /8h2uhIpUgeSuAqhzf5Tz8mWqI7t9Yi9Edl3pRXCvnopKPnkD+g0hqSxjJzAX1iO9baUF
 4Q9qYDIPmjL+tLwhUEC8tFcSg77X0lw17AKkaUu+iCU4HOVjAa/hlRvGgTeQ2bkW2RA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506828;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 b=iyDtuFTItG8SpF2a1112pKpQP/FJx4uc3pBgkqvmo8OZFzF920MCyPbcozTSWYHj0omi
 sOZSeceR5Y5zBI43tWW4lk47Do910I5Iw95iiYTsVDMlNfEGhsWNBEwsXL1lPzxIwS72p
 TcdmvJm/ycezPhAyZ3uYMpf6vOcHxdJk19N78nyv6nc/2rqfDZWRTDzUg3aTE9/TJ5N0J
 ci+3ybGcagEjewA5cIlaC5EpBBwJgS5dkzS4wqbY5baLrlz1srG3dSrryQxjKObTdxqqw
 nB8W7EYJHTfI+sj6Gtt2FjP9FoijtZ1alE1p1aUxic/VUn6pfCCbDxnLTbBeajftgyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SU7V685q; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SU7V685q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E879B6071C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505873;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SU7V685qw8Jt5Ii8WIbyTkCFID7VKdvnwtPuJBIRSwaX4Y0yoFOBpVeNZVgJkNirm
 0XaTFa1ZOEBBB/UIddk6w2RlSIvdQa0wCQorn27AaW/mipAAMfakqupd861lMmpBZI
 v6TSLiSRWy/vSuz+Yjdh+2RLTts+rTtmStn9vyZdp8YFXLpwvdHzsifB76eZnDDOhy
 9ta7BVULzPS4Gdrk/2Q9LWPhopfd5NtHJoFJtzy973MRAAuctevInUqA15SLalJtxT
 RW0jnPwBu1TkLlU4Zxyn1lOWdGj4r2YIPRAqeRwviFzC7mP/kg5+dN0ra4IE+qhEKD
 f6CvVfeWU0iPQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 wZ1yuZ592+WGRpvv1JmseqtjBWa2x/hmiMuK7pK2DXBfezrVqH7c1Uj/LJQ1D4r4NvagVpO45gx
 bfNh/7mb8EPpJIuxX/cen9H1Kil87niPi7PTS0BLT/S/J1DR72f46yqXon9GJ9yAIqESCCMzekU
 NcGwMuD5+YOOI+G6kz27a2qtzWimn//F8JXjWLp+/OwwpC54KV/bnioT4WWmEBcGmjwmIkMXI5S
 XiUMf6Y5NaMLcS26uirB7DcKgM+o099QMjIrD4BgeLsZ0HoO4DILgJ54hugYs8cDr0Y724oZrAG
 ydVpGJWxzdVA8pAId/bJbjwFi+I2hMxXJ5OR3+kWGHsnIyDAt6LVb9WIy2SddguQdaAZIqrXrQ4
 TRI+alYjOAGRBuqPbARI6O4ktzLCgIv9Wti9moySOaDRueexZGh+XjK1SYo+GuGqNDpYMxkytcK
 LC+zNsicJp2qeDTS2cef7+gy54GkrkN+ZblMy2uPKoHeOxuTTA58RLDhBd22HMdw34TW9vJmdg2
 v6xFUQXyCl+QKO46yUHeom++K4RHm3dwzr/ZhYpokDC6lzWpUW8K5sJzaEzYpj5krfHtig6PICb
 ZEvQr7hj+A+SlNPDalVQEKH3T95JUoiG/elyMVF2svXHG4yr7/jzK+NhEG28vvrMAaajRNOb/cw
 vB+Xd+29p/oJzpBMpvtOU
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 542D6A4C50A6;
 Sun, 27 Sep 2026 12:44:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLf-0000000007a-2E7O;
 Sun, 27 Sep 2026 10:43:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:35 +0200
Message-ID: <20260927104301.1801638-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 57/82] package/mtd: Fix build with OpenSSL
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
 ...t-compile-engine-support-if-not-avai.patch | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch

diff --git a/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch b/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
new file mode 100644
index 0000000000..21fc2ca2fd
--- /dev/null
+++ b/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
@@ -0,0 +1,62 @@
+From 50136f0ec6d8c9763889d49b31ca6965189afba5 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Sat, 29 Aug 2026 19:25:02 +0200
+Subject: [PATCH] ubifs-utils: Don't compile engine support if not available
+
+OpenSSL 4.0 dropped engine support which was deprecated since 3.0. The
+replacement is the "providers" API.
+
+Add an ifndef OPENSSL_NO_ENGINE around the engine code so it can be left
+out where it is not supported.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://lists.infradead.org/pipermail/linux-mtd/2026-August/114868.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ubifs-utils/common/sign.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
+index 032a6ac..5f94c0a 100644
+--- a/ubifs-utils/common/sign.c
++++ b/ubifs-utils/common/sign.c
+@@ -23,11 +23,14 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+-#include <openssl/engine.h>
+ #include <openssl/cms.h>
+ #include <openssl/conf.h>
+ #include <err.h>
+ 
++#ifndef OPENSSL_NO_ENGINE
++#include <openssl/engine.h>
++#endif
++
+ #include "linux_types.h"
+ #include "sign.h"
+ #include "ubifs.h"
+@@ -139,6 +142,7 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+ 	*cert = NULL;
+ 
+ 	if (!strncmp(private_key_name, "pkcs11:", 7)) {
++#ifndef OPENSSL_NO_ENGINE
+ 		ENGINE *e;
+ 		struct {
+ 			const char *url;
+@@ -177,6 +181,10 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+ 		}
+ 		*cert = parms.cert;
+ 		fprintf(stderr, "Using cert %p\n", *cert);
++#else
++		ssl_err_msg("PKCS#11 ENGINE support not available.");
++		return NULL;
++#endif
+ 	} else {
+ 		BIO *b;
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
