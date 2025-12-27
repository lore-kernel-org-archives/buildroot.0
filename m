Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10608E9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11A2405D5;
	Sat, 27 Dec 2025 22:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pur01cBAvZk; Sat, 27 Dec 2025 22:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939AC40402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766873120;
	bh=C8Jxb12D18WoQUzm0GIyMBOhICkYuP3cNzbeKMilogc=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nWaH8vcnQAmbYiXnWKh8xpK5So0gMG5TkjjTjwJPo7FyA8/eo1Zu6LVRUry4LpPXT
	 tiwctg7AaQHmL7azyD7FNPh6+unOhUPo9z19ux43saSNl35w+SFbUen/0GfBJRpQWz
	 un+zNDeV9i6tF3kawb5Fv3PT/4aDfPiEj506QXn+O/0CQ0IE9+epNHrSVaV7YWHBla
	 GdkPpAgl6AcFipg0MHf6b3/oLJnoPBl0XQrUcSd+m58/duTnq0i14ZB5dx/DLZQE7T
	 /5pASSub4UKzUTMEF+EbxLdgtbgf63Nddt3hCN1Cr9QHjZILYjl1Vv0aFxBb6uD4qM
	 F/7PCmIog2/Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939AC40402;
	Sat, 27 Dec 2025 22:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23621B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14CA880D6C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yl-m7m6wiR8R for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:05:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28C4280C6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28C4280C6C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28C4280C6C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:05:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C3E401A24A1;
 Sat, 27 Dec 2025 22:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8386E60725;
 Sat, 27 Dec 2025 22:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 910C0119782B9; Sat, 27 Dec 2025 23:05:11 +0100 (CET)
Date: Sat, 27 Dec 2025 23:05:10 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20251227230510.2c64db79@windsurf>
In-Reply-To: <20251220173412.433583-2-francois.perrad@gadz.org>
References: <20251220173412.433583-1-francois.perrad@gadz.org>
 <20251220173412.433583-2-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766873113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OUQTYOgI++P95fBSfdvDNojSpInGJ0ZTeJ0aeurOWfs=;
 b=ueExlK7ZsdekvH1ongsuSiqxou8jZGCLjhINj7TEnRnWV+31HOGUiq3ZD41A66TEVMR2Hs
 abpTI2MMQW0FtqUCtTMvsJ7EHjoli2WqgoTD8go6QnQdGFnJSpn2LSCbkI/EN1BIgwHWE4
 VWNsBIxp0Fr2gNZQfta2aI72fBnFfrOdTXwhio0ApSPezlMd8z9f/12YyhTmeYgqwUfkil
 rjYeLV/VHscwtL12TcH+JHVaYbzUjW8W3SLCTh5vF8oymWGEfm4KphqrHEzVHnVkPEY6nS
 F9A6u4ERQYJ0jgwlGGmfwX7LaX0tM4CHStwxzWiQYYt/FDl1ePJxkbkXNYYiSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ueExlK7Z
