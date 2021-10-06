Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C18C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 18:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497A561130
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 18:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 497A561130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE78F40843;
	Wed,  6 Oct 2021 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQeYhHmKg3wC; Wed,  6 Oct 2021 18:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3436B4085A;
	Wed,  6 Oct 2021 18:24:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8E3E1BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 18:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9882883FDD
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 18:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQrZXeUwJEUm for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 18:24:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42BFD83EC9
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 18:24:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g8so13198693edt.7
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 11:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Phrm0u4o78Yn6hlvN2fN5mk9fqG0EJ7UieY7bbL94Vc=;
 b=IUmvu28DetiixmdE8Rrh13RaR+jOLrLhegeiK9UX4jXda+yOcXATYc5NraVoulgqQc
 CDcVryc2sH8NOyEOolCC0Osdrwo0qoH3lQMC9z0mZnFLS1nkm7t0zB7MgRSjKAyrKXGd
 4pmiU0xD4kyAc8js6x4rMTLkAEW+84rK/IUrIo6KsWM8kLFwRomLdmq2ZJftrUNhZmpH
 0pWtM3cS0+7GKp9T9tvkXw8o+sxKy1Kae/TUwYG3h0TiQcnY/WFC7YoDQe76IMs4O+Bb
 RoEMa7jf4Zhk37YlYxDFlTyUBHuYvi36eQ/04XwCLCxQEJ0Qnugw0qTiYTByZw5Jd1nz
 S4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Phrm0u4o78Yn6hlvN2fN5mk9fqG0EJ7UieY7bbL94Vc=;
 b=wyIZKSydJSto7teRjrP3KH8/uY8U+E+EGCbD5qVM6+9Zdb6FxLik+PhxGY3q8jCpHP
 S/7aAxdC6ZGnw+sXiurAwx291qopIt9q8ina+w/54rUCdANMZoErHfuRsH0NDnXyeLqI
 hFYlt5qN6GzB4i4SvBDTGvfu76zSpy9nHRPEPv2+aoXlsVq+R3xG2GxPQAVfaFwZhc6Y
 96aIQzmk7556hjyQd10Lbt1ToVdWBFGZ3SoJkni6q1XAWCDU8+nbv7AsKrfn1QO0si+o
 QC+lRJZDgoggZ2gJyz4QtbKTqLrvwSbFy0pcX/R6WnZ1b/Ajak85oZ7MQmu9i5WHyz86
 mrcg==
X-Gm-Message-State: AOAM532BGjnYEb9rzcZDGfSTTMbxx4uqaEZsRbrjl/7QLcuGQqpKdCYq
 nVKxjFnr45nVhQ96eobTA7AVCg==
X-Google-Smtp-Source: ABdhPJz4wMJF52IpYZcJSsrvwCuV/We8zD1ntCTUL9HZ68P6E8KkojB3e+azFJLWusl4N9aF5ZiqOw==
X-Received: by 2002:aa7:d895:: with SMTP id u21mr35731671edq.310.1633544685290; 
 Wed, 06 Oct 2021 11:24:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l19sm4181218edb.65.2021.10.06.11.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 11:24:44 -0700 (PDT)
