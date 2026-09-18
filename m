Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1238C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D58960E9C;
	Fri, 18 Sep 2026 18:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Rn5NzBaF6Zn; Fri, 18 Sep 2026 18:54:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A016B60E8C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757697;
	b=tWSFTmSUWOGPBM1+yDzf8r5b1KqFeSuLsjqEYvBuxXJFuOw5G+eDS0BWXugY1ABx8juN
	 pMwjmVHUDeIZnQf7DaU8R2qDf0FiS1yhCYvNGAZm/GmHCJFyXMK6wBiD6q2bAm/Pg/1yd
	 yiP6pJC7oNt71XjHkoWQTt+jbrYyNp8Dj/ywyYdHMhF7mwm83tI0asJXGmpWJj5LgcX5i
	 DYmsu1g1icfysluz+RjkK5ZDQxS+xWMdOjMab1E9OtpYpdMdDkbl4BwsTUlZzXygV3Mqw
	 925HmXBBBt8MBDf2CNF+wVs0TBryxL60/bP0djCSXrrmjLyICJgAk7PoXi7ynmrVdcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	b=M4lMomqr6z//m3tmaTIDg/7O2Y0ylq55eFV1lXhuEOpX8Ze7NCAQSWEppCqkXdgWpyPg
	 6GB9bQuCdyDlqKENoSzV0gKsmV2oJT71sdz9fFWOlGFz9cpqhDbtTmPIBV4cDmAZqaakY
	 kgMgRMLSZkaVnmzFMQ1GHPP0stL85iJvTT87t1R/gZ1nTxELxJwZN5j4fpDcg6DWoJOSP
	 hEzLzGIbcadN0k3u5o2/tY4NtB7ohvGJK3F2WH3/R+tK5AHDOf852N4AqRnBv4MLf4esc
	 4LvcxmmtSehP4gD9LEcwim97EibVIJmkSh9FPF9O+H0IYBsPKLLagxPEQQyhWRfNHGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ST1lEPp5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757697;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TyhaZbE9MZWb8NIOI1IKHaH42O2ph5oDsAllyAvfaVxQYButQ60bh23seiI22o3OQ
	 nPrnsWS4kiY9mv0U61nyFQ4ArOPhIQ/iQqLUMgBK4v+8iKxToF2wbmfrqiwDSZpK+t
	 Abj3Kg1zhGM7DPd0fNouOAuS3azoCT0eTQCXqsgmW6eVZ2w7PX6nDw1MXLbtsioeG7
	 LnRMhWvjkKGXO68pL3OS0p3+PKpOUYt415f7DkEgsKicWnvrr1Exx69T6ZuYhfDb7R
	 Kcy75Ej6YE0Yi7De4PtBo/4qG6Ub/avN3fPCY+A92Wu5rgG+WBASxhm5u2PVo7yMQF
	 IZoUgYPIMpMAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A016B60E8C;
	Fri, 18 Sep 2026 18:54:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB23237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 507D360E8C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOYbf2CW7DYO for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:54:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6931F60E60
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757694;
 b=e76BHUfGneeSfrt8wMm2G6efg8136bBNE3Ja0c13/45yS/IEIe9PUbRWhBA5f5IpWcJV
 iIflSq3gGeXJmCgp8nH8lF1grIJ575PAPuQCc8DL38NjSPvAPawzXeudo1AgxHshi2gzh
 3nA+6uGbcyEFWs1XJxYNZGZNPzZycQZV6+TV+mnswsSnHQAT5LmMKE6TKbuTB/uDOQFST
 iNvQDVDb0wJugD7hXC+7mmFOYF3b87r+66Zbij0fp3QIThIQfbX5mqNQno/Dk4Ue7SffC
 yWnEkmfDd3xN5FegTZH/HCxHh8scMJRAcuiSrzsz3W46prlph8DN3v616ixyp1Ptm9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757694;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 b=VI/pLjRiv8O0VDzHbELZZ5dp0QYrSKDqQBi0b87LYB4rQBtByyj4G6DlO2/g1GwBHjwP
 f3X7wVu2xTFydpFhGC2HuyVUtlA2eSguDSwCPvFSkjr6a0Lu3MzUHVnyLkkSdhyNkxXyV
 D/pY79Tukc88VlHdpqBbvQKADsEY7tRmCTqytT3831ArlyLMcewjKaDiCgM53GRRf1ZYz
 /wCI9UaQKaaWfLLZz6ABKIKhNyLxw6MdCpnRGqt6WOvguQpj2O5r8yRqxDiUA4/lfjo0P
 uxVRZhBV3/BosgQr6RIKdsb39KbxiVFo7AvfOJGSG+aGro7KaXvrWv1CC0bwLcMivUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ST1lEPp5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ST1lEPp5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6931F60E60
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756944;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ST1lEPp5J8QNwNVj+maZWYEXOj/yB7e80rnBcCauDsLx51QnT136fU/0PtUqyNuYA
 1MyM3zTOKBWk1lOH5M6X9Dwl9SHXjC8Aian3ndaKXtEfe9dbsDxKyKovyHQ4QMuoS7
 pCjvZsUKuRpwSg2KciexXbduSryGW6ylbqYKfdapNPt2dseflE4XmPxiP9vNNWxusZ
 xbSVoYAxMUfQSio8fKh0Sb9X98H4DE9lGaC9PDecrnAz04Uj+bh5WFplm8s9cEKUBf
 bkxEvye5P6+FSAkVPyqKoEJtKSM2JPMc+HnaPUDxwcTf02WZsinQ21lFvhQfdRiGRq
 obwXy3kF8fzMQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:hXRto6qSUiBH0Rtvagl4asWrxz/BAdHiULjieo9mmPrJo0Xb+89CX4iBBENefPIUbQkF+2A8e8jbOMsV0sdvrSoKA2178iRLdn+6bW4AWdl2gTycR4xF25mJBAoNdMbYSV4U8N/6ElcO7dRdYLqYex0qvg1dXziuXXO84QRQD4WrK4KO2gn4NkRQ53W4TAa/1H42BzYJ2xSHrTEbwrmywiTqPp1smJbXHUusUfFieg7X3UajLSvK50FH7TkCBqz9W4ZbbmCKurjVSxirFqBXywO2qNJHfAP5sTvX04sJwLQB0KU/PQSWu0pc1udqoS68HZ43ftHwk+JuBTDjSkXw2ZHtHQV1UAyXh+b2IQZKTfGRNASgidVnrwY3XXc8Fk8YMa1DraJUy9jQK2e4SKfPEugP1SII/xKYpXokw1kP05t8eSpsWDY/sFDoS0E7nFHrPLG6zikcQ1XHm6+ZdknM97PQfWT3DoaV3StFA8wBn1Tv6QVhz4/BOEnh7kGXrax9Mz16joVOo/pKAwhfyjWjAIlRS8PvagOArmnX5IVgXft9xgx6k4j15tg9MGn22508ZdNXzHyqdj3pOeL7hiZOV6EN7ACTTXWE/tMKXLr+n+9Uf7
 4GzkUuBgByA9o+yPFZlGuGfHk+PfhtzBp9oGD58fJK21WA1eJ4JVdYTeI89g2qVzhECNhi4/6c
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CAB9EA4C4746;
 Fri, 18 Sep 2026 20:42:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWy-000000007cB-0PPc;
 Fri, 18 Sep 2026 18:41:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:13 +0200
Message-ID: <20260918184140.3631274-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 51/77] package/mtd: Fix build with OpenSSL 4.0.0
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
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
