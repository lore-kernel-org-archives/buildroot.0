Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31855C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E948277E;
	Wed, 27 Jul 2022 19:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E948277E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFZwg7O2Enhh; Wed, 27 Jul 2022 19:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 923CC82416;
	Wed, 27 Jul 2022 19:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923CC82416
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 057AD1BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A83400F1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A83400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDM0KLqSo9Gp for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:10:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F3FD400D8
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F3FD400D8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:10:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h8so25759933wrw.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vYrDKUXENn/DfUh8vKw/A9MTx5edG4zG5WdvDZAv8e0=;
 b=5no2KWDl/F+zz9m44m08yrzpzBpkqDcmjCGNk7en83JrNwJZSoPezB7N6/VIHbiFNi
 vnZJdK23uFMAKf1gq7UYvtBEWn+cCKAEpcVT1c2ofP/vcexR4lOC6Rrw/w+uys8Q/ayt
 zstC/HXMcOwN8i2+aVyIGM53+UH5F8+2DJcobz1AAx1vUM7fl+2q+StnETsLTGacfXLI
 5oO5WcrNcEE6/PAFjicTyU5/FxKMK64C3619CNMMHZVLl2BZrMBLt3HI3ujuDjZ3nnDx
 ZQxoG1QjtNLsjPm4EbUALnmsdUoqvkzMMZhsKQc70MbjnRGqpbW5OLNxNGK0HOd/uBYD
 5SBA==
X-Gm-Message-State: AJIora9JRvUFIaTuNhxKxrBZ0eQIesqQAvUofcaAc7lPvWBS3uxXYRSa
 cfYOAh09khrbVJDgPfpRvLUMcQ==
X-Google-Smtp-Source: AGRyM1tvxLWfXI/98NqXVfxNLMJ/hArlSkO4YibKtFJHC3y/Q7/pd1YQ1YQ51qHafCyZawGjbj/LPQ==
X-Received: by 2002:adf:fb08:0:b0:21e:a828:5064 with SMTP id
 c8-20020adffb08000000b0021ea8285064mr6066106wrr.261.1658948998304; 
 Wed, 27 Jul 2022 12:09:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 bs27-20020a056000071b00b0021ebff0a0fbsm3340980wrb.69.2022.07.27.12.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 12:09:57 -0700 (PDT)
Message-ID: <289f02de-d0f2-347f-28be-0cfe52478990@mind.be>
Date: Wed, 27 Jul 2022 21:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>
References: <20220109221650.777610-1-nolange79@gmail.com>
 <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
 <CADYdroP82ZnJLWzL0=DP1r2T-0nJe3c7xxC4QgwkNtF5dkC_8A@mail.gmail.com>
 <28488fd2-ab02-43c7-25da-cdcb3f37d83a@mind.be>
 <CADYdroNVSoUB-GkdRoXj64s+e+ECwE2sUfSs17kLcN-h_0_i7Q@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroNVSoUB-GkdRoXj64s+e+ECwE2sUfSs17kLcN-h_0_i7Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vYrDKUXENn/DfUh8vKw/A9MTx5edG4zG5WdvDZAv8e0=;
 b=L2/NrDKposs5WYcSXUrQ2NvDHb94VJ1NA+jHqA2OpF+4tfIAibmI+0bLwy4/j1aHVK
 m+gsZKlmFpg/hTtSr3B/GEZsrLzGjqMda6gGSPk+1BzkMVT1uwRiC5B3ZHUbcrU+I19I
 jo7slOUKfjjuIp4Xyl3PRZsw7lReIEsph/PeDdzeOb1gEVJLc6BN5mqhRjE0qVPQlCk2
 u/hzHvipysE3vkRsrlIN1+CufQKM/dDYnWy80+MKLkvbQ8ikAtRGOU0TIrt1Wj4efDdy
 uTmir4Y10l4QhmWE+NKAlwVI0dtN/sopwOatbiVwblU0ohI3qtiRaVkkL9QVXDGdjcGa
 CeFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L2/NrDKp
