Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506CDC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D1F40E71;
	Sun, 20 Sep 2026 14:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9BEVF3QKLb7; Sun, 20 Sep 2026 14:19:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 24BA040E49
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913963;
	b=VgzOZ2GKPJ5B2AkXBnOu/G9dNOnE7ANSWGBstLxKq/G+B3WoYxnTm5ldDmATpAwqVeoQ
	 P6hhJNpA5sI2l016WRMy/TChohlAwME/Z5zIULXn6qvDQLjLaAcVCoDaB1QsmLEoSaXeK
	 1WliOmlPxiQPTM9+JP7emOJdo2ByhmIUbOdGZCPnPn0idkUsJ8BMBGF6Anvls4+FSYeEj
	 oDzQrOc7XbYv+9/YN0l3M58x5Xh+x/aVKu8Yw1vvsn7wSb4LmfZ9mEgoacGMeDCBmuOT0
	 eEhZ8q9p+FdzspgerBaeh0DSytQI/uzvXTaPiiEOtB02ssSV1RxwKbaxPA1vp04IjGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	b=cJJDuhbXQxqL9EuFUdCaNmJA/SI867gyoku45C44Dx4yiMHZApovd78zapX9nomh3tWE
	 2dYb8JDQaYvlkXRpMrKcoahjvlESfgmAdw+mDQ1IJ7R8ND4LPZoYNrHe5nL6A0R5l/Kyl
	 jx2q0IE1MvQo09qNNNJmqXCyNai/9zpJjMwu7Z/xPqjcLp0rf5Tj1epboUH5ATdJXdP5i
	 Wvz99jdtUBMiyPKkUZz4TO4FfQVt79/LT5to8/J73P/tyJu28kcdG9rDWWe8lIOTXttRf
	 s4SB91aMBR0MXQlnk/BquQXaI1xCH2qb5iVqM7iHM0yayTC5wLg8EUu8vORSEtuB+0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913963;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a0lwDnZKdS2NQkvqTfangcGOx4vcSlWslD7XHxACaG5Vzr7pDRC9piDwIIMf6KYLO
	 dG9RV6+jysgfTDyzpQVlzCHMN58oYdFOezyyJmSxWb/yTCp+/J/OUt1SKDTBqAX2vd
	 veLdB4erbbNHLbOVnQb+33ZLd1NxYDlKc3m2zg02PphzwEB98BQUBHzWDF9A79luZ5
	 X28WhKgt/WbvnQSSYn7spaYpkfhtkbTbkm6XYGr8joNauroJFdRfcq9HaTBkartpwS
	 0E8VsJu0AyZgEDY3RjNIZJo/xri76MEDgzNJZ+RpjAGjHUHdW+wgrjZMwBT5p/r2Ky
	 j4H9deBt9mY8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BA040E49;
	Sun, 20 Sep 2026 14:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 314813DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 214EB400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMIvyY5k2X-a for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:19:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2564640022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913961;
 b=suXhgC41x1f9Td6TrPOSKTW/Htuz47vUQ7HARuf6bpAiU3bFqPwuYBQJZuB8J5LK2bLn
 FDMSK71jDxJIA5wKI2DTHBjaEY83CrhEmZcUCKUha6DjweNg3F61yK+eoHv83diJx+lmN
 alo0Tk+djGv2nndj496q8txErmh4egSdDz27kiPE0Xhf1+kLWCHfwzO1zS8cHjEEy0my5
 PVoWVsewSO+LfKVF8HK8iNiMrt0L4VCReMmSBryslh+s5QRl+va9lzbqHEDCfhQ/c+YON
 mXXToDvRAdjKj18uelmtDNMbzdL/u13dte6AS/SUfRiAecdL36LUHf5xZHF+EesdbKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913961;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 b=WXJGjgqBTsQVSLdjH9Kdnzc5xTH/J/H1ZhDYDqpL6reGijDlul/SWtKNgUa7Qv5tDvGc
 Ye3NpMg0FX+BTYO9S/TgX8xXBgoomV7MBMM/9jszdsZb83CSYuvcklCj6bubkOYuTYdsr
 uUTvQAVfo2PCRJmEHpgrDe0IxGb14BehVk/IXsrv1o+9lqaQOsJcYgt/d6QUOamXiSFUc
 sbRa4qRJlQffOhy2HPNAzwdg1BVHBFVd8W8XBM6LRQvW53PaEZFNX3Q7m5zcT5C2VPlWH
 moNehDV4vlkUl8ARdXFdE7O6y/ubuYPYICyMHhle90ohYkDaGTMGuTgp7pFnaUgl0AA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bnkwMsv3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bnkwMsv3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2564640022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913244;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bnkwMsv3nTaPy+VqDIBGs7ZnOaxLRpZh00BtQ6+o1Bk9b8TPInyxqRYC9nbm9Au25
 9ba4vDuFQfFZJw9yTCmfT72dVCeHdPG6kUqnLsMQUomlje3BoSZYmblgIoU+dehlBH
 EzvGSsbr6NBlF6n7TYkoU6uYAftTCyExaBrFJJi6DNkFi6j3DcdJlhLRdmKyQ+Fes1
 mqlxfZwyOy+wcrnCrBBOYgnpR3l3VPG4gVx5w1yCa7ClyjN3S01NYBQK7FDPNEVzY+
 nkqKUdSoyczXVe3Amg1HwOCHEHGbc6MTVjBCniPRjKkt9SVhRlKoYl5pZa8apMzfLR
 nf5HCNTz+zDpQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:EnN4SsDd25iYIeDL1AowhEpDroxuHoqDhQRvEk4bwi/fG5DIEicgDcq1qSS9M4lN1NXFKTZ8iL5CvJyZKu76kMfhoctraxC/y5HFyAqCHNBnIARL4YysXpZMm87Pn1qEOSaJzUtmSQe0RRNbyg3z6QdP7VCa6MrEXnThWbjt7yYNCNdCqVCVyTKEtmblxX8brBBSCTsjI/qt391cywiVRmTC+NJYoOb6Vtd+tD5ctXv2Gw+C2T/6Tbex8CmW9pJlHgoxFM5/WTehZJ0KyDDqi2whsjvqkOWoCpYg9Z6f68VJczPCrbNV/1OlZxhdP8pUFDOCM2tWg6CDWq0zaFjKmE4wjgn+cqGwljuq09uwFwTgDRrn+g0CY+XNMD9MZ6N/AI8oEIkGJ6pGhQpmLc5/Nwg0qgs1t8FWzWfttbjpVRu2QmJOwUh7urDOTJpe546vV3LNjAgY5kAFxRrShcEfNHoYb/U9ZKvYwHfxS+u6Q16CdF36XhSnA8pejT9ZNr9QoO1Tcl9PmEK7/r2Eou58JGi0RnMnFPkXEkfXVRZKGPX/PxP9PQ3DfKwZ5j7xYqD8HSzT4gXXvMA6bvvT+Zqt6Q4uW5JsRf4TNpmJ1oQkukgFrS
 Fxsde2I3cn5D6tJUbjMdxZEsB3ViF99zf6/kVfenv/7XXVXh3lz02gNgJcdHqCYD3hFJHnyCc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 315F0A4C488E;
 Sun, 20 Sep 2026 16:07:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBN-000000002J9-2zK8;
 Sun, 20 Sep 2026 14:06:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:52 +0200
