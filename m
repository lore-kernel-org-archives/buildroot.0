Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF6BC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691C080E16;
	Sun, 13 Sep 2026 07:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2Udbsz-s5z0; Sun, 13 Sep 2026 07:44:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3749D80E19
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789285460;
	b=ni6KWcBcCREMCa0qkIVvPw3ATUpVOunBbGpMORSanWnSso+KUa2oCVQNNfqhIApr2769
	 7qPU9pjwqX36O2IYuKxIU5oDkFMIqnhKc9yoOuZ/KOilBoKt2CB5j8L9yWgQEZVtVyQLW
	 GUDaONS2Vop9Ta6oEkD2JeUX6dxY5TumZ6SSc5ZxlWA9NRVOui52DfRKDHgegq57SV4wv
	 ul2CXELFPO+zgRF/f6a2HVIv687MD/56bteQDNyxn3LjnUhpnRh5DZ41JESb5RtZhb9ug
	 DjNieHN/dShHbYXlf+aAJ/5k0U4KqhhHUDXLTEDcH5366DouJi/RBTyqMAtyFOo5TPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789285460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=DqoPVUXCopi9/j/vRQNI8t4+ti5mGRuYEssUpEAs84Q=;
	b=NqWC0rjwWPfUpimZ65UDc2UPVufb85dG98H4mFEBnL6oeUoqTNuuWJ4LFc40XRLAM4FS
	 kSg5W6Vj7uOCZwooMBzlffhcq4JhNfDoiaRiE9+2sJry6qOqQFGMyYVgIVEFnSo22vd91
	 XXHtaA/Vu+5TvVQRUxjqWKJwpufLhWNcpbhr4B0XAKHNwFkHjgZD/yJmt9ZDgY/RCPPEJ
	 CQPTzT1LiE/upTROQbcI7irxnDYkx7u+Qwbq6KNOvVNH0Rp9R57V3JSapQf8u+9QHuigV
	 8cQq2zlDktMgIgTUY0vNue2Y88bRlDiQJcsl4zMBhhSuyOpUieuvU3mPuTwAuPHHs2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789285460;
	bh=DqoPVUXCopi9/j/vRQNI8t4+ti5mGRuYEssUpEAs84Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mi1qTRcDHdNHYwNynXjggDZFhtz9fTUej5D0DHPYKJPSPwPSaO++DY/JCvbaqG1oS
	 fxxoWBNZ3uLh7xdo7IYsYt50Yh7OpPeqbd0Yn3fHRf/BeUDloFEQjiIHDv45xoucjX
	 FWSiomhJN9gE9JjFysCU4oZMLKgtcXgzFtrXwA8PDs04F3lOLKqJ/zRtvNssbkHtHJ
	 44kwTbx3fPkQH7LRSjsF1B7ZIcF69xRzGNCFAjEAFBO3XC22lMYNe5XFMLtJ5BKOxP
	 KoWw69/rCjZrKuU5iOzf3kjISAj3TS1nLOzGpjdhhKIdAs1wP9h2RbD4//Fe/d7Gtn
	 qPEio1mlIls9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3749D80E19;
	Sun, 13 Sep 2026 07:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADE1A32F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E44400BA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srgThNF44AIW for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:44:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 21EEA40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789285457;
 b=GSUXdbYC68uzW6/c32f3ePvUG2JmptsFyPg7/atoa0vW5y6pzWjvzhEEMJ8E7rURsT0A
 w/w8XKM3GShOdAiWxz2wv4515831pkMpACC644Qh9sQwXLhVf2EubPgOQU772oths0aM1
 sRHTZnEUWBm7YUiTrvqd35BOoYt1NmZiH6SVD658tzd12+rnIWI5gwSMBF67js4WmvhVB
 05UVk5KzBK4Y3oBiTxpzALts/6NQ2x7SFEvVUXWKXox85oaa9eYxDsJtL8VQuQmKe7/2Y
 2Bnnyj+wJOygBuzSFeaRbQrd09+6qTNSKgy4umxYrrheJsVZBnkHMsP5NAmFXSdx9UQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789285457;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=q7EMPlLPOLIL1VhHq39+8PczXy8c672kKgrRp0bSIE8=;
 b=kXECew/D5iNOTGRbkobZWJoZptORASnhYFrIO2BE2havj/j2HX0QepoZK1uFKCE4Oh17
 ZNiV8/LAkjd0Ea7lrm65Fb9KC64HoPujMzDwtAQMz/iwqDU6dUQldlcuqDdraqUosZI52
 Ds085zFB9FQshuCuyztQE67za7Ehijl2zLvFYyc1Lqmq6aBcHQOpPHQ+geyGUNiF2Vd8E
 vlrDvkSaTWroIq0foEutpY496/E1CvYpWf8MuiXyIghOs1hx9VOz2xU1VizHPWcj1rCro
 PdzJj5p3Bb5f4U6MKCKo7S6WnAYN/ODeKoez1FJl6XJ4l+HbNF+KXqfli+4ITequ/Xg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=APL0Oe80; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21EEA40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:44:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A9E88B0054C;
 Sun, 13 Sep 2026 09:44:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 09:44:12 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 09:44:12 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20260911063053.795160-1-thomas.petazzoni@bootlin.com>
