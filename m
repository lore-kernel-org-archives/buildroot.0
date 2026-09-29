Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53EFCA5FAD
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD678811DF;
	Tue, 29 Sep 2026 18:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCg-QrKN2hBB; Tue, 29 Sep 2026 18:48:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AEBB9811F8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707704;
	b=mBCKHCDpQVPQoi/Ldlcvbxo5Bz9l055lWpVYI/roYvLYypUhcAA4n/ES5pMaARB8lYk1
	 NU6humDFViV6uCGMvaUFJShmMujS7CA9VxWrYQV8Y3VO5gsaKIGJLvhE7zDrEXWCFFL/s
	 NYymubTuw5XAtCJguEgkJdcS2NaRRq5OhKbIX856I7xC8FGTT9of4JYMzOE0HUlZmPFib
	 p3liyKcwZH5qN0N9KWZO5WwHkcMrwxskeK5KrMpNZSW75x3fOfqLn+IiTimT46ndxusKc
	 KLULkDtYySJV83DOisxBDCvpf23hpioDuokf9olpZ1q3hiKq+2rWlnzDeB5KSRMw92g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7coOgQvJaTvIQaVKcv+9s1FecU2Tziurp5fdy2N6kXs=;
	b=PnaecsEXoinS8Txc5+0S4huwFCPjoc7pNCAMNa9ygCfcqXZXuGV0J+EyMEje1M9sAuc3
	 /1JkoAcS4KRUEe6ir2QhiE3s7Ga4Mro53IWBlpinmwNqrhvch9A5cL/9y4Rt8zQp5kh7m
	 v6JofxNWQ1muT1vh77erXzz53UIYu44bA2dEC4YwGUHx658lRe89XxL00ChgbkdvbIylU
	 hV+HRYbsPUNABJX+2682qCAjqJ4zP7RNOfLHin/FdwQ6aSR2oOyz/S368XkV6Jmq0B11g
	 aBvnnqx33JpHQ4gwUOZd0CRVyhav0TFzkLIcZnRW1T67dozqFn4hHdnYdFpb/h1VmBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="kJ/hsM1p";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707704;
	bh=7coOgQvJaTvIQaVKcv+9s1FecU2Tziurp5fdy2N6kXs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbqs+AnS7lxsev+M5ei3AECSVfL/Dnq3SMpDs0tbh/ZbrlzRwZjxIWUVj+Yc7edLZ
	 ZqH7HDMvTbtu1xyt2SqUZ/djPBu5njDwUsu696POZ5kVzKBgRaaeK6+TcuGX2tWBzE
	 ZB9ZNbDqdM/xFzjLDnDrFkZqaW64D4lgKgdPuLrlIxQu48a1ipeVb8yTyfJUHJUoL3
	 av8A/fLGFZvX0gthRzYKKJi/cAp/6YClZgi8JPjRjW175X/maQhpZCfI4QKW0kZVjl
	 9GQnJJrqFccq711HVkpOqc9FiahG+Ggt4gMVi5l4jzquoFmyPP4k+oVOKUekdgkYTP
	 cAVdVOQr9Th2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBB9811F8;
	Tue, 29 Sep 2026 18:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C5DA3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D28C811F4
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6ccfhNl40GK for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:48:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9429F811DF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707702;
 b=I5pM3zoLpaOyk96omUVAAeMkVrkDMn7QWrnUh7JzurieSM/PYB4mJbmuAxxwzOniX+V0
 prqBEAyhsAKjmXGJ87AwJ3qizAH90WLRNh1tmZfFNm0tO81/af6Wbsx4JZz8GKEMt+gF3
 bIgmyVokrD7n8EjZfT6n3ydOY78MmsgRr1d3wj5awKkczAP3ux9rT+Ws8Ud6nEVG/j9y8
 FlPuzrRaZzyWNimFEEX5GvoXABlkH7oH9WJ2bbDiuovKo7GZTyLy6azmjdlS09fm/bMbD
 f+DP0/L6kUiIaLh+l0u1S+jY9L9+bdh2ai/YYtj2W2NHKHByD1k55/ybQngxM9UV7DA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707702;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xrVfEvroJBMVV4A4040yMXHYaLaTbW5a2iXuh7bvPgs=;
 b=b9BG3S//XOGJvgByK4RvP/637iXsr2boZDAo1vpOUqxc6daDCJ0NC5mbyMIt2tvY6QYg
 0PB3v1XOhJEx1+Gxu/fX7pTYJoDoDjAhqPpURBxxlDwDQEKIpu3xzlTItF/N/LhiD732Z
 mE+ZvlNt5dbYgim3y4hYzMP69L24vNbhFbBMTubq5/s1Ipv0Xs7KwQi7C7DoIdeg7G502
 MDq/t2KZiq+5WLLqJHgUeyUaMS/rwDLh1NB2EAWvzEEEwCvER+m7X+EXGJrP41LkCei8Y
 9X0EG5lmxO8P3FMfB5/6OgDG3rLom8Wlk+2B9cuMn4JCESjYYamZqPT10+Vdm2Eu6vA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="kJ/hsM1p"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kJ/hsM1p
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9429F811DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707032;
 bh=xrVfEvroJBMVV4A4040yMXHYaLaTbW5a2iXuh7bvPgs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kJ/hsM1pXzTOaPZLITvjzA59fnmuqcJEugVHwUXjsjgxMFzGUo8QBYT71+s6esyoj
 rSMWcjxPu1KY9PI687GoGSCHcHMfztHb4Oel9OBus1xorpETgBh5MLCxfCGGT9Mu35
 5d0dhiI6Q/YAAR6xP3MzGP3FGyM3v5cq0Y7snKLo7El+yFJmTvjEPwAlTadbyRxbNd
 jujqCBAqmzW6xjXWfbEwWEMzkED3n6FYOB+Qu6ojNyPklV8u0JSJnEOI4zQPzCz0cM
 Q8G2V0mDg5nJ6tlV0MCSIOYv36BSFpI1E+zU+nKlilM4BEoIVPtUfFH9Rhn6yav2YD
 EXeZDZlf6cuTg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 iYt6R1BEupVvW4fnLeyJxvWV0FQw5heqdo/Qo4aRPf4X4KPFXkCJcj3dnBzkgpTmbT5u2Y7Z3vt
 eGNiSfOY1Bpbz9LeecDs1xOwvG+oOYBlqnsx/aV/Jk2tYZkkdhND1m7zesD+LSkMhev2ZPraYnN
 XewxBJcMrTrLjhSt3hSy25dzGGFv37X7qybPmu5ni4xPWjTUUk3v0s+Yp2hXf70qPvyxEx33YqO
 1XqpUYh4uY7y18haHlPVBl6kI81Mz0BluYzhWh/9e+CrExEco/fEA1duGz5uzR0RnyOqTdq6sZr
 q8AOih894eaILIDSsKvLjRll5OOEgnWr/x+4I2FE0wDFn1lG0x+ORRdPdCZgxI6gfEWFVsBdnp1
 xtOm3Cztv/o9dfpfzt4jOdvcHCpG+nul/LIZSDqPaB9a/oMzunNnUyUlq1Z3DZ3OQl1i3mPmFPs
 U6n+0bN0gIRlWS8h1DpH8AWV1kFiwL2C2BdyWOtkbSykj4n+whMcNeUGT1O9orjDAoIIrP2gnMn
 AkEoLxc//VrX2Tm5HQigBbrs4xpYZMxEIN7SoriboEUohWe3mM79eMTnDviBzmg59f4KgZPVm8b
 AZVLfwqq7sQG16fV/9UNsccEbv5M221AZ+GY2q3ws7X5thVp
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 995B6A4C51F2;
 Tue, 29 Sep 2026 20:37:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgl-000000006Jn-2F4T;
 Tue, 29 Sep 2026 18:36:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 29 Sep 2026 20:35:49 +0200
