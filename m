Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77126C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 20:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D06D6405E9;
	Thu, 18 Aug 2022 20:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D06D6405E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOb0K1vw5wnc; Thu, 18 Aug 2022 20:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC5D0403C8;
	Thu, 18 Aug 2022 20:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC5D0403C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9EBF1BF343
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F24B84013
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 20:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F24B84013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTFXWWKFhsN0 for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 20:15:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D3C83F67
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27D3C83F67
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 20:15:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gb36so5214795ejc.10
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8bqc5OmL2MnKhb+iPWv2BwcrovVNX6i4fSZpqE4nxRA=;
 b=fmAzBD+TVILVrX/CCTcyvdAeQ91yP8zGJ3P0B2Sn58NXmJ/LDBDeWB+FYDYvjW4Grz
 InyK0ijJrHhCc5p1fotyksbDWLn4VZu0ctSfRoGUgPayOLccUeo7OANl9gni5b4loZiV
 H6ud54hQPd08Qh+NAdt+4Ijd7EorBEP9EjYh+028z6MsN5N3VqMNkPfNfsaDf3EL6eVb
 09rqm6rz6nc+/ypSzV3Jf3chPOWlJHaVFmUcIHfv9V1DDhOyRAIwngD6k6Sh6KorrMlx
 ODV94Fx3Cgp+5PcpfaQR0O3m7cO3TnAOdWSpNap/oGEPp5C+Ar1KEFCL8fzISVHcTNBx
 sZ8w==
X-Gm-Message-State: ACgBeo1XepcK80GHzVZRf8Qwp98xC+jZIGc7HoFgzU4alriAU8oDpleV
 MnFQ3WjDPGeTNtNakWdD/GCh4A==
X-Google-Smtp-Source: AA6agR6QkspxS+/b0PUf4VnqsKVdp8KcG7hOGoYkk2VJIjMkXtXGPgQ4nXtqv9heDg+l2WiLMUwZ1w==
X-Received: by 2002:a17:907:724f:b0:731:9ec:10fc with SMTP id
 ds15-20020a170907724f00b0073109ec10fcmr2841840ejc.427.1660853731430; 
 Thu, 18 Aug 2022 13:15:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a056402040300b00445e1489313sm1667056edv.94.2022.08.18.13.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 13:15:31 -0700 (PDT)
Message-ID: <7f8e557f-d01d-3fe6-765e-253435fbeff0@mind.be>
Date: Thu, 18 Aug 2022 22:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
 <20220816210334.GP2854108@scaer> <87bksjc1ji.fsf@dell.be.48ers.dk>
 <fb8ee027-b516-39e6-7029-3286f3961332@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <fb8ee027-b516-39e6-7029-3286f3961332@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=8bqc5OmL2MnKhb+iPWv2BwcrovVNX6i4fSZpqE4nxRA=;
 b=KUFTiNJjYcAcBz0At7LhyIN1e6+D/Lrt1/bNufgdN9RSMnJDcGYVtpKx5iIRzpxQ42
 AMTvdsWaIw4ZUSksFuq51174JUPGbxSqoJQcGC7Sje7xQeFQhmiLmkRAOhCAcDEEdlG8
 IPY6nbcGMbUVLk0qoDNdGsYvonM9uBInkxHhC90yWo2+XESao4rQHfJOeSI5vmTM5SbU
 xqpcgQeTiMwaLxLUffCsPQrpSE3rl3Y1L8D6urBJLKsVT3MMvlG2+EPBSPvo4Jq1mZrP
 8MstmxzSdHgKgR3vdL0etCcg0AEhSrGcpD72aHmHBGA9a1N9Y4nY2V7VW2Ha+VjPsujl
 /raw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KUFTiNJj
Subject: Re: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default
 to glibc as the C library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wOC8yMDIyIDIxOjM1LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
