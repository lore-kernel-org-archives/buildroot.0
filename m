Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F89C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C533440CBD;
	Sat, 19 Sep 2026 16:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j53hJpQmfP4; Sat, 19 Sep 2026 16:11:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D54AE40CC7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834261;
	b=WaC2mG2TAcVrIP2+bJJ1+yAoPigdZwhwpytQrDus6lp/ER1mBLatAwLmrIs0NppZcH4G
	 BlLZ5ORBojrh5BJRcvu0rzeuVkMt6sbpxmPsEWo4FpuzE746PLYifT1uzzbUmwBUsP6WU
	 OegZ7rkns545nkyTsnlbUvFe8SsdQ6PEuiGPE5czy9Eipko5g5GBJ55v0KrwI/DwP0ojA
	 C2IXlVe+MhGw2QRdvbsVi35KNuAbOnxQ1lD+v4jzsRQ05N1bdGxsjnTP5Rq3wFT/3JBxf
	 tRByHc3WEbkuoOQMc695/HzLe65KWDNeA++wL87jrN5x7f0sG+FeEnwYjEHOoRNprog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	b=rj+56q/vyab5xNuoTjzV9/uCsRss/kk0pd4/Z758nbW+ZKlYIlfZniIqg/jN4byYHsdI
	 TUMSqk3u/BIMw5TvekmKWId7uTjMVdUSN3kMrhT5ILWR50hjn+wv0girAr/6ZTzRwCxOR
	 64LRWTrdzc0lf8ORzXWvNU1cu7aHZQUK0Vb8GG4paH+Mg0ZyyEhxbG6VevN9A8quZXTpK
	 u4SPoXEY6yZzntufbQEtYlSzK89pZHi8H5FLklAtkkd6+MrwgjVxb4sZWgSN8QxrWYXms
	 f1Gyv/jHE01CMF6udlJXL5dv4g1Wjh5YmpBJq5+xIKH98dpP7kON2sDlqehEo2CplOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=n9rTI9dS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834260;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hVEhxltLv0Ni/GrY+sYytNW4xV2PBIilBOHY7k55XXmOZD899+O2CR8voKn1EJw7p
	 ToBldJNKef99lI0Hy+AjudqjBikuhI96A3afauFkKRMNZsAajV4K4bw2o4CIi/t5z5
	 z/BwoT7kKIYkDUMc12Q0+IxZqQ639cuqeP6ElpB76Y4HgcnNgcruOXOwEDjKyIsTbA
	 S1WtxhlNU5AwBBXUBUZ+2XFqi0NZeSomInnTgc9a1fxIZs62G9VfncZTuqiT730QVY
	 qUo6z55jsD5Iyf3aC8zDTpMiRnTup7jEAKI60fO4pNMq/hQrEU3wEJgKgrPlbx0a4u
	 CBBUWjMwdxloQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54AE40CC7;
	Sat, 19 Sep 2026 16:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6125A24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 530A140CCE
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJvX9Gyre9EB for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 635EC40CC9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834258;
 b=qtIbPWILsOaPU2sP3XTekgje1tG0wIGJ2JT32meBJ0m70hMX5UlSI0P82LrBhhdgrTsG
 /8V/qMDuKz0zyX4jSxiL38iSZCG24UnadEXytD1s7ovbE6bOEy/ro1G82ytJebL/tO0bI
 k9zf4NNOuM0MYoMNt7Uk2HGV/CRi0pzRuFRda3KnhyWYIObCKsenHRGs7oRZxHsZj/7QI
 QvtIEkddvFEZdJzsjnHLCIdZYRIlQRKE9Xx5EFPUcNwmkFeLWTDNluUmlHLedhXLdKU+9
 9Qv6ZL5KDi0bM74ddlB67CPznX7iUeeZSgE0gNIfEcvtL1IyUOZn0mXytYV5W5nP2fQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834258;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 b=iMl1oNoWU4Tu75w8VbG4Aw7DUO7sWPhfRfbxXlwJWr/QDd0EcAVud/+CSwvTRPSlbgk/
 u1Em2wREyvvLhwyScUadkbK7PPSBGSl3YkNN4cJYkJP3uN75eNJFNCX7p9KXE0DWUekbv
 6ACVAsAKHrDX7sgGrJygewb+I+dizTSK5LSjBxG9o+mJWS/XRtQLDOP0B6ji6HjAZakwn
 3Y323mKH+N6E8PuMeR0QL0piZm44yBcdM9SI06DjjDkT+OJrHI4qJ6dehZFW2HaeRTbaO
 qpsd7ORkj4A7rIrdXS87MIJYEX9oBAMSorNCURk2QRMe9YOupSLWoUdvvOYh3YZyt/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n9rTI9dS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=n9rTI9dS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 635EC40CC9
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833553;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n9rTI9dSRem0ydcnatZ0Xn/R/ODtVVtbc0IQCd90K+lbSKRjStc2aCdmTv4xRDozj
 rayOYnz/ckWKgCS8fHiBBpKB90Ek2oQSdnNOWJjsqkHES9H6VCiaxMkoycdbhcVNNX
 eTz7rDk8OwTgz1SXehhrjxKuIVwkaOi7sME4LB/ewFk/BAyztF+Zn6lirM3KvciBeC
 Rot35cJXga2Z8vdGyG07w+Ige+zfapwg2Czq5utFUddk9WD7NwITHf6wIS/TamB86s
 tU8sM+RtwsLrzeP9TUAi7FPl+zN5H7SEVMTMN+uKu0mvzFoKVAUK2jsprmhXb04jDC
 0oBcxmD7/xryQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:fxoYHTrCQLGuoNZV/C4knXAYiMHLdto1rAt/SDgCj7Zj1Frau6QHEWNsh8rPxqoUcCYjlmaOEVR70Ny2tlqPGdyhoyQQfPzIoNOXaGMGBS5YhIdvZH1RhiVniQ3ocY9wA36K71OsQ8TQGO4ZthBkZbnfrtV7/3JsYIc2UyPoOv08bb/mdQ9RuYk31xfm5tQnhkY/K2l+C2zrHxNlr0pS0usTxRB39NNvS1G9yDGD+x1c9ls6JQ57oHA8gir2O8le0LYWSnYJRrFvJzSqY2cvHo0qFQ4sjbykpeS2t8J4FQWzg6ukF9+gx9oY0sKOiPh5eEYjZxfSZWzQyh4jaX939rSYNOFTp9nlR7tHqIXktGGQCdgMKsjtER/+EETv6idwQAQf8nShYe5pBwAayaeFkkqkVhC7YHZdzcBbqqMr1Wh7XBCDFU3K8vNpV3Sdmqk/Zigdaq5OwppldoFl1VSNq2toxrEFC34w6V8xkW3GVpuycJLucLvUWRVXzOOsNJog87Bg1+ef4+TE6qcQLYGpKlb/9qBzp8sKInyBzzB6vZABK5Z6KaGex65sEx0SXiOPR8BikTOaf6Wm8m+OUZDLH8lGvKAA+Xrs2E+y/f5fN7ytxN
 Mai3cIrwGX1As/KhZ8Zhyk1sRybxo9lvpXULR8jx2df70lq+cmEspqidfEjeFNuu/8o0g8
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91A38A4C484B;
 Sat, 19 Sep 2026 17:59:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSs-000000005Jx-2JNc;
 Sat, 19 Sep 2026 15:58:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:17 +0200
