Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50168C7EE26
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 23:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 909C8405BB;
	Tue, 23 May 2023 23:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 909C8405BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3e26PPc4C0WH; Tue, 23 May 2023 23:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB72E41DCC;
	Tue, 23 May 2023 23:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB72E41DCC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2E21BF369
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 23:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 305D761516
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 23:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305D761516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_nn5qm4a6HQ for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 23:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B422F614F6
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B422F614F6
 for <buildroot@buildroot.org>; Tue, 23 May 2023 23:22:38 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-784205f0058so149131241.1
 for <buildroot@buildroot.org>; Tue, 23 May 2023 16:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684884157; x=1687476157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxLbFs1JX0MNK1X/+O+idl5re9+j6Qh9plSDe/xXtWk=;
 b=EV0jH7CSTN+oxSa3txWb0JEWsDMk3hE8PccGFZpcfvuOfuFgI9g4ptbeKnQjCvVuIz
 3I2yjFnPi94BVRxldsvolplw84pZEOI62ojZUJhOTNhz8Hyo4thE7GzAUNiVzxbc6jc+
 kF5By+kkaz9haF/O5e0GZjX1mM1s/aODVvINhL7PzYGxmc4vog0uK3S8Dm/iI+4M2jfQ
 kVLxlFVCsZ+hyFQMyFqG6ra4NDt1rMVYNBNvvOg8PibPuS2z8c00lyWgJbkp2cyurXQo
 Ii/mMA8x3xB2Ct79CfgYJ90fg72Mwol2RmLIe4tuJQ/MqSQKW1fRKmERQFe5CTlDGo9k
 U7cA==
X-Gm-Message-State: AC+VfDxiJAlCAPRSjHMFn8th5A5U6TjzAzywz7yZ0Tvfsj1d+XqDF8LA
 WIyZjQH1beZHmXSclno8F16ECRCnF19bgnnA/Dk=
X-Google-Smtp-Source: ACHHUZ4zdGbHXoVVgXxF8gw1ayHgPjnQAuNObFGqSC/YgBmky7fFtsoLJ6erYZO5gyy9NrJPP70yjH/lEy0kz/mPos4=
X-Received: by 2002:a05:6102:e46:b0:434:5359:61b1 with SMTP id
 p6-20020a0561020e4600b00434535961b1mr4561044vst.19.1684884157086; Tue, 23 May
 2023 16:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230409000929.391071-1-unixmania@gmail.com>
 <2e28cd63-1af2-cfc0-fe46-32ec6d6954df@mind.be>
 <CAJ4jsadr2aqVUWfO79++RF8spamx79r4pY+umDaL5rmEraYGZA@mail.gmail.com>
In-Reply-To: <CAJ4jsadr2aqVUWfO79++RF8spamx79r4pY+umDaL5rmEraYGZA@mail.gmail.com>
From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 23 May 2023 20:22:26 -0300
Message-ID: <CAJ4jsafuYW3Bie1tvV-n3W+kuJLkN8fJXEfnZO-QAj5qmOG8Mg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684884157; x=1687476157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxLbFs1JX0MNK1X/+O+idl5re9+j6Qh9plSDe/xXtWk=;
 b=d7jY5X6ICuHSF/15f5kzogTdrfr39j+F03qqYu/wSFOL4yRsrvO7E4lcj5B1oq42ct
 NRkql0+ejH+M/9+9G5Ybg/F/c1uUGMF0py0GiUZ7wvlm/YSEZqBW8il43qDXxOcUS9v5
 3Rf7gfy7k/MsqSKgtcQLuYnX5YUA8hXhgM7IYhkHdTRYpyWWtVuHCMON657QZtefMkgh
 8B43eKtxxTZH43DPmiriuytgCNZJbBWIODC9uKmmpMIxcEeIJcYdHU1NgLdoycuV9RYD
 4nwSKILdcCsPeTKonUUJuUVDQikgkQt8Lsk2fiE68dxhPNuAlgEyOk0spSlkVhEFIXSe
 WSJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d7jY5X6I
