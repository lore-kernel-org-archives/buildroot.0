Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E1D3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C47740C6E;
	Wed, 28 Jan 2026 17:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AIeM4tcAwYw; Wed, 28 Jan 2026 17:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D391409AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621087;
	bh=VebC0xZq/g5Pm+dX6eOyIVgcTz9AiQeyrNg4mV/Wmb8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L6nhqT0BMmev1ZHJDa59qvweLAUqJ6W+tMdwHe5jzmKb2N9+2cAjbdQ0kxozzKlAh
	 kArCl8rBnsLnWQzC9qyhA2nH4cVNyLA4i9T/kCtw9RTfsQSTjJD/DITKGbtkgd6Dru
	 yi9YNCqFAdhijggSFyFgOwNwhillkYawdjXHIoUmPRlwT4JrqTmDoWrmkkGOoUX1+Y
	 Xr49YpG38frDdFcqnBbZ6SFAxkrwDQavEksz/egahxOCg0CcPk8xlNWNdjHJ6v6ZxF
	 bo3bC6BSPuixIvZUP4UF0mTYcUwNmMioHXzufjMJEpW3//n2yLL0lP4KKEztsPDBJG
	 FA7hspUNvdm+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D391409AD;
	Wed, 28 Jan 2026 17:24:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 711463B8
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5243D40C2F
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFqTHZSusvTv for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25A3C409B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A3C409B1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25A3C409B1
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3AF31B97AC12; Wed, 28 Jan 2026 18:24:28 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:27 +0100
Message-ID: <20260128172427.343060-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106200115.1985522-2-bernd@kuhls.net>
References: <20260106200115.1985522-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qectPxlAqZtjcZjHSl5MmQLUmouFCw2sjZyAIMo3oXo=;
 b=AoIS2tOLdz41uLQK4Yzeq6txdm1UUINFFR1M7hhVVB+U0w4xRIcXZbC0ust3s3qr5Kiq0t
 5YePDvpW6gISNYBv8PKT4ArElFDc8lXdOcOkK0Eztx7+DDpB5pJVR3/t8Ub8Rnza9MPe0y
 qxkH2bKfev+T4TEOquDxpIIbfsYdkXW0m1mzr4Ffw3ZSuydXGfNNUtuk1itbfV321nC+vi
 0kRVum8Kgq8w69xiOafO+Tf4zrOOLBPVBhsOg9Htkl65XlOt+xQDNN1V2G+h9beMGqASjj
 fm3FGCH6vyjZ7IQODj52jGRHMS0Z3S5s8MoDykHxhUZ9LlG+b3ukc5xVdx5aUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AoIS2tOL
