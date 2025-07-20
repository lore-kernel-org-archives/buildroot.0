Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE64AC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 10:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A67340F04;
	Sun, 20 Jul 2025 10:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDnAGFW4vhNT; Sun, 20 Jul 2025 10:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7293D40F73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7293D40F73;
	Sun, 20 Jul 2025 10:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF241117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95ECB60B6E
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uTqXrsV57uU for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 10:35:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3504C60EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3504C60EE8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3504C60EE8
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:35:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EF71B13F89A;
 Sun, 20 Jul 2025 12:35:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 12:35:41 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 12:35:41 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250620221850.2465031-1-fiona.klute@gmx.de>
References: <20250620221850.2465031-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <904a074fed22fe7a018a79ad34329c91@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753007744;
 bh=560Oq6h9A+B5jV2F62afRFtHcCdQmnfw2VpoqAe03R0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tVCgHrMBFCvBba5WhrXHMqpg2HuLRiMSyVXzNy+i4JxsuLLDC3Wl+2fbW9sPRwbOq
 VVyMUYxmcoHKeQZA3QZoZ18QFWTaq/YvltaZY00D3GmyVFqk+EyLzhzfTbZKxEgR86
 CywtaJV5EPWTJtOPv7aqLt06hgPeUQHkCE4by7VINMdpg+6iMqkY6J6JE1sWWIy04r
 JEk04wrZazhgLa0FS18Gfr1LCXBF5VDTZ3tbGCbAylvx5Q7bvrzrBUBJAA9SPUUtj3
 bsOIBRma8DGLCY2JjmE5so7isVlMO6E6ZLYlAkTsK/GtsM0ODBrZ3bMyNvHMw7jfqL
 Kol2Br5/MfT1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tVCgHrMB
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with musl
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

SGkgRmlvbmEsCgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKCk9uIDIxLzA2LzIwMjUgMDA6MTgsIEZp
b25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gbGliL2xvbmctb3B0aW9ucy5jIGZhaWxl
ZCB0byBjb21waWxlIHdpdGggbXVzbCBmb3IgdGhlIHNhbWUgcmVhc29uCj4gMDAwMi1saWItbG9u
Zy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5wYXRjaCB3YXMgYWRkZWQgdG8gZml4LAo+IGV4
aXQoKSBiZWluZyB1bmRlZmluZWQuIFRoZSBmaXggaXMgdGhlIHNhbWUgYXMgd2VsbDogaW5jbHVk
ZSBzdGRsaWIuaC4KCkJlZm9yZSB3ZSBtZXJnZSB0aGlzIHBhdGNoLCBjb3VsZCB5b3UgYWRkIGEg
Y29tbWVudCBpbiB0aGUgdXBzdHJlYW0KcHVsbCByZXF1ZXN0IGxpbmtlZCBpbiB0aGUgcGF0Y2gg
aW4gWzFdIHByb3Bvc2luZyB5b3VyIGNoYW5nZT8KCkkga25vdyBscnpzeiBpcyBhbiBhbmNpZW50
IHBhY2thZ2UsIGFuZCB0aGlzIGZvcmsgZGlkIG5vdCByZWNlaXZlZApjb21taXRzIGluIHRoZSBw
YXN0IHllYXJzLCBidXQgd2UgbmV2ZXIga25vdyA7KQoKRm9yIHRoZSByZWNvcmQsIHRoZXJlIHdh
cyBhbiBhbHRlcm5hdGUgcHJvcG9zYWwgaW46Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTAzMjYxNzA4MTQuMjM5My0xLXV1aWR4eEAxNjMu
Y29tLwpidXQgc2luY2UgYWxsIHRoZSAzIGxpYmNzIHNlZW1zIHRvIHN1cHBvcnQgdGhhdCwgd2Ug
Y2FuIGdvIHdpdGggeW91ciAKcHJvcG9zYWwuCgo+IEZpeGVzOiBiNjc4NGExZjFmICgicGFja2Fn
ZS9scnpzejogZml4IGJ1aWxkIHdpdGggR0NDID49IDE0LngiKQo+IFNpZ25lZC1vZmYtYnk6IEZp
b25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gLS0tCj4gVGhpcyBjb21waWxlcyB3aXRo
IHVDbGliYy1uZywgdG9vICh3aXRob3V0IGV2ZW4gYSB3YXJuaW5nLCBJIGRpZG4ndAo+IHRlc3Qg
YXQgcnVudGltZSksIHNvIEknbSBub3Qgc3VyZSB3aGF0IHRob3NlICJub24tR05VIEMgbGlicmFy
aWVzIgo+IHdoZXJlIHRoaW5ncyBicmVhayBhcmUuIFRoZXJlIGFyZSBzaW1pbGFyIGNvbW1lbnRz
IGFsbCBvdmVyIHRoZSBnZXRvcHQKPiBjb2RlLCBzbyB3aXRoIHRoZSBhZ2Ugb2YgdGhlIGNvZGUg
bWF5YmUgd2F5IG91dGRhdGVkIG9uZXMsIG9yCj4gbm9uLUxpbnV4IHBsYXRmb3Jtcy4KCkZpbmFs
bHksIGlmIHlvdSB3YW50IHRvIHJ1bnRpbWUgdGVzdCwgdGhlcmUgYSBzaW1wbGUgcnVudGltZSB0
ZXN0OgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21h
c3Rlci9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xyenN6LnB5CnRoZSBsb25n
LW9wdCB3aWxsIGJlIGEgYml0IHRlc3RlZCB3aXRoIHRoZSAtLWhlbHAuCgo+ICAuLi4vMDAwMi1s
aWItbG9uZy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5wYXRjaCAgICAgfCAxMCArKystLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCAKPiBhL3BhY2thZ2UvbHJ6c3ovMDAwMi1saWItbG9uZy1vcHRpb25zLmMt
aW5jbHVkZS1zdGRsaWIuaC5wYXRjaCAKPiBiL3BhY2thZ2UvbHJ6c3ovMDAwMi1saWItbG9uZy1v
cHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5wYXRjaAo+IGluZGV4IDYyMjkxMTRlMGEuLmYwNTMy
YmQwMzYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9scnpzei8wMDAyLWxpYi1sb25nLW9wdGlvbnMu
Yy1pbmNsdWRlLXN0ZGxpYi5oLnBhdGNoCj4gKysrIGIvcGFja2FnZS9scnpzei8wMDAyLWxpYi1s
b25nLW9wdGlvbnMuYy1pbmNsdWRlLXN0ZGxpYi5oLnBhdGNoCj4gQEAgLTE1LDYgKzE1LDggQEAg
bG9uZy1vcHRpb25zLmM6NzA6MTE6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiAKPiBm
dW5jdGlvbiDigJhleGl04oCZCj4gCj4gIFVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vVXdl
T2hzZS9scnpzei9wdWxsLzQKPiAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiArW0Zpb25hOiByZW1vdmUgY29uZGl0aW9uYWwg
b24gX19HTlVfTElCUkFSWV9fIHRvIGZpeCBidWlsZCB3aXRoIG11c2xdCj4gK1NpZ25lZC1vZmYt
Ynk6IEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gIC0tLQo+ICAgbGliL2xvbmct
b3B0aW9ucy5jIHwgOSArKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKPiBAQCAtMjMsMTggKzI1LDEyIEBAIGRpZmYgLS1naXQgYS9saWIvbG9uZy1vcHRpb25zLmMg
Cj4gYi9saWIvbG9uZy1vcHRpb25zLmMKPiAgaW5kZXggNzZiOTc5Ni4uMTljODRlMCAxMDA2NDQK
PiAgLS0tIGEvbGliL2xvbmctb3B0aW9ucy5jCj4gICsrKyBiL2xpYi9sb25nLW9wdGlvbnMuYwo+
IC1AQCAtMjIsNiArMjIsMTUgQEAKPiArQEAgLTIyLDYgKzIyLDkgQEAKPiAgICNlbmRpZgo+IAo+
ICAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICsKPiAtKy8qIFRoaXMgbmVlZHMgdG8gY29tZSBhZnRl
ciBzb21lIGxpYnJhcnkgI2luY2x1ZGUKPiAtKyAgIHRvIGdldCBfX0dOVV9MSUJSQVJZX18gZGVm
aW5lZC4gICovCj4gLSsjaWZkZWYJX19HTlVfTElCUkFSWV9fCj4gLSsvKiBEb24ndCBpbmNsdWRl
IHN0ZGxpYi5oIGZvciBub24tR05VIEMgbGlicmFyaWVzIGJlY2F1c2Ugc29tZSBvZiAKPiB0aGVt
Cj4gLSsgICBjb250YWluIGNvbmZsaWN0aW5nIHByb3RvdHlwZXMgZm9yIGdldG9wdC4gICovCj4g
ICsjaW5jbHVkZSA8c3RkbGliLmg+Cj4gLSsjZW5kaWYJLyogR05VIEMgbGlicmFyeS4gICovCj4g
ICsKPiAgICNpbmNsdWRlIDxnZXRvcHQuaD4KPiAgICNpbmNsdWRlICJsb25nLW9wdGlvbnMuaCIK
PiAtLQo+IDIuNTAuMAoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgoKWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9Vd2VPaHNlL2xyenN6L3B1bGwvNApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