Subject: Re: [Buildroot] [PATCH] package/qemu: install keyboard maps only if
 necessary
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUdWUsIEFwciAxMSwgMjAyMyBhdCAxMTo0MeKAr0FNIENhcmxvcyBTYW50b3Mg
PHVuaXhtYW5pYUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMTAsIDIwMjMgYXQg
MTE6NTfigK9BTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+
ID4KPiA+ICAgSGkgQ2FybG9zLAo+ID4KPiA+IE9uIDA5LzA0LzIwMjMgMDI6MDksIHVuaXhtYW5p
YUBnbWFpbC5jb20gd3JvdGU6Cj4gPiA+IEZyb206IENhcmxvcyBTYW50b3MgPHVuaXhtYW5pYUBn
bWFpbC5jb20+Cj4gPiA+Cj4gPiA+IFRoZXkgYXJlIHJlcXVpcmVkIG9ubHkgZm9yIHN5c3RlbSBl
bXVsYXRpb24sIHNvIHB1bGwgYSBwYXRjaCBhbHJlYWR5Cj4gPiA+IHJldmlld2QgdXBzdHJlYW1b
MSwyXSB0aGF0IG1ha2VzIHRoZSBpbnN0YWxsYXRpb24gY29uZGl0aW9uYWwuCj4gPiA+Cj4gPiA+
IDEuIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIzLTAz
L21zZzA2NDI4Lmh0bWwKPiA+ID4gMi4gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRt
bC9xZW11LWRldmVsLzIwMjMtMDMvbXNnMDY0MzguaHRtbAo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBDYXJsb3MgU2FudG9zIDx1bml4bWFuaWFAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
ICAuLi50YWxsLWtleWJvYXJkLW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2ggfCAzNiArKysr
KysrKysrKysrKysrKysrCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykK
PiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xZW11LzAwMDQtbWVzb24taW5zdGFs
bC1rZXlib2FyZC1tYXBzLW9ubHktaWYtbmVjZXNzYXJ5LnBhdGNoCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3FlbXUvMDAwNC1tZXNvbi1pbnN0YWxsLWtleWJvYXJkLW1hcHMtb25s
eS1pZi1uZWNlc3NhcnkucGF0Y2ggYi9wYWNrYWdlL3FlbXUvMDAwNC1tZXNvbi1pbnN0YWxsLWtl
eWJvYXJkLW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2gKPiA+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMC4uOTFlYTFlODZjOQo+ID4gPiAtLS0gL2Rldi9u
dWxsCj4gPiA+ICsrKyBiL3BhY2thZ2UvcWVtdS8wMDA0LW1lc29uLWluc3RhbGwta2V5Ym9hcmQt
bWFwcy1vbmx5LWlmLW5lY2Vzc2FyeS5wYXRjaAo+ID4gPiBAQCAtMCwwICsxLDM2IEBACj4gPiA+
ICtGcm9tIDlkOWI3NGY4MDZmNWRiY2E1M2RmNjYzMGMxYTA1OTFlYWVkZDQ1MDAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gPiA+ICtGcm9tOiBDYXJsb3MgU2FudG9zIDxjYXNhbnRvc0ByZWRo
YXQuY29tPgo+ID4gPiArRGF0ZTogU3VuLCAxIEphbiAyMDIzIDIxOjAwOjU3IC0wMzAwCj4gPiA+
ICtTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBpbnN0YWxsIGtleWJvYXJkIG1hcHMgb25seSBpZiBu
ZWNlc3NhcnkKPiA+ID4gKwo+ID4gPiArVGhleSBhcmUgcmVxdWlyZWQgb25seSBmb3Igc3lzdGVt
IGVtdWxhdGlvbiAoaS5lLiBoYXZlX3N5c3RlbSBpcyB0cnVlKS4KPiA+ID4gKwo+ID4gPiArU2ln
bmVkLW9mZi1ieTogQ2FybG9zIFNhbnRvcyA8Y2FzYW50b3NAcmVkaGF0LmNvbT4KPiA+Cj4gPiAg
IFdlIG5lZWQgdGhlIFNvQiBmb3IgdW5peG1hbmlhQGdtYWlsLmNvbSBvbiB0aGlzLiBUaGUgU29C
IGlzIGEgc2hvcnQgd2F5IGZvcgo+ID4geW91ICh0aGUgcHJpdmF0ZSBwZXJzb24sIG5vdCB0aGUg
UmVkaGF0IGVtcGxveWVlKSB0byBhc3NlcnQgdGhhdCB5b3UgYXJlCj4gPiBlbnRpdGxlZCB0byBj
b250cmlidXRlIHRoZSBwYXRjaCB1bmRlciBxZW11J3MgbGljZW5zZS4KPgo+IFRob3VzYW5kcyBv
ZiBSZWQgSGF0IGVtcGxveWVlcyBjb250cmlidXRlIHRvIGZyZWUgc29mdHdhcmUgcHJvamVjdHMK
PiB1c2luZyB0aGVpciB3b3JrIGVtYWlsIGFkZHJlc3Nlcy4gVGhlcmUgaXMgbm8gY29udHJhZGlj
dGlvbiBiZXR3ZWVuCj4gcGVyc29uYWwgYW5kIGVtcGxveWVlIGFjdGl2aXR5IHJlZ2FyZGluZyB0
aGlzLiBDaGVjayB0aGlzIGRvY3VtZW50IGZvcgo+IGFkZGl0aW9uYWwgaW5mb3JtYXRpb246Cj4K
PiAgICBSZWQgSGF04oCZcyBvcGVuIHNvdXJjZSBwYXJ0aWNpcGF0aW9uIGd1aWRlbGluZXMKPiAg
ICBodHRwczovL3d3dy5yZWRoYXQuY29tL2VuL3Jlc291cmNlcy9vcGVuLXNvdXJjZS1wYXJ0aWNp
cGF0aW9uLWd1aWRlbGluZXMtb3ZlcnZpZXcKPgo+ID4gICBBbHNvLCBwbGVhc2UgbGluayB0byB0
aGUgdXBzdHJlYW0gcGF0Y2h3b3JrIGVudHJ5IGhlcmUsIGxpa2UgdGhpczoKPiA+Cj4gPiBVcHN0
cmVhbToKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVs
L3BhdGNoLzIwMjMwMzI3MTcyMTQ3LjE5NjYwNy0xLWNhc2FudG9zQHJlZGhhdC5jb20vCj4KPiBU
aGlzIG1ha2VzIHNlbnNlLiBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB0byBmaXgg
dGhlIGxpbmsuCj4KPiAtLQo+IENhcmxvcyBTYW50b3MgPHVuaXhtYW5pYUBnbWFpbC5jb20+CgpJ
IHNlbnQgYW4gdXBkYXRlZCBwYXRjaDoKCiAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNTIzMjMxNjQ1LjMzODg2LTEtdW5peG1hbmlh
QGdtYWlsLmNvbS8KCi0tIApDYXJsb3MgU2FudG9zIDx1bml4bWFuaWFAZ21haWwuY29tPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
