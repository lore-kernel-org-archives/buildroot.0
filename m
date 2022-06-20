Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C707C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 23:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC99483410;
	Mon, 20 Jun 2022 23:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC99483410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoG0SL2En2Od; Mon, 20 Jun 2022 23:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E2A783403;
	Mon, 20 Jun 2022 23:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E2A783403
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E979C1BF372
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 23:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C389B40480
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 23:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C389B40480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4eObR6NhhHI for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 23:15:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF99F4010C
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF99F4010C
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 23:15:04 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 q1-20020a056830018100b0060c2bfb668eso9449875ota.8
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 16:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lh0LQMAJs0pporniiXfu6kyCdQifBY9GYTIWnVn8YTI=;
 b=kf5nN2BXuONI6IFhzOz5HcZglYVJzZ/v8O9vxASWkEklh79JEB2F4ea2tn6skUv1kE
 Vt0lIr3e6OiLUS+epzmNA7KKI3Luk6p/e8I7omedlvz1jr4TtFESctrf11bxC1afoMZV
 1OIWuKqr98WkaO6gNjbShKR+pWrOzpZsn7iwuxG/2rujBn6C4t0EuTZEkLHYhgMdfJiQ
 X8fLJzAujnz2neQXHPNk2BaQgV+Cj8GooCUotHdOskQfpC5h+OPhLZ2BPc8cIJnbpsHz
 YEQjL4fLVsBLHN4TknhjpwaY1aLKFnpHvsJF5Z7lUsGCu4wuWIOXCbbEXbYYZLQeUBL5
 3rfg==
X-Gm-Message-State: AJIora8spHOcd7OeEYRrUSD4PFUIQZxMf34EzEMRSL1dqLS7W8wG0U9h
 dsxPvoeJbvJpn7sqN7+gNfv4REyWtVH2a8O2tFaXuH/AHGg=
X-Google-Smtp-Source: AGRyM1tRbUlPH+KBfNt0tmmQW18dfMx1DTZ6SPMsejKz+0WUga/J8pEDOrgj3le/FaQGmwz5u3+fAPN+Id5Tx1vak2E=
X-Received: by 2002:a05:6830:4411:b0:60c:5362:3e49 with SMTP id
 q17-20020a056830441100b0060c53623e49mr10761880otv.151.1655766902285; Mon, 20
 Jun 2022 16:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220329185059.943889-1-alseycmiller@gmail.com>
 <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
 <CADvTj4oQxty5MOVPmjXcQXOGXgdFn=LAF4WsgC8Ntf8Q6h-wng@mail.gmail.com>
 <6DD9DC86-9DF3-4CF8-9D7E-92F238643AA6@gmail.com>
 <CADvTj4rQnote1-uhWj6SEuddjFoEt2sPmcAnvR=_1ugrtve81A@mail.gmail.com>
 <057A8C3C-8DAC-46A3-86AB-2DAA92A9368B@gmail.com>