Message-ID: <20260919155845.5776-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 52/77] package/netsnmp: Fix build with
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
 .../0002-libsnmp-Fix-OpenSSL-4-build.patch    | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch

diff --git a/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
new file mode 100644
index 0000000000..e92dffff02
--- /dev/null
+++ b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
@@ -0,0 +1,99 @@
+From 1c70efc4334629ba278ea75a071d4dbabc198df8 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 12 Jun 2026 13:52:20 +0200
+Subject: [PATCH] libsnmp: Fix OpenSSL 4 build
+
+[ bvanassche: edited patch description and fixed OS/X build ]
+Fixes: https://github.com/net-snmp/net-snmp/pull/1101
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/66736ece08dc2b4050acaf234e6959d21c89cb02
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ snmplib/snmp_openssl.c | 39 ++++++++++++++++++++++-----------------
+ 1 file changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/snmplib/snmp_openssl.c b/snmplib/snmp_openssl.c
+index 4471a7a9d3..0bd1a65882 100644
+--- a/snmplib/snmp_openssl.c
++++ b/snmplib/snmp_openssl.c
+@@ -234,6 +234,7 @@ void
+ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ {
+     int              i, onid;
++    int              oname_value_type;
+     X509_NAME_ENTRY *oname_entry;
+     ASN1_STRING     *oname_value;
+     X509_NAME       *osubj_name;
+@@ -252,8 +253,9 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+         oname_entry = X509_NAME_get_entry(osubj_name, i);
+         netsnmp_assert(NULL != oname_entry);
+         oname_value = X509_NAME_ENTRY_get_data(oname_entry);
++        oname_value_type = ASN1_STRING_type(oname_value);
+ 
+-        if (oname_value->type != V_ASN1_PRINTABLESTRING)
++        if (oname_value_type != V_ASN1_PRINTABLESTRING)
+             continue;
+ 
+         /** get NID */
+@@ -268,7 +270,7 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ 
+         DEBUGMSGT(("9:cert:dump:names",
+                    "[%02d] NID type %d, ASN type %d\n", i, onid,
+-                   oname_value->type));
++                   oname_value_type));
+         DEBUGMSGT(("9:cert:dump:names", "%s/%s: '%s'\n", prefix_long,
+                    prefix_short, ASN1_STRING_get0_data(oname_value)));
+     }
+@@ -433,30 +435,33 @@ _extract_oname(const GENERAL_NAME *oname)
+                 rtn = strdup(buf);
+             break;
+ 
+-        case GEN_IPADD:
+-            if (oname->d.iPAddress->length == 4) {
+-                sprintf(ipbuf, "%d.%d.%d.%d", oname->d.iPAddress->data[0],
+-                        oname->d.iPAddress->data[1],
+-                        oname->d.iPAddress->data[2],
+-                        oname->d.iPAddress->data[3]);
++        case GEN_IPADD: {
++            const int iplen = ASN1_STRING_length(oname->d.iPAddress);
++            const unsigned char *const ipdata =
++                ASN1_STRING_get0_data(oname->d.iPAddress);
++
++            if (iplen == 4) {
++                sprintf(ipbuf, "%d.%d.%d.%d", ipdata[0],
++                        ipdata[1],
++                        ipdata[2],
++                        ipdata[3]);
+                 rtn = strdup(ipbuf);
+-            }
+-            else if ((oname->d.iPAddress->length == 16) ||
+-                     (oname->d.iPAddress->length == 20)) {
++            } else if (iplen == 16 || iplen == 20) {
+                 char *pos = ipbuf;
+                 int   j;
+-                for(j = 0; j < oname->d.iPAddress->length; ++j) {
+-                    *pos++ = VAL2HEX(oname->d.iPAddress->data[j]);
++
++                for (j = 0; j < iplen; ++j) {
++                    *pos++ = VAL2HEX(ipdata[j]);
+                     *pos++ = ':';
+                 }
+                 *pos = '\0';
+                 rtn = strdup(ipbuf);
+-            }
+-            else
++            } else {
+                 NETSNMP_LOGONCE((LOG_WARNING, "unexpected ip addr length %d\n",
+-                       oname->d.iPAddress->length));
+-
++                       iplen));
++            }
+             break;
++        }
+         default:
+             DEBUGMSGT(("openssl:cert:san", "unknown/unsupported type %d\n",
+                        oname->type));
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