Message-ID: <20260929183607.1849293-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 50/66] package/qt5/qt5base: Add support for
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

Support for OpenSSL 4 was added to the Qt 6.x OpenSSL plugin by commit
https://invent.kde.org/qt/qt/qtbase/-/commit/e806630e694d89f567cffa9c982d1f471089ecd8
contained in the 6.12 branch.

OpenSSL support in Qt 5.x is not plugin-based, the move occured in
version 6.2.0:
https://invent.kde.org/qt/qt/qtbase/-/commit/d385158d5213ef568b7629e2aa4a818016bbffac

The upstream repo is not updated anymore:
https://community.kde.org/Qt5PatchCollection
https://mail.kde.org/pipermail/distributions/2026-May/001690.html

To enable support for OpenSSL 4 in qt5base we add a patch set mentioned
in the OpenSSL issue https://github.com/openssl/openssl/issues/29117

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/qt5/qt5base/0009-openssl4.patch |  52 +++++++++
 package/qt5/qt5base/0010-openssl4.patch | 139 ++++++++++++++++++++++++
 package/qt5/qt5base/0011-openssl4.patch |  89 +++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 package/qt5/qt5base/0009-openssl4.patch
 create mode 100644 package/qt5/qt5base/0010-openssl4.patch
 create mode 100644 package/qt5/qt5base/0011-openssl4.patch