TGUgMTYvMDgvMjAyMiDDoCAyMzozNywgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6Cj4+Pj4+
Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyaXRl
czoKPj4KPj4gICA+IFRob21hcywgQWxsLAo+PiAgID4gT24gMjAyMi0wOC0xNSAyMjoyOSArMDIw
MCwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPj4gICA+PiBU
aGlzIGlzIHBlcmhhcHMgdGhlIG1vc3QgY29udHJvdmVyc2lhbCBjaGFuZ2UgZm9yIEJ1aWxkcm9v
dCB0aGF0IGNhbgo+PiAgID4+IGJlIHdyaXR0ZW4gaW4gYSB0d28tbGluZXIuCj4+ICAgPj4KPj4g
ICA+PiBIaXN0b3JpY2FsbHksIHdlIGhhdmUgdXNlZCB1Q2xpYmMgYXMgb3VyIGRlZmF1bHQgQyBs
aWJyYXJ5LCBhcwo+PiAgID4+IEJ1aWxkcm9vdCB3YXMgY3JlYXRlZCBpbml0aWFsbHkgYXMgYSB0
ZXN0LWJlZCBmb3IgdUNsaWJjLCBhbmQgYWxzbwo+PiAgID4+IGJlY2F1c2UgdUNsaWJjIG1hZGUg
YSBsb3Qgb2Ygc2Vuc2UgZm9yIGVtYmVkZGVkIExpbnV4IHN5c3RlbXMsIGR1ZSB0bwo+PiAgID4+
IGl0cyBzbWFsbGVyIHNpemUgYW5kIGZpbmUtZ3JhaW5lZCBjb25maWd1cmFiaWxpdHkuCj4+ICAg
Pj4KPj4gICA+PiBTaW5jZSB0aGVuLCB0aGUgbGFuZHNjYXBlIG9mIGVtYmVkZGVkIExpbnV4IHN5
c3RlbXMgaGFzIGNoYW5nZWQuIEV2ZW4KPj4gICA+PiB0aG91Z2ggQnVpbGRyb290IGhhcHBpbHkg
c3VwcG9ydHMgcmVhbGx5IGxvdy1lbmQgZGV2aWNlcywgdGhlIHZhc3QKPj4gICA+PiBtYWpvcml0
eSBvZiBCdWlsZHJvb3QgdXNlcnMgYXJlIHF1aXRlIGNlcnRhaW5seSBydW5uaW5nIHRoZSByZXN1
bHRpbmcKPj4gICA+PiBzeXN0ZW0gb24gYSByZWFzb25hYmx5IHBvd2VyZnVsIHBsYXRmb3JtLCB3
aXRoIHNpZ25pZmljYW50IGFtb3VudCBvZgo+PiAgID4+IFJBTSBhbmQgc3RvcmFnZS4gSW4gdGhp
cyBjb250ZXh0LCB0aGUgYmVuZWZpdHMgb2YgdUNsaWJjIGFyZSBubyBsb25nZXIKPj4gICA+PiB0
aGF0IG11Y2ggcmVsZXZhbnQsIGFuZCBnbGliYyBjYXVzZXMgbGVzcyAidHJvdWJsZXMiLiBUaGVy
ZWZvcmUsIHRoaXMKPj4gICA+PiBwYXRjaCBwcm9wb3NlcyB0byB1c2UgZ2xpYmMgYXMgb3VyIGRl
ZmF1bHQgQyBsaWJyYXJ5IHdoZW4gdXNpbmcgdGhlCj4+ICAgPj4gaW50ZXJuYWwgdG9vbGNoYWlu
IGJhY2tlbmQgaW5zdGVhZCBvZiB1Q2xpYmMuCj4+ICAgPj4KPj4gICA+PiBPZiBjb3Vyc2UsIHdl
IHdpbGwga2VlcCB0aGUgc3VwcG9ydCBmb3IgdUNsaWJjLCB3aGljaCByZW1haW5zIGFuCj4+ICAg
Pj4gaW1wb3J0YW50IEMgbGlicmFyeSBjaG9pY2UsIGZvciBzcGFjZS1jb25zdHJhaW5lZCBzeXN0
ZW1zLCBvciBzaW1wbHkKPj4gICA+PiBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGFyZSBub3Qgc3Vw
cG9ydGVkIGJ5IGdsaWJjLgo+PiAgID4+Cj4+ICAgPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPj4KPj4gICA+IEFja2VkLWJ5
OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPj4KPj4gICA+IFllcywg
SSB3aWxsIGJlIGEgYml0IHNhZCB0aGF0IHdlIGRlbW90ZSB1Q2xpYmMtbmcsIGJ1dCBsZXQncyBm
YWNlIGl0Ogo+PiAgID4gdGhlIHdvcmQgbW92ZXMgb24sIGxldCdzIG1vdmUgYWxvbmcuCj4+Cj4+
IEFncmVlZC4KPj4KPj4gQWNrZWQtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJk
LmNvbT4KPj4KPiBUaGUgbmV4dCBtb3ZlIGlzIHByb2JhYmx5IGluY3JlYXNlIHRlc3Rpbmcgd2l0
aCBnbGliYyBpbiB0aGUgQnVpbGRyb290IHRlc3RzdWl0ZT8KCiAgSWYgeW91IG1lYW4gdGhlIGF1
dG9idWlsZGVyOiBubywgbm90IGF0IGFsbC4gUXVvdGluZyBKYW1lczogd2UgYWN0dWFsbHkgd2Fu
dCAKdGhlIGF1dG9idWlsZGVyIHRlc3RzIHRvIGZhaWwgLSBwYXNzaW5nIHRlc3RzIGFyZSBub3Qg
ImludGVyZXN0aW5nIi4gQW5kIHVDbGliYyAKYW5kIG11c2wgYXJlIG11Y2ggbW9yZSBsaWtlbHkg
dG8gbGVhZCB0byBmYWlsdXJlcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gQWNrZWQtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gUm9tYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
