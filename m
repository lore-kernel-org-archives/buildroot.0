Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768A0D5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 21:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34DFF402D6;
	Sat,  9 Nov 2024 21:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLwkZ2vKY3BY; Sat,  9 Nov 2024 21:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164AD402DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164AD402DB;
	Sat,  9 Nov 2024 21:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7933C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C90E780AC1
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWMrbPGzuTy0 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 21:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE78080A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE78080A9C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE78080A9C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:40:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 92F0619F57B;
 Sat,  9 Nov 2024 22:40:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59028])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 22:40:53 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 22:40:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <3a2ffbd005d1eed6a9a87f66d883cc19@free.fr>
References: <20240818235602.1867361-1-james.hilliard1@gmail.com>
 <f801ef73029a96970d99d8298afe78c1@free.fr>
 <CADvTj4pPXyLTmRwaN_XROg4ZRDaN-_ag7uHStzP9PH+jf8GPrg@mail.gmail.com>
 <3a2ffbd005d1eed6a9a87f66d883cc19@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <f129a03399d7147ec4a14bf98c0833d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731188454;
 bh=vhr91cqap12RgupI3IfOdqVMYMgWol45onkulV8FBhw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FdWZXuv5e5foajypUKChi0MLXxiNYKDqMp7ipaNo13rydg4AT/WPLrj+CTXEhq9kN
 +ifAGRUuxiAQf70il/NMu4iMtxlkCDY0amQIg/L9B8Qb0e6HKgqPHDz6iWihMjauby
 oF6eEiWGINMy/6Ka2I1cbg+aQ6DHNM+nDcRyALAtWY+PXqDicNfP3BNubObWQcGaIu
 JrsG7DvWltsOapaxTEmHu+tkQnn1ry8zT6Sx/gyZgFGBWGOIE1lDd7VUX/8sJrCUKX
 bCGw9RfNiCtYrai+C5gjpMCsFk0gwqI2zI4ZKqPb0rBjugBy29AQv/vkvg85oZgyl8
 CKZ1iwElfF1fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FdWZXuv5
Subject: Re: [Buildroot] [PATCH 1/1] package/uefisettings: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWdhaW4sCgpPbiAwOS8xMS8yMDI0IDIyOjIwLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBI
aSBKYW1lcywKPiAKPiBPbiAwOS8xMS8yMDI0IDIxOjUyLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToK
Pj4gT24gU2F0LCBOb3YgOSwgMjAyNCBhdCAxOjI54oCvUE0gSnVsaWVuIE9saXZhaW4gPGp1Lm9A
ZnJlZS5mcj4gd3JvdGU6Cj4+PiAKPj4+IEhpIEphbWVzLAo+Pj4gCj4+PiBXaGlsZSBydW5uaW5n
IGEgdGVzdC1wa2cgb24gdGhpcyBwYWNrYWdlLCBpdCBzZWVtcyBhbGwKPj4+IDMyLWJpdCBidWls
ZHMgYXJlIGZhaWxpbmcuIFNlZToKPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWls
ZHJvb3QvLS9waXBlbGluZXMvMTUzNDg5NzIyNQo+Pj4gCj4+PiBEb2VzIHRoaXMgcGFja2FnZSBu
ZWVkcyBhICJkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Ij8KPj4+IENhbiB5b3UgaGF2ZSBhIGxv
b2sgcGxlYXNlPwo+PiAKPj4gWWVhaCwgYmFzZWQgb24gdGhvc2UgZXJyb3JzIGl0IGxvb2tzIGxp
a2UgaXQgZG9lcywgc2hvdWxkIEkgcmVzcGluCj4+IHRoZSBwYXRjaCBvciBkbyB5b3Ugd2FudCB0
byBqdXN0IGFkZCBpdCB3aGVuIGFwcGx5aW5nPwo+IAo+IFNpbmNlIHlvdSBjb25maXJtIHRoZSAi
ZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NCIgaXMgZW5vdWdoLAo+IEknbGwganVzdCBhZGQgaXQg
bXlzZWxmLgoKSSBhcHBsaWVkIHRvIG1hc3RlciBpbjoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2FlYWQxMDJkM2YxOTgzMTRhYTMwMTlhMmMxMTk4
YWI2Y2JjMWIwNGMKClRoYW5rcyEKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