Message-ID: <20260920140605.3005461-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 54/66] package/sofia-sip: Fix build with
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
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
 ...001-Fix-build-error-with-OpenSSL-4.0.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4e1b2ad87d
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -0,0 +1,42 @@
+From b21b4cc7d0dd4c3eae1a98a3fa38f4cdb2e5a385 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 17 Jul 2026 16:41:11 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4.0
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/stun/stun.c | 2 +-
+ m4/sac-openssl.m4           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsofia-sip-ua/stun/stun.c b/libsofia-sip-ua/stun/stun.c
+index 22ca7c7..aa4b574 100644
+--- a/libsofia-sip-ua/stun/stun.c
++++ b/libsofia-sip-ua/stun/stun.c
+@@ -1368,7 +1368,7 @@ int stun_tls_callback(su_root_magic_t *m, su_wait_t *w, su_wakeup_arg_t *arg)
+     /* openssl initiation */
+     SSLeay_add_ssl_algorithms();
+     SSL_load_error_strings();
+-    ctx = SSL_CTX_new(TLSv1_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     self->sh_ctx = ctx;
+ 
+     if (ctx == NULL) {
+diff --git a/m4/sac-openssl.m4 b/m4/sac-openssl.m4
+index 289d3e1..76ba9f2 100644
+--- a/m4/sac-openssl.m4
++++ b/m4/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
