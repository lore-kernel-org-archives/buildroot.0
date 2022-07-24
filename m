Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7736EC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E025561B38;
	Sun, 24 Jul 2022 13:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E025561B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9B1OQKuW1Uq; Sun, 24 Jul 2022 13:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E8561171;
	Sun, 24 Jul 2022 13:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E8561171
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8D7B1BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8331A40C0C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8331A40C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XT_i6q8_hjoN for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:05:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF6D40BFF
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF6D40BFF
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:05:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d13so4737478wrn.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ewRO2BKSbaymW19cDa8VDwbNosQPPo4hPJ/GP0z0pkY=;
 b=oIFEjmFfD92BSGbVv+aQBYM/WjCC4b4SpkqEeQ6lXYMdBObK7AB2nFX+NQRjX/JprG
 +f0tpAPQVYO7jrLDfZydi7C10Wxr8J9unD22V/G8lgb5gKJRe4Vnb1rEj8Lgd844OWtW
 gFDyGXDCNrUB3ZkYtjPZ1cpMSLDfGAs8GMcAqIlS4zVgDLlgVPdlM66FmMJtketyrv+3
 Bj1zP8MHHDT6FJ/P+JkzUV83yxJJml2mcSWKrgErn9fD8Co6li0NG3o4/Mw4IHP3oppa
 ltAasaYjyAgIGTXdmvN/AMf2q/mQipWBNYAh/aVJIsfsiXo3EjV+bU872j278lgY9Zqz
 e5gg==
X-Gm-Message-State: AJIora/w+Be5n0I7czbfpiTSoIMnRsNj9ngxD9pmGTPjiOXoLq12sGBU
 m1LqjMAuE2XCoQTmGP505qSXEw==
X-Google-Smtp-Source: AGRyM1sLp7Xd6q/v+VUarh946vxui1l9tLp0jQv+xLZRlQT42oNhgbv75A3MOnENcl6jDojf+1ETPA==
X-Received: by 2002:a5d:5641:0:b0:21e:59a1:fd1b with SMTP id
 j1-20020a5d5641000000b0021e59a1fd1bmr5372414wrw.678.1658667925120; 
 Sun, 24 Jul 2022 06:05:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b003a32297598csm15665371wmq.43.2022.07.24.06.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 06:05:24 -0700 (PDT)
