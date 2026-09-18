Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3056AC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E864E60E60;
	Fri, 18 Sep 2026 18:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZecSwDhX_-lX; Fri, 18 Sep 2026 18:55:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00C8D60E87
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757708;
	b=qy+w6jemck5CrMNeB9OtFYxtSkBISlLSQBBQ6YOCXkREoyr6Xk4vArgQiL/VV84/kmOF
	 p2u+c/jHeWcRQyseKGUuH6UexmJPxhV44rZtWzuVcel3JelhtUlr1t4LPnMnoZT519bgg
	 4BVmUvFAEvqQKnAL5uBkT4wcx3tGnaI5kXvonNvtmf/qA1N5c+EjWFoxc9WscC9VNaI2G
	 IwnlhG2ND1sOSLSB55LIt5aJINY57xJj5hGC4nNcpVzscUVJJEsYMF1yjQ8KwJbHx9kbi
	 7szm/N9VOPlm0IIJyjCa6Kc+8QcC1bHu7l+dpD05IkTXACexF0C2TuYUjHKbtrSlWcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	b=Ws1TAPYWMLhjy0xZxOYE72PtnM34RJ4wTQ8OUw8p3KG/ELvqYiP3OaB6m7Mxzr3iR7wP
	 iGdKUWqzeaBW/558r1ildCuM/aC1re7+RgKDW5BNSzImhy5pOS1/zwjVUTSVq1ShP73Vp
	 nKGSvqMslm0Hvr9OKYnkVJcqt1KBRuL9ASSlT10wXdDB1puraPuQHGRVSmq+fjdP0oWX9
	 RrmqIS8ScigJOPmfKu0vVwMyC7pNoqUmbtfL14l1vbXhmBLcPVxB/5bm2ypd28k+4VAws
	 tL7CogIejd8l3u92iAQNYtRGQmRvUzwXZWLRZxWNnbm24gKQJNaslsdf0eLv/uOZIoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757708;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DhGdJlaNT6a53UiLkjVIlG/xZucorsO4GByBY2GpCIsWAJVYOBK07GKf1lv5UinDh
	 LqpLMILlB/DuYp93oinIyhLT5seIX5aai1HdOCHJQ+m5j++qbDYNzqZI9/+wNtSgfn
	 B9CpVU/N08Ju69p8W1px2R4KJy39wt89JZa6h7b6MXEDweBbOzDeX7EeuKkB6HTlp3
	 A6gt7lU/VhQk3zVpFf5J17UjOnHmmmm8/j4siwInAwtesjE08S4xfXTMwTlBn3/ygv
	 QfnJ7rVWKzZYyZXHcGKzuyH/I5s5RjcvDM9j9XkaasbrKnhewxnZ6W/hbpDHdqBJHr
	 T1XzgnU04LIKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C8D60E87;
	Fri, 18 Sep 2026 18:55:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0317C237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E80D581303
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTN2NomefYbh for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:55:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EFADB812FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757706;
 b=LeD2gySAD+ao32a+y+kMF56hJpOx26nMIqUvTbBB76j+lp1JdhOaqeX6T5dumt306ar1
 HYJJpkcY5n+g70GVKr14JN/PG+f3zFOP/oZABnPfWFSHYM1BEXJLpEZ53UcrEUhczU47R
 0h+xm3pLotwtXdRIl+5JitVR7G+EaisnIlqpF+LVvygldxYPdW/Gk3djNM9dCGLuy/cwX
 g2eUIMN6DmsdWSzn20g5Zdvr0JVlox2iPH1/73NydnMvQsXsCLGona/re3hSFmZYnHqNC
 dCZYjQMCcEFe/lCI2O2Fb2EAAkho3KVxJNp27bkaNUEL3zaUetFLlOB7FA5W7prFpqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757706;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 b=qpboD69sU/AJXMMVPQLb2UeWL+8+kRam+KS46naJYh7LG+Z4v7Lhx3fid6qCq/bDiYhk
 cYHxqjS8Th5z1Mqqv773ctbgQMmToxawtD/QE19ODzzyKRsbpp9ogezlCzQ7UMcXKP8qs
 4qgssCi4T8+96ZqsPJTw47B/jZKCpCxt+EOK3daNFqnZ0UaW8dTqkMCViyp4wpXZF50Rq
 e432bh8sdoapjm/jSqZluksm6rD54pQ24vk0TjMvSYoHFztXP+WVlFD2dsr7NzKDqE9fa
 A6KQ/r9XXMfPmyLa68c5I2mcwh/1k3So809itlKGoRf++GqVtIk1ZT60ajc8XvrKAPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XH9hhSfq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XH9hhSfq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFADB812FE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756945;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XH9hhSfqSdbi/9dukRC9bmI0i5h7dugG+wvwREuV+GWHl3Ts24pDeIVoPaTLQ5Gse
 wK2gpcbLxaHjwNtsNbWRdUE/VxkHQ3j3jfmYLwQEdSgrZltkYNMtnfmnCHnjgWNx2M
 0sx4CbNXuttK4WhnHoG6lOi5hX4UAHK9dzrdSjkfcHfLh3arVZ8bgfFfcdvzYgZWcG
 obZ+zr6ni/Q2TWaLK4H2g2Xr1d43JgzWksmFcanmafTFAzrt0udQNx84DdcD6wClG4
 KUt1XBPP1WaWSH4gQIApx3X4aw4CKqW0oxJ5T0+vgY4/dsIuglhu2sDKHLYJ/c05Se
 95roxiqPrWIJQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:SLJGSLC6C0hJBAwDltzlganXwC0G4240iopZw9VuTtA1I2YsS4SOSwLxV1hnzOEdt4663qRP6ehswRFbskNCuUTyRqLJ9M7NdJ0LKJJbSvXJWvfLkbV7JLwUuFcbY9uwhlFN6XXj092gOK3ocaGNPqL/cLSlIPcP324ZFeIpsQ5dlavcBlQYTBqOV+xg6rd15O03T0awI77TLjei1j0eN5fTTn6iitrE8deb6OXSK55ajip6gMNRpWUPsBFkaDOP+Rowac5xCkqse439u7n1K1PRjDo2xLnhODlhgL5rA85FOZh6WTAax1Vef4BCowclHnq5ihwXZMDfY/BmI3POd791FJ21zjDDRCTFPSJrAwTwuk2dd64i39L9/IJsWyoiyYyoC41gSnhIFBn3IGO/+zyIjhuAa+WdHAxqlccbyhwGvm6k4spydRdEV9dkEd2Ktc8wttgHEYAJGhScZLXMB8ihliYvTOt8/7x8LbUcFHBsbkq+MM7eimCJLGEQ7BjBUqMtlfSFccEM8EmdT/RIr5hQ4uC80xHajnM225U1CtfnnWNEdC2SmXZ5h9m0JfN9P4/57/PLOmUpSePkfqmcL0Xy6jiXq8lNDWkv+70Lbio72O
 KQ2qcnz7JCh0aAYBYj/M5kv4zdYjQwwVZovrKGVQ6D6s+8NuqOVaBqRZpp09AFag5xb2bO40z8
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58705A4C474A;
 Fri, 18 Sep 2026 20:42:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWy-000000007cB-0suV;
 Fri, 18 Sep 2026 18:41:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:14 +0200
Message-ID: <20260918184140.3631274-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 52/77] package/netsnmp: Fix build with OpenSSL
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
