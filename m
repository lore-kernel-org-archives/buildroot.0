Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98435C32789
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 16:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225C481496;
	Tue, 23 Aug 2022 16:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225C481496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ab4GJr6FKnYm; Tue, 23 Aug 2022 16:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4B3813F6;
	Tue, 23 Aug 2022 16:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4B3813F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 076C41BF300
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 16:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D59D480D0F
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 16:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59D480D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9GgCilDZE-y for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 16:14:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FADE813F6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FADE813F6
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 16:14:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id e21so13840622edc.7
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 09:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kQycJtw8422VW+Po1G8+5nq3k+RuIz8LTLT/xTvI5tY=;
 b=yrZT37niMZtHcCxc700wdWoXml3CqkT6wJQLGGE2DtP8NxJGJrHLH3jEa6tz39vqav
 AafMuHA3rw0sZcK5TgMCBjZru9s1boYkW8s0RFMFCgmBTlTbsZwlZgN7FBjZ04bT16DL
 q8VMm3K2a1mLU9hm26gQwoXHoPS2yulH/dzL7zbU3kOl5DfkWJ+nkEaq0y1+SdV8KrPp
 VgbBX9231H05/4MvKW2urH4yXraAEPKQYmrLS7AgTiSa3CNoJoWkIFcWxMo0DjgdIrrk
 yud0k/JW1He3eCsDqv1n0qpNf5LuOZGsKk4NdaC2lvXC3cUfb/JLjWaQqDGMDa6aqItp
 MBEw==
X-Gm-Message-State: ACgBeo2pcaH0El8ZNzZBxtpLzFOWqfeGu3BMHUMnb1TvicUJFTDNujVv
 TsdSz2jCDaW2xsyZHrw1GaIyRA==
X-Google-Smtp-Source: AA6agR6EZudg4bcwOtHuDoqMjL1rMTQCZdwUsqFcb5HpW/dI6+SvO1YzaMNMceFGTS+PXzcLoUZ3PQ==
X-Received: by 2002:a05:6402:270a:b0:446:c9e9:6e00 with SMTP id
 y10-20020a056402270a00b00446c9e96e00mr4185017edd.315.1661271245521; 
 Tue, 23 Aug 2022 09:14:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h14-20020aa7cdce000000b0043cf0d56a61sm1669921edw.8.2022.08.23.09.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 09:14:05 -0700 (PDT)
Message-ID: <528bd5b3-aefd-9196-1a81-ee59c5dd0e72@mind.be>
Date: Tue, 23 Aug 2022 18:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Francois Perrad <fperrad@gmail.com>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
 <20220821211709.GV2167049@scaer> <20220822212434.GG2167049@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220822212434.GG2167049@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=kQycJtw8422VW+Po1G8+5nq3k+RuIz8LTLT/xTvI5tY=;
 b=EhfTWAwAVWmUWAju07ad3YxiIffdlcxv3c361i+uYjWUngyRc93RAAX13AUeult/Ff
 u3YktXBHT9VOaFzIFSxGRIolJ4voYLI1jZJkax7adsEoqymXoYX1l4hofWeodVRPekY+
 X5wgNMbUUNAOabZw6WzKk8a322yEQRCB0q+rztNU7INMa/dnAsSW0xcxd+0HeEvvkYvN
 RSB2kWgUCoEIoTHn9YUVPUUVCAuSBrs14jHMrmfhFaLLzLD6W23I639XNejmZjcK6NnI
 6F6bn26u1U17jt8gtDVEcW7KrjbW/PINipXY8UWBA/ajc80zbTFGvA71HbW0qQX9cGFl
 XO7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EhfTWAwA