Subject: Re: [Buildroot] [PATCH v2 1/9] package/libsvg-cairo: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBwYWNrYWdlIGlzIG5vIGxvbmdlciBtYWludGFpbmVkLCBubyBy
ZWxlYXNlIHNpbmNlIDIwMDUsIGFuZCBpdHMKPiBkZXBlbmRlbmN5IGxpYnN2ZyBoYXMgYnVpbGQg
aXNzdWVzIGFzIGl0IHVzZXMgdG9vIG9sZCBYTUwgQVBJczoKPiAKPiAvaG9tZS90aG9tYXMvcHJv
amV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluLy4uL2FhcmNoNjQtYnVpbGRyb290LWxpbnV4
LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2xpYnhtbDIvbGlieG1sL1NBWC5oOjE4OjQ6IHdhcm5p
bmc6ICN3YXJuaW5nICJsaWJ4bWwvU0FYLmggaXMgZGVwcmVjYXRlZCIgWy1XY3BwXQo+ICAgIDE4
IHwgICAjd2FybmluZyAibGlieG1sL1NBWC5oIGlzIGRlcHJlY2F0ZWQiCj4gICAgICAgfCAgICBe
fn5+fn5+Cj4gCj4gc3ZnaW50Lmg6NDI6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd4bWxQ
YXJzZXJDdHh0UHRyJwo+ICAgIDQyIHwgdHlwZWRlZiB4bWxQYXJzZXJDdHh0UHRyIHN2Z194bWxf
cGFyc2VyX2NvbnRleHRfdDsKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCkFw
cGxpZWQgdG8gMjAyNS4wMi54IGFuZCAyMDI1LjExLnguIFRoYW5rcwoKPiAtLS0KPiAgQ29uZmln
LmluLmxlZ2FjeSAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwo+ICBERVZFTE9Q
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgcGFja2FnZS9Db25maWcu
aW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIHBhY2thZ2UvbGlic3ZnLWNhaXJvL0Nv
bmZpZy5pbiAgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9saWJzdmctY2Fpcm8v
bGlic3ZnLWNhaXJvLmhhc2ggfCAgNiAtLS0tLS0KPiAgcGFja2FnZS9saWJzdmctY2Fpcm8vbGli
c3ZnLWNhaXJvLm1rICAgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCj4gIDYgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbGlic3ZnLWNhaXJvL0NvbmZpZy5pbgo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5tawo+IAo+IGRpZmYgLS1naXQgYS9Db25m
aWcuaW4ubGVnYWN5IGIvQ29uZmlnLmluLmxlZ2FjeQo+IGluZGV4IGNlN2E0NzU4MzguLjAxMDIw
M2M2OWQgMTAwNjQ0Cj4gLS0tIGEvQ29uZmlnLmluLmxlZ2FjeQo+ICsrKyBiL0NvbmZpZy5pbi5s
ZWdhY3kKPiBAQCAtMTQ2LDYgKzE0NiwxNCBAQCBlbmRpZgo+ICAKPiAgY29tbWVudCAiTGVnYWN5
IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDI2LjAyIgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QlNWR19DQUlSTwo+ICsJYm9vbCAibGlic3ZnLWNhaXJvIHBhY2thZ2UgcmVtb3ZlZCIKPiArCXNl
bGVjdCBCUjJfTEVHQUNZCj4gKwloZWxwCj4gKwkgIFRoZSBsaWJzdmctY2Fpcm8gcGFja2FnZSBo
YXMgYmVlbiByZW1vdmVkLiBJdHMgbGF0ZXN0Cj4gKwkgIHVwc3RyZWFtIHJlbGVhc2Ugd2FzIGZy
b20gMjAwNSwgYW5kIGl0IHdhc24ndCB1c2VkIGJ5IGFueQo+ICsJICBvdGhlciBCdWlsZHJvb3Qg
cGFja2FnZS4KPiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0pTTUlOCj4gIAlib29sICJo
b3N0LWpzbWluIGhhcyBiZWVuIHJlbW92ZWQiCj4gIAlzZWxlY3QgQlIyX0xFR0FDWQo+IGRpZmYg
LS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGY5ODJlMzEyM2EuLmRkYWQz
N2MyYzYgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAt
NTkyLDcgKzU5Miw2IEBAIEY6CXBhY2thZ2Uvc3VueGktYm9hcmRzLwo+ICBOOglDYXJzdGVuIFNj
aG9lbmVydCA8Yy5zY2hvZW5lcnRAZ21haWwuY29tPgo+ICBGOglwYWNrYWdlL2xpYmR2YnNpLwo+
ICBGOglwYWNrYWdlL2xpYnN2Zy8KPiAtRjoJcGFja2FnZS9saWJzdmctY2Fpcm8vCj4gIAo+ICBO
OglDw6lkcmljIENow6lwaWVkIDxjZWRyaWMuY2hlcGllZEBnbWFpbC5jb20+Cj4gIEY6CXBhY2th
Z2Uvem5jLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmln
LmluCj4gaW5kZXggMzUyZmQ2MjZlMC4uOWQxMWM5MzI1MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTE3NzMsNyArMTc3Myw2
IEBAIG1lbnUgIkdyYXBoaWNzIgo+ICAJc291cmNlICJwYWNrYWdlL2xpYnJhdy9Db25maWcuaW4i
Cj4gIAlzb3VyY2UgInBhY2thZ2UvbGlicnN2Zy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2th
Z2UvbGlic3ZnL0NvbmZpZy5pbiIKPiAtCXNvdXJjZSAicGFja2FnZS9saWJzdmctY2Fpcm8vQ29u
ZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2xpYnZhL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAi
cGFja2FnZS9saWJ2YS1pbnRlbC1kcml2ZXIvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L2xpYnZkcGF1L0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzdmctY2Fpcm8v
Q29uZmlnLmluIGIvcGFja2FnZS9saWJzdmctY2Fpcm8vQ29uZmlnLmluCj4gZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggNDYwMmU5M2MyYS4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2th
Z2UvbGlic3ZnLWNhaXJvL0NvbmZpZy5pbgo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwxMSArMCww
IEBACj4gLWNvbmZpZyBCUjJfUEFDS0FHRV9MSUJTVkdfQ0FJUk8KPiAtCWJvb2wgImxpYnN2Zy1j
YWlybyIKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9DQUlSTwo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdF
X0NBSVJPX1BORwo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlNWRwo+IC0JaGVscAo+IC0JICBM
aWJzdmctY2Fpcm8gcHJvdmlkZXMgdGhlIGFiaWxpdHkgdG8gcmVuZGVyIFNWRyBjb250ZW50IGZy
b20KPiAtCSAgZmlsZXMgb3IgYnVmZmVycy4gQWxsIHJlbmRlcmluZyBpcyBwZXJmb3JtZWQgdXNp
bmcgdGhlIGNhaXJvCj4gLQkgIHJlbmRlcmluZyBsaWJyYXJ5Lgo+IC0KPiAtCSAgaHR0cDovL2Nh
aXJvZ3JhcGhpY3Mub3JnCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2
Zy1jYWlyby5oYXNoIGIvcGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2gKPiBk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCBkOWNmYmZmYTdhLi4wMDAwMDAwMDAwCj4g
LS0tIGEvcGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2gKPiArKysgL2Rldi9u
dWxsCj4gQEAgLTEsNiArMCwwIEBACj4gLSMgRnJvbSBodHRwOi8vY2Fpcm9ncmFwaGljcy5vcmcv
c25hcHNob3RzL2xpYnN2Zy1jYWlyby0wLjEuNi50YXIuZ3oubWQ1Cj4gLW1kNSAgZDc5ZGE3YjNh
NjBhZDhjOGU0YjkwMmM5YjM1NjMwNDcgIGxpYnN2Zy1jYWlyby0wLjEuNi50YXIuZ3oKPiAtCj4g
LSMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgYTM4MGJlNmE3OGVjMjkzODEwMGNlOTA0
MzYzODE1YTk0MDY4ZmNhMzcyYzY2NmI4Y2M4MmFhODcxMWEwMjE1YyAgbGlic3ZnLWNhaXJvLTAu
MS42LnRhci5nego+IC1zaGEyNTYgIGQ4MGM5ZDA4NGViZmI1MGVhMWVkOTFiZmJjMjQxMGQ2Y2U1
NDIwOTdhMzJjNDNiMDA3ODFiODNhZGNiOGM3N2YgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLm1rIGIvcGFja2FnZS9saWJzdmctY2Fpcm8v
bGlic3ZnLWNhaXJvLm1rCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggZjdhMTA1
ZTAzZS4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWly
by5tawo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwxNiArMCwwIEBACj4gLSMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gLSMKPiAtIyBsaWJzdmctY2Fpcm8KPiAtIwo+IC0jIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+IC0KPiAtTElCU1ZHX0NBSVJPX1ZFUlNJT04gPSAwLjEuNgo+IC1MSUJTVkdfQ0FJ
Uk9fU0lURSA9IGh0dHA6Ly9jYWlyb2dyYXBoaWNzLm9yZy9zbmFwc2hvdHMKPiAtTElCU1ZHX0NB
SVJPX0RFUEVOREVOQ0lFUyA9IGNhaXJvIGxpYnN2Zwo+IC1MSUJTVkdfQ0FJUk9fSU5TVEFMTF9T
VEFHSU5HID0gWUVTCj4gLUxJQlNWR19DQUlST19MSUNFTlNFID0gTEdQTC0yLjErCj4gLUxJQlNW
R19DQUlST19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+IC0KPiAtTElCU1ZHX0NBSVJPX0NPTkZf
T1BUUyA9IC0td2l0aG91dC14Cj4gLQo+IC0kKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCj4g
LS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