Subject: Re: [Buildroot] [PATCH 2/4] package/jmp: new host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gU2F0LCAyMCBEZWMgMjAyNSAxODozNDoxMCArMDEwMApGcmFu
Y29pcyBQZXJyYWQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3Rl
OgoKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6
Lm9yZz4KCkl0IGlzIGFsd2F5cyBuaWNlIHRvIG5vdCBoYXZlIGFuIGVtcHR5IGNvbW1pdCBsb2cg
d2hlbiBhZGRpbmcgbmV3CnBhY2thZ2VzLCBlc3BlY2lhbGx5IHdoZW4gd2hhdCB0aGV5IGFyZSB1
c2VmdWwgZm9yIGlzIG5vdCBzdXBlciBjbGVhci4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvanBt
LzAwMDEtZml4LWxpbmtlci1jb21tYW5kLXdpdGgtQlItdG9vbGNoYWluLXdyYXBwZXIucGF0Y2gg
Yi9wYWNrYWdlL2pwbS8wMDAxLWZpeC1saW5rZXItY29tbWFuZC13aXRoLUJSLXRvb2xjaGFpbi13
cmFwcGVyLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAuLjQ1
NjlhNDY5ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2pwbS8wMDAxLWZpeC1saW5r
ZXItY29tbWFuZC13aXRoLUJSLXRvb2xjaGFpbi13cmFwcGVyLnBhdGNoCj4gQEAgLTAsMCArMSwy
NyBAQAo+ICtGcm9tIDMzOTgyYmJmNzM5YTNhNGViNzBjZjE4YTA1NzVkNTEwNjMyNDg3M2EgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMu
cGVycmFkQGdhZHoub3JnPgo+ICtEYXRlOiBNb24sIDIwIE9jdCAyMDI1IDE0OjU3OjI1ICswMjAw
Cj4gK1N1YmplY3Q6IFtQQVRDSF0gZml4IGxpbmtlciBjb21tYW5kIHdpdGggQlIgdG9vbGNoYWlu
LXdyYXBwZXIKPiArCj4gK1Vwc3RyZWFtOiBOL0Egc3BlY2lmaWMgZm9yIEJ1aWxkcm9vdCBidWls
ZAo+ICtTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6
Lm9yZz4KPiArLS0tCj4gKyBqcG0vY2MuamFuZXQgfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9qcG0vY2Mu
amFuZXQgYi9qcG0vY2MuamFuZXQKPiAraW5kZXggYzVhYmRhYy4uNGViYjI1YyAxMDA2NDQKPiAr
LS0tIGEvanBtL2NjLmphbmV0Cj4gKysrKyBiL2pwbS9jYy5qYW5ldAo+ICtAQCAtMTEwLDcgKzEx
MCw3IEBACj4gKyAgICAgICAgIChpZiAoZHluIDppcy1tc3ZjKQo+ICsgICAgICAgICAgIChjbGV4
ZS1zaGVsbCBsaW5rZXIgO2xkZmxhZ3MgKHN0cmluZyAiL09VVDoiIHRhcmdldCkgO29iamVjdHMK
PiArICAgICAgICAgICAgICAgICAgKHN0cmluZyAoZHluOmhlYWRlcnBhdGgpICIvamFuZXQubGli
IikgO2RlcC1pbXBvcnRsaWJzIDtsZmxhZ3MpCj4gKy0gICAgICAgICAgKHNoZWxsIGxpbmtlciA7
Y2ZsYWdzIDtsZGZsYWdzIGAtb2AgdGFyZ2V0IDtvYmplY3RzIDtsZmxhZ3MpKSkpCj4gKysgICAg
ICAgICAgKHNoZWxsIGxpbmtlciA7bGZsYWdzIGAtb2AgdGFyZ2V0IDtvYmplY3RzKSkpKQoKV2hh
dCBpcyB0aGUgYWN0dWFsIHByb2JsZW0gYmVpbmcgZml4ZWQgaGVyZT8gSGF2aW5nIHNvbWV0aGlu
ZyBub3QKdXBzdHJlYW1hYmxlIGlzIGNsZWFybHkgbm90IG5pY2UgZm9yIGEgYnJhbmQgbmV3IHBh
Y2thZ2UuCgoKPiArZGVmaW5lIEhPU1RfSlBNX0lOU1RBTExfQ01EUwo+ICsJKGNkICQoQEQpOyBc
Cj4gKwkJREVTVERJUj0kKEhPU1RfRElSKSBcCj4gKwkJUFJFRklYPS91c3IgXAoKWW91IHNob3Vs
ZCB1c2U6CgoJCVBSRUZJWD0kKEhPU1RfRElSKQoKPiArCQlKQU5FVF9CSU5QQVRIPS91c3IvYmlu
IFwKPiArCQlKQU5FVF9NT0RQQVRIPS91c3IvbGliL2phbmV0IFwKPiArCQlKQU5FVF9NQU5QQVRI
PS91c3Ivc2hhcmUvbWFuL21hbjEgXAo+ICsJCSQoSE9TVF9ESVIpL2Jpbi9qYW5ldCBib290c3Ry
YXAuamFuZXQpOwo+ICsJJChTRUQpICdzfC91c3IvfCQoSE9TVF9ESVIpL3Vzci98JyAkKEhPU1Rf
RElSKS91c3IvYmluL2pwbQoKQW5kIGhvcGVmdWxseSB0aGlzIHdpbGwgYWxsb3cgdG8gYXZvaWQg
dGhpcyAkKFNFRCkgPwoKTm90ZSB0aGF0ICQoSE9TVF9ESVIpL3VzciBzaG91bGQgbm8gbG9uZ2Vy
IGJlIHVzZWQuIFVzZSAkKEhPU1RfRElSKQpkaXJlY3RseS4KClRoYW5rcyBhIGxvdCEKClRob21h
cwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
