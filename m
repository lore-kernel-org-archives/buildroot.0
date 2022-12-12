Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CEAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 14:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B1080BDE;
	Mon, 12 Dec 2022 14:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B1080BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEdWZlReOCHu; Mon, 12 Dec 2022 14:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A3080BB8;
	Mon, 12 Dec 2022 14:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A3080BB8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B96911BF390
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 942D8401A0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 942D8401A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDBud365Qw37 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 14:34:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB664019F
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FB664019F
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 14:34:39 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id m204so11378605oib.6
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 06:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8gRXYntIq5T+0589+UjMtM6KlAVE8srWkcOJuTWMNsE=;
 b=NqegHtdbOVUm0zMmPGL+SsSVS2zdR9SvQeaANQNbNY51koY0EJK19V659QWYLA1XGM
 tEK8etkctXLMr95Z0Xk971WnFlUSzkl1+z7NyihHyCEfv8lrMZxPEo6C4jVrcEw5VWjr
 OflWH18a5X+dhjEeWILx6cuktq8GvIqCPr9wu9PokXvex4bKlFydg39VIVanbwZIco8B
 O8SkSaT2vDirIt/7x4WuskTakRRDUWA6GW+NBXCY/QSVy8WKU6YQqyE5AfsMq1r+p9Bb
 zHKlkpKikGE8VPhZ+lMCX6Z1wVaK5aKv3wV0EFzKWASrHzP0e95fXSqgK+r3kwGHRG0c
 pnOQ==
X-Gm-Message-State: ANoB5pm/doCu7gTzklPfOG8li6UeQXOdUIjdUIoWEog0VnfkSBSQryoo
 tzIWQPkinH3wdIzuKFQRIEEhozfDfh1WgUQti6o=
X-Google-Smtp-Source: AA0mqf5Pic1dXcfZmAehZ9nuDMOgYxoAkqpbdTgcDxcX2VYK1dBxrUfwFMBm0IK4u/969I3N2FyezABb2LNjpqJ2sAA=
X-Received: by 2002:aca:110f:0:b0:35a:1bdf:3db1 with SMTP id
 15-20020aca110f000000b0035a1bdf3db1mr47208411oir.18.1670855678998; Mon, 12
 Dec 2022 06:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20221211225515.588291-1-james.hilliard1@gmail.com>
 <CAGm1_ks6hAJ6oWd0L7n7W=Eyob3i38PXWvVcHmyamnX-CBq88Q@mail.gmail.com>
 <CADvTj4rj2ssotkyuWLL+g1Voqa2=5ayVYdKPny6z_i075Sh6gA@mail.gmail.com>
 <CAGm1_kuL7OH2u-XePWEyR+CmSN6cNg7aeyfQaXHPJCkhBa9D+g@mail.gmail.com>
