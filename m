Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42430C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 10:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDD994165D;
	Sat, 23 Jul 2022 10:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD994165D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3Kpxy8KiCBb; Sat, 23 Jul 2022 10:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A79E041655;
	Sat, 23 Jul 2022 10:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A79E041655
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1021F1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE7141655
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 10:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE7141655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdX5tkgnQYNg for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 10:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7861C41654
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7861C41654
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 10:34:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k11so9091294wrx.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 03:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=uMUclKwEGUPt8JBsBZQ6GZh+dCq1GxcnnVJwzW4LgtU=;
 b=px0d+cbgKEaHdaKZLZPtt/5wEJv5y0ojDpwjdOLS1cHl4985n38H7rz5qFRRlO1YEP
 cb4FDLrs2hxJAc5OlxhItQ1I6GMzInOgB2hzNDzhYzNWk/KADc7HoE+IJUjAzFPhqT19
 qLrjXIH4hLrayb93SRgguRnn+DU2VJUBzDy/aLDywtXrA87xmRSzuZBE5XbFI5/aUdJU
 HYV2gW5R1H/yTWCBzebj0qo9V+0hpF/WDibvPiwu8dF96SF4tQxk0EO4mdN8MeMBcUn1
 W1WjuT4OALrgd6ILbrV6HyNt14F2wgXK4/o4fpNP6sXX9CiuLx1yTGEaVJq0gE8AK8Og
 HmlQ==
X-Gm-Message-State: AJIora9OlbZFjrmd9iW1UrER/7JJatIC33A8reemBZtePrslmwQZKDy7
 d9WfwMRW6vMiXOWGFN+p94Li7HwFEPM1hg==
X-Google-Smtp-Source: AGRyM1sAhT7nmQOpFBifn4gzwVjP4qr+pIBZVM1fQFyWiPQnuvjvHNrtulE86h0KngX/51BqkuRoAA==
X-Received: by 2002:adf:ee85:0:b0:21e:485a:9720 with SMTP id
 b5-20020adfee85000000b0021e485a9720mr2379751wro.579.1658572449145; 
 Sat, 23 Jul 2022 03:34:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc859000000b003a0375c4f73sm7502855wml.44.2022.07.23.03.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 03:34:08 -0700 (PDT)
Message-ID: <c8fc15ef-f5dd-4a09-0975-238c9a0e9d84@mind.be>
Date: Sat, 23 Jul 2022 12:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
References: <20220719131605.337057-1-nolange79@gmail.com>
 <20220719131605.337057-2-nolange79@gmail.com>
 <20220719154504.GJ2249625@scaer>
 <bdd21bf7-754c-2fb1-995e-f2d13cfddbb7@mind.be>