Message-ID: <ac205100-f6ca-7fff-b587-c7a5575ebc25@mind.be>
Date: Sun, 24 Jul 2022 15:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220112132618.2634250-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112132618.2634250-1-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ewRO2BKSbaymW19cDa8VDwbNosQPPo4hPJ/GP0z0pkY=;
 b=Uvz1ZLl12BRbbub/GjbEPoBQ3iCW9sCJqL8dWMyQuzwINmy7l84x3VQyedFLzzbWcK
 rL5vw9UbUeoxeYWcDSHL0Pfq9kHDJDw/RWgkGqy0NWA/cvXSOH1tNqztr7Kch1OcS/6+
 Pe1WQ4EKayLbvJTKdgXLJL/8KxQSLJCNJlMutvGNKVG3QvaflFEf+9gV8TjF/LSktpka
 DnGdkLvR9vE1IjlY/tsQxJxBDidGXSYlb2SW85tDY96MMNGWRym8H49joSZ0EaBtqlrG
 Mj3Fs0zrwDN8W7rFIqLBaLnJVjKozUid0nAB0kCz0xUH+iV1tsTA//rWOz8vTV+WkhwV
 VSDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Uvz1ZLl1
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
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
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBBZHJpYcyBbiwKCiAgQXJlIHlvdSBzdGlsbCBpbnRlcmVzdGVkIHRvIHJlc3BpbiB0aGlz
IHNlcmllcz8gSXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRoaXMgCmZlYXR1cmUgLSBlc3BlY2lh
bGx5IHNpbmNlIGUuZy4gUXQ2IGluIGZhY3QgKmV4cGVjdHMqIHRvIGJlIGJ1aWx0IHdpdGggTmlu
amEuCgpPbiAxMi8wMS8yMDIyIDE0OjI2LCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIHdyb3RlOgo+
IEhlbGxvIGV2ZXJ5Ym9keSwKPiAKPiBBcyBkaXNjdXNzZWQgeWVzdGVyZGF5LCBoZXJlIGlzIGEg
cXVpY2sgc3RhYiBmb3IgdGVzdGluZyBhbmQgZ2V0dGluZyB0aGUKPiBjb252ZXJzYXRpb24gc3Rh
cnRlZCBhYm91dCB1c2luZyBOaW5qYSBmb3IgQ01ha2UtYmFzZWQgcGFja2FnZXMgKGhlbmNlIHRo
ZQo+IG1pc3NpbmcgZG9jdW1lbnRhdGlvbiB1cGRhdGVzIGFuZCB0aGUgIlJGQyIgdGFnIGluIHRo
ZSBzdWJqZWN0IDotRCkuCgogIERvY3VtZW50YXRpb24gaXMgb2YgY291cnNlIG5lZWRlZCBmb3Ig
dGhlIG5vbi1SRkMgb25lLiBGb3IgdGVzdGluZywgd2UgYWdyZWVkIAp0aGF0IGl0J3Mgc3VmZmlj
aWVudCB0byB0ZXN0IG9uIGEgZmV3ICgxMC0yMCkgbWFqb3IgcGFja2FnZXMgYW5kIHJlbHkgb24g
dGhlIAphdXRvYnVpbGRlcnMgZm9yIHRoZSByZXN0LgoKCj4gSW4gb3JkZXIgdG8gYXZvaWQgdGhl
IGNpcmN1bGFyIGRlcGVuZGVuY3kgb2YgaG9zdC1uaW5qYSByZXF1aXJpbmcgaXRzZWxmLAo+IG5p
bmphLm1rIGdldHMgY2hhbmdlZCB0byB1c2UgaG9zdC1nZW5lcmljLXBhY2thZ2Ugd2l0aCBhIGJ1
aWxkIGNvbW1hbmQKPiB0aGF0IHBsYWlubHkgcnVucyB0aGUgY29tcGlsZXIgb24gdGhlIHNldCBv
ZiBzb3VyY2VzIHdlIGtub3cgYXJlIG5lZWRlZAo+IHRvIGJ1aWxkIGEgbWluaW1hbCB1c2FibGUg
dmVyc2lvbiBvZiBpdCB1bmRlciBVbml4LXkgc3lzdGVtcy4gVGhpcyBpcwo+IGJhc2ljYWxseSB0
aGUgbGlzdCBvZiBzb3VyY2VzIHRoYXQgQ01ha2Ugd291bGQgaGF2ZSBwaWNrZWQgKGFzIHBlciB0
aGUKPiBDTWFrZUxpc3RzLnR4dCBmaWxlKSBwYXNzZWQgc3RyYWlnaHQgdG8gJChIT1NUQ1hYKS4K
CiAgVG8gYXZvaWQgdGhpcyBoYWNrOiB3ZSB0aG91Z2h0IGl0IHNob3VsZCBiZSBzaW1wbGUgdG8g
YWxsb3cgYSBwYWNrYWdlIHRvIHVzZSAKTWFrZWZpbGVzIGluc3RlYWQgb2YgTmluamEsIGJ5OgoK
LSB1c2luZyBhbiBhcHByb2FjaCBsaWtlIFsxXSB0byBjYWxsICdjbWFrZScgdG8gZG8gdGhlIGJ1
aWxkIGFuZCBpbnN0YWxsIGluc3RlYWQgCm9mIGNhbGxpbmcgJ25pbmphJyBkaXJlY3RseTsKCi0g
cGFja2FnZXMgdGhhdCByZWFsbHkgcmVxdWlyZSBtYWtlZmlsZXMgY2FuIHBhc3MgJy1HVW5peCBN
YWtlZmlsZXMnIGluIAo8UEtHPl9DT05GSUdVUkVfT1BUUyAodGhlIHNlY29uZCAtRyBzaG91bGQg
b3ZlcnJpZGUgdGhlIGZpcnN0IG9uZSwgSSBob3BlKS4KClRoaXMgY2FuIGJlIHVzZWQgYnkgbmlu
amEgdG8ga2VlcCBvbiBidWlsZGluZyBpdHNlbGYgd2l0aCBjbWFrZS4KCgo+IFRoZSBuZXh0IGNo
YW5nZSBtb2RpZmllcyBwa2ctY21ha2UubWsgdG8gYWx3YXlzIHBhc3MgLUdOaW5qYSBhbmQgcmVt
b3Zlcwo+IHRoZSAkKDxQS0c+X0lOU1RBTExbX1NUQUdJTkcsX1RBUkdFVF1fT1BUUykgdmFyaWFi
bGVzLCBiZWNhdXNlIHdoZW4gdXNpbmcKPiBOaW5qYSB0aGUgImluc3RhbGwvZmFzdCIgdGFyZ2V0
cyBhcmUgbm90IGdlbmVyYXRlZCBieSBDTWFrZSAodGhvc2UgYXJlCj4gYW4gaW50ZXJuYWwgZGV0
YWlsIG9mIHRoZSBNYWtlZmlsZSBnZW5lcmF0b3IsIGl0IHNlZW1zKS4gRm9yIGNvbnNpc3RlbmN5
Cj4gd2l0aCB0aGUgTWVzb24gcGFja2FnZSBpbmZyYXN0cnVjdHVyZSB2YXJpYWJsZXMgJChOSU5K
QSksICQoPFBLRz5fTklOSkFfRU5WKQo+IGFuZCAkKE5JTkpBX09QVFMpIGFyZSBob25vcmVkIGJ5
IHRoZSBkZWZhdWx0IHNldCBvZiBidWlsZC9pbnN0YWxsIGNvbW1hbmRzLgo+IAo+IE5vdywgdGhl
cmUgbWlnaHQgYmUgcGFja2FnZXMgdGhhdCBicmVhayB3aXRoIHRoaXMsIGFuZCBJIHdvdWxkIGJl
Cj4gcGFydGljdWxhcmx5IGNvbmNlcm5lZCBhYm91dCB0aGluZ3MgbGlrZSBwYWNrYWdlcyB3aGlj
aCB1c2UgQ01ha2UgYW5kCj4gYnVpbGQgb3V0LW9mLXRyZWUga2VybmVsIG1vZHVsZXMgKGFzIHRo
ZSBrZXJuZWwgYnVpbGQgaW5mcmFzdHJ1Y3R1cmUgaXMKPiBhbGwgTWFrZSwgYW5kIG9ubHkgTWFr
ZSEpIGJ1dCB0aGUgY2hhbmdlcyBpbmNsdWRlZCB3ZXJlIGVub3VnaCBmb3IgbWUKPiB0byBnZXQg
UmFzcGJlcnJ5IFBpIGltYWdlcyBidWlsdCB3aXRoIFdlYktpdCAoYm90aCBHVEsgYW5kIFdQRSBw
b3J0cykKPiBpbiBpdCwgd2hpY2ggcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGJ1aWx0IHVzaW5n
IFtob3N0LV1jbWFrZS1wYWNrYWdlOgo+IAo+ICAgIC0gYnJvdGxpCj4gICAgLSBjb2cKPiAgICAt
IGpwZWctdHVyYm8KPiAgICAtIG9wZW5qcGVnCj4gICAgLSB3ZWJraXRndGsKPiAgICAtIHdlYnAK
PiAgICAtIHdvZmYyCj4gICAgLSB3cGV3ZWJraXQKPiAKPiBXaGlsZSBub3QgYSBsb25nIGxpc3Qg
YnkgYW55IG1lYW5zLCBJIHRoaW5rIGl0IHNob3dzIGEgZGVjZW50IHNhbXBsZSBvZgo+IHBhY2th
Z2VzIGNvbWluZyBmcm9tIGRpZmZlcmVudCBkZXZlbG9wbWVudCB0ZWFtcyB0aGF0IHdvcmsganVz
dCBmaW5lCj4gc3dpdGNoaW5nIHRvIE5pbmphLgo+IAo+IElmIGFueWJvZHkgY2FuIHN1Z2dlc3Qg
c29tZXRoaW5nIHdpdGggYSBiaWdnZXIgbnVtYmVyIG9mIENNYWtlIHBhY2thZ2VzIHRvCj4gYnVp
bGQgKG9yIGEgLmNvbmZpZyBmaWxlIHRvIHNoYXJlKSBJIHdpbGwgYmUgbW9yZSB0aGFuIGhhcHB5
IHRvIGdpdmUgaXQgYQo+IHRlc3QgdGhpcyB3aXRoIHRoZXNlIHBhdGNoZXMgYXBwbGllZCA6KQoK
ICBJIHRoaW5rIGdudXJhZGlvIGlzIGFsc28gYSBnb29kIG9uZSB0byB0ZXN0LCBpdCBoYXMgYSBm
YWlybHkgY29tcGxpY2F0ZWQgYnVpbGQgCnN5c3RlbSBJSVJDLgoKPiAKPiBDaGVlcnMsCj4gLUFk
cmlhbgoKCiAgUmVnYXJkcywKICBBcm5vdXQKClsxXSAKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDcyMjA2MDkzNi41NjY1MzQtMS1qYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tLwoKCj4gCj4gCj4gQWRyaWFuIFBlcmV6IGRlIENhc3RybyAo
Mik6Cj4gICAgcGFja2FnZS9uaW5qYTogZG8gbm90IHJlcXVpcmUgY21ha2UKPiAgICBwYWNrYWdl
L3BrZy1jbWFrZS5tazogdXNlIG5pbmphIGluc3RlYWQgb2YgbWFrZQo+IAo+ICAgcGFja2FnZS9u
aW5qYS9uaW5qYS5tayB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+
ICAgcGFja2FnZS9wa2ctY21ha2UubWsgICB8IDI0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
