Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6CAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 04:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1987C40503;
	Mon, 12 Dec 2022 04:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1987C40503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOyWvWxU-k47; Mon, 12 Dec 2022 04:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179044018E;
	Mon, 12 Dec 2022 04:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179044018E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1E01BF3A0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 04:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41CF2813AE
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 04:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41CF2813AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxIRfTRlMI5n for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 04:46:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18145813A9
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18145813A9
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 04:46:50 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v70so10204186oie.3
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOUjoul/FmC5OzVvHCCB63er1JhHSUxCws58A+e/Bzs=;
 b=V/YJ67ufQoKByK9qjoKpghYP7R8OEqHXxp3pUnzPc55jjjGbB10Ep/4xMMQfvkG9nn
 9nft6lsTDOX+PhW2fBRE/T4xnrwIR65ZINEngPjHhC76ExURPGg3fQvQGVS1cElj+f6P
 M5bImrOFK2KwwL0Q/ovEHrVPekehlF6NX/5b3cc3J/+kS3RdyH5y07qVPP90ZPj5lypl
 kUEfp674TX8txEl3UX6e8FjVQsl/a7cJDYhf2thLAfbHaYT1UvA31gTkVWGsgLl0ARXA
 Vdr2bUtVWiif+uP26A7HIDNxzRNPA6qE384aGOXrMLFnXjg+Xw02tEXRpoZeTyPJKjWP
 oJ8g==
X-Gm-Message-State: ANoB5pmyhrffvXpweZZcW7CXHWnHyKItjaCrb4Ufsb/HoIermm/SiOlb
 Fqwxkis+c6m8L1N25xHcnhe21zGSdFx98V2r9qA=
X-Google-Smtp-Source: AA0mqf4bcNrUoe9llB5SdhHIT9cDElzVDZd3njAY61SCC2qpUIgncUA0LsvxK4oEonvq3sJorCqTazUtXNs9Q6j9r6U=
X-Received: by 2002:aca:110f:0:b0:35a:1bdf:3db1 with SMTP id
 15-20020aca110f000000b0035a1bdf3db1mr47127355oir.18.1670820409856; Sun, 11
 Dec 2022 20:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20221211225515.588291-1-james.hilliard1@gmail.com>
 <CAGm1_ks6hAJ6oWd0L7n7W=Eyob3i38PXWvVcHmyamnX-CBq88Q@mail.gmail.com>
In-Reply-To: <CAGm1_ks6hAJ6oWd0L7n7W=Eyob3i38PXWvVcHmyamnX-CBq88Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Dec 2022 00:46:38 -0400
Message-ID: <CADvTj4rj2ssotkyuWLL+g1Voqa2=5ayVYdKPny6z_i075Sh6gA@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOUjoul/FmC5OzVvHCCB63er1JhHSUxCws58A+e/Bzs=;
 b=orQLLwzGTdawRtiLZA2NjL7J/h+7DD+R6a73x+U9ej5JTEF56888aCc2V0OfPrVwkj
 CvKUgf0aS/zbgkZRkCm9dzx7ZR7/AWRFT807mTC/cEzngk3UQ6Xr2midhBjNTzKdPtD1
 YRKspPh0vHDhl64CKB7ZWXYqhm1YvfdaXP6zdLf8RnQV1RPwQR1hgr1hSX3AT4HFagGu
 lmdun7VVEKZjrY/a8bpn52nJgMNvc4gdrEWYbKnKKWH3rPMuKiy9E2COe5wXeqtu2y6c
 xILa3XSB4WRcC0worfoMxHP+R5JHj5lY29Y5OZI0moPurQiaJiUsykSlFpnKRfUPXq6z
 i+iA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=orQLLwzG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bunch: remove package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMTI6MTEgQU0gWWVnb3IgWWVmcmVtb3YKPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IEhpIEphbWVzLCBhbGwsCj4KPiBPbiBTdW4s