Organization: Essensium/Mind
In-Reply-To: <bdd21bf7-754c-2fb1-995e-f2d13cfddbb7@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=uMUclKwEGUPt8JBsBZQ6GZh+dCq1GxcnnVJwzW4LgtU=;
 b=dI5vrg9yX4lHkYHkq0A7MJn+IAp0nM2WkB8H2kVAvhIn5LWfcvDGxi7j1WEor1o3gI
 QAnnl5NZzvxGnFHCJA0G0Af4BX3QSizqyq7/u6GzyYkvPqLiWpCPc6MqlOMZX9Sd8tqo
 Oykbp/f8fPYDWI7+jYrLfUenvpArfB39OtUropZg/i6W2hz8Z3HHolPTdCKfwIy/aeNT
 aD75VoQsLgbFEcPrGlDqH9mDRo+cfU4LEKAGaYon3A/J6Lb5s80iohYX99K4wRRIcKWa
 3Z+DA0z6JSe/xuRPNWVs1HXoKdD7YYUhQ+2tuVF5dwx475U7gTCF7kqJEzlJ6+2OPIQc
 SciA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dI5vrg9y
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: allow package to be
 used without init system
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIyLzA3LzIwMjIgMjM6MjksIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxOS8wNy8yMDIyIDE3OjQ1LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+PiBOb3JiZXJ0LCBBbGws
Cj4+Cj4+IE9uIDIwMjItMDctMTkgMTU6MTYgKzAyMDAsIE5vcmJlcnQgTGFuZ2Ugc3Bha2UgdGh1
c2x5Ogo+Pj4gQWxsb3cgc3lzdGVtZCB0byBiZSBidWlsdCBhcyBub3JtYWwgcGFja2FnZSwgdGhp
cyBmb3IgZXhhbXBsZQo+Pj4gYWxsb3dzIGJ1aWxkaW5nIHN5c3RlbWQtYm9vdCB3aXRob3V0IGFu
eSBpbml0IHN5c3RlbS4KPj4KPj4gSG93IGhhcyB0aGUgc2l0dWF0aW9uIHdpdGggdXBzdHJlYW0g
ZXZvbHZlZCBzaW5jZSBsYXN0IHRpbWUgdGhlIHRvcGljCj4+IHdhcyByYWlzZWQgaGVyZToKPj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2NvdmVyLjE1NDU4MTQzMzQuZ2l0Lnlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyLyN0Cj4+IGFuZCBlc3BlY2lhbGx5IHRoZSBzdWItdGhyZWFk
Ogo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvZDM4MjM5Zjg2Zjk5OTI0ZTg3
ZGNiNmUwNDViMmRlM2FjMGNiNDM1Zi4xNTQ1ODE0MzM0LmdpdC55YW5uLm1vcmluLjE5OThAZnJl
ZS5mci8KPj4KPj4gQXMgZmFyIGFzIEkga25vdyAoYW5kIHVuZGVyc3RhbmQpLCB1cHN0cmVhbSBo
YXMgZGVjaWRlZCB0byB0aWUgdGhlIGJ1aWxkCj4+IG9mIHN5c3RlbWQtYm9vdCAoZm9ybWVybHkg
dGhlIHN0YW5kYWxvbmUgZ3VtbWlib290KSB0byB0aGUgYnVpbGQgb2YgdGhlCj4+IHJlc3Qgb2Yg
dGhlIHN5c3RlbWQgc3VpdGU7IHRoZXkgZGlkIG5vdCBhY2NlcHQgdG8gbWFrZSBpdCBwb3NzaWJs
ZSB0bwo+PiBvbmx5IGJ1aWxkIHN5c3RlbWQtYm9vdCB0byB1c2UgaXQgb3V0c2lkZSB0aGUgc3lz
dGVtZCBlY29zeXN0ZW0uCj4+Cj4+IMKgRnJvbSBCdWlsZHJvb3QncyBwZXJzcGVjdGl2ZSwgYWxs
b3dpbmcgdG8gYnVpbGQgc3lzdGVtZCB3aXRob3V0IGl0IGJlaW5nCj4+IGFuIGluaXQgc3lzdGVt
LCBhbmQgd2l0aG91dCB0aGUgcG9zc2liaWxpdHkgdG8ganVzdCBidWlsZCBzeXN0ZW1kLWJvb3Qs
Cj4+IGlzIGFza2luZyBmb3IgdHJvdWJsZXMgZG93biB0aGUgbGluZS4KPgo+IMKgSG93ZXZlciwg
aXQgZG9lcyBtYWtlIHNlbnNlIGlmIHlvdSdyZSBub3QgYWN0dWFsbHkgYnVpbGRpbmcgYSBmdWxs
IHN5c3RlbS4gCj4gVGhhdCdzIG5vdCBhIHVzZSBjYXNlIHRoYXQgaXMgcmVhbGx5IHdlbGwgc3Vw
cG9ydGVkIGJ5IGJ1aWxkcm9vdCwgYnV0IHdlIAo+IHNob3VsZG4ndCBnbyBvdXQgb2Ygb3VyIHdh
eSB0byBhY3RpdmVseSBibG9jayB0aGF0IHVzZSBjYXNlLgoKIMKgLi4uIG9uIHRoZSBvdGhlciBo
YW5kLCB5b3UgY2FuIGp1c3Qgc2VsZWN0IHN5c3RlbWQgYXMgdGhlIGluaXQgc3lzdGVtIGV2ZW4g
aW4gCnRoYXQgY2FzZS4gSW4gdGhlIGVuZCwgaXRzIG9ubHkgZWZmZWN0cyBhcmU6CgotIHVzaW5n
IHRoZSBzeXN0ZW1kIHNrZWxldG9uIHJhdGhlciB0aGFuIHRoZSBlbXB0eSBza2VsZXRvbjsKCi0g
aW5zdGFsbGluZyB0aGUgc3lzdGVtZCB1bml0IGZpbGVzIGZvciBwYWNrYWdlcy4KCiDCoFRoZSBz
a2VsZXRvbiBpcyBub3QgbXVjaCBvZiBhbiBvdmVyaGVhZCBhbmQgaXMgcHJvYmFibHkgd2hhdCB5
b3Ugd2FudCBhbnl3YXk7IAp0aGUgc3lzdGVtZCB1bml0IGZpbGVzIHlvdSBwcm9iYWJseSB3YW50
IGFzIHdlbGwsIGFzIEkgb2JzZXJ2ZWQgYmVmb3JlLgoKCiDCoFNvIHNpbXBseSB1c2UgQlIyX0lO
SVRfU1lTVEVNRCBldmVuIGlmIHlvdSdyZSBub3QgYWN0dWFsbHkgdXNpbmcgYW55IGluaXQuCgoK
IMKgUmVnYXJkcywKIMKgQXJub3V0CgoKCj4KPiDCoEkndmUgYmVlbiB0aGlua2luZyBmb3IgYSB3
aGlsZSB0byBtYWtlIGFuIGV4cGxpY2l0IG9wdGlvbiBmb3IgdGhpcywgd2hpY2ggCj4gd291bGQg
YmFzaWNhbGx5IG92ZXJyaWRlL2Rpc2FibGUgYWxsIHRoZSBzeXN0ZW0vQ29uZmlnLmluIHN0dWZm
LiBUaGVyZSdzIGp1c3QgCj4gb25lIHRoaW5nIHRob3VnaDogaW4gc3VjaCBhIHVzZSBjYXNlLCBv
dSBwcm9iYWJseSBkbyBzdGlsbCB3YW50IHRvIGluc3RhbGwgdGhlIAo+IGFwcHJvcHJpYXRlIGlu
aXQgc2NyaXB0cywgc28gc2V0dGluZyBCUjJfSU5JVF9OT05FIGlzIG5vdCBleGFjdGx5IHRoZSBj
b3JyZWN0IAo+IGVpdGhlci4uLgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4KPj4gVGhl
IHRyaXZpYWxpdHkgb2YgeW91ciBwYXRjaCBkb2VzIG5vdCBtYWtlIGl0IHBvc3NpYmxlIHRvIG9u
bHkganVzdAo+PiBidWlsZCBzeXN0ZW1kLWJvb3Q7IGluc3RlYWQsIGl0IHN0aWxsIGJ1aWxkcyB0
aGUgd2hvbGUgc3lzdGVtZCBzdWl0ZSwKPj4gd2hpY2ggaGludHMgdGhhdCB1cHN0cmVhbSBkaWQg
bm90IG1ha2UgaXQgcG9zc2libGUgdG8gZG8gc2VwYXJhdGUKPj4gYnVpbGRzLgo+Pgo+PiBTbywg
dW5sZXNzIHRoaW5ncyBoYXZlIGV2b2x2ZWQgc3Vic3RhbnRpYWxseSwgSSBhbSBub3QgdmVyeSBm
b25kIG9mCj4+IGFsb3dpbmcgdGhpcywgYW5kIHN0YW5kIGJ5IHRoZSBkZWNpc2lvbiB0aGF0IHdh
cyBtYWRlIGJhY2sgdGhlbiAoaS5lLgo+PiBhYmlkZSBieSB1cHN0cmVhbSBkZWNpc2lvbiBhbmQg
dGllIHN5c3RlbWQtYm9vdCB0byB0aGUgc3lzdGVtZAo+PiBlY29zeXN0ZW0pLgo+Pgo+PiBSZWdh
cmRzLAo+PiBZYW5uIEUuIE1PUklOLgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBMYW5n
ZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgcGFja2FnZS9zeXN0ZW1kL0Nv
bmZpZy5pbiB8IDEgLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbiBiL3BhY2thZ2Uvc3lzdGVt
ZC9Db25maWcuaW4KPj4+IGluZGV4IDlmMWE3NzhlNTkuLmUwZjVkYmNlMGQgMTAwNjQ0Cj4+PiAt
LS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4+PiArKysgYi9wYWNrYWdlL3N5c3RlbWQv
Q29uZmlnLmluCj4+PiBAQCAtMTYsNyArMTYsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfU1lTVEVN
RF9BUkNIX1NVUFBPUlRTCj4+PiDCoCDCoCBtZW51Y29uZmlnIEJSMl9QQUNLQUdFX1NZU1RFTUQK
Pj4+IMKgwqDCoMKgwqAgYm9vbCAic3lzdGVtZCIKPj4+IC3CoMKgwqAgZGVwZW5kcyBvbiBCUjJf
SU5JVF9TWVNURU1ECj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfU1lTVEVN
RF9BUkNIX1NVUFBPUlRTCj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPj4+
IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMga21vZAo+Pj4gLS0gCj4+
PiAyLjM1LjEKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
