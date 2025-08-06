Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A87C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 16:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3D640A62;
	Wed,  6 Aug 2025 16:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_RWEAaK4t4v; Wed,  6 Aug 2025 16:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 735234121C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 735234121C;
	Wed,  6 Aug 2025 16:05:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E23731
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C618613DF
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_lu0EsVmsea for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 16:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6543A60D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6543A60D97
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6543A60D97
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:05:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55b8736b1d6so41984e87.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 09:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754496323; x=1755101123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ulTwMK0jM7KEBdMMFFPbnAX/Tqly6aQPq3UXUVUzhE=;
 b=nFHFfm4aTD4UgIJ2Hf6dubs1bmIHDSFZFfSq3bcfkeD2OhXMC5yTZT4vphm2Nols+a
 ID4Q8xdIJV03Ar6hmpeDrXTNAF5FWILVEKoFc6WEyFBPoUVCFZ3cDD2cDHO1Cbtu0q2H
 1eaTqXJWQAWdMACPEjEHpEg64RaiLKdLnAf8MsI8gKG+rNwpfJ5PyaBl+HWKB6eazBGd
 8wHfME8rKRmk7/J2FQ4ZRxf462GU/6yV8LhmpeeB2/a9KTZA7acgbph8m5OyqhpLWPt8
 N+eDeb8D10p+4r+aBmOzm9uMTNT0y7u9kZy8sMUV2e0yqER/zgyfRX+zi07Jisa8ALq5
 7wZQ==
X-Gm-Message-State: AOJu0YyaI+VVEvW0d3H+Rm4GN+v3enxeDKUuYMLEtL5GSjGa7Izxe6Vq
 uu6rqfMgX19N/S4l5saVeSPWphes2I2YNfcA2dhf78CP5QIpOOSF+2KgGOm4ojrZ6zdnaygLR57
 g33MmgulPfTcaT4asPSdfOADFvvqoP3FyZHQMuxDj/Q==
X-Gm-Gg: ASbGncsgOuJ/sE5H8GzMWZxihguO8CDL9mRFoO7RxDui9BJkvKi1szeqdZ95LNRfx3o
 nnOXFRFCYOkU+pUqMz3uW9URGW2x3fvyercPc73CkZ0zugYHAVxbsctv6jnCF+WV/1wyIcgRN9G
 IQsEBKp9CM0BckPVYs5httwv6QLmaoZ/YFUTtwXbIpBkv1w3t/MB4a3+LtXLfaJf7RBrenDOnwi
 OPpzAooWg==
X-Google-Smtp-Source: AGHT+IEwp4gKAKhgjoo3ZfHkkH2hMI9tKLYSUgDOKSXrFiT8AenB/L4JnoauBqT2Er6CmoyMi+cY4F1yFN7Hp9mSebE=
X-Received: by 2002:ac2:4e14:0:b0:554:e7f2:d759 with SMTP id
 2adb3069b0e04-55caf35de5amr1198002e87.28.1754496323106; Wed, 06 Aug 2025
 09:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-2-fabien.lehoussel@smile.fr>
 <87pld8im6v.fsf@dell.be.48ers.dk>
In-Reply-To: <87pld8im6v.fsf@dell.be.48ers.dk>
Date: Wed, 6 Aug 2025 18:05:12 +0200
X-Gm-Features: Ac12FXwM-V4p3RDLnc1WycM4yHupguQZ4Ny-YLnfSpOy_hesstcJhsAlWrhlpJg
Message-ID: <CAKWtHtxtsJz14bqoO1MqhC3m7SpfNn1DvYPbJLSTEAS_oATKUw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754496323; x=1755101123; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ulTwMK0jM7KEBdMMFFPbnAX/Tqly6aQPq3UXUVUzhE=;
 b=xUmCeozzdP/qe0XLNE3AzOEaDSKWlUuoCjUyfu3nysjqmmVwu/zHFv9QcH+Wm+SJXw
 dbl8HvjCKka1t4lv7HnZObwUSSPXEwskZrOxK8W7h4BNhPokpygAF9OGy8d2y6ZO/gOg
 uUqaKbwHugAbyOaa1EttC2LAGsc+iqYYzqwtw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xUmCeozz
