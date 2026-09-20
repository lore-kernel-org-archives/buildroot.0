Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E695C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5376076A;
	Sun, 20 Sep 2026 14:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyZe5PRUz9eh; Sun, 20 Sep 2026 14:52:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 436426073D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915978;
	b=lTiSFT1TEQpW0fBZLGcU+VVdbpPnAifyiFSQVLGqxz6MUhRydV2+AslHas59dm1swvrH
	 ihMrgTyDa3pWTMXKP91zi5gbKSs/eOLklQrmO2oIRiXM3MYa2jdPI2CWTLbZxqb345HNW
	 S9kqjoyU24+ew5Ux61yA2X/AJBYjGiwdlsmcVAhuWGeCRTuRlsJ17qKa+4cHg00MjyFXw
	 1wIvQVF2jmY8rDrBpcgJ+kNdcT3UPh7kGQUjaByqi+BkeVtw0OkT5Hf7Has7zqGEU+KZg
	 g2tqsDRrhsbX0r2CCJgYjdbXx0S5ygGYsfEgMkrdEP0Dr0+TjO+BajatIEJQLF9Ou0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915978;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	b=E1hsllCponkrF43ARvoz+p6Q0tlf+zILK2iD//lPlvj5jsaJfmN8RwAy7aEshePFvfCo
	 RxNf96Q0PXH6QR9z8s+c4jecMVaAAZxaIn4bHbVe0KWcB0OeDd/U3o9ahCklaIkmFKzfb
	 EN5LUnrwe+b4mLH2O9ZGWXU9ADLnxiuco2jB2b3STnk4794roTJWj2v56TVxq2ktYzpYc
	 cMQOIzauFLWT34CYXJ8b+2fmixwDNbfNhHzWnpbRlp8McuigWwCSlDzkuSBv8gYOo+HV/
	 V1xn29DxnAPytcFzBfUO5jmpwIdpw/5WifD0HBI9ooTKIYQ8zLDYqezS+TXigCxdnmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tYm1bf3A;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915978;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KWdBLu0eI4mhEX2AjimpXTUpo2lgQEaxM6fiz8G35AkKxAKhBMoVpVRIUQGzgJXvR
	 x4TjhZ9CzuJBgPBnulLZhlAZmOjHjUYLdGREwgh/Bjck2uYUtlp8wWYfexVjr58jd1
	 YDcchq1FZn8oibi0iovr1UOeOQu1hkhWIdPaCFKsGbItj1+DP7gKdmaS4Ebfejc/ZV
	 F+a6l/7vESOVEbBsEiN6E+rxzg85rMcWbakNkqchiL6mVF8i7Q5x+LbJocb6BkVWAh
	 2Sa8u3h9cjz5LePvXGIDVi20ERpDYkblE7BXaRZ/F6ON3yUhfYbZzZO0eHYS3Stgms
	 3xiT+8611pSNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436426073D;
	Sun, 20 Sep 2026 14:52:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C260824D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7EA36073D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUQ-g3-8q9oe for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:52:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BFADC605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915976;
 b=E8ZVmIPXHehcppKQVVhGPE3UYUn3nPEwOr5ga1tKfxGHDfrOSiXhg5UUQ9nKVKxMvcb+
 A7YGUUYp5V+XTPI0TvFdoz9Hdt5sOX3gDH+EkZSLZA6giNsKItkO3nYJDusDJbU5hEmJv
 Kv3CHWtIqQhG3RP8Dr8r1zaIpNRkpKycsbjDFsHoGgkIEIPzz3qq4u5D0zD79vxIebKf9
 tIOpy5PERCrhp1UjnVw8Jp1LR6QHNXp6Uh4TOaC/4qHyrwTet6cs1eETRB+FNVNbSnpmW
 /Jng7iqphbT8CGnI6SbwwjiawcNgSaoRNtnH+OoZ2NE0pJENJ6koujz37V1xLgKFl2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915976;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 b=fgzjhBwTOQ+UpUW+eO8J4T7bM18I38/Bm3ULBo4Wi9uBia8rRzIPEbhCAqvx/cIDeLO7
 T7PhPLsl0Z96IsOLqwFHFVBGFZxuIkn2YMZq5GMEqHtjx+Yef78/mcr23hcbN5UrVtKMg
 YFJfdG1TViLEl4bNUYgQ65mdBrvoObkL/e9HYydOqhkLU4TdRC7VngASu68MtRmq6fSFI
 tIsw2BqcCQcAzfuVUDadldZP2Py0bBsDH807/ip+/2m3uT+JULKaTOAUyLLMzqt1pjCO8
 ToypKLczxAMoqERXltPBRtYVnTnajEPvNEqZYD4fwC7GZ1ojaIw5RIhLCXjbVCuOqKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tYm1bf3A; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tYm1bf3A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFADC605E3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=tYm1bf3AWhHs6NBW+mI4ARPx4Pl3y62lSm/d/qfqHmnEpJr6eBDrbJH4VA/3+24JD
 ABBzA5qcHWnWt1RRdplF1JDIZsXCdw+V8Ciyq1uwf7lg2vc3YilyCpoA50uguWSaJ0
 Z54UtsBLCM+nZ/mFR6bLv+h686+GuvIOu+7iI1qU+hqRb1sb0HGQK3cEEk27lpdDGg
 7ioNbnIoP1SGiqszvjWwQsXJRaaOZaYY6TSlvK3E/IlFrWo/HSWWBTwdP6KG40Wos1
 mvptURoqupxA8l3jLbsRxl1DmlPl+8AKgwiVGnZcqw9AAuDEpl0HDp+CeJCbd5uy6u
 FK/0S6is6mdCw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:t+cQHbFFxAyznnEKkVqDxpjtbynrKoGR2O6BakpwNZg3RfDlMXFgDoAGC/EIrDwdTnc5Vj6LgceJiES/C27+Gbpx6zBPvIb3x512PaTpYSB+pzHWWYwVdKmwJ0VD1Yang7iQPizkCsELzx8+/z+2Fwerbx0lRdNFKJw9qv/OJic4/U9zA2So3XMrS+Nn6m5mKXy4kfclrCdA8AsWWfPAt9DDL6/YdzPrQ3EbO/2Dcpqw5QNqcd/dwq9VYKT6c3jLBGXKojSpZJTRiX3qoYpFE4FPqAosA8SMrY1PxAiZYWpow20heSCaDy75/4Ljxq7Q9DDXILhcR3YlyYMvjYrMIbTYfoALk4Lxbp5XC5TRcQ0oE8Swst8mHUVfw6GhNH6kghTpPRUep5XkIEM/ihBlRquT6dYeNGccpkrlad+fHb7l/Qkcwc+P5Bjj1N3E+2Ut+Rcv0WqX0DjL/W6l6F/L2bfu3bnx8C8OQXjHoZozUXuvpIz1qil/32K/AMAwrKKrPHfaiy5UjqynEtHhIaUk54CDWRNl1eeQUuj/HTvYyMDViTgTUsAS2HoEsKkR3zqAvNh1z0vGyP8IDACtbdg68ZOpwBDcblA=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F363A4C489B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imk-000000000hB-0QZ7
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:03 +0200
Message-ID: <20260920144428.3009612-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 42/66] package/netsnmp: Fix build with
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