References: <20260911063053.795160-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <fd67340cdca90c98ec9833f851530b6b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/openscap: propagate dependencies of
 libxmlsec1 after bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvMDkvMjAyNiAwODozMCwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IEluIGNvbW1pdAo+IGZlZjljYWQxZmU4NGI0MzY2ZTcwNWFkYjAzNDcwZTEyMTk5ZmZkMjUg
KCJwYWNrYWdlL2xpYnhtbHNlYzE6IGJ1bXAKPiB2ZXJzaW9uIHRvIDEuMy4xMiIpLCBsaWJ4bWxz
ZWMxIHdhcyBidW1wZWQsIGFuZCBhbG9uZ3NpZGUgc29tZQo+IGFkZGl0aW9uYWwgImRlcGVuZHMg
b24iIHdlcmUgYWRkZWQuCj4gCj4gSG93ZXZlciwgdGhlc2UgbmV3ICJkZXBlbmRzIG9uIiB3ZXJl
IG5vdCBwcm9wYWdhdGUgdG8gcmV2ZXJzZQo+IGRlcGVuZGVuY2llcyBvZiBsaWJ4bWxzZWMxLCBp
LmUuIG9wZW5zY2FwLCBjYXVzaW5nIEtjb25maWcgd2FybmluZ3M6Cj4gCj4gV0FSTklORzogdW5t
ZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgQlIyX1BBQ0tBR0VfTElCWE1MU0VD
MQo+ICAgRGVwZW5kcyBvbiBbbl06IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgWz1uXSAm
JiAKPiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+
ICAgLSBCUjJfUEFDS0FHRV9PUEVOU0NBUCBbPXldICYmIEJSMl9QQUNLQUdFX0xJQkdQR19FUlJP
Ul9BUkNIX1NVUFBPUlRTIAo+IFs9eV0gJiYgIUJSMl9TVEFUSUNfTElCUyBbPW5dICYmIEJSMl9U
T09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCBbPXldCj4gCj4gYW5kIHBvdGVudGlhbGx5IHNvbWUg
YnVpbGQgaXNzdWVzLCBldmVuIHRob3VnaCB3ZSBkaWRuJ3QgY2hlY2sgaW4gdGhlCj4gYXV0b2J1
aWxkZXJzIGZvciBwb3RlbnRpYWwgZmFpbHVyZXMuCj4gCj4gVGhpcyBjb21taXQgZml4ZXMgdGhh
dCBieSBwcm9wZXJseSBwcm9wYWdhdGluZyB0aGUgbmV3IGRlcGVuZGVuY2llcy4KPiAKPiBDYzog
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiBDYzogSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