IERlYyAxMSwgMjAyMiBhdCAxMTo1NiBQTSBKYW1lcyBIaWxsaWFyZAo+IDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBTaW5jZSB0aGUgcHl0aG9uMyBidW1wIHRvIHZl
cnNpb24gMy4xMSBpbiBjb21taXQKPiA+IDczODUwMGMyOTZjOGIxMjA2ZjIwZTk0Y2EzZTdjNTkz
MmE2YTA0ODYgcHl0aG9uLWJ1bmNoIGhhcyBmYWlsZWQKPiA+IHRvIGJ1aWxkLgo+ID4KPiA+IFRo
aXMgaXMgZHVlIHRvIG9wZW4oKSB3aGljaCBubyBsb25nZXIgYWNjZXB0cyAnVScgKOKAnHVuaXZl
cnNhbAo+ID4gbmV3bGluZeKAnSkgaW4gdGhlIGZpbGUgbW9kZS4KPiA+Cj4gPiBSZW1vdmUgdGhp
cyBwYWNrYWdlIGFzIGl0IGhhcyBub3QgaGFkIGEgcmVsZWFzZSBzaW5jZSAyMDExIGFuZAo+ID4g
aXMgdW5tYWludGFpbmVkIHVwc3RyZWFtLgo+ID4KPiA+IERldGFpbHM6Cj4gPiBodHRwczovL2Rv
Y3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMuMTEuaHRtbCNwb3J0aW5nLXRvLXB5dGhvbi0z
LTExCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy8yYmEvMmJhNzJmYzk4Mzc2MDVhMzZlYTYzYmJkM2U2ZTE4MWE0MGNkZjM2MAo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgICAgICAgICAgICAg
fCAgNiArKysrKysKPiA+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxIC0KPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0K
PiA+ICBwYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4gICAgICAgICB8ICA2IC0tLS0tLQo+
ID4gIHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoIHwgIDUgLS0tLS0KPiA+
ICBwYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsgICB8IDE0IC0tLS0tLS0tLS0t
LS0tCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygt
KQo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4K
PiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNo
Lmhhc2gKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9u
LWJ1bmNoLm1rCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0NvbmZpZy5pbi5sZWdhY3kgYi9Db25maWcu
aW4ubGVnYWN5Cj4gPiBpbmRleCAyOGM2ODIyNjg5Li41YzFlMTYyZjU2IDEwMDY0NAo+ID4gLS0t
IGEvQ29uZmlnLmluLmxlZ2FjeQo+ID4gKysrIGIvQ29uZmlnLmluLmxlZ2FjeQo+ID4gQEAgLTE0
Niw2ICsxNDYsMTIgQEAgZW5kaWYKPiA+Cj4gPiAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVt
b3ZlZCBpbiAyMDIzLjAyIgo+ID4KPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0JVTkNI
Cj4gPiArICAgICAgIGJvb2wgInB5dGhvbi1idW5jaCByZW1vdmVkIgo+ID4gKyAgICAgICBzZWxl
Y3QgQlIyX0xFR0FDWQo+Cj4gU2hvdWxkIHdlIGFkZCAic2VsZWN0IEJSMl9QWVRIT05fTVVOQ0gi
Pwo+Cj4gVGhpcyBwYWNrYWdlIGlzIGEgbWFpbnRhaW5lZCBmb3JrOiBodHRwczovL2dpdGh1Yi5j
b20vSW5maW5pZGF0L211bmNoCgpXZWxsIHRoZSBpbXBvcnQgbmFtZXNwYWNlIGlzIGRpZmZlcmVu
dCBzbyBpdCBwcm9iYWJseSBkb2Vzbid0IG1ha2Ugc2Vuc2UKdG8gaGF2ZSBpdCBhcyBhIGRyb3Ag
aW4gcmVwbGFjZW1lbnQuCgo+Cj4gUmVnYXJkcywKPiBZZWdvcgo+Cj4gPiArICAgICAgIGhlbHAK
PiA+ICsgICAgICAgICBUaGUgcHl0aG9uLWJ1bmNoIHBhY2thZ2UgaXMgdW5tYWludGFpbmVkLgo+
ID4gKwo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fTTJSCj4gPiAgICAgICAgIGJvb2wg
InB5dGhvbi1tMnIgcmVtb3ZlZCIKPiA+ICAgICAgICAgc2VsZWN0IEJSMl9MRUdBQ1kKPiA+IGRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+ID4gaW5kZXggZjBkY2M0MmRlNy4u
MGMzNzczNjk1YSAxMDA2NDQKPiA+IC0tLSBhL0RFVkVMT1BFUlMKPiA+ICsrKyBiL0RFVkVMT1BF
UlMKPiA+IEBAIC0yMDE3LDcgKzIwMTcsNiBAQCBGOiAgICAgICAgcGFja2FnZS9wb2xpY3ljb3Jl
dXRpbHMvCj4gPiAgRjogICAgIHBhY2thZ2UvcHJvZnRwZC8KPiA+ICBGOiAgICAgcGFja2FnZS9w
cm90b2J1Zi1jLwo+ID4gIEY6ICAgICBwYWNrYWdlL3Byb3RvYnVmLwo+ID4gLUY6ICAgICBwYWNr
YWdlL3B5dGhvbi1idW5jaC8KPiA+ICBGOiAgICAgcGFja2FnZS9weXRob24tY29sb3JhbWEvCj4g
PiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWZpbGVsb2NrLwo+ID4gIEY6ICAgICBwYWNrYWdlL3B5
dGhvbi1mbGFzay1jb3JzLwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFj
a2FnZS9Db25maWcuaW4KPiA+IGluZGV4IDkxNGMzNTg0ZTkuLjdmMGMzNDUxOWEgMTAwNjQ0Cj4g
PiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiA+
IEBAIC05NzksNyArOTc5LDYgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCj4gPiAg
ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tYm90dGxlL0NvbmZpZy5pbiIKPiA+ICAgICAg
ICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1icm90bGkvQ29uZmlnLmluIgo+ID4gICAgICAgICBz
b3VyY2UgInBhY2thZ2UvcHl0aG9uLWJzZGlmZjQvQ29uZmlnLmluIgo+ID4gLSAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbiIKPiA+ICAgICAgICAgc291cmNlICJw
YWNrYWdlL3B5dGhvbi1jYWNoZWQtcHJvcGVydHkvQ29uZmlnLmluIgo+ID4gICAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWNhbi9Db25maWcuaW4iCj4gPiAgICAgICAgIHNvdXJjZSAicGFj
a2FnZS9weXRob24tY2Fub3Blbi9Db25maWcuaW4iCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tYnVuY2gvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluCj4g
PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDg5ZWFlNzQyYjguLjAwMDAwMDAw
MDAKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgo+ID4gKysrIC9kZXYv
bnVsbAo+ID4gQEAgLTEsNiArMCwwIEBACj4gPiAtY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9C
VU5DSAo+ID4gLSAgICAgICBib29sICJweXRob24tYnVuY2giCj4gPiAtICAgICAgIGhlbHAKPiA+
IC0gICAgICAgICBBIGRvdC1hY2Nlc3NpYmxlIGRpY3Rpb25hcnkgKGEgbGEgSmF2YVNjcmlwdCBv
YmplY3RzKS4KPiA+IC0KPiA+IC0gICAgICAgICBodHRwOi8vZ2l0aHViLmNvbS9kc2MvYnVuY2gK
PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaCBi
L3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gPiBkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKPiA+IGluZGV4IGNmZGUyZGI2MDMuLjAwMDAwMDAwMDAKPiA+IC0tLSBhL3Bh
Y2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gPiArKysgL2Rldi9udWxsCj4g
PiBAQCAtMSw1ICswLDAgQEAKPiA+IC0jIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9y
Zy9weXBpL2J1bmNoL2pzb24KPiA+IC1tZDUgIDBhODI5ZDY0ZTk1ZWQ5NmRlZmJjYWUyYmY5MDYx
YmIwICBidW5jaC0xLjAuMS50YXIuZ3oKPiA+IC1zaGEyNTYgIDUwYzc3YTBmYzBjYjM3MmRmZTQ4
YjVlMTE5MzdkNWY3MGU3NDNhZGJmNDI2ODNmM2E2ZDI4NTc2NDVhNzZhYWEgIGJ1bmNoLTEuMC4x
LnRhci5nego+ID4gLSMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gPiAtc2hh
MjU2ICA1N2NhOTVjOTIwNTljODM4MDYyNTE5MjQ2Mjk3OWJkMzI5OTRhYWUzZmNkZjkwMmZmNmVi
MWU0NjdlZWIwNDY5ICBMSUNFTlNFLnR4dAo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LWJ1bmNoL3B5dGhvbi1idW5jaC5tayBiL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5j
aC5tawo+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAxOGZkYzIyM2JiLi4w
MDAwMDAwMDAwCj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsK
PiA+ICsrKyAvZGV2L251bGwKPiA+IEBAIC0xLDE0ICswLDAgQEAKPiA+IC0jIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ID4gLSMKPiA+IC0jIHB5dGhvbi1idW5jaAo+ID4gLSMKPiA+IC0jIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ID4gLQo+ID4gLVBZVEhPTl9CVU5DSF9WRVJTSU9OID0gMS4wLjEK
PiA+IC1QWVRIT05fQlVOQ0hfU09VUkNFID0gYnVuY2gtJChQWVRIT05fQlVOQ0hfVkVSU0lPTiku
dGFyLmd6Cj4gPiAtUFlUSE9OX0JVTkNIX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3Rl
ZC5vcmcvcGFja2FnZXMvZWYvYmYvYTRjZjE3NzlhNGZmYjRmNjEwOTAzZmEwOGUxNWQxZjRhOGEy
ZjRlMzM1M2EwMmFmYmUwOTdjNWJmNGE4Cj4gPiAtUFlUSE9OX0JVTkNIX1NFVFVQX1RZUEUgPSBz
ZXR1cHRvb2xzCj4gPiAtUFlUSE9OX0JVTkNIX0xJQ0VOU0UgPSBNSVQKPiA+IC1QWVRIT05fQlVO
Q0hfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gPiAtCj4gPiAtJChldmFsICQocHl0aG9u
LXBhY2thZ2UpKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