Subject: Re: [Buildroot] [PATCH 0/3] portable services: another use case of
 BR
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wOC8yMDIyIDIzOjI0LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEZyYW7Dp29pcywg
YWxsLAo+IAo+IE9uIDIwMjItMDgtMjEgMjM6MTcgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2Ug
dGh1c2x5Ogo+PiBPbiAyMDIyLTAyLTIxIDA1OjMwICswMTAwLCBGcmFuY29pcyBQZXJyYWQgc3Bh
a2UgdGh1c2x5Ogo+Pj4gVGhpcyBzZXJpZXMgYWxsb3dzIHRvIGJ1aWxkIGEgcm9vdGZzIHN1aXRh
YmxlIGZvciBwb3J0YWJsZSBzZXJ2aWNlcyB3aXRoIHN5c3RlbWQuCj4+Pgo+Pj4gQSBuZXcgdmFs
dWUgb2YgIkluaXQgc3lzdGVtIiBpcyBpbnRyb2R1Y2VkIDogQlIyX0lOSVRfUE9SVEFCTEUuCj4+
PiBCUjJfSU5JVF9QT1JUQUJMRSBpcyBsaWtlIEJSMl9JTklUX05PTkUsIGJ1dCB3aXRoIGFsbCBG
T09fSU5TVEFMTF9JTklUX1NZU1RFTUQgZXhlY3V0ZWQuCj4+Pgo+Pj4gQSBuZXcgdHlwZSBvZiBz
a2VsZXRvbiBpcyByZXF1aXJlZCA6IEJSMl9QQUNLQUdFX1NLRUxFVE9OX0lOSVRfUE9SVEFCTEUu
Cj4+Pgo+Pj4gc2VlIGh0dHBzOi8vc3lzdGVtZC5pby9QT1JUQUJMRV9TRVJWSUNFUy8KPj4KPj4g
SSBkb24ndCBzZWUgYW55dGhpbmcgdGhhdCBjYW4ndCBiZSBhbHJlYWR5IG1hbmFnZWQgd2l0aCBl
eGlzdGluZwo+PiBjb25maWd1cmF0aW9uIG9wdGlvbnMuCj4gCj4gQWgsIEkgbWlzc2VkIG9uZSB0
aGluZzogdGhpcyBhbGxvd3MgaW5zdGFsbGluZyBzeXN0ZW1kIHVuaXRzIGJ1bmRsZWQgaW4KPiBC
dWlsZHJvb3QsIHdpdGhvdXQgdXNpbmcgc3lzdGVtZCBhcyBhIGluaXQgc3lzdGVtLgoKICBJbiBh
IHBvcnRhYmxlIHNlcnZpY2UsIC9zYmluL2luaXQgaXMgbm90IHVzZWQgYW55d2F5LCBzbyB0aGUg
aW5pdCBzeXN0ZW0gaXMgCmlycmVsZXZhbnQuCgogIFRoZSBvbmx5IHJlYWwgZGlmZmVyZW5jZSBp
cyB0aGF0IHN5c3RlbWQgYW5kIGl0cyBkZXBlbmRlbmNpZXMgYXJlIG5vdCAKaW5zdGFsbGVkIHRv
IHRoZSB0YXJnZXQsIHdoaWNoIHJlZHVjZXMgc2l6ZSBhIGxpdHRsZS4KCj4gVGhpcyBpcyBmbGF3
ZWQsIElNTywgYmVjYXVzZSBhIGxvdCBvZiBwYWNrYWdlcyBub3cgaW5zdGFsbCB0aGVpciBvd24K
PiB1bml0cyBhcyBwYXJ0IG9mIHRoZWlyIGluc3RhbGwgcHJvY2VkdXJlLCBzbyB3aXRob3V0IHN5
c3RlbWQgZW5hYmxlZCwKPiB0aG9zZSBwYWNrYWdlcyB3b2xkIG5vdCBpbnN0YWxsIHRoZWlyIHVu
aXRzLgo+IAo+IFNvLCBpbiBwcmFjdGljZSwgdG8gYmUgcmVhbGx5IHVzZWZ1bGwsIHRoaXMgd291
bGQgc3RpbGwgbmVlZCBzeXN0ZW1kIHRvCj4gYmUgZW5hYmxlZCwgYW5kIHdlJ3JlIGJhY2sgdG8g
dGhlIHNpdHVhdGlvbiB3aGVyZSB0aGlzIHNlcmllcyBvbmx5Cj4gYnJpbmdzIGEgZmV3IGRlZmF1
bHRzIGFzIHBvbGljeS4KCiAgWWVhaCwgdG8gYmUgZnVsbHkgdXNlZnVsLCB3ZSBzaG91bGQgcHJv
YmFibHkgcmVwbGFjZSBhbGwgY29uZGl0aW9ucyBvbiAKQlIyX0lOSVRfU1lTVEVNRCAoYW5kIG1h
bnkgb24gQlIyX1BBQ0tBR0VfU1lTVEVNRCkgd2l0aCBzb21ldGhpbmcgZWxzZS4uLiBJbiAKYWRk
aXRpb24sIHBhY2thZ2VzIHRoYXQgYWN0dWFsbHkgcmVxdWlyZSBsaWJzeXN0ZW1kIChlLmcuIGNs
YW1hdikgd291bGQgbmVlZCB0byAKc2VsZWN0IEJSMl9QQUNLQUdFX1NZU1RFTUQgLSBhbmQgaWYg
eW91IHVzZSBhbnkgb2YgdGhvc2UsIHRoZSBhZHZhbnRhZ2UgaXMgbG9zdCAKYWdhaW4uCgogIFNv
LCBhbHRob3VnaCB0aGUgdXNlIGNhc2UgZXhpc3RzLCBJIGRvbid0IHRoaW5rIHRoZSBkaWZmZXJl
bmNlIGlzIGltcG9ydGFudCAKZW5vdWdoIHRvIGJvdGhlciwgYW5kIHRoaXMgc2VyaWVzIGFkZHJl
c3NlcyBvbmx5IGEgc21hbGwgcGFydCBvZiB0aGUgcHJvYmxlbSAKc3BhY2UuIFNvIEkgYWdyZWUg
d2l0aCBZYW5uLgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gU28sIEknbSBzdGlsbCBub3Qg
Y29udmluY2VkIGFib3V0IGl0Lgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4g
QWxsIHRoYXQgdGhpcyBuZXcgc28tY2FsbGVkIGluaXQgc3lzdGVtIGRvZXMsIGlzIGNoYW5nZSBz
b21lIGRlZmF1bHRzIHRvCj4+IG1hdGNoIGEgc3BlY2lmaWMgdXNlLWNhc2UuIFdlIGhhZCBzaW1p
bGFyIHN0dWZmIGJhY2sgaW4gdGhlIGRheSAoZS5nLiBhbgo+PiBvcHRpb24gdG8gZGVmaW5lIGEg
cm91dGVyLCBvbmUgdG8gZGVmaW5lIHNvbWV0aGluZyBlbHNlLCBhbmQgc28gb24pLCBhbmQKPj4g
d2UgcmVtb3ZlZCBhbGwgb2YgdGhlbS4KPj4KPj4gR3JhbnRlZCwgcG9ydGFibGUgc2VydmljZXMg
YXJlIHNsaWdodGx5IGRpZmZlcmVudCwgYnV0IHN0aWxsIGFsbCB0aGF0Cj4+IHRoaXMgc2VyaWVz
IGV2ZW50dWFsbHkgZG9lcyBpcyBjaGFuZ2Ugc29tZSBkZWZhdWx0czsgaXQgZG9lcyBub3QgZXZl
bgo+PiBlbmZvcmNlIHRoZSBzZXR0aW5ncyBzbyB0aGV5IGFyZSBub3QgZXZlbiByZXF1aXJlZC4K
Pj4KPj4gRXZlbiB0aGUgbmV3IHNrZWxldG9uIGNhc2UgY2FuIGFscmVhZHkgYmUgaGFuZGxlZCBi
eSBwcm92aWRpbmcgYSBjdXN0b20KPj4gc2tlbGV0b24sIGFuZCBpdCBpcyBhIHRyaXZpYWwgb25l
LCBzbyBldmVuIHRoYXQgaXMgbm90IG5lZWRlZC4KPj4KPj4gSWYgeW91IHdhbnQgdG8gYnVpbGQg
YSBwb3J0YWJsZSBzZXJ2aWNlLCBqdXN0IGJ1aWxkIGEgc3lzdGVtIHdpdGgKPj4gc3lzdGVtZCBh
bmQgdGhlIHJlc3Qgb2YgdGhlIHNldHRpbmdzIHNldCBhcyByZXF1aXJlZCBmb3IgdGhhdCB1c2Ut
Y2FzZS4KPj4KPj4gU28sIG15IHBvc2l0aW9uIGlzIHRvIHJlamVjdCB0aGlzIG5ldyBwc2V1ZG8t
aW5pdCBzeXN0ZW0uCj4+Cj4+IFJlZ2FyZHMsCj4+IFlhbm4gRS4gTU9SSU4uCj4+Cj4+PiBGcmFu
Y29pcyBQZXJyYWQgKDMpOgo+Pj4gICAgcGFja2FnZS9za2VsZXRvbi1pbml0LXBvcnRhYmxlOiBu
ZXcgc2tlbGV0b24KPj4+ICAgIHBvcnRhYmxlOiBuZXcgaW5pdCBzeXN0ZW0KPj4+ICAgIHBvcnRh
YmxlOiB0d2VhayBzb21lIGRlZmF1bHQgdmFsdWVzCj4+Pgo+Pj4gICBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+PiAgIGZzL3NxdWFzaGZzL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4+ICAgcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+Pj4gICBwYWNrYWdlL2lm
dXBkb3duLXNjcmlwdHMvQ29uZmlnLmluICAgICAgICAgICAgfCAgMiArLQo+Pj4gICBwYWNrYWdl
L3BrZy1nZW5lcmljLm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+Pj4gICBwYWNr
YWdlL3NrZWxldG9uLWluaXQtcG9ydGFibGUvQ29uZmlnLmluICAgICAgfCAgNyArKysrKysKPj4+
ICAgLi4uL3NrZWxldG9uLWluaXQtcG9ydGFibGUubWsgICAgICAgICAgICAgICAgIHwgMjMgKysr
KysrKysrKysrKysrKysrKwo+Pj4gICBzeXN0ZW0vQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxOCArKysrKysrKysrKy0tLS0KPj4+ICAgOCBmaWxlcyBjaGFuZ2VkLCA1
MCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9za2VsZXRvbi1pbml0LXBvcnRhYmxlL0NvbmZpZy5pbgo+Pj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXBvcnRhYmxlL3NrZWxldG9uLWluaXQtcG9y
dGFibGUubWsKPj4+Cj4+PiAtLSAKPj4+IDIuMzIuMAo+Pj4KPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4+Cj4+IC0tIAo+PiAuLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLgo+PiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+PiB8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAo+PiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+PiB8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAo+PiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