diff --git a/package/qt5/qt5base/0009-openssl4.patch b/package/qt5/qt5base/0009-openssl4.patch
new file mode 100644
index 0000000000..19e70e876b
--- /dev/null
+++ b/package/qt5/qt5base/0009-openssl4.patch
@@ -0,0 +1,52 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: src/network/ssl/qsslcertificate_openssl.cpp
+--- a/src/network/ssl/qsslcertificate_openssl.cpp.orig
++++ b/src/network/ssl/qsslcertificate_openssl.cpp
+@@ -123,11 +123,11 @@ QByteArray QSslCertificate::serialNumber() const
+     QMutexLocker lock(QMutexPool::globalInstanceGet(d.data()));
+ #endif
+     if (d->serialNumberString.isEmpty() && d->x509) {
+-        ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
++        const ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
+         QByteArray hexString;
+-        hexString.reserve(serialNumber->length * 3);
+-        for (int a = 0; a < serialNumber->length; ++a) {
+-            hexString += QByteArray::number(serialNumber->data[a], 16).rightJustified(2, '0');
++        hexString.reserve(q_ASN1_STRING_length(serialNumber) * 3);
++        for (int a = 0; a < q_ASN1_STRING_length(serialNumber); ++a) {
++            hexString += QByteArray::number(q_ASN1_STRING_get0_data(serialNumber)[a], 16).rightJustified(2, '0');
+             hexString += ':';
+         }
+         hexString.chop(1);
+@@ -251,10 +251,10 @@ QMultiMap<QSsl::AlternativeNameEntryType, QString> QSs
+                 QHostAddress ipAddress;
+                 switch (len) {
+                 case 4: // IPv4
+-                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<quint32 *>(genName->d.iPAddress->data)));
++                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<const quint32 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress))));
+                     break;
+                 case 16: // IPv6
+-                    ipAddress = QHostAddress(reinterpret_cast<quint8 *>(genName->d.iPAddress->data));
++                    ipAddress = QHostAddress(reinterpret_cast<const quint8 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress)));
+                     break;
+                 default: // Unknown IP address format
+                     break;
+@@ -511,8 +511,8 @@ static QVariant x509ExtensionToValue(X509_EXTENSION *e
+ 
+             // keyid
+             if (auth_key->keyid) {
+-                QByteArray keyid(reinterpret_cast<const char *>(auth_key->keyid->data),
+-                                 auth_key->keyid->length);
++                QByteArray keyid(reinterpret_cast<const char *>(q_ASN1_STRING_get0_data(auth_key->keyid)),
++                                 q_ASN1_STRING_length(auth_key->keyid));
+                 result[QLatin1String("keyid")] = keyid.toHex();
+             }
+ 
diff --git a/package/qt5/qt5base/0010-openssl4.patch b/package/qt5/qt5base/0010-openssl4.patch
new file mode 100644
index 0000000000..8bcd5b1664
--- /dev/null
+++ b/package/qt5/qt5base/0010-openssl4.patch
@@ -0,0 +1,139 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+disable EVP_PKEY_param_check(),
+use the old versions of sk_new(), ..., sk_value()
+disable SSL_CONF_CTX
+
+Index: src/network/ssl/qsslsocket_openssl_symbols.cpp
+--- a/src/network/ssl/qsslsocket_openssl_symbols.cpp.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols.cpp
+@@ -146,16 +146,27 @@ DEFINEFUNC2(int, BN_is_word, BIGNUM *a, a, BN_ULONG w,
+ DEFINEFUNC(int, EVP_CIPHER_CTX_reset, EVP_CIPHER_CTX *c, c, return 0, return)
+ DEFINEFUNC(int, EVP_PKEY_up_ref, EVP_PKEY *a, a, return 0, return)
+ DEFINEFUNC2(EVP_PKEY_CTX *, EVP_PKEY_CTX_new, EVP_PKEY *pkey, pkey, ENGINE *e, e, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, EVP_PKEY_param_check, EVP_PKEY_CTX *ctx, ctx, return 0, return)
++#endif
+ DEFINEFUNC(void, EVP_PKEY_CTX_free, EVP_PKEY_CTX *ctx, ctx, return, return)
+ DEFINEFUNC(int, RSA_bits, RSA *a, a, return 0, return)
+ DEFINEFUNC(int, DSA_bits, DSA *a, a, return 0, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, OPENSSL_sk_num, OPENSSL_STACK *a, a, return -1, return)
+ DEFINEFUNC2(void, OPENSSL_sk_pop_free, OPENSSL_STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
+ DEFINEFUNC(OPENSSL_STACK *, OPENSSL_sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
+ DEFINEFUNC2(void, OPENSSL_sk_push, OPENSSL_STACK *a, a, void *b, b, return, DUMMYARG)
+ DEFINEFUNC(void, OPENSSL_sk_free, OPENSSL_STACK *a, a, return, DUMMYARG)
+ DEFINEFUNC2(void *, OPENSSL_sk_value, OPENSSL_STACK *a, a, int b, b, return nullptr, return)
++#else
++DEFINEFUNC(int, sk_num, STACK *a, a, return -1, return)
++DEFINEFUNC2(void, sk_pop_free, STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
++DEFINEFUNC(_STACK *, sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
++DEFINEFUNC2(void, sk_push, _STACK *a, a, void *b, b, return, DUMMYARG)
++DEFINEFUNC(void, sk_free, _STACK *a, a, return, DUMMYARG)
++DEFINEFUNC2(void *, sk_value, STACK *a, a, int b, b, return nullptr, return)
++#endif // LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, SSL_session_reused, SSL *a, a, return 0, return)
+ DEFINEFUNC2(qssloptions, SSL_CTX_set_options, SSL_CTX *ctx, ctx, qssloptions op, op, return 0, return)
+ DEFINEFUNC(int, SSL_CTX_get_security_level, const SSL_CTX *ctx, ctx, return -1, return)
+@@ -244,7 +255,8 @@ DEFINEFUNC2(void, BIO_set_shutdown, BIO *a, a, int shu
+ 
+ DEFINEFUNC(long, ASN1_INTEGER_get, ASN1_INTEGER *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_INTEGER_cmp, const ASN1_INTEGER *a, a, const ASN1_INTEGER *b, b, return 1, return)
+-DEFINEFUNC(int, ASN1_STRING_length, ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_length, const ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_type, const ASN1_STRING *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_STRING_to_UTF8, unsigned char **a, a, ASN1_STRING *b, b, return 0, return)
+ DEFINEFUNC4(long, BIO_ctrl, BIO *a, a, int b, b, long c, c, void *d, d, return -1, return)
+ DEFINEFUNC(int, BIO_free, BIO *a, a, return 0, return)
+@@ -358,12 +370,14 @@ DEFINEFUNC2(int, SSL_CTX_use_PrivateKey, SSL_CTX *a, a
+ DEFINEFUNC2(int, SSL_CTX_use_RSAPrivateKey, SSL_CTX *a, a, RSA *b, b, return -1, return)
+ DEFINEFUNC3(int, SSL_CTX_use_PrivateKey_file, SSL_CTX *a, a, const char *b, b, int c, c, return -1, return)
+ DEFINEFUNC(X509_STORE *, SSL_CTX_get_cert_store, const SSL_CTX *a, a, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(SSL_CONF_CTX *, SSL_CONF_CTX_new, DUMMYARG, DUMMYARG, return nullptr, return);
+ DEFINEFUNC(void, SSL_CONF_CTX_free, SSL_CONF_CTX *a, a, return ,return);
+ DEFINEFUNC2(void, SSL_CONF_CTX_set_ssl_ctx, SSL_CONF_CTX *a, a, SSL_CTX *b, b, return, return);
+ DEFINEFUNC2(unsigned int, SSL_CONF_CTX_set_flags, SSL_CONF_CTX *a, a, unsigned int b, b, return 0, return);
+ DEFINEFUNC(int, SSL_CONF_CTX_finish, SSL_CONF_CTX *a, a, return 0, return);
+ DEFINEFUNC3(int, SSL_CONF_cmd, SSL_CONF_CTX *a, a, const char *b, b, const char *c, c, return 0, return);
++#endif
+ DEFINEFUNC(void, SSL_free, SSL *a, a, return, DUMMYARG)
+ DEFINEFUNC(STACK_OF(SSL_CIPHER) *, SSL_get_ciphers, const SSL *a, a, return nullptr, return)
+ DEFINEFUNC(const SSL_CIPHER *, SSL_get_current_cipher, SSL *a, a, return nullptr, return)
+@@ -871,15 +885,20 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(AUTHORITY_INFO_ACCESS_free)
+     RESOLVEFUNC(EVP_PKEY_up_ref)
+     RESOLVEFUNC(EVP_PKEY_CTX_new)
++#ifdef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(EVP_PKEY_param_check)
++#endif
+     RESOLVEFUNC(EVP_PKEY_CTX_free)
+     RESOLVEFUNC(RSA_bits)
++
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(OPENSSL_sk_new_null)
+     RESOLVEFUNC(OPENSSL_sk_push)
+     RESOLVEFUNC(OPENSSL_sk_free)
+     RESOLVEFUNC(OPENSSL_sk_num)
+     RESOLVEFUNC(OPENSSL_sk_pop_free)
+     RESOLVEFUNC(OPENSSL_sk_value)
++#endif
+     RESOLVEFUNC(DH_get0_pqg)
+     RESOLVEFUNC(SSL_CTX_set_options)
+     RESOLVEFUNC(SSL_CTX_get_security_level)
+@@ -985,6 +1004,7 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(ASN1_INTEGER_get)
+     RESOLVEFUNC(ASN1_INTEGER_cmp)
+     RESOLVEFUNC(ASN1_STRING_length)
++    RESOLVEFUNC(ASN1_STRING_type)
+     RESOLVEFUNC(ASN1_STRING_to_UTF8)
+     RESOLVEFUNC(BIO_ctrl)
+     RESOLVEFUNC(BIO_free)
+@@ -1096,12 +1116,14 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(SSL_CTX_use_RSAPrivateKey)
+     RESOLVEFUNC(SSL_CTX_use_PrivateKey_file)
+     RESOLVEFUNC(SSL_CTX_get_cert_store);
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(SSL_CONF_CTX_new);
+     RESOLVEFUNC(SSL_CONF_CTX_free);
+     RESOLVEFUNC(SSL_CONF_CTX_set_ssl_ctx);
+     RESOLVEFUNC(SSL_CONF_CTX_set_flags);
+     RESOLVEFUNC(SSL_CONF_CTX_finish);
+     RESOLVEFUNC(SSL_CONF_cmd);
++#endif
+     RESOLVEFUNC(SSL_accept)
+     RESOLVEFUNC(SSL_clear)
+     RESOLVEFUNC(SSL_connect)
+@@ -1254,13 +1276,13 @@ bool q_resolveOpenSslSymbols()
+ //==============================================================================
+ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+ {
+-    size_t lTimeLength = aTime->length;
+-    char *pString = (char *) aTime->data;
++    size_t lTimeLength = q_ASN1_STRING_length(aTime);
++    const char *pString = (const char *) q_ASN1_STRING_get0_data(aTime);
+     auto isValidPointer = [pString, lTimeLength](const char *const probe){
+         return size_t(probe - pString) < lTimeLength;
+     };
+ 
+-    if (aTime->type == V_ASN1_UTCTIME) {
++    if (q_ASN1_STRING_type(aTime) == V_ASN1_UTCTIME) {
+ 
+         char lBuffer[24];
+         char *pBuffer = lBuffer;
+@@ -1333,7 +1355,7 @@ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+         result = result.addSecs(lSecondsFromUCT);
+         return result;
+ 
+-    } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {
++    } else if (q_ASN1_STRING_type(aTime) == V_ASN1_GENERALIZEDTIME) {
+ 
+         if (lTimeLength < 15)
+             return QDateTime(); // hopefully never triggered
diff --git a/package/qt5/qt5base/0011-openssl4.patch b/package/qt5/qt5base/0011-openssl4.patch
new file mode 100644
index 0000000000..23451b2912
--- /dev/null
+++ b/package/qt5/qt5base/0011-openssl4.patch
@@ -0,0 +1,89 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+use compat defines for STACK and INIT_SETTINGS
+disable EVP_PKEY_param_check
+map q_OPENSSL_sk_*() to q_sk_*()
+disable SSL_CONF_CTX
+use old signature of CRYPTO_free()
+
+Index: src/network/ssl/qsslsocket_openssl_symbols_p.h
+--- a/src/network/ssl/qsslsocket_openssl_symbols_p.h.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols_p.h
+@@ -80,6 +80,13 @@ QT_BEGIN_NAMESPACE
+ 
+ #define DUMMYARG
+ 
++#ifdef LIBRESSL_VERSION_NUMBER
++typedef _STACK STACK;
++typedef STACK OPENSSL_STACK;
++typedef void OPENSSL_INIT_SETTINGS; 
++#endif
++
++
+ #if !defined QT_LINKED_OPENSSL
+ // **************** Shared declarations ******************
+ // ret func(arg)
+@@ -236,14 +243,31 @@ int q_EVP_CIPHER_CTX_reset(EVP_CIPHER_CTX *c);
+ Q_AUTOTEST_EXPORT int q_EVP_PKEY_up_ref(EVP_PKEY *a);
+ EVP_PKEY_CTX *q_EVP_PKEY_CTX_new(EVP_PKEY *pkey, ENGINE *e);
+ void q_EVP_PKEY_CTX_free(EVP_PKEY_CTX *ctx);
++#ifndef LIBRESSL_VERSION_NUMBER
+ int q_EVP_PKEY_param_check(EVP_PKEY_CTX *ctx);
++#endif
+ int q_RSA_bits(RSA *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ Q_AUTOTEST_EXPORT int q_OPENSSL_sk_num(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
+ Q_AUTOTEST_EXPORT OPENSSL_STACK *q_OPENSSL_sk_new_null();
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_free(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
++#else // LIBRESSL_VERSION_NUMBER
++int q_sk_num(STACK *a);
++#define q_OPENSSL_sk_num(a) q_sk_num(a)
++void q_sk_pop_free(STACK *a, void (*b)(void *));
++#define q_OPENSSL_sk_pop_free(a, b) q_sk_pop_free(a, b)
++STACK *q_sk_new_null();
++#define q_OPENSSL_sk_new_null() q_sk_new_null()
++void q_sk_push(STACK *st, void *data);
++#define q_OPENSSL_sk_push(st, data) q_sk_push(st, data)
++void q_sk_free(STACK *a);
++#define q_OPENSSL_sk_free q_sk_free
++void *q_sk_value(STACK *a, int b);
++#define q_OPENSSL_sk_value(a, b) q_sk_value(a, b)
++#endif // LIBRESSL_VERSION_NUMBER
+ int q_SSL_session_reused(SSL *a);
+ 
+ #if OPENSSL_VERSION_MAJOR < 3
+@@ -373,7 +397,8 @@ void q_SSL_set_psk_use_session_callback(SSL *s, q_SSL_
+ bool q_resolveOpenSslSymbols();
+ long q_ASN1_INTEGER_get(ASN1_INTEGER *a);
+ int q_ASN1_INTEGER_cmp(const ASN1_INTEGER *x, const ASN1_INTEGER *y);
+-int q_ASN1_STRING_length(ASN1_STRING *a);
++int q_ASN1_STRING_length(const ASN1_STRING *a);
++int q_ASN1_STRING_type(const ASN1_STRING *a);
+ int q_ASN1_STRING_to_UTF8(unsigned char **a, ASN1_STRING *b);
+ long q_BIO_ctrl(BIO *a, int b, long c, void *d);
+ Q_AUTOTEST_EXPORT int q_BIO_free(BIO *a);
+@@ -515,12 +540,14 @@ int q_SSL_CTX_use_PrivateKey(SSL_CTX *a, EVP_PKEY *b);
+ int q_SSL_CTX_use_RSAPrivateKey(SSL_CTX *a, RSA *b);
+ int q_SSL_CTX_use_PrivateKey_file(SSL_CTX *a, const char *b, int c);
+ X509_STORE *q_SSL_CTX_get_cert_store(const SSL_CTX *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ SSL_CONF_CTX *q_SSL_CONF_CTX_new();
+ void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
+ void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
+ unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
+ int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
+ int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
++#endif
+ void q_SSL_free(SSL *a);
+ STACK_OF(SSL_CIPHER) *q_SSL_get_ciphers(const SSL *a);
+ const SSL_CIPHER *q_SSL_get_current_cipher(SSL *a);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