Subject: Re: [Buildroot] [PATCH v6 1/4] package/dbus-broker: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wNy8yMDIyIDE5OjMxLCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+IAo+IAo+IEFybm91
dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZSA8bWFpbHRvOmFybm91dEBtaW5kLmJlPj4g
c2NocmllYiBhbSBNaS4sIAo+IDI3LiBKdWxpIDIwMjIsIDE5OjA1Ogo+IAo+IAo+IAo+ICAgICBP
biAyNy8wNy8yMDIyIDE1OjQ3LCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+ICAgICAgPiBBbSBNaS4s
IDI3LiBKdWxpIDIwMjIgdW0gMTM6MDggVWhyIHNjaHJpZWIgQXJub3V0IFZhbmRlY2FwcGVsbGUK
PiAgICAgID4gPGFybm91dEBtaW5kLmJlIDxtYWlsdG86YXJub3V0QG1pbmQuYmU+PjoKW3NuaXBd
Cj4gICAgICA+PsKgIMKgIFNvIHRvIG1lIHRoZSBwcm9wZXIgYXBwcm9hY2ggc2VlbXMgdG8gY2hh
bmdlIGRidXMgaXRzZWxmIHNvIHRoZSBkYWVtb24gaXMKPiAgICAgID4+IG9wdGlvbmFsLCBpLmUu
IG9ubHkgbGliZGJ1cyBpcyBpbnN0YWxsZWQgaWYgdGhlIGRhZW1vbiBpcyBub3QgZW5hYmxlZCwK
PiAgICAgc2ltaWxhcgo+ICAgICAgPj4gdG8gZS5nLiBsaWJjdXJsLiBCUjJfUEFDS0FHRV9EQlVT
X0RBRU1PTiBzaG91bGQgZGVmYXVsdCB0byB5IGJlY2F1c2UKPiAgICAgdGhhdCdzIHdoYXQKPiAg
ICAgID4+IG1vc3QgcGVvcGxlIHdhbnQuIFdlJ2QgaGF2ZSB0byBnbyB0aHJvdWdoIGV4aXN0aW5n
IHBhY2thZ2VzIHRvIGNoZWNrIGlmIHRoZXkKPiAgICAgID4+IGRlcGVuZCBvbiBsaWJkYnVzIG9y
IG9uIHRoZSBkYWVtb24gLSBtb3N0bHkgaXQgd2lsbCBiZSB0aGUgZmlyc3QuIElmCj4gICAgIHRo
ZXJlIGlzIGEKPiAgICAgID4+IHBhY2thZ2UgdGhhdCByZWFsbHkgbmVlZHMgdGhlIGRhZW1vbiAo
SSBkb24ndCBhY3R1YWxseSB0aGluayBzbyksIHRoZW4KPiAgICAgd2UgbWlnaHQKPiAgICAgID4+
IG5lZWQgdG8gaW50cm9kdWNlIGEgdmlydHVhbCBwYWNrYWdlIGZvciB0aGUgZGFlbW9uLiBSZWdh
cmRsZXNzLCBkYnVzLWJyb2tlcgo+ICAgICAgPj4gc2hvdWxkIGRlcGVuZCBvbiAhQlIyX1BBQ0tB
R0VfREJVU19EQUVNT04uCj4gCj4gICAgICDCoCBMb29raW5nIG1vcmUgZGV0YWlsZWQgYXQgaXQs
IHRoaXMgc2VlbXMgdG9vIGNvbXBsaWNhdGVkLiBkYnVzIGRvZXNuJ3QKPiAgICAgb2ZmZXIgYQo+
ICAgICB3YXkgdG8gaW5zdGFsbCBvbmx5IHRoZSBsaWJyYXJ5LiBBbHNvIGluIHRlcm1zIG9mIHJv
b3RmcyBzaXplLCB0aGUgb25seQo+ICAgICBkaWZmZXJlbmNlIGlzIHRoZSBkYnVzLWRhZW1vbiBh
bmQgZGJ1cy1sYXVuY2ggYmluYXJpZXMsIHBsdXMgYSBmZXcgY29uZmlnCj4gICAgIGZpbGVzLgo+
ICAgICBOb3QgcmVhbGx5IHN1ZmZpY2llbnQgdG8gbWFrZSBpdCB3b3J0aCBpdC4KPiAKPiAgICAg
IMKgIFdoYXQgSSB3aWxsIGRvLCBJIHRoaW5rLCBpcyB0byBpbmNsdWRlIGxvZ2ljIGluIGRidXMg
dG8gcmVtb3ZlIHRoZQo+ICAgICBhY3RpdmF0aW9uCj4gICAgIHVuaXRzIChib3RoIHRoZSBzZXJ2
aWNlIGFuZCB0aGUgc29ja2V0KSB3aGVuIGRidXMtYnJva2VyIGlzIGVuYWJsZWQuIEl0IGlzCj4g
ICAgIHNsaWdodGx5IG1lc3N5IGJlY2F1c2UgZGJ1cy5tayA8aHR0cDovL2RidXMubWs+IGFuZCBk
YnVzLWJyb2tlci5tawo+ICAgICA8aHR0cDovL2RidXMtYnJva2VyLm1rPiBiZWNvbWUgZmFpcmx5
IHRpZ2h0bHkgd292ZW4KPiAgICAgdG9nZXRoZXIsIGJ1dCBJIHRoaW5rIGl0J3Mgd29ydGggaXQg
ZnJvbSBhIHVzYWJpbGl0eSBwZXJzcGVjdGl2ZS4KPiAKPiAKPiBTb3VuZHMgbWVzc3kgdG9vLAoK
ICBBZ3JlZWQuIEJ1dCB0aGUgb25seSB1bm1lc3N5IHRoaW5nIHRoYXQgSSBmb3VuZCBzbyBmYXIg
aXMgdG8gbm90IHVzZSAKZGJ1cy1icm9rZXIgYXQgYWxsIGlmIG9yaWdpbmFsIGRidXMgaXMgc2Vs
ZWN0ZWQsIGFuZCBJIHRoaW5rIHRoYXQgdGhhdCBwcmV0dHkgCm11Y2ggZGVmZWF0cyB0aGUgcHVy
cG9zZSBvZiBpbmNsdWRpbmcgZGJ1cy1icm9rZXIuCgo+IEkgd291bGQgcmF0aGVyIGhhdmUgYSBk
YnVzLWNvbW1vbiBwYWNrYWdlIHRoYXQgaW5jbHVkZXMgdGhlIHNvY2tldCBhbiBjb25maWcgCj4g
ZmlsZXMgKGFuZCBjcmVhdGVzIHRoZSB1c2VyIGlmIG5lY2Vzc2FyeSkuCgogIFRoYXQgaXMgYSBn
b29kIGlkZWEuIEhvd2V2ZXIsIGl0IG9ubHkgd29ya3MgZm9yIHRoZSB0d28gZGJ1cyBjb25maWd1
cmF0aW9uIApmaWxlcywgbm90IGZvciB0aGUgc3lzdGVtZCB1bml0cywgc28gaXQgb25seSBzb2x2
ZXMgaGFsZiBvZiB0aGUgbWVzcy4gQW5kIHRoZSAKYWRkZWQgYmVuZWZpdCBpcyBub3QgdGhhdCBn
cmVhdC4gQWxzbywgdGhleSBkb24ndCBjaGFuZ2UgdmVyeSBvZnRlbiBhbnkgbW9yZSAKdXBzdHJl
YW0gKHRoZSBsYXN0IGNoYW5nZSBpcyBmcm9tIDEyLzIxLCBiZWZvcmUgdGhhdCBpdCdzIDEyLzE3
KS4gU28gaW4gdGhlIGVuZCAKd2UgZGVjaWRlZCBub3QgdG8gZ28gZm9yIGRidXMtY29tbW9uLgoK
Cj4gVGhhdCBwYWNrYWdlIHdvdWxkIGRvd25sb2FkIGRidXMsIGJ1dCBub3QgYnVpbGQgaXQsIGlu
c3RlYWQganVzdCBjb3B5IG92ZXIgdGhvc2UgCj4gZmlsZXMuCj4gS2luZGEgbGlrZSB1dGlsLWxp
bnV4LWxpYnMKPiAKPiAKPiAgICAgID4gRGViaWFuIGRvZXMgc29tZXRoaW5nIHNpbWlsYXIsIGlu
Y2x1ZGluZyBzcGxpdHRpbmcgb2YgdGhlIHhtbCBjb25maWcgZmlsZXMKPiAgICAgID4gYW5kIGFj
dHVhbCBkYWVtb25zIGludG8gdGhlaXIgb3duIHBhY2thZ2VzLgo+ICAgICAgPgo+ICAgICAgPiBz
ZWUgWzFdLgo+ICAgICAgPgo+ICAgICAgPj4+IE5vdGUgYWJvdXQgdGhlIHVzZXI6IHRoZSBwYXRo
IHRvIHRoZSBzeXN0ZW0gYnVzIHNvY2tldCBpcyBhIHNvLWNhbGxlZAo+ICAgICAgPj4+ICJ3ZWxs
LWtub3duIGxvY2F0aW9uIjogaXQgaXMgZXhwZWN0ZWQgdG8gYmUgdGhlcmUsIGJ5IHNwZWMuIE1v
dmluZyBpdAo+ICAgICAgPj4+IGVsc2V3aGVyZSBpcyBnb2luZyB0byBicmVhayBleGlzdGluZyBw
cm9ncmFtcy4gU28sIHRoZSB1c2VyIHJ1bm5pbmcgdGhlCj4gICAgICA+Pj4gc3lzdGVtIGJ1cyBk
YWVtb24gbXVzdCBiZSBhYmxlIHRvIGNyZWF0ZSB0aGF0IHNvY2tldC4KPiAgICAgID4+Pgo+ICAg
ICAgPj4+IEFzIHdlIG1heSBoYXZlIHR3byBwYWNrYWdlcyBwcm92aWRpbmcgYSBzeXN0ZW0gYnVz
IGRhZW1vbiwgdGhleSBoYXZlIHRvCj4gICAgICA+Pj4gYmUgYm90aCBhYmxlIHRvIGNyZWF0ZSB0
aGUgc29ja2V0LCBhbmQgdGh1cyBtdXN0IGJvdGggYmUgYWJsZSB0byB3cml0ZQo+ICAgICAgPj4+
IGluIHRoZSBkaXJlY3RvcnkgY29udGFpbmluZyB0aGUgc29ja2V0LiBBbmQgc2luY2UgdGhleSBj
YW4gYmUgc3dpdGNoZWQKPiAgICAgID4+PiBhdCBydW50aW1lLCB0aGV5IG11c3QgYmUgcnVubmlu
ZyBhcyB0aGUgc2FtZSB1c2VyLgo+ICAgICAgPj4+Cj4gICAgICA+Pj4gV2UgY2FuJ3QganVzdCBy
ZWZlcmVuY2UgdGhlIG9yaWdpbmFsIGRidXMgdXNlciwgc28gd2UgZHVwbGljYXRlIHRoZQo+ICAg
ICAgPj4+IGVudHJ5LiBXaGF0IGlzIGltcG9ydGFudCwgaXMgdGhhdCB0aGUgdXNlciBiZSBuYW1l
ZCAnZGJ1cycsIGFzIHRoYXQncwo+ICAgICAgPj4+IHdoYXQgd2UgdXNlIGluIGJvdGggY2FzZXMu
Cj4gICAgICA+Pgo+ICAgICAgPj7CoCDCoCBJZiBpdCdzIGEgdmlydHVhbCBwYWNrYWdlLCB0aGVu
IHRoZSB1c2VyIGNvdWxkIGJlIGNyZWF0ZWQgYnkgdGhlIHZpcnR1YWwKPiAgICAgID4+IHBhY2th
Z2UgaXRzZWxmLgo+IAo+ICAgICAgwqAgSXQgd29uJ3QgYmUgYSB2aXJ0dWFsIHBhY2thZ2UsIHNv
IG5vIGxvbmdlciByZWxldmFudC4KPiAKPiAKPiAgICAgID4gd2l0aCBzeXN0ZW1kIHlvdSBwcm9i
YWJseSBkb250IGV2ZW4gbmVlZCBhIHJlYWwgdXNlciBmb3IgdGhlIGlzb2xhdGlvbgo+ICAgICAg
PiBiZW5lZml0cy4KPiAgICAgID4gU28gbWF5YmUgdGhpcyB3b3VsZCBqdXN0IGJlIG5lY2Vzc2Fy
eSBpZiBkYnVzIHV0aWxpdGllcyBhcmUgdXNlZCwKPiAgICAgID4geW91IGNhbiBhbHNvIGp1c3Qg
bGV0IHN5c3RlbWQgY3JlYXRlIHRoYXQgdXNlciBkeW5hbWljYWxseToKPiAgICAgID4KPiAgICAg
ID4gW1NlcnZpY2VdCj4gICAgICA+IC4uLgo+ICAgICAgPiBVc2VyPWRidXMKPiAgICAgID4gR3Jv
dXA9ZGJ1cyA+IER5bmFtaWNVc2VyPXRydWUKPiAKPiAgICAgIMKgIElmIHdlIGRvIHRoaXMgYm90
aCBpbiB0aGUgZGJ1cyBhbmQgdGhlIGRidXMtYnJva2VyIHVuaXRzLCB0aGVuIGluZGVlZCB3ZSBj
YW4KPiAgICAgcmVtb3ZlIHRoZSBkYnVzIHVzZXIuCj4gCj4gCj4gQUZBSVIgdGhlIHJlYXNvbiBm
b3IgdGhlIGRidXMgdG8gYmUgYSBzeXN0ZW0gdXNlciBpcyB0aGF0IGRidXMtbGF1bmNoIGNhbiBz
ZXR1aWQgCj4gaW50byBpdC4KPiBTbyBpdCBvbmx5IHdvcmtzIHdpdGhvdXQgc3lzdGVtIHVzZXIg
aWYgZGJ1cy1sYXVuY2ggaXMgbm90IHVzZWQuIERidXMtYnJva2VyIAo+IGRlbGVnYXRlcyB0aGlz
IGZ1bmN0aW9uYWxpdHkgdG8gc3lzdGVtIChkYnVzIGFjdGl2YXRpb24pCgogIFdlbGwsIHRoZSBz
ZXJ2aWNlIGZpbGUgc3RpbGwgY2FsbHMgZGJ1cy1icm9rZXItbGF1bmNoLCB3aGljaCBJIGd1ZXNz
IGRvZXMgCnNldHVpZCBiZWNhdXNlIHRoZSB1cHN0cmVhbSBzZXJ2aWNlIGZpbGUgZG9lc24ndCBo
YXZlIGFueSBVc2VyPSBvciBHcm91cD0KCiAgSSB0aGluayB3ZSdsbCBqdXN0IHN0aWNrIHRvIHdo
YXQgd2UgaGF2ZSBub3csIGFuZCBrZWVwIHRoZSB1cHN0cmVhbSBzZXJ2aWNlIApmaWxlIHJhdGhl
ciB0aGFuIGhhY2tpbmcgb3VyIG93bi4uLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiAKPiAg
ICAgIMKgIElmIEkgYWRkIHRoaXMganVzdCB0byBkYnVzLWJyb2tlciwgYnV0IGRidXMgc3RpbGwg
Y3JlYXRlcyBhIHN0YXRpYyB1c2VyLCBpcwo+ICAgICB0aGlzIGdvaW5nIHRvIGdpdmUgYSBwcm9i
bGVtIGZvciBzeXN0ZW1kPyBJLmUuIGRvZXMgc3lzdGVtZCBzdXBwb3J0IGEKPiAgICAgRHluYW1p
Y1VzZXI9dHJ1ZSBpZiB0aGUgdXNlciBleGlzdHMgYWxyZWFkeSBzdGF0aWNhbGx5PyBJIHRoaW5r
IHNvLi4uCj4gCj4gCj4gVGhpbmsgc28gdG9vLgo+IAo+IAo+ICAgICAgwqAgUmVnYXJkcywKPiAg
ICAgIMKgIEFybm91dAo+IAo+ICAgICAgPiBFeGVjU3RhcnQ9IS91c3IvYmluL2RidXMtYnJva2Vy
LWxhdW5jaCAtLXNjb3BlIHN5c3RlbSAtLWF1ZGl0Cj4gICAgICA+IEV4ZWNSZWxvYWQ9IS91c3Iv
YmluL2J1c2N0bCBjYWxsIG9yZy5mcmVlZGVza3RvcC5EQnVzCj4gICAgICA+IC9vcmcvZnJlZWRl
c2t0b3AvREJ1cyBvcmcuZnJlZWRlc2t0b3AuREJ1cyBSZWxvYWRDb25maWcKPiAKPiAgICAgW3Nu
aXBdCj4gCj4gCj4gTm9yYmVydAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
