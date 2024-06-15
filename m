Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C1C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B46C60645;
	Sat, 15 Jun 2024 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX5XXThirjWM; Sat, 15 Jun 2024 18:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AEB607D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60AEB607D2;
	Sat, 15 Jun 2024 18:56:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCC681BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA566607D2
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxWEdN2t4LkI for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EF4860645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF4860645
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EF4860645
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:56:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 328BC13F8B9;
 Sat, 15 Jun 2024 20:56:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 20:56:32 +0200
Date: Sat, 15 Jun 2024 20:56:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <Zm3j4K29xEOVDdEo@landeda>
References: <20240612-ppd-merge-b4-v2-1-81044690d046@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612-ppd-merge-b4-v2-1-81044690d046@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718477797;
 bh=xALTAAIXDB06u4+AV0gxKOU2obMGWDqnlZXExvOBQ+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkW0ur6IIHdzuGG7kkkDlOZammTKyPntywyYsIzGM85w+iWGXu/BqplaCOeTOSOa5
 fYyAkvyJHdltENjlXoyj4Pip3xp8wQzXU0DQe1cYK46RnexOLbjEJQHkChJFbW9yls
 JjogbUDPXQl9Dkm/U8ZUw6xpJY0fKS+cLZw2ZoyRqojG+1/iR6QRGS8En+KcOqBZVb
 9B9tNneIXGoBSPpwZOZa8m+1HpNrXYDTBbkqbpta6kkj5A2fWeriZ+x8C/nhKANaPr
 DpLY71lsXtZR6gputVO5+KPdcOxp3J3hG/V8TdR7rn/RFLEtIyXys64YEHIo+yGTkZ
 YSz7VZyNmWBRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dkW0ur6I