Subject: Re: [Buildroot] [PATCH v2 2/5] utils/generate-cyclonedx: update
 package filtering
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
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGFvw7t0IDIwMjUgw6AgMTY6MDEsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYmllbiIgPT0gRmFiaWVuIExlaG91
c3NlbCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgo+Cj4g
ID4gS2VlcCBvbmx5IHVwc3RyZWFtIHBhY2thZ2VzLCBpLmUuLCB0aG9zZSBmb3Igd2hpY2ggWFhf
U0lURSBpcyBzZXQKPgo+IFRoZSB0ZXJtICJ1cHN0cmVhbSBwYWNrYWdlcyIgc291bmRzIGEgYml0
IGNvbmZ1c2luZyB0byBtZSwgSSBndWVzcyB0aGUKPiBpbnRlbnRpb24gaXMgdG8gb25seSBpbmNs
dWRlICJyZWFsIiBwYWNrYWdlcywgRS5HLiBwYWNrYWdlcyBub3QgYnVuZGxlZAo+IGluc2lkZSBC
dWlsZHJvb3QuCgpPaywgSSB3aWxsIHVwZGF0ZSBjb21tZW50CgoKPiBZb3VyIHYxIHNlcmllcyBl
eHBsaWNpdGx5IG1lbnRpb25lZCBza2VsZXRvbiBwYWNrYWdlcywgc28gbWF5YmUgZ2l2ZQo+IHRo
YXQgYXMgYW4gZXhhbXBsZT8KCk9rLCBpIHdpbGwgbWVudGlvbiBza2VsZXRvbiBwYWNrYWdlcyBh
cyBleGVtcGxlCgo+IEl0IHdvdWxkIElNSE8gbWFrZSBtb3JlIHNlbnNlIHRvIGhhdmUgdGhpcyBh
cyB0aGUgZmlyc3QgY29tbWl0IGluIHlvdXIKPiBwYXRjaCBzZXJpZXMsIHNvIGJlZm9yZSB0aGUg
aG9zdCBmaWx0ZXJpbmcgb25lLgoKT2sKCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gTGVob3Vz
c2VsIDxmYWJpZW4ubGVob3Vzc2VsQHNtaWxlLmZyPgo+ICA+IC0tLQo+ICA+ICB1dGlscy9nZW5l
cmF0ZS1jeWNsb25lZHggfCAxMiArKysrKy0tLS0tLS0KPiAgPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+ICA+IGRpZmYgLS1naXQgYS91dGlscy9n
ZW5lcmF0ZS1jeWNsb25lZHggYi91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKPiAgPiBpbmRleCAw
OGM1OTFlODZiLi4xNGY2NTViY2EyIDEwMDc1NQo+ICA+IC0tLSBhL3V0aWxzL2dlbmVyYXRlLWN5
Y2xvbmVkeAo+ICA+ICsrKyBiL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+ICA+IEBAIC0yNzcs
OCArMjc3LDcgQEAgZGVmIG1haW4oKToKPiAgPiAgICAgICAgICAgICAgICAgICAgICAgICAgZGVm
YXVsdD0oTm9uZSBpZiBzeXMuc3RkaW4uaXNhdHR5KCkgZWxzZSBzeXMuc3RkaW4pKQo+ICA+ICAg
ICAgcGFyc2VyLmFkZF9hcmd1bWVudCgiLW8iLCAiLS1vdXQtZmlsZSIsIG5hcmdzPSI/IiwgdHlw
ZT1hcmdwYXJzZS5GaWxlVHlwZSgidyIpLAo+ICA+ICAgICAgICAgICAgICAgICAgICAgICAgICBk
ZWZhdWx0PXN5cy5zdGRvdXQpCj4gID4gLSAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCItLXZpcnR1
YWwiLCBkZWZhdWx0PUZhbHNlLCBhY3Rpb249J3N0b3JlX3RydWUnLAo+ICA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICBoZWxwPSJUaGlzIG9wdGlvbiBpbmNsdWRlcyB2aXJ0dWFsIHBhY2thZ2Vz
IHRvIHRoZSBDeWNsb25lRFggb3V0cHV0IikKPiAgPiArCj4KPgo+IEkgYW0gbm90IHN1cmUgZXhh
Y3RseSB3aGF0IHRoZSB1c2UgY2FzZSBpcyBvZiAtLXZpcnR1YWwsIGJ1dCB3aHkgcmVtb3ZlCj4g
aXQ/CgpEb24ndCBrbm93LCBJIGRpZG4ndCB1bmRlcnN0YW5kIHdoYXQgaXQgd2FzIGZvciwgYnV0
IHRoaXMgaXMgbm90CmNvbXBhdGlibGUgd2l0aCB0aGUgbmV3IGZpbHRlci4KRG9lcyBhbnlvbmUg
aGF2ZSB0aGUgYW5zd2VyPwoKPiA+ICAgICAgcGFyc2VyLmFkZF9hcmd1bWVudCgiLS1uby1ob3N0
LXBhY2thZ2VzIiwgZGVmYXVsdD1GYWxzZSwgYWN0aW9uPSdzdG9yZV90cnVlJywKPiAgPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgaGVscD0iVGhpcyBvcHRpb24gZXhjbHVkZXMgaG9zdCBwYWNr
YWdlcyBmcm9tIHRoZSBDeWNsb25lRFggb3V0cHV0IikKPgo+ICA+IEBAIC0yOTAsMTEgKzI4OSwx
MCBAQCBkZWYgbWFpbigpOgo+Cj4gID4gICAgICBzaG93X2luZm9fZGljdCA9IGpzb24ubG9hZChh
cmdzLmluX2ZpbGUpCj4KPiAgPiAtICAgICMgUmVtb3ZlIHJvb3RmcywgaG9zdCAoaWYgbm90IGlu
Y2x1ZGVkKSBhbmQgdmlydHVhbCBwYWNrYWdlcyAoaWYgbm90IGluY2x1ZGVkKQo+ICA+IC0gICAg
IyBmcm9tIHRoZSBjbGkgYXJndW1lbnRzCj4gID4gKyAgICAjIE9ubHkga2VlcCB1cHN0cmVhbSBw
YWNrYWdlcywgaS5lLiwgdGhvc2UgZm9yIHdoaWNoIFhYX1NJVEUgaXMgc2V0Cj4gID4gKyAgICAj
IEFsc28gZmlsdGVyIG91dCBob3N0IHBhY2thZ2VzIGlmIC0tbm8taG9zdC1wYWNrYWdlcyBpcyBz
cGVjaWZpZWQKPiAgPiAgICAgIGZpbHRlcmVkX3Nob3dfaW5mb19kaWN0ID0ge2s6IHYgZm9yIGss
IHYgaW4gc2hvd19pbmZvX2RpY3QuaXRlbXMoKQo+ICA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCJyb290ZnMiIG5vdCBpbiB2WyJ0eXBlIl0pIGFuZAo+ICA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGFyZ3MudmlydHVhbCBvciB2WyJ2aXJ0dWFsIl0g
aXMgRmFsc2UpIGFuZAo+ICA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh2
LmdldCgiZG93bmxvYWRzIikgYW5kIGxlbih2WyJkb3dubG9hZHMiXSkgPiAwKSBhbmQKPiAgPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChub3QgYXJncy5ub19ob3N0X3BhY2th
Z2VzIG9yICJob3N0IiBub3QgaW4gdlsidHlwZSJdKX0KPiAgPiAgICAgIGN5Y2xvbmVkeF9kaWN0
ID0gewo+ICA+ICAgICAgICAgICJib21Gb3JtYXQiOiAiQ3ljbG9uZURYIiwKPiAgPiBAQCAtMzA1
LDcgKzMwMyw3IEBAIGRlZiBtYWluKCk6Cj4gID4gICAgICAgICAgXSwKPiAgPiAgICAgICAgICAi
ZGVwZW5kZW5jaWVzIjogWwo+ICA+ICAgICAgICAgICAgICBjeWNsb25lZHhfZGVwZW5kZW5jeSgi
YnVpbGRyb290IiwgbGlzdChmaWx0ZXJlZF9zaG93X2luZm9fZGljdCkpLAo+ICA+IC0gICAgICAg
ICAgICAqW2N5Y2xvbmVkeF9kZXBlbmRlbmN5KHJlZiwgYnIyX3BhcnNlX2RlcHNfcmVjdXJzaXZl
bHkocmVmLCBzaG93X2luZm9fZGljdCwgYXJncy52aXJ0dWFsKSkKPiAgPiArICAgICAgICAgICAg
KltjeWNsb25lZHhfZGVwZW5kZW5jeShyZWYsIGJyMl9wYXJzZV9kZXBzX3JlY3Vyc2l2ZWx5KHJl
Ziwgc2hvd19pbmZvX2RpY3QsIFRydWUpKQo+Cj4gSWYgd2Ugd2VyZSB0byBkcm9wIHRoZSB2aXJ0
dWFsIG9wdGlvbiwgdGhlbiBpdCBzaG91bGQgSU1ITyBhbHNvIGJlCj4gZHJvcHBlZCBmcm9tIGJy
Ml9wYXJzZV9kZXBzX3JlY3Vyc2l2ZWx5LgoKT2sKCj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFy
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
