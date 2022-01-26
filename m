Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CA7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CAA61005;
	Wed, 26 Jan 2022 22:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aE620iVsw51; Wed, 26 Jan 2022 22:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FDBB60B89;
	Wed, 26 Jan 2022 22:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B654E1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B032640165
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecZ-5T6AK1Wh for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:24:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33BAB4015A
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:24:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ka4so1525938ejc.11
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gzEYSDmssVOlGMDkn/U6o94hjEE0IakFZ/AMxYO4QdU=;
 b=lGmQJT5B+PQhIZfnVbOX4TyIGy/2PcM+mEbsVULEy7tum5hZUqxOZCJYM3BYoZ9d8z
 AFgGBGPHrWl2s7VNCu3ZVFlewXa0KwEHMT79qreU7qQWRCPikQr08G9dWVhabygabPZi
 cMtmTHkHPdZSNYsSEhPqML0wwlegLUmURai6DQvAL0Ps2VV/9SvbvkuLq44c9TMTXiZy
 7sk8gn/8rSfKRXPy+SRnVWXCYgn+Fap7ZbB5a4QsOQNa6ms/2SkPSqDzCEO168B0WprD
 jFUJQMSnWMSD0VyfI79ISwjUBS8T3pZBFRYykuQnrwb/o1ggjwk4IGlWWzP4dDgfO0Og
 hsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gzEYSDmssVOlGMDkn/U6o94hjEE0IakFZ/AMxYO4QdU=;
 b=FY/JUvhNpoOnuel476TJNXhBmDoz6t9kNpE/RMvqaeulHcl16UWZZur711aP1FCeNy
 MwA3iHMGyn0W6quxd/3RtQ1sYdVo8GkpzIa7xGH6eKLtYvu1pL4RcUXZGBSajRj9lQys
 ELCj+ejkDBoKO+OWSTIW6JZm5R7hHG+FPqL40Lf1KClNDyoRIwX+hUkLQf5bH9D3zYzK
 03H0gMOHiVqdW4OAf9TeunMSOkF5mV7KyPg4yPMKfRBgSfrXKlcJnbXhUZF6gIBakAYw
 INZ3OYOuIqRmLiXp/WJFkugFlseTFVe9KJ6ZzcgDicy2u4cDAg4g6b1t0UBUKwbsU+eG
 ml4g==
X-Gm-Message-State: AOAM532ducX9hVXPk/oQwLAldhqIqxH2RmkJ5/mJ+AEiBppVnZycq3oG
 O09XVxuUqhslm/O8jITSL6DCUCV7cxPfpkRuuSo=
X-Google-Smtp-Source: ABdhPJwBrM+gdwhwxgzhyXoZkcX0g8NHnfuhen++OAkXOLBuiTGifXbfK3Zdj2atMwsUvpUwaG+6Pt6kW4rJdMSZJCY=
X-Received: by 2002:a17:907:6d8f:: with SMTP id
 sb15mr643035ejc.7.1643235855290; 
 Wed, 26 Jan 2022 14:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20220124213445.2426794-1-fontaine.fabrice@gmail.com>
 <20220126230532.43ebcc51@windsurf>
