Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9D3C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A795C40DCB;
	Sun, 20 Sep 2026 14:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUcPaMSD3gqp; Sun, 20 Sep 2026 14:17:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AD8B240DB3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913846;
	b=clfxA+Og0qXi4BzdeR1bG30O5WWycMmB6qgTOaIVd+J1U73ZuUtfEw6jCOXwKwHqwt1A
	 S+9oYIaa1EkO8+fYYb7nY2DStMTtHoHr1FH+eUFjnlPt2dHKPHJk7SiQLu7BLbyI/kthM
	 lNQxOTFNap0kwa1FCsxB0MGF4SWXd+ALecyGqPAKKDbkqT8swK6nnTdc+ZAEMGC4z0a76
	 cPkpNo9TOvIIKH4iSe/uKG1iONhR2wBbE4a2QzSl3TGbcMLfRaoUfzcOPVVVRtKKupiBa
	 UYfj2LvsIANVeOHE+ZzKUPvTthHdXV2nNH91hZ/A/HAGTzJpdjDSJAkuNDHJCv7NuzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	b=C0x9Dw6n+zOA0vALU0IlsOgHs336xkV4hxtkG65iwtqhMgxI5aJa5nWfN9GzanUfnd/b
	 S9U7LapW0Kd2BQpFAzm9ebvsIQZ+/YYy791dZoKVQtyUf0hPQXeXROmGOv1gZ4S1npPXV
	 umVD2ZX79+VZGmGvy5ejJLnS5dkp+FH+/9h6oJ31s8DKHMhneXjF17wXONDhKLhMBl8vl
	 20ROiBEfvQEynHXJWpyBIyGqF2EdXDroBVC8XENomIERt3Izr4hBEwosgbZw0gcnXjmf3
	 clqskkhyviOpOzneo2YEUKGfXNon0A81hYgcOApo2NxP/b1SySamEWVzqWYTjZ5krtg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913846;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j3F5dKn1EuuVtV+UI6A/MMOL0RQsWSQHMXRD+K4MMN5OlIA0h869o1stKiyxVGLLm
	 c1gotlW60/r7YZcULTTaKLZz6WLtw7MmHdrnmb8cOUIZ8gkofTK+XNbwoc7ptk5uzM
	 Z6wrlR/340NAoNi0ggjxRfkU6y8Cf8QC/6kOjmGmphDFX/XSZT5jqt20TdjjDo0QwS
	 LVYJvJpVgZGd3JiPnDuBjV82A3c++eJxb8YlvCjPBvrSYQT6MbZ1JmGp8z5IipNxib
	 3cGhGG6W6i/MY7XKew7BNdVwE7lFPnZI2IyRYsIyiLLYOrZTVw/lNz0NoHEnc4k7fD
	 kbr5/XGHiygXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8B240DB3;
	Sun, 20 Sep 2026 14:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58E6C224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ACD060623
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XrJp-AzOTdG for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:17:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5D285605FF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913844;
 b=MuwhiLuUWPApj1X0tk+CxwQEil5H8UjoafGVvptn+JLgq/5leUYuRNqqCBUv+TVGcsW8
 0BQQUVR/4HG40JEIf71Z9orPzVpoeHhvBfSuD08iJNiPrpjXx6GRXtGbCIi5xgrSN4mKn
 9kMvavq9weqWXS1IgQABJ5ZknfoXcrQewzTFor4djgirIQepaJ3HBKtyD28kudljfXVuP
 jB+f66LTiMzltdZgp98Wh8Ne5IQHFfa7VW1WRk9NbemA+w7jPhSyhJvjRcJV8DSdU5tFi
 xo1b9pDyddKuNyXwboWBZlgFvcqsmXj0QCGmYb7MvK1h2fIX4LIYDyW1sp5KaIgsx3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913844;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 b=i6rGgFGfoyjiOrs4BN2FHp1Mn2VE0Hau/W7Ho9yurswwUHxmb/GJZ4moAx8WO1RrSQGw
 zXEy1Hrtl4V4oX/helwdNjNc7Kbcr/+PuSR1xxKv3aoSzPeyP4b1OHSELPeUUWj71/93a
 a24W5nl3BwyytMi+OYU5eIyNViLF0+kGiBhOfqEb6WbL2YZ/PMJN1gPwgs+GnXKJyqTO6
 Ftto6sy4/an1weL6eEfQOOQT1QQ/jvXUmo1wX8ajZTy1mRKaJfB8+VbyNBlayk9RLJFFp
 FCWzoWODSwc/gOv+/k2NnHImiqI4Jdm63Ibk7bghoSQVczd4JKc6DEF2/lwVQjX7nCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hH13fKOP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hH13fKOP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D285605FF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913241;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hH13fKOPcwTjeZ6bDN0Nj5mad76LvoUg5HueqLdNdu485dz3iqTXu4wGUfVV9rK1g
 06QUHnoPd20szqy36zUC+dDY8ZUfjvVcyNQse822uPfkfa+11g9dMjcS0cP0lvb943
 0yxeXHECqnfVjplS7CZZz9mpfDTRaoUtetuZTModwo6r3TM/WQmRHYwDdHe36ghEx0
 tV0LxwGE34w7bkpvv6Z+fRvnDj/FDHf6mD1cwZCyla+pKAtoqLb6kSk5MYtpb6DrH6
 Kr0sAzPNOxp7vJzcbsJntFnQ5iXIStTU2aQGrplOW55VFNgH+cqbgnZavgqEGYp/DA
 OblZjNrgJVfHg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:Aro2G31NhGQZ3Bi8V1q/4AO7Iz5sRCqmNtvI28XiwZKhSUcsYfdRMu48w1+B7tdySY0q7lLr/IkuPZpudHJUftzZaNnQOKS7tU+IyD6Ik8p4QcrKDifgdGcUW96G+K+/3vhLan9ACaT39PNAwtrATlICP7MNhS3WPiZs3m4LNj3Px8U8cnX4klHNvf71ULv/2Jrj/2G5h5+29D1rB+9S8QWsQMMvB0OEEIF5dfy5HycMGWvPkev3PQ5OBEc7xgxng3MlECOca3pq+yIQOXPzCE4NhaYONvtz1vckMkxeNHIFUdeA0fDjmn9c1sTkdxrCn+0YZfw5BCKvndkNqp3XlyAN+ojqqlVe3/vBNzWxWhF3Q8IcF8di1IDj/9f101T2/fA9+HCqnoB44L8gYLSS+erLkOujeu1H66MoSwhjP6QWcrA3h5T+I853VrK/DZfVD6ypY4VRoEfBvUy9zmDa4aPwYT1AuB2RpKpNzo/pyEeJrQAeEDAMQ6g1qS8mJQYQmf7es1OprDp8m2zfrPOfYppAzAoqvA/wQfGSLAT8WI1OIinJG9x+PbfpquT18fKRTiiS5nNXvBIsYe5UtlvzWdZZLdriGo3jCfAjnvpnIiXBoD
 nJ1yuN33CAGjwxsLQGN/RNPpOWtBNKneLnz3Eu6C5LR0BR/hiWygXu/c5F/s36j4ELpbKlrq/g
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85111A4C4883;
 Sun, 20 Sep 2026 16:07:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBK-000000002J9-3509;
 Sun, 20 Sep 2026 14:06:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:40 +0200
Message-ID: <20260920140605.3005461-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 42/66] package/netsnmp: Fix build with
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
