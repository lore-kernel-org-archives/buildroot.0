Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D2AC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1884B40153;
	Tue,  2 Apr 2024 19:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJj2RDimks8C; Tue,  2 Apr 2024 19:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19AB40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F19AB40640;
	Tue,  2 Apr 2024 19:37:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4595C1BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 325E340640
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXlRlS9PJTst for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:37:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 535FC40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 535FC40153
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 535FC40153
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:37:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3436b096690so146201f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712086653; x=1712691453;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gx9BMg7aOYV46Q3m1HSeX1RetXTtf5Bx03i+Hu7FR7A=;
 b=wbvSwyCFUrEMSFx4dpZxSuJ+rQrYt7QetEH/V9dePjJY63ez6LCcV+bb/mW0lyFUbv
 QKITxH75Hwn0GL/6iFJeZiT394XDQxNX7jK4+l68qVyIB0gFp0hDyQK2/uNSsBe2zGm1
 kqCKJDL51OtbEeX69irQB4uz2VgEAwKutuboN/33FipD5ABv2GX5jgGIsjeOCDEWImP7
 hUoI9hqhb7NB24frdfeEX5tFiJRtIFndZrnG7+F98oOFUWwff5QB01dKHqXuFrton8xF
 BUdsOqt36Z8I5W25tM4YVdElr/6BeGX1Q048VShwFEV1EZ+eRJ0/MtWVrFQBL6NtK1aX
 4+Xw==
X-Gm-Message-State: AOJu0YycMCOA4rJPZUhQLJqUXxdjbvo9exeHO7+Q+uwxrkgsh9LCAanC
 r40DDFeO/+/cyy17LzLqCjeo81neb+WE0Bb1+SpXu5UZ2d3c4yf7eV9gqcEr4Fu0qrhrdjVdYXQ
 e
X-Google-Smtp-Source: AGHT+IHYHDhVlPkkdpsUSV0kNwWswTTTb+F+w4A8R3x//HIek51tV6DPc5GCg50IimXet40dFwV0Jg==
X-Received: by 2002:a5d:6307:0:b0:343:8660:b0a8 with SMTP id
 i7-20020a5d6307000000b003438660b0a8mr434237wru.4.1712086652638; 
 Tue, 02 Apr 2024 12:37:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004148c3685ffsm19211802wmq.3.2024.04.02.12.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:37:31 -0700 (PDT)
Message-ID: <471e44c7-5bff-4d9b-8dff-00c99ef19214@mind.be>
Date: Tue, 2 Apr 2024 21:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patricia Holden <pholden@nklabs.com>
References: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
 <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
 <CAJ6EmCcEAuv8i_RC5FbVLueXaCLYm1T-GsuEtmo1wNCPOsRmCw@mail.gmail.com>
 <b5434307-aaf8-4ee1-a41a-00d9730f332c@mind.be>
 <CAJ6EmCdiSJk0Mora4P401KPv3vhXOpSGEthujBh37Lg_kAc52w@mail.gmail.com>
 <CAJ6EmCesk+mnBYocn4N0Hz+rU3udi+4U_9ZR7yQ9zyhrNvoFoA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAJ6EmCesk+mnBYocn4N0Hz+rU3udi+4U_9ZR7yQ9zyhrNvoFoA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712086653; x=1712691453; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gx9BMg7aOYV46Q3m1HSeX1RetXTtf5Bx03i+Hu7FR7A=;
 b=iXBV4rzkjdNvcykWPjohvqYmdAng6cXHyD31aYr+dmDaE+LROYUoi1KvnLCuAwY6Hq
 fTEmvTG10NcFpEyyoynljjAjdYGkR6NfzbwVK64SO3ZZ4VJNfqAUFR0WpbEuu6u/r0m7
 XPYmWvivwAsRZgRkagYa6a7/8PvMkauUHBlQlRMRlS9fcveVzGJrWXC3tU7YnAZhpdsb
 pBAKdSz5hSbRK5yyGGeWzTIV/gS4wpx2tCSzY9vDszW1MoLPYnoC2uysvE7z+Jl9nn3Z
 QUbMNhiSfG3m4qvL9GBTrRQ0xS+UymKphGCLlLDHLhLPH3m4ax5aGOIhJ9+8JPyitJ+n
 celA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iXBV4rzk
