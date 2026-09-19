Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C9C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6BE240CBD;
	Sat, 19 Sep 2026 16:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqVICOidsPHY; Sat, 19 Sep 2026 16:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8065640CA0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834250;
	b=saVor4Ws+9/TtvlN2g2E0PG1xIraEVfzu/gFX/hV/n7PGYq4USTBH7z6YjXDXxrx+xOF
	 q6RjyuOTuf+AzeHepTx5yIsUtclhlJcR3VKRaCfQ0fc8bj+igssX62cj0o3oLVZO3t4yn
	 FV6UpWuU3mdX+shzRsu4eI16WaIaj9sSZ72mLwqPU5gnBISElyfgTVkEYvKbjwTdK1tfj
	 C7A5LZZbg2lKisSM9tYUKZE5BzYODpB/OWIZTA2widuz/WbNk0Y3RY7jmH9HSVx2Z6wh3
	 WrkwcjybbchqXBW0jfBdRo9woIeZDpiA4kVte/wShtozR7x1ryRdJBveKf3FPtXZBjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	b=fbguIKq+qWBQ+8ETqiUiQoKJq/RA6j/wpaSSuIY9+TUWGb7tiHgWP0jNtapYpzU850Il
	 e+8PqoJ+4eZFlhGV6WFIZOmlnPER2ZMx4WscqlMToRRqclqHIDsqZ1UWAS/FXG+pGdN7u
	 uhbcndR0WAiQ36AkkpCHut4sQzmjk0i9e9BH2OR3883gTL5lmfuXpHBrPgwSvGKY4J6Ph
	 XN1nmtqdOUshY5RwMyAyXm8S4tUl369iZ3awa44O1Ror5AMUSsD3KrSU21ht2sIRVSJ/v
	 MuZtIhnM+vY3rQJ+bGPykugj36UeUPGLqndgSvmg6Y3yXt8zIb+omckEquq/5T2akfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834250;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JpDKuJ2F/9IRoGszp3R6EVWFEUSBgZsMuaBDD93ZA+kvv8uT1KiUO5bgBaHsw1wPn
	 JjWmURsbMe3dHQmOK8hVAkocA3LpFQqikJhk/J6Sz/qShsr6NLvgzBdiSYCJkARSHf
	 QvGU/Clikw32TBKJtbvi0iA54lRRRv32B4kcF2+Eu1oTWUlbmQieAEVt0RPnbplztN
	 H9g9SH+yw/rKfMTsQzQ798qGNtYSYBF0dJTL7rDiLOCowdnC6UJrTj5xC87CHUY+eU
	 eLQBYlZdCGR266MYb86XOxlW+y2VQ0WY3BHQvoSeQbQD8ylsM5zTCbno77JG4w48ql
	 /h7eAJRShJJ5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8065640CA0;
	Sat, 19 Sep 2026 16:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 536BF333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E06BF40085
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw-Koo28o0U9 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:10:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3930340026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834246;
 b=NdQOjh9RkjzYgccxbrDhUhljqTtyeW20aJBE6xlCifCKaEhYVYSD7x7WkbWGAVUSPT9p
 kN9II7DT3EgLjTLyeoK/dWjQtxr2QWdJee5d80mlw9c7LEFrdNd0cruBFLQZmYi8Yda9F
 TEz/ck8X0B4NpsuCZEDGgIXxIHxIZNpW9NMeGCzX3RYGVxljCh3er0/iRtytViTTWg7Ai
 UDYzb2rqubGwzQT006Ozf/8HKE6gDeTKjS399nSlwL0XFppWEICBdBTlJpyFEDCnulTs8
 yj5tQm7f4YuPZxSDPiTD26kkQ+jjJNIT61se3YS2MTzjEUBMFJPrI6S/2pDydb62Amg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834246;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 b=LLPTm38SrkgjCIg9DKP8lmkAeCxkhtuj6iozTVuM1pBzbzCgPmuPGdi+C7/TPFEX1luL
 7W5fI03RiUytwt+8B3svAfBGyg3D/LWVvZNOPMY4jiYy/HMFbrg13EDetPsTeSpNOqWIj
 yoI1YFBLy1bfRAYuXZ9ev7dY9TNrptRm6dd/Q4IeLuIEKhfcVt3lfT8k8HkLzVAiW/XCG
 3QUZDnagZ0Tijl43g7XB5Z7DO0103kBQbrzeys4uQsxfoXi0E85cQQxx6BHzW9RoeXOgA
 /E29iqrYUCgEYbdbl9JRYdLJbxE76accvsSEl9vGECJlTaDuNXneacf7PZbJC/b0uKA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Mi6SbNk6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Mi6SbNk6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3930340026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833553;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Mi6SbNk6mvDGVH3AG0mVl2Gcd/VYkmMbK06y9c3VASO2rANITCOGbDfVmq7bORycJ
 7QKfrGnU0rTaa0UX3oJlhs0xEgy8M4Dml4jioI2BJudnpMli6/3Qh4Dg/OOjyf0S7F
 vYqeQg1PXbe/74vMWS8dwsxLHc4ZKqhWE9h7kr1TXTBp8+Vxp4Rryg97MyM+zagit6
 ff6t3XQq7/DK/iaxJNaOODKDl8R06kA8UGttbeQRyBTFTEKIgPI6/NdyECULneUJFN
 iqQdzogh+SUK4g7zyzc1+1ZzWmdQGmslkyCwdIRRe+2WcXDj2rF5V61U7XxBnzn1PV
 nMEkdExQqT7CA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:uqIHuSU8ISY+Y6txqtgfMKbKewppf+Mchpqd85o4hmFdH1zTHuF/RFooFCkC0awDzBhwZUvFSkP1R8NW1N4vg8LOWsftCI615MvJXEQfWIdFpS+HrUeth31pUFceJ2yHEDCXE/ED+E5bn6B7vGYN4aKyFdpIj+wh0MCtRbssSs6ojA9IsXeC70e4yUV8BQEDNK0OMY1nCgJuNTVcHqsn7BhwgSLvCugb20EDOx6kowe83OTEtc++hlc15wLgFpEE9e1Bauupb51AMCVOlJZ+o+aQuIjMUrvRGWzN4Ts5NSBaQPNrVLVrwGMR4rK0+5L6hD7ykbmIDVaVyvBbx6PMQwEBkPzA0BYkbndM7E91ra03Mtw1XXqmpuWM+SGx7AeIfD9SrITGE6PnqfZ4dmjsTuIo/2U/EioTqXuxXIpazPzRB7Dbtznvy+w/5341smYNWMn5ee0qLJ1c6OU5IVA7iP/g9S78pkj4yHwx73b6Ex/Lp52eVZQ580bj+wv/6nbsiHLVY/giAZoGrqP9yI5Q9tEpXPUkonBUUpQyRu1eUG5aZ+QVJxxq1KZFrm9QZDVfBu8jovEZEgO8VMAu1nue0Kw+Aqmd0bGXqlYhobq6eQaZBY
 V1Apy42jfu9jbszztE4wxUw5+6ab1g/dJvrTh5ve1+/yQv9IZfreoPraTk5H9eGzkiNkh8
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80F46A4C484A;
 Sat, 19 Sep 2026 17:59:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSs-000000005Jx-1qBR;
 Sat, 19 Sep 2026 15:58:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:16 +0200
Message-ID: <20260919155845.5776-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 51/77] package/mtd: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