In-Reply-To: <057A8C3C-8DAC-46A3-86AB-2DAA92A9368B@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jun 2022 17:14:51 -0600
Message-ID: <CADvTj4pTzyNWdpgsybk_gYgoqguL6PmDBvjwXSP1vFd7+Q6syQ@mail.gmail.com>
To: Alsey Miller <alseycmiller@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lh0LQMAJs0pporniiXfu6kyCdQifBY9GYTIWnVn8YTI=;
 b=nc+HsBLO/lvMRLtOKnD1pnO+zHSOv3wgDGyzPQqwA6WUPPAu5Q3bfkvfvB0Tx/JObv
 8aIEs+06dLGranxHpsgBsXu0Gz6rdPbRQIL5t09kGIqFTIDB2xdijWTvejBS2DK34dV5
 +KRWS0OSxbmaGSHgoU4+CvvhNbFdUqbm5+RycRwbiUalQHmd0YcTh8QIwNMNNajDVXZL
 DVmm3d7bAzIFQ/QqUad3zmAMmEI+SmRPXj9nJ8NQyoN4/Lq0+aGOirFRPWWKnzfG9IJl
 yNPT41zKsijuYjVHUC5EnnlEL5fuDMQP3xuo5bimU4G75JkC1g4OMZUeBlJZZZaXjHGw
 PDJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nc+HsBLO
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-cmake: allow overriding
 toolchain
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBNYXIgMjksIDIwMjIgYXQgNToxOSBQTSBBbHNleSBNaWxsZXIgPGFsc2V5Y21pbGxl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSeKAmXZlIHN1Ym1pdHRlZCBhIG5ldyBzZXJpZXMgb2Yg
cGF0Y2hlcyB0aGF0IEnigJl2ZSB0ZXN0ZWQgd2l0aCB5b3VyIHBhdGNoLiBTbyB0aGUgYExJQkRJ
U1BBVENIX1NVUFBPUlRTX0NNQUtFX1RPT0xDSEFJTmAgbGluZSBpcyByZW1vdmUgYW5kIGFsbCBg
cGtnLWNtYWtlYCBjaGFuZ2VzLgoKRllJIHRvb2xjaGFpbiB2YXJpYWJsZSBvdmVycmlkZSBzdXBw
b3J0IGlzIG5vdyBtZXJnZWQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290
L2NvbW1pdC81NmEyN2Q3ZDAwZWEzYTE4NTFhNDYwNDViYmM5NDcyMDkxNDEyZTc2Cgo+Cj4gPiBP
biBNYXIgMjksIDIwMjIsIGF0IDE6MTAgUE0sIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE1hciAyOSwgMjAyMiBhdCAxOjU4
IFBNIEFsc2V5IE1pbGxlciA8YWxzZXljbWlsbGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+
PiBUaGF0IGNvbW1pdCBpcyBub3QgbWVyZ2VkIGFuZCBvbmx5IHNlZW1zIHRvIG92ZXJyaWRlIHRo
ZSBDIGZsYWdzLiBIb3cgY2FuIHdlIGZvcmNlIGNtYWtlIHRvIHVzZSBDbGFuZyBmb3IgdGFyZ2V0
IHBhY2thZ2VzPyBJIHdvdWxkIGJlIGZpbmUgd2l0aCBiYXNpbmcgbXkgd29yayB0aGF0IHBhdGNo
IGlmIHN1cHBvcnQgZm9yIHVzaW5nIENsYW5nIGFuZCBhcyB0aGUgQyBhbmQgQysrIGNvbXBpbGVy
IGlzIGFkZGVkLgo+ID4KPiA+IEl0IHNob3VsZCBhbGxvdyBvdmVycmlkaW5nIGFueSBvZiB0aGUg
dG9vbGNoYWluIHZhcmlhYmxlcyBsaWtlIHRoaXM6Cj4gPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwMzIyMjMyMjI0LjI4NDIyNjYtNi1q
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwo+ID4KPiA+IEkgdGhpbmsgdGhpcyB3aWxsIHByZXR0
eSBtdWNoIHdvcmsgYXMgaXMgd2l0aCB5b3VyIGxpYmRpc3BhdGNoIHBhdGNoOgo+ID4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDMyOTE4
NTA1OS45NDM4ODktMi1hbHNleWNtaWxsZXJAZ21haWwuY29tLwo+ID4KPiA+IEl0IHNob3VsZCBh
bGxvdyB5b3UgdG8gZHJvcCB0aGlzIHBhcnQ6Cj4gPiBMSUJESVNQQVRDSF9TVVBQT1JUU19DTUFL
RV9UT09MQ0hBSU4gPSBOTwo+ID4KPiA+IFlvdSBtaWdodCBhbHNvIGJlIGFibGUgdG8gZHJvcCBz
b21lIG9mIHRoZSBvdGhlciBjb25mIG9wdHMgc2luY2UgdGhlIHRvb2xjaGFpbgo+ID4gZmlsZSBj
YW4gdGhlbiBzdGlsbCBiZSB1c2VkIHdpdGggcGFydGlhbCBvdmVycmlkZXMuCj4gPgo+ID4+Cj4g
Pj4+IE9uIE1hciAyOSwgMjAyMiwgYXQgMTI6MjYgUE0sIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gVHVlLCBNYXIgMjksIDIw
MjIgYXQgMToxOCBQTSBBbHNleSBNaWxsZXIgPGFsc2V5Y21pbGxlckBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4+Pj4KPiA+Pj4+IFRoaXMgY2hhbmdlIGlzIG5lY2Vzc2FyeSBiZWNhdXNlIGlmIHlvdSBz
cGVjaWZ5IHRoZSB0b29sY2hhaW4gaXQgd2lsbCBhbHdheXMgdXNlIHRoZSBHQ0MgdG9vbGNoYWlu
IGFuZCBDIGZsYWdzIGluc3RlYWQgb2YgdGhlIENsYW5nIGNyb3NzIGNvbXBpbGVyICBhbmQgY3Vz
dG9tIEMgZmxhZ3MuIFRoaXMgaXMgbm90IGFuIGlzc3VlIGZvciBob3N0IHBhY2thZ2VzLCBvbmx5
IGZvciB0YXJnZXQuCj4gPj4+Cj4gPj4+IEkgdGhpbmsgdGhpcyBpcyBwcm9iYWJseSBhIGJldHRl
ciB3YXkgb2YgZGVhbGluZyB3aXRoIHRoZSBpc3N1ZToKPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDMyMjIzMjIyNC4yODQyMjY2
LTUtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPiA+Pj4KPiA+Pj4+Cj4gPj4+Pj4gT24gTWFy
IDI5LCAyMDIyLCBhdCAxMTo1MCBBTSwgQWxzZXkgQ29sZW1hbiBNaWxsZXIgPGFsc2V5Y21pbGxl
ckBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxzZXkg
Q29sZW1hbiBNaWxsZXIgPGFsc2V5Y21pbGxlckBnbWFpbC5jb20+Cj4gPj4+Pj4gLS0tCj4gPj4+
Pj4gcGFja2FnZS9wa2ctY21ha2UubWsgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystCj4g
Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1jbWFrZS5tayBiL3BhY2thZ2Uv
cGtnLWNtYWtlLm1rCj4gPj4+Pj4gaW5kZXggM2IxZGIzNWZiNi4uOWIzNmVlMmI0NyAxMDA2NDQK
PiA+Pj4+PiAtLS0gYS9wYWNrYWdlL3BrZy1jbWFrZS5tawo+ID4+Pj4+ICsrKyBiL3BhY2thZ2Uv
cGtnLWNtYWtlLm1rCj4gPj4+Pj4gQEAgLTU3LDcgKzU3LDcgQEAgJCgyKV9JTlNUQUxMX1NUQUdJ
TkdfT1BUUyAgID89IERFU1RESVI9JCQoU1RBR0lOR19ESVIpIGluc3RhbGwvZmFzdAo+ID4+Pj4+
ICQoMilfSU5TVEFMTF9UQVJHRVRfT1BUUyAgICAgID89IERFU1RESVI9JCQoVEFSR0VUX0RJUikg
aW5zdGFsbC9mYXN0Cj4gPj4+Pj4KPiA+Pj4+PiAkKDMpX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlM
RCA/PSBZRVMKPiA+Pj4+PiAtCj4gPj4+Pj4gKyQoMylfU1VQUE9SVFNfQ01BS0VfVE9PTENIQUlO
ID89IFlFUwo+ID4+Pj4+Cj4gPj4+Pj4gaWZlcSAoJCQoJCgzKV9TVVBQT1JUU19JTl9TT1VSQ0Vf
QlVJTEQpLFlFUykKPiA+Pj4+PiAkKDIpX0JVSUxERElSICAgICAgICAgICAgICAgICA9ICQkKCQo
MilfU1JDRElSKQo+ID4+Pj4+IEBAIC04Miw2ICs4Miw3IEBAIGlmZXEgKCQoNCksdGFyZ2V0KQo+
ID4+Pj4+ICMgICBkb2N1bWVudGVkIGFzIGEgc3RhbmRhcmQgQ01ha2UgdmFyaWFibGUuIElmIGEg
cGFja2FnZSBzdXBwb3J0cyBpdCwKPiA+Pj4+PiAjICAgaXQgbXVzdCBoYW5kbGUgaXQgZXhwbGlj
aXRseS4KPiA+Pj4+PiAjCj4gPj4+Pj4gK2lmZXEgKCQoMylfU1VQUE9SVFNfQ01BS0VfVE9PTENI
QUlOKSxZRVMpCj4gPj4+Pj4gZGVmaW5lICQoMilfQ09ORklHVVJFX0NNRFMKPiA+Pj4+PiAgICAg
KG1rZGlyIC1wICQkKCQkKFBLRylfQlVJTERESVIpICYmIFwKPiA+Pj4+PiAgICAgY2QgJCQoJCQo
UEtHKV9CVUlMRERJUikgJiYgXAo+ID4+Pj4+IEBAIC0xMDQsNiArMTA1LDI4IEBAIGRlZmluZSAk
KDIpX0NPTkZJR1VSRV9DTURTCj4gPj4+Pj4gICAgICkKPiA+Pj4+PiBlbmRlZgo+ID4+Pj4+IGVs
c2UKPiA+Pj4+PiArZGVmaW5lICQoMilfQ09ORklHVVJFX0NNRFMKPiA+Pj4+PiArICAgICAobWtk
aXIgLXAgJCQoJCQoUEtHKV9CVUlMRERJUikgJiYgXAo+ID4+Pj4+ICsgICAgIGNkICQkKCQkKFBL
RylfQlVJTERESVIpICYmIFwKPiA+Pj4+PiArICAgICBybSAtZiBDTWFrZUNhY2hlLnR4dCAmJiBc
Cj4gPj4+Pj4gKyAgICAgUEFUSD0kJChCUl9QQVRIKSBcCj4gPj4+Pj4gKyAgICAgJCQoJCQoUEtH
KV9DT05GX0VOVikgJCQoQlIyX0NNQUtFKSAkJCgkJChQS0cpX1NSQ0RJUikgXAo+ID4+Pj4+ICsg
ICAgICAgICAgICAgLURDTUFLRV9JTlNUQUxMX1BSRUZJWD0iL3VzciIgXAo+ID4+Pj4+ICsgICAg
ICAgICAgICAgLURDTUFLRV9DT0xPUl9NQUtFRklMRT1PRkYgXAo+ID4+Pj4+ICsgICAgICAgICAg
ICAgLURCVUlMRF9ET0M9T0ZGIFwKPiA+Pj4+PiArICAgICAgICAgICAgIC1EQlVJTERfRE9DUz1P
RkYgXAo+ID4+Pj4+ICsgICAgICAgICAgICAgLURCVUlMRF9FWEFNUExFPU9GRiBcCj4gPj4+Pj4g
KyAgICAgICAgICAgICAtREJVSUxEX0VYQU1QTEVTPU9GRiBcCj4gPj4+Pj4gKyAgICAgICAgICAg
ICAtREJVSUxEX1RFU1Q9T0ZGIFwKPiA+Pj4+PiArICAgICAgICAgICAgIC1EQlVJTERfVEVTVFM9
T0ZGIFwKPiA+Pj4+PiArICAgICAgICAgICAgIC1EQlVJTERfVEVTVElORz1PRkYgXAo+ID4+Pj4+
ICsgICAgICAgICAgICAgLURCVUlMRF9TSEFSRURfTElCUz0kJChpZiAkJChCUjJfU1RBVElDX0xJ
QlMpLE9GRixPTikgXAo+ID4+Pj4+ICsgICAgICAgICAgICAgJCQoQ01BS0VfUVVJRVQpIFwKPiA+
Pj4+PiArICAgICAgICAgICAgICQkKCQkKFBLRylfQ09ORl9PUFRTKSBcCj4gPj4+Pj4gKyAgICAg
KQo+ID4+Pj4+ICtlbmRlZgo+ID4+Pj4+ICtlbmRpZgo+ID4+Pj4+ICtlbHNlCj4gPj4+Pj4KPiA+
Pj4+PiAjIENvbmZpZ3VyZSBwYWNrYWdlIGZvciBob3N0Cj4gPj4+Pj4gZGVmaW5lICQoMilfQ09O
RklHVVJFX0NNRFMKPiA+Pj4+PiAtLQo+ID4+Pj4+IDIuMzUuMQo+ID4+Pj4+Cj4gPj4+Pgo+ID4+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
Pj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKPiA+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
