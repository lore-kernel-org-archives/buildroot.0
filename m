Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A224CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 08:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A16561108;
	Sun, 19 Oct 2025 08:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skDmPEo27pnW; Sun, 19 Oct 2025 08:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AC83610FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC83610FE;
	Sun, 19 Oct 2025 08:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 971BC1CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 08:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88C73610FE
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 08:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCdOD2XjQHDN for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 08:41:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E29286108A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E29286108A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E29286108A
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 08:41:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1DB391A1366
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 08:40:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD255606D5;
 Sun, 19 Oct 2025 08:40:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0415C102F238D; 
 Sun, 19 Oct 2025 10:40:49 +0200 (CEST)
Mime-Version: 1.0
Date: Sun, 19 Oct 2025 10:40:49 +0200
Message-Id: <DDM5XDBZNP6B.28NJYSBQZQNJN@bootlin.com>
Cc: <buildroot@buildroot.org>, "James Hilliard" <james.hilliard1@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Julien Olivain" <ju.o@free.fr>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
 <20251017-python-scp-v1-1-b45644fa9afb@bootlin.com>
 <4ea4862e694a32ea35c425b2d39c5320@free.fr>
In-Reply-To: <4ea4862e694a32ea35c425b2d39c5320@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760863254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZUtiR8k67JnqzLC8843QyMKUIVy3broOHAymmQcbDn0=;
 b=PYnmEKiOlWvK+rooQCQZzpEg2m9xCkTJDYQYkaTXCjfcZLTV40Cp8da8SZcbLBMMAU2dBn
 JOwUTvNSpbTaE1E6AbfIbXaeBjkVeqKsZ/bbnStBoxWDQxUuaFtVW9hgR64xlRIQn+972j
 vD4lN4gIaqnYIJo10WltKhv96EnjSo+E3gT8cvtzBAyZ+3zlSn3V8SlvSwSBGy7wHjY1a3
 irtCQy/AoriE5XyrkU0XibdX3kH63kHJGo6VW03R3ifvimSGRH55tuTiPhnAcUEZ4b6x0d
 tl5/vE/bgQ/J41dugHO7rgQXW5rs9PMdMlPA5D2cCwLXLaCwYoozT2W2Iq4OjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PYnmEKiO
Subject: Re: [Buildroot] [PATCH 1/2] package/python-scp: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKT24gU2F0IE9jdCAxOCwgMjAyNSBhdCA0OjQyIFBNIENFU1QsIEp1bGll
biBPbGl2YWluIHdyb3RlOgo+IE9uIDE3LzEwLzIwMjUgMDk6NDIsIEFsZXhpcyBMb3Rob3LDqSB2
aWEgYnVpbGRyb290IHdyb3RlOgo+PiBBZGQgcHl0aG9uLXNjcCBhcyBhIG5ldyBwYWNrYWdlLiBw
eXRob24tc2NwIGFsbG93cyB0byBzZW5kIGFuZCByZWNlaXZlcwo+PiBmaWxlcyBpbiBweXRob24g
dGhyb3VnaCB0aGUgc2NwMSBwcm90b2NvbCwgb24gdG9wIG9mIHBhcmFtaWtvLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4K
Pgo+IFNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gRm9yIGluZm8sIEkgZGlk
IGZldyBtaW5vciBjaGFuZ2VzIHRvIHRoZSBydW50aW1lIHRlc3QuIFNlZToKPiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNzQ3MDU4N2NmYTlhMjRk
M2M0OWFkYzBmYjZjYzYwNTEyOTA3ZjMxYQoKQUNLLCB0aGFua3MgZm9yIHRoZSBpbXByb3ZlbWVu
dHMgIQoKQWxleGlzCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
