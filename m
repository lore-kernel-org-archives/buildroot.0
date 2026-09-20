Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABBAC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A00240FBC;
	Sun, 20 Sep 2026 17:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUhHtipIAGtW; Sun, 20 Sep 2026 17:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 542D040E30
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924764;
	b=jjeMA4yUcDV8WgtNu+3oO6Ann5iwP49CVkecFwPcnuMo+6c6L/U4NWHXbT1IAAIff0+0
	 NFlT6rBRcUW/cumVxjOS95gZdCbz4wsL7I4bssqTN7ufkXbwd5PyZyVi+0D9ddCN339x8
	 T6Rt6vmyX8Jbngt9kGoo9N+AOSTrEbnkbL5wBb8+4zm7Ej/pXfkExarFOpsimVXJTYJY+
	 WJD2R4SiCYg1jJQZ6rbhM9Rto7NJwwZI5/m31KOBDp2mjUgudf6OfMh1hpa4D066ITYpk
	 a8G1a3QalzM7HlPkgp+6JzyZ1PSw5viRBQ5u419Fi/we+Imz2VyJhHJi+f8pv/cWdeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	b=RLMHipyRa5tWpWtSVkckVGsAlO/J1tpcm0Ewan0oW5SykNIyCdHI9IMzjaXXm19R12PN
	 O0uMZ/PxDQfNiFd52w/Dx90p6+/FLNK4YnMQZM32Abcbx9nlbbzSu0mmY0sl3YxfI5OxU
	 INEvSrRESE0P0L+BVVpr/WTQQ9AIXMzIU8lONcyoTXM2ArOT5KWT7aAQ52L4LnnK+5i7z
	 Odfo1XKD9BhSST2w5auN7aQmQtgey5zl7LKhhuv+fE1M2cJ/zP+XAEVSBDiuBI39OmiPR
	 4jrMafrVsgKXsvwTAbXCByRosiF4hd9TVEnJuc7RXkyNv+dmdZ+lbntFcFG1YeGhUNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924764;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PuOCQNrD6b+sCKGtuYMC94mfIIJv1ie52LMQBkcmz6FJg5T7ck+a3mA4q4Bd+mlS/
	 eklxNGwYhMacTa1uyAJaaZDakIzCgNYCHRcsvf82kycIhBB/J4efLRWZvc1aB8Jza9
	 Yc3VevzlPN0OsO/IUcmP4z2gtZD2gEV90H7sr3P4ShCzvOa48mZdjwzSTDsxSPzEE/
	 9vmkbOfYKwAb4bG9+Hgdey3lQX8eHxju1ZWE1nN/UcIEqrua/2Tmgv0zoTsRVbgWsG
	 ma3LC/HXi56g9MnIGpQ7O11A7q6DtMDTHO9aMj994hIoALxlonlyOhTaHIZk0N8HnI
	 WLk4y/dr601zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 542D040E30;
	Sun, 20 Sep 2026 17:19:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 555A13FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E9980DC5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBnjMHhowLkY for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2C3F280DC2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924762;
 b=L6iZNqFeFPTZyOUvTUlW1nZ9k4jfJtArRpc0xLxOpvQd8dLhdZCcGv0Fj83MJNUUsxpA
 3+4oxsgYD38lf9/90JfNVOZFO5FloPqn2dAsRVgBQyRbx9w9py/hVwNeom/uPsjL/WOHZ
 zOr9oXOlBDrwVCOVJ7C7EkKvjMZm5Fe/5LMOsD6M+pg7mN2/LGDQzhP+Ymhvyp7/m0uex
 9F9F+OG1c7dq9iurYk1XQpFEp5NNAkNUwy3/wIVosii5CW6VpLIG4gmNgvu2tKUFuc6EX
 IB3L00AquRkBU90KQ7IhtjeZpe7VSJ12furE/TMxYYvSfMwXf6KxoaNGNbDSyc6tBZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924762;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 b=MWV59YBw0tcTJHQHGs2yb2c/PzHXsuQnPDybj55E9vFh0fyu4LHp2WWQ43ftDFtrAjtn
 dOTdSJwev/dWm3EIPaR46PcOvQd2v1xkHCSAP4kBk+ChzRQiHukBPAeNiJzb0wJpFX1xV
 lovkccv9/mxY83LYbtGAuzoTif5fOe/hst0/RFvdftYdkIzK6Zi7ra42/s6OokJMvNrQ3
 R+rmahZUDsOXkCWjAxwKMs47CrkhSV/8q7JImHJKOIhj+6LuZQPBG/uYnVho/pWct1QJ7
 02EUd4ChTJIhLMsc+GuR3oqTY2w/7LqyIftVLmtxU9O8Jawsg3MJD5WraYfu8VACPUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MpViejLW; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MpViejLW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C3F280DC2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924162;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MpViejLWfSKF5UG5WIgL66/Aobrs83V3rdYWpBNDQOSo01zVcED22/Jd0ZGrh9mDh
 014+z47UUcjg9W9vgyGHcGNu4p35H8ft1hUQziDcydOw7DJZMJDWu3A4PLvN5kbBxy
 qlrDVKcV5sOQZEn2BKpy02/UQyr2fg9qxuq4CFLuhuIhK+weRJaD/HuBugUdHMMQ3S
 QeZUHZ6/LhEpyG2dZgKq9lVXZXc/srg8rPU6ymN0yP6jPrz4WvrvAXocsSpacxqJmH
 KDvxQZHivmhhcCku2nVIHrixC1KKj9LZfRaVErb1JvA3lZY8cfHa+ZGQW0lYoev+HW
 8eKezC3K3ZObA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:BWqMABryMqmmOZoN8UQmyzJn0CXsLH/9zpktblvcP4+WW+DR51/9P1rVLoglTNFaQDZqVc2QxWXD+E+rxh//RsqSv7JSkn0UxQVioMm95iqGPua/Xxudv0dgLBcLU/UloDSxtNPRaIjwKKyyeBm3R5GEUSDX6GHEcIeK6OtyWK+nYskF0sgPmx5SC/YgaY9nNLf2vQtzWNKA9gN0YTGuhxcSEGHM6d7t5IFX08Hec2uBqzOW4rsGq9eKUJXSVa/hyjq5GVBzfwt2Jt2rcxmcnP5Z5gnCRohoSowIrhfuMLI26J+Ap/h+FP9iN+ifbJemv3l3xp3vH3F0f+eTWWSLo5QRzmBIJeaUQrUTv2SFR1iucnPk8fOPm6jyPF/+lKWST3SPWqOummd3e7Q4Rc1SGhB6o3GofdnKka8Css5G/znWAcGjUbQ3+QBjqvqqPCq5fJMoUPGPbx72Lm/+YQnsl8e8uIFVUp2U8ruowjrMbnxH0iGWCYJETAfoY1aBIuSzq4zPrP/VjA6w33R2p4oUTONdDrItXuIHFYdTURyxYTaT7HLsvgMx5adpD87SJN5ysr4AuYdsAaaqDa6+MXiixfE+bfQxuElQALom/S6c2LWD6A
 LOMl6kFH9beqafZXR7+eNF6MHbO9j46SMpuGCvAKxcAAegc+U/r+XTAlb4kys5L8f44NSDVwM=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3E87A4C489A;
 Sun, 20 Sep 2026 19:09:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1c-000000000o7-2Usd;
 Sun, 20 Sep 2026 17:08:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:49 +0200
Message-ID: <20260920170815.240247-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 42/67] package/mtd: Fix build with OpenSSL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