Message-ID: <16c55b45-955a-ef8f-9346-e5590c8b5a66@mind.be>
Date: Wed, 6 Oct 2021 20:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, Vincent Fazio <vfazio@xes-inc.com>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
 <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
 <20210921223932.5d85a71d@gmx.net>
 <25e4db09-93fc-43e2-74ae-0efba65fab96@xes-inc.com>
 <d61b3361-d5da-d2b5-13af-0b9bec3eb806@xes-inc.com>
 <20210930215402.0badb3ec@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210930215402.0badb3ec@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
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
Cc: buildroot@buildroot.org, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMC8wOS8yMDIxIDIxOjU0LCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiBIZWxsbyBWaW5j
ZW50LCBhbGwsCj4gCj4gT24gVGh1LCAzMCBTZXAgMjAyMSAxNDoxOTowMyAtMDUwMCwgVmluY2Vu
dCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPiB3cm90ZToKPiAKPj4gUGV0ZXIsIGFsbCwKPj4K
Pj4gT24gOS8yMy8yMSA4OjU4IEFNLCBWaW5jZW50IEZhemlvIHdyb3RlOgo+Pj4gQWxsLAo+Pj4K
Pj4+IE9uIDkvMjEvMjEgMzozOSBQTSwgUGV0ZXIgU2VpZGVyZXIgd3JvdGU6Cj4+Pj4gSGVsbG8g
VmluY2VudCwgYWxsLAo+Pj4+Cj4+Pj4gT24gVHVlLCAyMSBTZXAgMjAyMSAwODowODoxMCAtMDUw
MCwgVmluY2VudCBGYXppbwo+Pj4+IDx2ZmF6aW9AeGVzLWluYy5jb20+IHdyb3RlOgo+Pj4+ICAg
Cj4+Pj4+IFBldGVyLCBhbGwsCj4+Pj4+Cj4+Pj4+IE9uIDkvMjAvMjEgNDo0MSBQTSwgUGV0ZXIg
U2VpZGVyZXIgd3JvdGU6Cj4+Pj4+PiBIZWxsbyBWaW5jZW50LAo+Pj4+Pj4KPj4+Pj4+IE9uIE1v
biwgMjAgU2VwIDIwMjEgMTY6MTk6NTcgLTA1MDAsIFZpbmNlbnQgRmF6aW8KPj4+Pj4+IDx2ZmF6
aW9AeGVzLWluYy5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcyBmb3IgdGhlIGluZm8s
IG9ubHkgZGlkIGEgcXVpY2sgcmVhZCBvZiB0aGUgUFIgMTYxOSwgdGhlIHByb2JsZW0KPj4+Pj4+
IHNlZW1zIFUtYm9vdCBzcGVjaWZpYyAobm90IHRoZSBidWlsZHJvb3QgZGVmYXVsdCBjYXNlKSBh
bmQgdGhlcmUgaXMKPj4+Pj4+IGFscmVhZHkgYSBzdWdnZXN0ZWQgVS1ib290IGZpeCAoc3VibWl0
dGVkIGJ5IHlvdSk/Cj4+Pj4+IFllcywgc29ycnkgSSB3YXMgbm90IHZlcnkgY2xlYXIgaW4gbXkg
ZW1haWwgeWVzdGVyZGF5IChJIHdhcyBzZW5kaW5nIGl0Cj4+Pj4+IG9uIG15IHdheSBvdXQgdGhl
IGRvb3IpLgo+Pj4+IE5vIHByb2JsZW0gOy0pLCB0aGUgaGludCB3YXMvaXMgdmVyeSB2YWx1YWJs
ZSEKPj4KPj4gVGhpcyBtYXkgbm8gbG9uZ2VyIGJlIGFuIGlzc3VlIG90aGVyIHBhY2thZ2VzIGhh
dmUgdG8gZGVhbCB3aXRoIFsxXQo+Pgo+IAo+IFRoYW5rcyBmb3IgdXBkYXRlIChhbmQgeW91ciBk
ZWJ1Z2dpbmcgZWZmb3J0cyA7LSkgKSwgd2lsbCB1cGRhdGUgbXkKPiBwYXRjaHNldCB0aGUgbmV4
dCBkYXlzLi4uCgogIEkgd2FzIGdvaW5nIHRvIGFwcGx5IHRoaXMgc2VyaWVzIGFuZCB0aGVuIEkg
c2F3IHRoaXMgY29tbWVudC4uLiBBcmUgeW91IHN0aWxsIApnb2luZyB0byB1cGRhdGUgdGhlIHBh
dGNoc2V0IG9yIHNob3VsZCB3ZSBhcHBseSBhcy1pcz8KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4g
Cj4gUmVnYXJkcywKPiBQZXRlcgo+IAo+Pj4+ICAgCj4+Pj4+IFllcywgdS1ib290IGlzIGFmZmVj
dGVkLCB0aG91Z2ggSSB0aGluayBlZGsyIG1heSBhbHNvIGJlIGFmZmVjdGVkLiBUaGUKPj4+Pj4g
dS1ib290IHBhdGNoIGhhcyBub3QgeWV0IGJlZW4gcmV2aWV3ZWQgYW5kIG1heSBub3QgbWFrZSBp
dCBmb3IgMjAyMS4xMAo+Pj4+Pgo+Pj4+PiBJIGp1c3Qgd2FudGVkIHRvIGdpdmUgYSBoZWFkcyB1
cCB0aGF0IGJ1bXBpbmcgdGhpcyBwYWNrYWdlIGNvdWxkIGhhdmUKPj4+Pj4gY29uc2VxdWVuY2Vz
IGZvciBzb21lIGNvbmZpZ3VyYXRpb25zLgo+Pj4+IFNvIHRoZXJlIGFyZSB0aGUgZm9sbG93aW5n
IHBvc3NpYmlsaXRpZXM6Cj4+Pj4KPj4+PiAtIG5ldmVyIHVwZGF0ZSBycGktZmlybXdhcmUgdG8g
bm90IGJyZWFrIGxlZ2FjeSB1LWJvb3QgKGFuZCBtYXliZQo+Pj4+IGVkazIgYW5kCj4+Pj4gIMKg
wqAgbWF5YmUgbGludXgtbWFpbmxpbmUgYW5kIG1heWJlIC4uLikgc2V0dXBzCj4+PiBEZWZpbml0
ZWx5IG5vdCByZWNvbW1lbmRpbmcgdGhpcy4KPj4+PiAtIGRlbGF5IHRoZSBycGktZmlybXdhcmUg
dXBkYXRlIHVudGlsIHVwLXRvLWRhdGUgdS1ib290IChhbmQgZWRrMiBhbmQKPj4+PiAuLi4pCj4+
Pj4gIMKgwqAgYXJlIGF2YWlsYWJsZSAoYXMgdGhpcyBidW1wIHNlZW1zIHRvIGZpeCBzb21lIG90
aGVyIHJlZ3Jlc3Npb25zIGUuZwo+Pj4+ICDCoMKgICdrZXJuZWw6IFNlY29uZCBhdHRlbXB0IHRv
IGZpeCB0aGUgQ1BVIHN0YXJ0dXAgZmFpbHVyZScgWzFdCj4+Pj4KPj4+PiAtIGFwcGx5IHRoZSBy
cGktZmlybXdhcmUgdXBkYXRlIG5vdyBhbmQgaG9wZSB0aGF0IHRoaXMgZW1haWwgdGhyZWFkIGlz
Cj4+Pj4gIMKgwqAgZm91bmQgYnkgYWxsIHBlb3BsZSBhZmZlY3RlZCBieSB0aGUgdS1ib290IChh
bmQgLi4uKSBkZWZlY3QsIGJ1dAo+Pj4+ICDCoMKgIGtlZXBzIHRoZSBkZWZhdWx0IGJ1aWxkcm9v
dC9ycGkgdXNlcnMgdXAtdG8tZGF0ZSA7LSkKPj4+Cj4+PiBQcm9iYWJseSBubyByZWFzb24gdG8g
ZGVsYXkgaXQgaWYgdGhlcmUgYXJlIG5vIGRlZmF1bHQgY29uZmlndXJhdGlvbnMKPj4+IHRoYXQg
dXRpbGl6ZSB0aGUgYWZmZWN0ZWQgcGFja2FnZXMsIGJ1dCBub3Qgc3VyZSBpZiBpdCBkZXNlcnZl
cyBhCj4+PiBtZW50aW9uIHNvbWV3aGVyZSBsaWtlCj4+PiBodHRwczovL2J1aWxkcm9vdC5vcmcv
ZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNfa25vd25faXNzdWVzIHNvCj4+PiB0aGUgaXNz
dWUgaXMgbW9yZSBjbGVhcmx5IGFkdmVydGlzZWQgdW50aWwgdGhlcmUgYXJlIHBhdGNoZXMgdG8g
Zml4Cj4+PiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMuCj4+Pgo+Pj4gSSdsbCBsZXQgdGhlIG1haW50
YWluZXJzIGRlY2lkZSB3aGF0IHRvIGRvLiBBZ2FpbiwgSSBqdXN0IHdhbnRlZCB0bwo+Pj4gbWFr
ZSBwZW9wbGUgYXdhcmUuCj4+PiAgIAo+Pj4+IFJlZ2FyZHMsCj4+Pj4gUGV0ZXIKPj4+Pgo+Pj4+
IFsxXQo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9maXJtd2FyZS9jb21taXQv
OWY5NzA4MTk5Zjg4MDllY2YxNjExOWQwNzE2Mzc1YmVlN2I3ZDhkNAo+Pj4+ICAgCj4+Pj4+PiBS
ZWdhcmRzLAo+Pj4+Pj4gUGV0ZXIKPj4+Pj4+Cj4+Pj4+PiAgIAo+PiBbMV0KPj4gaHR0cHM6Ly9n
aXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zpcm13YXJlL2NvbW1pdC9iNTI1N2RhNThjMGU2NTI2MzM1
OTJjNmZjZTA5YTdmM2IxMDBhMmViCj4+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