In-Reply-To: <CAGm1_kuL7OH2u-XePWEyR+CmSN6cNg7aeyfQaXHPJCkhBa9D+g@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Dec 2022 10:34:26 -0400
Message-ID: <CADvTj4q0UCT1oWvHcwiP+rtkMZfYSrXFcwyvfWWT6uAqvcc8PA@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gRXYntIq5T+0589+UjMtM6KlAVE8srWkcOJuTWMNsE=;
 b=ejvV/iv7tjwt2MYbha2YpFs54G8o/4T7613eAKl/VW0KwoeiOVAt+gqT1rxJMwtBDH
 9loPdj4cdN0vEkAtgdIZ4/lNNkvu238MzYNI6imV67iFd0NIKswjXUORuc3+n1k+9srQ
 tuFjujUWrBRXqNNa+8zWID3AYeykSgoYlgl0luMcizFbk9LyoG9ZImni4Pnx+IWnJsmo
 IiKHDjePL1bPKNxyihISZC1mpndh0x50vhhifn9J8vtmJiF7EI2BmtlUeMFFPxkKxDS7
 dPBN/Sul7J2Z9iQ+UIJC5YIB4s91az0QlOkBvWS5Vvn8FD4NKYQRelCHDgOzmhEBPVZV
 XBuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ejvV/iv7
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

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMzoyNiBBTSBZZWdvciBZZWZyZW1vdgo8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgNTo0
NiBBTSBKYW1lcyBIaWxsaWFyZAo+IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCAxMjoxMSBBTSBZZWdvciBZZWZyZW1vdgo+
ID4gPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgSmFt
ZXMsIGFsbCwKPiA+ID4KPiA+ID4gT24gU3VuLCBEZWMgMTEsIDIwMjIgYXQgMTE6NTYgUE0gSmFt
ZXMgSGlsbGlhcmQKPiA+ID4gPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gU2luY2UgdGhlIHB5dGhvbjMgYnVtcCB0byB2ZXJzaW9uIDMuMTEgaW4gY29t
bWl0Cj4gPiA+ID4gNzM4NTAwYzI5NmM4YjEyMDZmMjBlOTRjYTNlN2M1OTMyYTZhMDQ4NiBweXRo
b24tYnVuY2ggaGFzIGZhaWxlZAo+ID4gPiA+IHRvIGJ1aWxkLgo+ID4gPiA+Cj4gPiA+ID4gVGhp
cyBpcyBkdWUgdG8gb3BlbigpIHdoaWNoIG5vIGxvbmdlciBhY2NlcHRzICdVJyAo4oCcdW5pdmVy
c2FsCj4gPiA+ID4gbmV3bGluZeKAnSkgaW4gdGhlIGZpbGUgbW9kZS4KPiA+ID4gPgo+ID4gPiA+
IFJlbW92ZSB0aGlzIHBhY2thZ2UgYXMgaXQgaGFzIG5vdCBoYWQgYSByZWxlYXNlIHNpbmNlIDIw
MTEgYW5kCj4gPiA+ID4gaXMgdW5tYWludGFpbmVkIHVwc3RyZWFtLgo+ID4gPiA+Cj4gPiA+ID4g
RGV0YWlsczoKPiA+ID4gPiBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMu
MTEuaHRtbCNwb3J0aW5nLXRvLXB5dGhvbi0zLTExCj4gPiA+ID4KPiA+ID4gPiBGaXhlczoKPiA+
ID4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yYmEvMmJhNzJm
Yzk4Mzc2MDVhMzZlYTYzYmJkM2U2ZTE4MWE0MGNkZjM2MAo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKysrKysrCj4gPiA+ID4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgLQo+ID4gPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8
ICAxIC0KPiA+ID4gPiAgcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluICAgICAgICAgfCAg
NiAtLS0tLS0KPiA+ID4gPiAgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2gg
fCAgNSAtLS0tLQo+ID4gPiA+ICBwYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsg
ICB8IDE0IC0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyNyBkZWxldGlvbnMoLSkKPiA+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgo+ID4gPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2gKPiA+ID4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5tawo+ID4gPiA+Cj4gPiA+
ID4gZGlmZiAtLWdpdCBhL0NvbmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5Cj4gPiA+
ID4gaW5kZXggMjhjNjgyMjY4OS4uNWMxZTE2MmY1NiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9Db25m
aWcuaW4ubGVnYWN5Cj4gPiA+ID4gKysrIGIvQ29uZmlnLmluLmxlZ2FjeQo+ID4gPiA+IEBAIC0x
NDYsNiArMTQ2LDEyIEBAIGVuZGlmCj4gPiA+ID4KPiA+ID4gPiAgY29tbWVudCAiTGVnYWN5IG9w
dGlvbnMgcmVtb3ZlZCBpbiAyMDIzLjAyIgo+ID4gPiA+Cj4gPiA+ID4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9QWVRIT05fQlVOQ0gKPiA+ID4gPiArICAgICAgIGJvb2wgInB5dGhvbi1idW5jaCByZW1v
dmVkIgo+ID4gPiA+ICsgICAgICAgc2VsZWN0IEJSMl9MRUdBQ1kKPiA+ID4KPiA+ID4gU2hvdWxk
IHdlIGFkZCAic2VsZWN0IEJSMl9QWVRIT05fTVVOQ0giPwo+ID4gPgo+ID4gPiBUaGlzIHBhY2th
Z2UgaXMgYSBtYWludGFpbmVkIGZvcms6IGh0dHBzOi8vZ2l0aHViLmNvbS9JbmZpbmlkYXQvbXVu
Y2gKPiA+Cj4gPiBXZWxsIHRoZSBpbXBvcnQgbmFtZXNwYWNlIGlzIGRpZmZlcmVudCBzbyBpdCBw
cm9iYWJseSBkb2Vzbid0IG1ha2Ugc2Vuc2UKPiA+IHRvIGhhdmUgaXQgYXMgYSBkcm9wIGluIHJl
cGxhY2VtZW50Lgo+Cj4gT0suIEJ1dCBzaG91bGQgaXQgYmUgYXQgbGVhc3QgbWVudGlvbmVkIGlu
IHRoZSBoZWxwIHRleHQ/CgpXZWxsIHdlIGRvbid0IGhhdmUgbXVuY2ggcGFja2FnZWQgcmlnaHQg
bm93IHNvIG5vdCBzdXJlLgoKPgo+ID4KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gWWVnb3IK
PiA+ID4KPiA+ID4gPiArICAgICAgIGhlbHAKPiA+ID4gPiArICAgICAgICAgVGhlIHB5dGhvbi1i
dW5jaCBwYWNrYWdlIGlzIHVubWFpbnRhaW5lZC4KPiA+ID4gPiArCj4gPiA+ID4gIGNvbmZpZyBC
UjJfUEFDS0FHRV9QWVRIT05fTTJSCj4gPiA+ID4gICAgICAgICBib29sICJweXRob24tbTJyIHJl
bW92ZWQiCj4gPiA+ID4gICAgICAgICBzZWxlY3QgQlIyX0xFR0FDWQo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+ID4gPiA+IGluZGV4IGYwZGNjNDJkZTcuLjBj
Mzc3MzY5NWEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvREVWRUxPUEVSUwo+ID4gPiA+ICsrKyBiL0RF
VkVMT1BFUlMKPiA+ID4gPiBAQCAtMjAxNyw3ICsyMDE3LDYgQEAgRjogICAgICAgIHBhY2thZ2Uv
cG9saWN5Y29yZXV0aWxzLwo+ID4gPiA+ICBGOiAgICAgcGFja2FnZS9wcm9mdHBkLwo+ID4gPiA+
ICBGOiAgICAgcGFja2FnZS9wcm90b2J1Zi1jLwo+ID4gPiA+ICBGOiAgICAgcGFja2FnZS9wcm90
b2J1Zi8KPiA+ID4gPiAtRjogICAgIHBhY2thZ2UvcHl0aG9uLWJ1bmNoLwo+ID4gPiA+ICBGOiAg
ICAgcGFja2FnZS9weXRob24tY29sb3JhbWEvCj4gPiA+ID4gIEY6ICAgICBwYWNrYWdlL3B5dGhv
bi1maWxlbG9jay8KPiA+ID4gPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWZsYXNrLWNvcnMvCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4K
PiA+ID4gPiBpbmRleCA5MTRjMzU4NGU5Li43ZjBjMzQ1MTlhIDEwMDY0NAo+ID4gPiA+IC0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluCj4gPiA+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiA+ID4g
PiBAQCAtOTc5LDcgKzk3OSw2IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgo+ID4g
PiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1ib3R0bGUvQ29uZmlnLmluIgo+ID4g
PiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1icm90bGkvQ29uZmlnLmluIgo+ID4g
PiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1ic2RpZmY0L0NvbmZpZy5pbiIKPiA+
ID4gPiAtICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluIgo+ID4g
PiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1jYWNoZWQtcHJvcGVydHkvQ29uZmln
LmluIgo+ID4gPiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1jYW4vQ29uZmlnLmlu
Igo+ID4gPiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1jYW5vcGVuL0NvbmZpZy5p
biIKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluIGIv
cGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluCj4gPiA+ID4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiA+ID4gaW5kZXggODllYWU3NDJiOC4uMDAwMDAwMDAwMAo+ID4gPiA+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgo+ID4gPiA+ICsrKyAvZGV2L251bGwKPiA+
ID4gPiBAQCAtMSw2ICswLDAgQEAKPiA+ID4gPiAtY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9C
VU5DSAo+ID4gPiA+IC0gICAgICAgYm9vbCAicHl0aG9uLWJ1bmNoIgo+ID4gPiA+IC0gICAgICAg
aGVscAo+ID4gPiA+IC0gICAgICAgICBBIGRvdC1hY2Nlc3NpYmxlIGRpY3Rpb25hcnkgKGEgbGEg
SmF2YVNjcmlwdCBvYmplY3RzKS4KPiA+ID4gPiAtCj4gPiA+ID4gLSAgICAgICAgIGh0dHA6Ly9n
aXRodWIuY29tL2RzYy9idW5jaAo+ID4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1i
dW5jaC9weXRob24tYnVuY2guaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5j
aC5oYXNoCj4gPiA+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXggY2Zk
ZTJkYjYwMy4uMDAwMDAwMDAwMAo+ID4gPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5
dGhvbi1idW5jaC5oYXNoCj4gPiA+ID4gKysrIC9kZXYvbnVsbAo+ID4gPiA+IEBAIC0xLDUgKzAs
MCBAQAo+ID4gPiA+IC0jIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2J1
bmNoL2pzb24KPiA+ID4gPiAtbWQ1ICAwYTgyOWQ2NGU5NWVkOTZkZWZiY2FlMmJmOTA2MWJiMCAg
YnVuY2gtMS4wLjEudGFyLmd6Cj4gPiA+ID4gLXNoYTI1NiAgNTBjNzdhMGZjMGNiMzcyZGZlNDhi
NWUxMTkzN2Q1ZjcwZTc0M2FkYmY0MjY4M2YzYTZkMjg1NzY0NWE3NmFhYSAgYnVuY2gtMS4wLjEu
dGFyLmd6Cj4gPiA+ID4gLSMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gPiA+
ID4gLXNoYTI1NiAgNTdjYTk1YzkyMDU5YzgzODA2MjUxOTI0NjI5NzliZDMyOTk0YWFlM2ZjZGY5
MDJmZjZlYjFlNDY3ZWViMDQ2OSAgTElDRU5TRS50eHQKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rIGIvcGFja2FnZS9weXRob24tYnVuY2gv
cHl0aG9uLWJ1bmNoLm1rCj4gPiA+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4g
aW5kZXggMThmZGMyMjNiYi4uMDAwMDAwMDAwMAo+ID4gPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LWJ1bmNoL3B5dGhvbi1idW5jaC5tawo+ID4gPiA+ICsrKyAvZGV2L251bGwKPiA+ID4gPiBAQCAt
MSwxNCArMCwwIEBACj4gPiA+ID4gLSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiA+ID4gLSMK
PiA+ID4gPiAtIyBweXRob24tYnVuY2gKPiA+ID4gPiAtIwo+ID4gPiA+IC0jIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ID4gPiA+IC0KPiA+ID4gPiAtUFlUSE9OX0JVTkNIX1ZFUlNJT04gPSAxLjAu
MQo+ID4gPiA+IC1QWVRIT05fQlVOQ0hfU09VUkNFID0gYnVuY2gtJChQWVRIT05fQlVOQ0hfVkVS
U0lPTikudGFyLmd6Cj4gPiA+ID4gLVBZVEhPTl9CVU5DSF9TSVRFID0gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2VmL2JmL2E0Y2YxNzc5YTRmZmI0ZjYxMDkwM2ZhMDhl
MTVkMWY0YThhMmY0ZTMzNTNhMDJhZmJlMDk3YzViZjRhOAo+ID4gPiA+IC1QWVRIT05fQlVOQ0hf
U0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiA+ID4gPiAtUFlUSE9OX0JVTkNIX0xJQ0VOU0UgPSBN
SVQKPiA+ID4gPiAtUFlUSE9OX0JVTkNIX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAo+ID4g
PiA+IC0KPiA+ID4gPiAtJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+ID4gPiA+IC0tCj4gPiA+
ID4gMi4zNC4xCj4gPiA+ID4KPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
