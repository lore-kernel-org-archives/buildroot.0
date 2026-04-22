Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF2BF94CD9
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 07:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA4F60A55;
	Wed, 22 Apr 2026 07:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYaJmjWO60gx; Wed, 22 Apr 2026 07:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6EA60729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776841219;
	bh=prxJU8+fyMF09Y1n72ByMRjH20OOXAvImD97e/f33bI=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nlzcapp+JM7eBlEJCnKBNpCHqPy1LXIm95vIzuK5uU7e5xW6g4cxuSzkqNnW2lfkz
	 tLdHbFAbLYb6147eGlTKlUfXHwOJkRAVod1L+/WWIAKM4DqWXK10JzchCr0C+ISNPQ
	 U0ZUcxuFQpxk+uoIpYwicjz3AsBut207kKzKTyqeT7T+q4v2Ed/r1nRLR74rP4gC+u
	 guWMav1QysPCzt+o/bzWPTnTQlEUUqCVgkaAuUkW/BnTuamOg6JssqsjxjM5w3paZf
	 raUdOTRz9h9NJB6wdp8I/AtZxKZWhq5H8Y8q7Tdx/Uffi0iarqcuVc7CiXMQPAazmz
	 0C47KYrkyhSEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6EA60729;
	Wed, 22 Apr 2026 07:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2F224D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3648B40224
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3ivGLG_FMpx for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 07:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5144E4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5144E4007C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5144E4007C
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:00:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 441BB1A339F;
 Wed, 22 Apr 2026 07:00:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B3A5600DD;
 Wed, 22 Apr 2026 07:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30FE910460B43; 
 Wed, 22 Apr 2026 09:00:12 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 22 Apr 2026 09:00:12 +0200
Message-Id: <DHZHN47Y9XYT.1PHQZCSLUKW7Z@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260421184831.2576691-1-bernd@kuhls.net>
In-Reply-To: <20260421184831.2576691-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1776841213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zN79tVspndX/csc90pSEz3LvBl5djPCZlxXgouVXawM=;
 b=W488CqNMm7oxeM1aEontTOmCQ1FApmHS1Oy4ZssQqMQvzJMMWv4S6d5JgK+ZxyZH55qAzE
 MWS6c5huf2iYeAW+PPdbE+Ks3qJZN/d7uvfK7EmFXRY46EQJ4RLDmFcBkcA1+oCPtfvZ31
 iIFb6iMp+/KT2zbaZW1UQxKhRfGvOt6zrrc6j9zRzg4PTYzkplwltgEdJSttkHCLylk0de
 KJbcp/iCtPaiMd58i8y72y7i+BaPLKzZxsigiZFoacLKPpXT5KxuiSNZ/8oaP61gNlH618
 P3KmfKGRUpyPYkDtRZMuE1l3nBvqtopHeYIx85dwKAI3orV2Qc6w0W+gVstxkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=W488CqNM
Subject: Re: [Buildroot] [PATCH 1/2] package/opensc: security bump version
 to 0.27.1
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

T24gVHVlIEFwciAyMSwgMjAyNiBhdCA4OjQ4IFBNIENFU1QsIEJlcm5kIEt1aGxzIHdyb3RlOgo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDL2Jsb2IvMC4yNy4xL05FV1MKPgo+IFN3
aXRjaGVkIHRvIHNoYTI1NiB0YXJiYWxsIGhhc2ggcHJvdmlkZWQgYnkgdXBzdHJlYW0uCj4KPiBS
ZW1vdmVkIHBhdGNoIHdoaWNoIGlzIGluY2x1ZGVkIGluIHRoaXMgcmVsZWFzZS4KPgo+IEZpeGVz
IHRoZSBmb2xsb3dpbmcgQ1ZFczoKPiAqIENWRS0yMDI1LTEzNzYzOiBTZXZlcmFsIHVzZXMgb2Yg
cG90ZW50aWFsbHkgdW5pbml0aWFsaXplZCBtZW1vcnkKPiAgICAgICAgICAgICAgICAgICBkZXRl
Y3RlZCBieSBmdXp6ZXJzCj4gKiBDVkUtMjAyNS00OTAxMDogUG9zc2libGUgd3JpdGUgYmV5b25k
IGJ1ZmZlciBib3VuZHMgZHVyaW5nIHByb2Nlc3NpbmcKPiAgICAgICAgICAgICAgICAgICBvZiBH
RVQgUkVTUE9OU0UgQVBEVQo+ICogQ1ZFLTIwMjUtNjYyMTU6IFBvc3NpYmxlIHdyaXRlIGJleW9u
ZCBidWZmZXIgYm91bmRzIGluIG9iZXJ0aHVyIGRyaXZlcgo+ICogQ1ZFLTIwMjUtNjYwMzg6IFBv
c3NpYmxlIHJlYWQgYmV5b25kIGJ1ZmZlciBib3VuZHMgd2hlbiBwYXJzaW5nCj4gICAgICAgICAg
ICAgICAgICAgaGlzdG9yaWNhbCBieXRlcyBpbiBQSVYgZHJpdmVyCj4gKiBDVkUtMjAyNS02NjAz
NzogUG9zc2libGUgYnVmZmVyIG92ZXJydW4gd2hpbGUgcGFyc2luZyBTUEtJCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKSSBzdXNwZWN0IHRoZSBDQyBv
biBteSBhZGRyZXNzIHRvIGJlIGEgbWlzdGFrZSwgYXMgbXkgbmFtZSBjYW4gYmUgZm91bmQKZm9y
IHRoZSBvcGVuc2NBUCBwYWNrYWdlLgoKTEdUTSB0aG91Z2ggOykKClRoYW5rcywKCkFsZXhpcwoK
LS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