Subject: Re: [Buildroot] Is there an official browser patch for Buildroot?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wNC8yMDI0IDAwOjI3LCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gSSBkbyBoYXZl
IGEgVEkgU0stQU02MsKgZGV2IGJvYXJkIHRvIHVzZSB0b28uwqAgSWYgc29tZW9uZSBjb3VsZCBo
ZWxwIG1lIG91dCB3aXRoIAo+IHNldHRpbmcgdXAgQnVpbGRyb290IHRvIGp1c3QgYnJpbmcgdXAg
YSBzaW5nbGUgcGFnZSB3ZWIgYnJvd3NlciBzbyBJIGNhbiBzdGFydCAKPiBteSByZWFjdC1hcHAg
ZnJvbnRlbmQgVUksIHRoYXQgd291bGQgYmUgYXdlc29tZSEKPiAKPiBPbiBNb24sIEFwciAxLCAy
MDI0IGF0IDU6MDnigK9QTSBQYXRyaWNpYSBIb2xkZW4gPHBob2xkZW5AbmtsYWJzLmNvbSAKPiA8
bWFpbHRvOnBob2xkZW5AbmtsYWJzLmNvbT4+IHdyb3RlOgo+IAo+ICAgICBVbmZvcnR1bmF0ZWx5
IEkgY2Fubm90IHVzZSBXUEVXZWJLaXQgd2l0aCBCZWFnbGVwbGF5wqBkZXYgYm9hcmQgSSdtIHVz
aW5nLiAKPiAgICAgSXQgcmVxdWlyZXMgT3BlbkdMIHdoaWNoIGhhcyBubyBCZWFnbGVwbGF5IHN1
cHBvcnQgYXQgdGhlIG1vbWVudC7CoCBXaGF0CgogIEJvdGggQmVhZ2xlcGxheSBhbmQgU0stQU02
MiBoYXZlIHRoZSBBTTYyNSB3aXRoIHRoZSBzYW1lIFJvZ3VlIEdQVSwgbm8/IEFGQUlLIAp0aGUg
ZHJpdmVyIGZvciB0aGF0IGhhc24ndCBiZWVuIGludGVncmF0ZWQgaW4gQnVpbGRyb290IHlldCAo
SSB0aGluayBpdCdzIFsxXSkuIApBbmQgd2UgZG9uJ3QgaGF2ZSBhIGRlZmNvbmZpZyBmb3IgQmVh
Z2xlcGxheSB5ZXQgYnV0IEkgZXhwZWN0IGl0IHNob3VsZCBiZSAKcHJldHR5IHNpbWlsYXIgdG8g
dGlfYW02Mnhfc2tfZGVmY29uZmlnLgoKPiAgICAgYWJvdXQgbWF0Y2hib3gtd2luZG93LW1hbmFn
ZXI/CgogIG1hdGNoYm94IGlzIGEgd2luZG93IG1hbmFnZXIsIG5vdCBhIGJyb3dzZXIuCgogIFJl
Z2FyZHMsCiAgQXJub3V0Cgo+IAo+ICAgICBPbiBNb24sIEFwciAxLCAyMDI0IGF0IDM6NTPigK9Q
TSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmUKPiAgICAgPG1haWx0bzphcm5v
dXRAbWluZC5iZT4+IHdyb3RlOgo+IAo+IAo+IAo+ICAgICAgICAgT24gMDEvMDQvMjAyNCAyMDo1
NiwgUGF0cmljaWEgSG9sZGVuIHdyb3RlOgo+ICAgICAgICAgID4gSSBqdXN0IG5lZWQgYSBzaW1w
bGUgd2ViIHBhZ2UgSSBjYW4gcnVuIGEgcmVhY3QgYXBwIG9uLsKgIElmIHlvdSBrbm93Cj4gICAg
ICAgICBvZiBhbnkKPiAgICAgICAgICA+IGV4YW1wbGVzIG9mIHRoaXMsIHBsZWFzZSBzaGFyZSHC
oCBJIGhhdmUgdHJpZWQgdXNpbmcgbWF0Y2hib3gsIGJ1dCBub3QKPiAgICAgICAgIHN1cmUgSSdt
Cj4gICAgICAgICAgPiBjb25maWd1cmluZyBpdCBjb3JyZWN0bHkuCj4gCj4gICAgICAgICAgwqAg
VGhhdCdzIGV4YWN0bHkgd2hhdCBxdC13ZWJraXQta2lvc2sgaXMgbWVhbnQgZm9yLiBPaCwgYW5k
IEkgZm9yZ290IGNvZwo+ICAgICAgICAgZWFybGllcjogdGhhdCdzIHRoZSBzYW1lIGtpbmQgb2Yg
dG9vbCBidXQgd2l0aG91dCBwdWxsaW5nIGluIFF0LiBOb3RlOgo+ICAgICAgICAgeW91IG5lZWQK
PiAgICAgICAgIHRvIGVuYWJsZSBXUEVXZWJLaXQgdG8gYmUgYWJsZSB0byBlbmFibGUgY29nIGlu
IEJ1aWxkcm9vdC4KPiAKPiAgICAgICAgICDCoCBjb2cgaXMgbXVjaCBiZXR0ZXIgbWFpbnRhaW5l
ZCAtIEkgYWRkZWQgQWRyaWFuIGluIENjIHdobyB3b3JrcyBvbgo+ICAgICAgICAgV1BFV2ViS2l0
Cj4gICAgICAgICBhbmQgY29nIGluIEJ1aWxkcm9vdC4KPiAKPiAgICAgICAgICDCoCBSZWdhcmRz
LAo+ICAgICAgICAgIMKgIEFybm91dAo+IAo+ICAgICAgICAgID4KPiAgICAgICAgICA+IE9uIE1v
biwgQXByIDEsIDIwMjQgYXQgMjozOOKAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRA
bWluZC5iZQo+ICAgICAgICAgPG1haWx0bzphcm5vdXRAbWluZC5iZT4KPiAgICAgICAgICA+IDxt
YWlsdG86YXJub3V0QG1pbmQuYmUgPG1haWx0bzphcm5vdXRAbWluZC5iZT4+PiB3cm90ZToKPiAg
ICAgICAgICA+Cj4gICAgICAgICAgPgo+ICAgICAgICAgID4KPiAgICAgICAgICA+wqAgwqAgwqBP
biAwMS8wNC8yMDI0IDIwOjAwLCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gICAgICAgICAgPsKg
IMKgIMKgID4gSSBmb3VuZCBhIGZldyB0b3BpY3Mgb25saW5lIGFib3V0IGEgcGF0Y2ggZm9yIGNo
cm9taXVtLCBidXQKPiAgICAgICAgIHRoZXkgYXJlCj4gICAgICAgICAgPsKgIMKgIMKgZGF0ZWQg
MjAxOAo+ICAgICAgICAgID7CoCDCoCDCoCA+IG9yIG9sZGVyLsKgIElzIHRoZXJlIGFuIG9mZmlj
aWFsIHBhdGNoIHRvIGFkZCB0aGUKPiAgICAgICAgIGNocm9taXVtLWJyb3dzZXIgYXMgYQo+ICAg
ICAgICAgID7CoCDCoCDCoHBhY2thZ2UKPiAgICAgICAgICA+wqAgwqAgwqAgPiBmb3IgQnVpbGRy
b290P8KgIE9yIGhvdyBhYm91dCAibWluaWJyb3dzZXIiLCB3aGljaCBJIGhhdmUgYWxzbwo+ICAg
ICAgICAgc2VlbiB0b3BpY3MKPiAgICAgICAgICA+wqAgwqAgwqBpbiBhbgo+ICAgICAgICAgID7C
oCDCoCDCoCA+IG9ubGluZSBzZWFyY2g/Cj4gICAgICAgICAgPgo+ICAgICAgICAgID7CoCDCoCDC
oCDCoCBJIGRvbid0IHRoaW5rIHRoZXJlIGhhcyBldmVyIGJlZW4gYW4gYXR0ZW1wdCB0byBhdHRl
bXB0Cj4gICAgICAgICBjaHJvbWl1bSBpdHNlbGYsIGJ1dAo+ICAgICAgICAgID7CoCDCoCDCoHRo
ZXJlIHdhcyBhbiBhdHRlbXB0IGF0IHBhdGNoZXMgZm9yIENocm9taXVtIEVtYmVkZGVkIEZyYW1l
d29yawo+ICAgICAgICAgKENFRikuIFRoYXQncwo+ICAgICAgICAgID7CoCDCoCDCoG5vdCBhIGJy
b3dzZXIsIGhvd2V2ZXIsIGp1c3QgYSBicm93c2VyIGVuZ2luZS4gQW5kIGFueXdheSBpdAo+ICAg
ICAgICAgdHVybmVkIG91dCB0aGF0Cj4gICAgICAgICAgPsKgIMKgIMKgQ2hyb21pdW0gKGFuZCBm
aXJlZm94KSBhcmUgd2F5IHRvbyBjb21wbGljYXRlZCB3aXRoIHRvbyBtYW55IHZlbmRvcmVkCj4g
ICAgICAgICAgPsKgIMKgIMKgZGVwZW5kZW5jaWVzIGFuZCBjcmF6eSBidWlsZHN5c3RlbXMuCj4g
ICAgICAgICAgPgo+ICAgICAgICAgID7CoCDCoCDCoCDCoCBUaGVyZSBhcmUgYSBidW5jaCBvZiBh
bHRlcm5hdGl2ZSBicm93c2VyIGVuZ2luZXM6Cj4gICAgICAgICBxdDV3ZWJlbmdpbmUsIHF0NXdl
YmtpdCwKPiAgICAgICAgICA+wqAgwqAgwqB3ZWJraXRndGssIHdwZXdlYmtpdC4KPiAgICAgICAg
ICA+Cj4gICAgICAgICAgPsKgIMKgIMKgIMKgIFRoZXJlIGFyZSBhbHNvIGEgZmV3IHNpbXBsZSAi
ZnJvbnRlbmRzIiBmb3IgdGhlc2UsIHRoYXQKPiAgICAgICAgIGJhc2ljYWxseSByZW5kZXIgYQo+
ICAgICAgICAgID7CoCDCoCDCoHNpbmdsZSB3ZWJwYWdlIGFuZCB0aGVuIGFsbG93IHlvdSB0byBi
cm93c2UgKHNvIG5vIHRoaW5ncyBsaWtlCj4gICAgICAgICBoaXN0b3J5LAo+ICAgICAgICAgID7C
oCDCoCDCoGJvb2ttYXJrcywgcGx1Z2lucywgZXRjLik6IHF0LXdlYmtpdC1raW9zaywgcXQ1d2Vi
dmlldzsgYW5kIGEKPiAgICAgICAgIG1vcmUgY29tcGxldGUKPiAgICAgICAgICA+wqAgwqAgwqBi
cm93c2VyOiBtaWRvcmkuCj4gICAgICAgICAgPgo+ICAgICAgICAgID7CoCDCoCDCoCDCoCBGaW5h
bGx5LCB0aGVyZSdzIGFsc28gdGhlIHRleHQtbW9kZSBicm93c2VyIGxpbmtzLCBidXQgSSBkb24n
dAo+ICAgICAgICAgc3VwcG9zZSB0aGF0Cj4gICAgICAgICAgPsKgIMKgIMKgdGhhdCBpcyB3aGF0
IHlvdSdyZSBsb29raW5nIGZvci4KPiAgICAgICAgICA+Cj4gICAgICAgICAgPgo+ICAgICAgICAg
ID7CoCDCoCDCoCDCoCBSZWdhcmRzLAo+ICAgICAgICAgID7CoCDCoCDCoCDCoCBBcm5vdXQKPiAg
ICAgICAgICA+Cj4gICAgICAgICAgPsKgIMKgIMKgID4KPiAgICAgICAgICA+wqAgwqAgwqAgPiBU
aGFua3MhCj4gICAgICAgICAgPsKgIMKgIMKgID4gUGF0IEhvbGRlbiwgTksgTGFicwo+ICAgICAg
ICAgID7CoCDCoCDCoCA+Cj4gICAgICAgICAgPsKgIMKgIMKgID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgICAgICAgICA+wqAgwqAgwqAgPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gICAgICAgICAgPsKgIMKgIMKgID4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4KPiAgICAgICAgIDxtYWls
dG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zz4+Cj4gICAgICAgICAgPsKgIMKgIMKgID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gICAgICAgICA8aHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Pgo+ICAgICAgICAgID7CoCDCoCDCoDxo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAg
ICAgICAgIDxodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3Q+Pgo+ICAgICAgICAgID4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