Subject: Re: [Buildroot] [PATCH RESEND v2] ppd-merge: speed up
 per-package-rsync
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnJhbmRvbiwgQWxsLAoKT24gMjAyNC0wNi0xMiAxODoyMiArMDAwMCwgQnJhbmRvbiBNYWllciB2
aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBGcm9tOiBCcmFuZG9uIE1haWVyIHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgo+IAo+IFRoZSBwZXItcGFja2FnZS1yc3lu
YyBzdGFnZSBjYW4gYWRkIGEgc2lnbmlmaWNhbnQgYW1vdW50IG9mIHRpbWUgdG8KPiBidWlsZHMu
IFRoZXkgY2FuIGFsc28gYmUgYW5ub3lpbmcgYXMgdGhlIHRhcmdldC1maW5hbGl6ZSBhbmQKPiBo
b3N0LWZpbmFsaXplIHRhcmdldHMgYXJlIHRoZSBzbG93ZXN0IGFuZCBydW4gb24gZXZlcnkgYG1h
a2UgYWxsYCwgd2hpY2gKPiBpcyB1c2VkIGZyZXF1ZW50bHkgZm9yIHBhcnRpYWwgcmVidWlsZHMu
Cj4gCj4gVGhlIHBlci1wYWNrYWdlLXJzeW5jIGlzIHNsb3cgYmVjYXVzZSBpdCBsYXVuY2hlcyBh
IG5ldyByc3luYyBmb3IgZWFjaAo+IHNvdXJjZSB0cmVlLCBhbmQgZWFjaCByc3luYyBtdXN0IHJl
c2NhbiB0aGUgZGVzdGluYXRpb24gZGlyZWN0b3J5IGFuZAo+IHBvdGVudGlhbGx5IG92ZXJ3cml0
ZSBmaWxlcyBtdWx0aXBsZSB0aW1lcy4gV2UgY2FuIGluc3RlYWQgbWVyZ2UgYWxsIHRoZQo+IHJz
eW5jIGNhbGxzIGRvd24gaW50byBvbmUgY2FsbCwgYW5kIHJzeW5jIGlzIHNtYXJ0ZXIgYWJvdXQg
c2Nhbm5pbmcgYWxsCj4gdGhlIHNvdXJjZSBkaXJlY3RvcmllcyBhbmQgb25seSBjb3B5aW5nIG92
ZXIgdGhlIGZpbGVzIGl0IG5lZWRzIHRvLgo+IAo+IFdlIGZlZWQgdGhlIHNvdXJjZSB0cmVlcyB0
byByc3luYyBpbiByZXZlcnNlLW9yZGVyLCBhcyB0aGlzIHByZXNlcnZlcwo+IHRoZSBvcmlnaW5h
bCBiZWhhdmlvdXIuIEkuZS4gd2hlbiB1c2luZyBtdWx0aXBsZSByc3luY3MsIHRoZSBsYXN0IHNv
dXJjZQo+IHRyZWUgd291bGQgb3ZlcndyaXRlIGFueXRoaW5nIGluIHRoZSBkZXN0aW5hdGlvbi4g
Tm93IHdoZW4gdXNpbmcgYQo+IHNpbmdsZSByc3luYywgd2UgcHV0IHRoZSBsYXN0IHRyZWUgZmly
c3QgYXMgcnN5bmMgd2lsbCBzZWxlY3QgdGhlIGZpcnN0Cj4gZmlsZSBpdCBmaW5kcy4KPiAKPiBU
aGlzIG9ubHkgc3VwcG9ydHMgdGhlICdjb3B5JyBtb2RlLCB3aGljaCBpcyB1c2VkIGluIHRoZSBm
aW5hbGl6ZSBzdGVwLgo+IFRoZSAnaGFyZGxpbmsnIG1vZGUgcmVxdWlyZXMgc3BlY2lmeWluZyBl
YWNoIHNvdXJjZSB0cmVlIHdpdGggdGhlCj4gLS1saW5rLWRlc3QgZmxhZyBidXQgZW5mb3JjZXMg
YSBtYXhpbXVtIG9mIDIwIHRyZWVzLgoKQXMgbXkgQHdvcmsgYWx0ZXItZWdvIG5vdGljZWQsIHRo
YXQgbGFzdCBzZW50ZW5jZSB3YXMgYW1iaWd1b3VzLCBzbyBJCnJlcGhyYXNlZCBpdC4KCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBCZWxvdyBp
cyBhIGJlbmNobWFyayBydW5uaW5nIHRoZSBob3N0LWZpbmFsaXplIHRhcmdldCBmb3IgYSBidWls
ZCB3aXRoCj4gMjAwIHBhY2thZ2VzLgo+IAo+IEJlbmNobWFyayAxOiBiZWZvcmUgY29weQo+ICAg
VGltZSAobWVhbiDCsSDPgyk6ICAgICAyNy4xNzEgcyDCsSAgMC43NzcgcyAgICBbVXNlcjogNi4x
NzAgcywgU3lzdGVtOiAxNC44MzAgc10KPiAgIFJhbmdlIChtaW4g4oCmIG1heCk6ICAgMjYuMzQz
IHMg4oCmIDI4LjU2NiBzICAgIDEwIHJ1bnMKPiAKPiBCZW5jaG1hcmsgMjogYWZ0ZXIgY29weQo+
ICAgVGltZSAobWVhbiDCsSDPgyk6ICAgICAgNi4yOTYgcyDCsSAgMC4xOTYgcyAgICBbVXNlcjog
Mi44NzQgcywgU3lzdGVtOiA1LjYwMCBzXQo+ICAgUmFuZ2UgKG1pbiDigKYgbWF4KTogICAgNi4w
OTQgcyDigKYgIDYuNzA5IHMgICAgMTAgcnVucwo+IAo+IFN1bW1hcnkKPiAgIGFmdGVyIGNvcHkg
cmFuCj4gICAgIDQuMzIgwrEgMC4xOCB0aW1lcyBmYXN0ZXIgdGhhbiBiZWZvcmUgY29weQo+IAo+
IENjOiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiBDYzogWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEhlcnZlIENvZGlu
YSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJyYW5kb24gTWFp
ZXIgPGJyYW5kb24ubWFpZXJAY29sbGlucy5jb20+Cj4gLS0tCj4gdjE6IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzExMjcyMjQxMzkuMzU5
NjktMS1icmFuZG9uLm1haWVyQGNvbGxpbnMuY29tLwo+IAo+IHYyOgo+IC0gU2ltcGxpZnkgbG9n
aWMgZm9yICdjb3B5JyBtb2RlCj4gLSBEcm9wIHN1cHBvcnQgZm9yICdoYXJkbGluaycgbW9kZQo+
IC0tLQo+ICBwYWNrYWdlL3BrZy11dGlscy5tayB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+IGlu
ZGV4IGQxOTY0Mjk5YWYuLjNhYjllOWZlNTIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctdXRp
bHMubWsKPiArKysgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+IEBAIC0yMjEsMTggKzIyMSwxMiBA
QCBpZmVxICgkKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUykseSkKPiAgIyAkNDogbGl0ZXJh
bCAiY29weSIgb3IgImhhcmRsaW5rIiB0byBjb3B5IG9yIGhhcmRsaW5rIGZpbGVzIGZyb20gc3Jj
IHRvIGRlc3QKPiAgZGVmaW5lIHBlci1wYWNrYWdlLXJzeW5jCj4gIAlta2RpciAtcCAkKDMpCj4g
LQkkKGZvcmVhY2ggcGtnLCQoMSksXAo+IC0JCXJzeW5jIC1hIFwKPiAtCQkJLS1oYXJkLWxpbmtz
IFwKPiAtCQkJJChpZiAkKGZpbHRlciBoYXJkbGluaywkKDQpKSwgXAo+IC0JCQkJLS1saW5rLWRl
c3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLywgXAo+IC0JCQkJJChpZiAkKGZpbHRl
ciBjb3B5LCQoNCkpLCBcCj4gLQkJCQkJJChlbXB0eSksIFwKPiAtCQkJCQkkKGVycm9yIHBlci1w
YWNrYWdlLXJzeW5jIGNhbiBvbmx5ICJjb3B5IiBvciAiaGFyZGxpbmsiLCBub3QgIiQoNCkiKSBc
Cj4gLQkJCQkpIFwKPiAtCQkJKSBcCj4gLQkJCSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgy
KS8gXAo+IC0JCQkkKDMpJChzZXApKQo+ICsJJChpZiAkKGZpbHRlciBoYXJkbGluaywkKDQpKSwg
XAo+ICsJCSQoZm9yZWFjaCBwa2csJCgxKSxcCj4gKwkJCXJzeW5jIC1hIC0taGFyZC1saW5rcyAt
LWxpbmstZGVzdD0kKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoMikvIFwKPiArCQkJCSQoUEVS
X1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gJCgzKSQoc2VwKSksIFwKPiArCQlwcmludGYgIiVz
LyQoMikvXG4iICQoMSkgfCB0YWMgXAo+ICsJCQl8IHJzeW5jIC1hIC0taGFyZC1saW5rcyAtLWZp
bGVzLWZyb209LSAtLW5vLVIgLXIgJChQRVJfUEFDS0FHRV9ESVIpICQoMykpCj4gIGVuZGVmCj4g
IAo+ICAjIHByZXBhcmVzIHRoZSBwZXItcGFja2FnZSBIT1NUX0RJUiBhbmQgVEFSR0VUX0RJUiBv
ZiB0aGUgY3VycmVudAo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiAxMmIyODYwZDc1NjJkNWNmMWI3
NDkyYjU4ZjRmMTBmMDQwNTQ0NGM0Cj4gY2hhbmdlLWlkOiAyMDI0MDYxMi1wcGQtbWVyZ2UtYjQt
OGM2MjNiYTdhYjkwCj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tIAo+IEJyYW5kb24gTWFpZXIgPGJy
YW5kb24ubWFpZXJAY29sbGlucy5jb20+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
