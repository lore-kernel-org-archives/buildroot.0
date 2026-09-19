Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0337C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C21040CC3;
	Sat, 19 Sep 2026 16:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JeAorMnj4dsD; Sat, 19 Sep 2026 16:11:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3F02E40CC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834312;
	b=chZu8m88MdI+llsGqKmqukPA/3ru8Vo6oBss0q5aKTpA4T47n7mZNSQ3Qm37sEIViwnI
	 9skRUCLxqI3DBgcowH39oySdEbAx0RBMdhyGi54i1JsQZY+VGOEl8wJbLQhb/AHa5noCT
	 a4AicHFrPu4U2PN/ZaREHqkg3E0xQobjymz8peFtGl4XieVfJJxHy8h0jXCf6JTijN9Qu
	 +2cnjc14KOuC4WmPehMA/4PIKF62J5pwUiEyV2DInRcwQyFfUBb9RQySc1j9TuEe9za6c
	 P8Z86D+K60NfvPfjiv4avPqJFCLIsGygOE8BgO7o14/BQgqkJ90RqvwhqpeZ9GX665Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SejVdTFrYmIv/TQv7dQ48F1QCWg7uY75T27igrz1QTU=;
	b=aK9r5r8Z/a9rOhPUOkxoaldE/ZAVOlHTE77v9U0INSjpD/+MRh23Xuyuma/y1k0lEVD6
	 o9bMflogyjKOfcBWrqdD1HCV6SeB8/SXzw0eAErSSzzotxJEbWqDrtrc8SKeA2H9HbSk+
	 Xg5gSGXafmre46SYVEw/0LXipVYaJwWhmjzEIXATVWE5LffWsJ4HkoWNINy147vdy4LC8
	 gRtOUJypvI+iXfffk2h1QmsbfuKyflH7WI8XGLKszK+82Va5PlsrPXOvQK7m03gaVnVA+
	 ci9WGMxdxkQVukKM9x+6O8s/SKpmJ4GGw2KQmSinZdkPgxbnhnfaAISMl2F9W7WwCTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834312;
	bh=SejVdTFrYmIv/TQv7dQ48F1QCWg7uY75T27igrz1QTU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eZWSSZJA/K5/Y8b+nF9iRvvBN2MLMs1KCyobz1lEO4oz5bAI+17IiNRGjLwhkzPJW
	 +fIMu2+woCzyDlZRg3FUQ+1sFm/5O+X7INHWdybIo/smvqrSrwBbv9XoVD58pHhhYg
	 /LXF+OyTOo8LPJH32mFGJ4ZJwzhyoTNV6F+mGMmpAJWjopVpJHvFS97dp+vinn9nPe
	 kgZgUMXWnoJS8SYgXxq/LkG9yPfuyfp9fZZ+aNcYm2aw+OddYTH1S3D6nBd46jA4JI
	 vMiMA0uanscrWugYvRNPXBw+TF1Pr1PAe8LX+DllH3EtvIvklopTSgTAguE/S+WQPf
	 MjGedEXWeH6pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F02E40CC6;
	Sat, 19 Sep 2026 16:11:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE8124D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57CB40085
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGSlYtHxf2UP for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:11:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4C63440026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834309;
 b=fBxlBMyvS2JpJJjpMNJdqDGLYSIQXLKlKK1i3EVq+00MepjqhXJqcOK9wczYg49PumlU
 j3NJaJpaXNUxLtdqi/HXl3lpgSO274wWdU+OfIW9QyiP0RBN1HGkc+tT9t/SxXhIE0PYz
 p3EY9yEK70tJQYsOUwaNaRoBGwxqY9oELvYjiavvIVEFwkhSd1t4L4MSGTotJQjQ0Lhb/
 Sd4RXKqel3CAg79qRCIqvxMOHF67LSQiItvr6DAjJ1cLJcXeQAqh5tQWH2F/LjrLOSXpI
 7zNp9t42iIPKh5O0tkx9vTckAKCps7JvbF+78CnIwWOCv4icNWrmPJ+vu6d2lDYpBwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834309;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wbb7Fhx7Eq9PL+6rS0pQNNwtXMerAQnvNerFGS28ftg=;
 b=GTX4HHyWkCi4hfCya9zSg115Cyn1cJd9zeyCOYgXbHz1UiTrRVEMtOYVetztI3XooZ+g
 iGCl/wxwKrqRGFw8nm4OwhktYAoPX+Y86Is9Z8zH7KFeZnhk3ab847rxEPMe6aZpwR7Hb
 lsymCB6t5kWpchD2xMq4SyuPuOvsjjTWEvPwnHN4Nm2R8J5tCyd4rCoQVZ1kwFhHJ/WCm
 Bx3yOsmnRi4OSD3LyrHkvr1nW4dPdY5KfC2gwkeWsmCGpu+YZ+kZ7QsTf0Z3GHEb3AxP4
 wfb8TtQaawmGi/KQIz6805KViQxWKTgVQ/Hs9fQMBsWBmIP/L/zuIRlPnFZ/nMSQndA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=P9iZZnPo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=P9iZZnPo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C63440026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833556;
 bh=wbb7Fhx7Eq9PL+6rS0pQNNwtXMerAQnvNerFGS28ftg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=P9iZZnPoubYWHvFPIbS8DSIFB93ZxMSzuhL7HGWNNL+85EbCwtrjBA14Np4JosztI
 vOXRLpm+WHSa/7LvlcTn+opsA/tFTMYZi5UDwllp0e8ZXTAU88Gqkzu5dlw9oxE3gJ
 WcIVWTyh91t/fG2zazS+lP7aPvV2YrcYcC9h9I9gR8jEB1hG76k224q8YXP5vNbhpR
 ferwvzZJo7KZfn+0gFX7EFJdqyEYaGFKxM1/va+u6/5fd+PSGi4x7aR7uyARi5DhCO
 iYYQud4i4gMkIIG3XkxtVjJbppokg93uvSIsXr9KM2RIQyLB2oZnZkjxK3rGAO5LDO
 wGZACVX2gXaaw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:8/oi2PAL26K7JtfhSOmvU/mpdnzjze6zZrsTsBzjCYNwhHKAERr46b0g540j8UJYLxu/9KHglp8GfdGsBz6RDw+snxJ0bdt6JRU2lOqkit38TOpde+MSOqK/Kf98SzRSsqVJQQlhRGHW2N83FPmJPDjFeguW4tmL1UEfE5y33ZAouhfY4PMh5jiVV+JYNBK102EwYpc42A/DZ97XqDDKtXZVEwysJKB8TwXB6XTiTOUrZc5A2HzQbHBS8RIVg54gdGrCZEubI9NSPLbIfCrHJ/f3eOVeWprSNhdjAGNsgSf9Dsc6QC01ATSs7fr2TxLPcqhQUfWpIWeJ6OFqzC7Lvbc5XL4/yYcif4VIgu62qRBPifE/TlUCfbdFIZtKRzmNKfQtlRGK5gFLc4ZJgMn0wO/iY9ftHvQsXv0vZXiD+laCUrGuNvwIQoY+y/FljWDld25xL7ALH4L0HoeUcYcQOYNcYMa5IK/Y5gOzGLMpTiDniWkTX8JAruniGULcpKJvVGrO7xuuJ5Fwh2hcSRWMS1CrBp8ntF/jQnuSN1IkJUZ0Uit844DjeQBhMu6GHlUWnEe3/gBomQEJeozrAYUmpzYnLGmAUB3y2fEyhuO0L2uTzq
 7Z6WKWhpLv6kYxXJFcc+ncSM3i1Sv+tMbcTfG29yAzsVjsvE3Akkl69Lkd00KIGbRXohOI/unn1D94EExf+o/n7vlqoh+wiLlun5FRK7FUomcAxA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DEEDA4C4854;
 Sat, 19 Sep 2026 17:59:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSu-000000005Jx-3rdf;
 Sat, 19 Sep 2026 15:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:25 +0200
Message-ID: <20260919155845.5776-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 60/77] package/qt5/qt5base: Add support for
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