In-Reply-To: <20220126230532.43ebcc51@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Jan 2022 23:22:24 +0100
Message-ID: <CAPi7W82ePwzyPvUG2K=uk-cvsOH7iRb=O=HSM3OGpxaDOTBbAQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Adam Duskett <aduskett@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBtZXIuIDI2IGphbnYuIDIwMjIgw6AgMjM6MDUsIFRob21hcyBQZXRhenpvbmkK
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIEZhYnJp
Y2UsCj4KPiArQWRhbSBmb3IgR09JIGV4cGVydGlzZS4KPgo+IE9uIE1vbiwgMjQgSmFuIDIwMjIg
MjI6MzQ6NDUgKzAxMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2Vk
IHNpbmNlIGNvbW1pdAo+ID4gOWQxZDQ4MThjMzlkOTdhZDdhMWNkZjZlMDc1YjlhY2FlNmRmZmY3
MToKPiA+Cj4gPiBbIDk4JV0gR2VuZXJhdGluZyBQb3BwbGVyLTAuMTgudHlwZWxpYgo+ID4gQ291
bGQgbm90IGZpbmQgR0lSIGZpbGUgJ0dPYmplY3QtMi4wLmdpcic7IGNoZWNrIFhER19EQVRBX0RJ
UlMgb3IgdXNlIC0taW5jbHVkZWRpcgo+ID4gZXJyb3IgcGFyc2luZyBmaWxlIC9ob21lL2dpdWxp
b2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0xL291dHB1dC0xL2J1aWxkL3BvcHBsZXIt
MjEuMTIuMC9nbGliL1BvcHBsZXItMC4xOC5naXI6IEZhaWxlZCB0byBwYXJzZSBpbmNsdWRlZCBn
aXIgR09iamVjdC0yLjAKPiA+IElmIHRoZSBhYm92ZSBlcnJvciBtZXNzYWdlIGlzIGFib3V0IG1p
c3NpbmcgLnNvIGxpYnJhcmllcywgdGhlbiBzZXR0aW5nIHVwIEdJUl9FWFRSQV9MSUJTX1BBVEgg
aW4gdGhlIC5tayBmaWxlIHNob3VsZCBoZWxwLgo+ID4gVHlwaWNhbGx5IGxpa2UgdGhpczogUEtH
X01BS0VfRU5WICs9IEdJUl9FWFRSQV9MSUJTX1BBVEg9IiQoQEQpLy5saWJzIgo+ID4KPiA+IEZp
eGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZDJmNTBh
YTU2NDEwYzJmZmY4YTA1MzhjNTcwMzgxMDQ5MDZlNzQ3ZQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4g
PiAgLi4udHh0LWFsbG93LXRoZS11c2VyLXRvLWNvbmZpZ3VyZS1JTlRSLnBhdGNoIHwgNDMgKysr
KysrKysrKysrKysrKysrKwo+ID4gIHBhY2thZ2UvcG9wcGxlci9wb3BwbGVyLm1rICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcG9wcGxlci8w
MDAyLWdsaWItQ01ha2VMaXN0cy50eHQtYWxsb3ctdGhlLXVzZXItdG8tY29uZmlndXJlLUlOVFIu
cGF0Y2gKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb3BwbGVyLzAwMDItZ2xpYi1DTWFr
ZUxpc3RzLnR4dC1hbGxvdy10aGUtdXNlci10by1jb25maWd1cmUtSU5UUi5wYXRjaCBiL3BhY2th
Z2UvcG9wcGxlci8wMDAyLWdsaWItQ01ha2VMaXN0cy50eHQtYWxsb3ctdGhlLXVzZXItdG8tY29u
ZmlndXJlLUlOVFIucGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAw
MDAwMDAwLi40NzM5NjZkN2M5Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3Bv
cHBsZXIvMDAwMi1nbGliLUNNYWtlTGlzdHMudHh0LWFsbG93LXRoZS11c2VyLXRvLWNvbmZpZ3Vy
ZS1JTlRSLnBhdGNoCj4gPiBAQCAtMCwwICsxLDQzIEBACj4gPiArRnJvbSBmOWU1ZDQyM2IwZjc2
NWYyMzkzYTk1YzMyOTlhMmQ4MjdiOWQzZmIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4g
K0Zyb206IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4g
K0RhdGU6IE1vbiwgMjQgSmFuIDIwMjIgMDk6Mjg6MjAgKzAxMDAKPiA+ICtTdWJqZWN0OiBbUEFU
Q0hdIGdsaWIvQ01ha2VMaXN0cy50eHQ6IGFsbG93IHRoZSB1c2VyIHRvIGNvbmZpZ3VyZQo+ID4g
KyBJTlRST1NQRUNUSU9OX0NPTVBJTEVSX0FSR1MKPiA+ICsKPiA+ICtBbGxvdyB0aGUgdXNlciB0
byBhZGQgaXRzIG93biBwYXJhbWV0ZXJzIHN1Y2ggYXMKPiA+ICstLWluY2x1ZGVkaXI9JChTVEFH
SU5HX0RJUikvdXNyL3NoYXJlL2dpci0xLjAgdG8KPiA+ICtJTlRST1NQRUNUSU9OX0NPTVBJTEVS
X0FSR1MgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdoZW4KPiA+ICtjcm9z
cy1jb21waWxpbmcgd2l0aCBidWlsZHJvb3Q6Cj4gPiArCj4gPiArWyA5OCVdIEdlbmVyYXRpbmcg
UG9wcGxlci0wLjE4LnR5cGVsaWIKPiA+ICtDb3VsZCBub3QgZmluZCBHSVIgZmlsZSAnR09iamVj
dC0yLjAuZ2lyJzsgY2hlY2sgWERHX0RBVEFfRElSUyBvciB1c2UgLS1pbmNsdWRlZGlyCj4gPiAr
ZXJyb3IgcGFyc2luZyBmaWxlIC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0
YW5jZS0xL291dHB1dC0xL2J1aWxkL3BvcHBsZXItMjEuMTIuMC9nbGliL1BvcHBsZXItMC4xOC5n
aXI6IEZhaWxlZCB0byBwYXJzZSBpbmNsdWRlZCBnaXIgR09iamVjdC0yLjAKPiA+ICtJZiB0aGUg
YWJvdmUgZXJyb3IgbWVzc2FnZSBpcyBhYm91dCBtaXNzaW5nIC5zbyBsaWJyYXJpZXMsIHRoZW4g
c2V0dGluZyB1cCBHSVJfRVhUUkFfTElCU19QQVRIIGluIHRoZSAubWsgZmlsZSBzaG91bGQgaGVs
cC4KPiA+ICtUeXBpY2FsbHkgbGlrZSB0aGlzOiBQS0dfTUFLRV9FTlYgKz0gR0lSX0VYVFJBX0xJ
QlNfUEFUSD0iJChARCkvLmxpYnMiCj4gPiArCj4gPiArRml4ZXM6Cj4gPiArIC0gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZDJmNTBhYTU2NDEwYzJmZmY4YTA1MzhjNTcw
MzgxMDQ5MDZlNzQ3ZQo+ID4gKwo+ID4gK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gK1tVcHN0cmVhbSBzdGF0dXM6Cj4gPiAr
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BvcHBsZXIvcG9wcGxlci8tL21lcmdlX3Jl
cXVlc3RzLzEwNDldCj4gPiArLS0tCj4gPiArIGdsaWIvQ01ha2VMaXN0cy50eHQgfCAyICstCj4g
PiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gKwo+
ID4gK2RpZmYgLS1naXQgYS9nbGliL0NNYWtlTGlzdHMudHh0IGIvZ2xpYi9DTWFrZUxpc3RzLnR4
dAo+ID4gK2luZGV4IDc1MTBlNjllLi5mNTEzMGUzYyAxMDA2NDQKPiA+ICstLS0gYS9nbGliL0NN
YWtlTGlzdHMudHh0Cj4gPiArKysrIGIvZ2xpYi9DTWFrZUxpc3RzLnR4dAo+ID4gK0BAIC0xMTks
NyArMTE5LDcgQEAgaWYgKEhBVkVfSU5UUk9TUEVDVElPTiBBTkQgQlVJTERfU0hBUkVEX0xJQlMp
Cj4gPiArICAgIyBHZW5lcmFsIGdpcjogUmVzZXQgb2JqZWN0LWxpc3QgZm9yIGludHJvc3BlY3Rp
b24gJiBsb2FkIHRvb2wgYXJncwo+ID4gKyAgIHNldChJTlRST1NQRUNUSU9OX0dJUlMpCj4gPiAr
ICAgc2V0KElOVFJPU1BFQ1RJT05fU0NBTk5FUl9BUkdTICItLWFkZC1pbmNsdWRlLXBhdGg9JHtD
TUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9IiAiLS13YXJuLWFsbCIpCj4gPiArLSAgc2V0KElOVFJP
U1BFQ1RJT05fQ09NUElMRVJfQVJHUyAiLS1pbmNsdWRlZGlyPSR7Q01BS0VfQ1VSUkVOVF9TT1VS
Q0VfRElSfSIpCj4gPiArKyAgc2V0KElOVFJPU1BFQ1RJT05fQ09NUElMRVJfQVJHUyAke0lOVFJP
U1BFQ1RJT05fQ09NUElMRVJfQVJHU30gIi0taW5jbHVkZWRpcj0ke0NNQUtFX0NVUlJFTlRfU09V
UkNFX0RJUn0iKQo+Cj4gSXMgdGhpcyB0aGUgcmlnaHQgd2F5IG9mIGRvaW5nIHRoaXM/IEkgc2Vl
IHRoYXQgZ2xpYi0yLjAucGMgZmlsZSBoYXMgYQo+ICJnaXJkaXIiIHZhcmlhYmxlICh3aGljaCB5
b3UgaGF2ZSBhZGRlZCBpbgo+IHBhY2thZ2UvbGliZ2xpYjIvMDAwNC1tZXNvbi5idWlsZC1hZGQt
Z2lyZGlyLXRvLWdpby0yLjAucGMtYW5kLWdsaWItMi4wLnBjLnBhdGNoCj4gdG8gZml4IGJ1aWxk
IGlzc3VlcyBpbiBhdGsgb3IgbGlibmljZSkuIFNvIGl0IHNlZW1zIGxpa2UgYXRrIGFuZAo+IGxp
Ym5pY2UgYXJlIGF1dG9tYXRpY2FsbHkgYWJsZSB0byB1c2UgdGhlc2UgcGtnLWNvbmZpZyBmaWxl
cyB0byBmaW5kCj4gb3V0IHRoaXMgZ2lyIGRpcmVjdG9yeS4KSW5kZWVkLCB0aGlzIGlzIHRydWUg
YnV0IGF0ayBhbmQgbGlibmljZSBhcmUgbWVzb24gcGFja2FnZXMuCkZvciBhdXRvdG9vbHMgcGFj
a2FnZXMsIGNvbW1pdAo4ZGRhNzk5NzA2NjEwOTBmMjAyZTFmMjBlNTk4MmJhNTNmZGFlYjk1IHVw
ZGF0ZWQKTWFrZWZpbGUuaW50cm9zcGVjdGlvbi4KPgo+IFNob3VsZG4ndCBwb3BwbGVyIGRvIHRo
ZSBzYW1lID8KcG9wcGxlciBpcyBhIGNtYWtlLXBhY2thZ2UgYW5kIEkgdGhvdWdodCB0aGF0IHRo
ZSBzdWdnZXN0ZWQgYXBwcm9hY2gKaXMgdGhlIHNpbXBsZXN0LCBsZXNzIGludmFzaXZlIGFuZCBx
dWlja2VzdCBhcHByb2FjaC4gVXBzdHJlYW0gaXMgYWxzbwpvayBmb3IgdGhpcyBwYXRjaC4KPgo+
IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
