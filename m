Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DB2CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 19:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE79B81A23;
	Mon,  1 Apr 2024 19:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huyf3dB9TKM5; Mon,  1 Apr 2024 19:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE92681A29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE92681A29;
	Mon,  1 Apr 2024 19:53:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F349C1BF2C7
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 19:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC74440664
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 19:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXMFNPastdXm for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 19:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42B8B40310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B8B40310
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42B8B40310
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 19:53:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4156a29ff70so5346175e9.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 12:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712001188; x=1712605988;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAiQF7w5UTmZQ5TrtL803XrjOsnAX6cTmbZYX9cjR88=;
 b=mDEPRdIxMp21dL8qNrHeOi7q0lub2Nc0N/b2Fe1NGvuxNPAaN1MhAtkapaVa5RoN0v
 zfHmXTzitj+Z/DkwR4wnU0sE5EalFQSTgjW2tGBeXyE1ruFQiYzupcZiM8CPpHDyvlnK
 KXIeKb/sh73XrwAW6IsxosGMsTT79hrjcc9kUCJdifcNC2gtkRGF8+SqS12sC/z97hdS
 vHwdaET5lFFqTIz/oRCy+9m8usFWmhwK7ALHU9zUjFRR5zbgpFAUpxsXU5J5tru5NG9x
 YGX1M6K1wYSYmIazXQmS3C7QQSRYKUEiM4+fB35jBYzUJYg9bvog2WNRKtKnDnqMlBe5
 vleg==
X-Gm-Message-State: AOJu0YxLfGxbDaTfwo8UZmil1qE7Hy1KNDXKIpsYYXvdvuI1ke0bN4XA
 irfUg3qe21ZqMBmzwCjoquTyiyYkAZSlYS0mzf9wRSqV2SCOSckrzHKoGTscPeH/kx7kZuPHLZc
 h
X-Google-Smtp-Source: AGHT+IGxDfAZ+XCb5Ww8BH2xTul2hrBU6Bc5NZhxEIiYY3jWOcpcwCpW7HLbbX0AULEMsA6b23pyqg==
X-Received: by 2002:a05:600c:3ac5:b0:415:68c1:5891 with SMTP id
 d5-20020a05600c3ac500b0041568c15891mr1854871wms.9.1712001187576; 
 Mon, 01 Apr 2024 12:53:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b0041493aae77esm18852331wms.23.2024.04.01.12.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 12:53:06 -0700 (PDT)
Message-ID: <b5434307-aaf8-4ee1-a41a-00d9730f332c@mind.be>
Date: Mon, 1 Apr 2024 21:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patricia Holden <pholden@nklabs.com>
References: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
 <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
 <CAJ6EmCcEAuv8i_RC5FbVLueXaCLYm1T-GsuEtmo1wNCPOsRmCw@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAJ6EmCcEAuv8i_RC5FbVLueXaCLYm1T-GsuEtmo1wNCPOsRmCw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712001188; x=1712605988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lAiQF7w5UTmZQ5TrtL803XrjOsnAX6cTmbZYX9cjR88=;
 b=TZ2BQ0jCyVeu07T12IqqtOIDjRkk6VEJPHLauxwV2+otmFqURZe8G04Gg/EUVm9Xcp
 VmRLHBsbApLLxfQmIxv912xc9Zkb1xe/2BAPl2f4gvTc1OhplBGM22v18eRa+0vA0AlE
 dA4M+811rnLp1l0WkAfAWGEbWx619lIfGesIbdWPWK9uLR8IzTczZybzzeMUd1xMbVW/
 wboVZhnvcdaAQWg/asDJVtWLSkzn0SRAHCQLTavBfFbkLgS8RA4vmvZCUHlAwfYc8wqw
 +GjqzrhBl4l3BfCb0A7FMk5zS9/Bv8lbzm2By+eUkYOW9jCiW9qihHMpiHre1y5N+UCO
 lbCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TZ2BQ0jC
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

CgpPbiAwMS8wNC8yMDI0IDIwOjU2LCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gSSBqdXN0IG5l
ZWQgYSBzaW1wbGUgd2ViIHBhZ2UgSSBjYW4gcnVuIGEgcmVhY3QgYXBwIG9uLsKgIElmIHlvdSBr
bm93IG9mIGFueSAKPiBleGFtcGxlcyBvZiB0aGlzLCBwbGVhc2Ugc2hhcmUhwqAgSSBoYXZlIHRy
aWVkIHVzaW5nIG1hdGNoYm94LCBidXQgbm90IHN1cmUgSSdtIAo+IGNvbmZpZ3VyaW5nIGl0IGNv
cnJlY3RseS4KCiAgVGhhdCdzIGV4YWN0bHkgd2hhdCBxdC13ZWJraXQta2lvc2sgaXMgbWVhbnQg
Zm9yLiBPaCwgYW5kIEkgZm9yZ290IGNvZyAKZWFybGllcjogdGhhdCdzIHRoZSBzYW1lIGtpbmQg
b2YgdG9vbCBidXQgd2l0aG91dCBwdWxsaW5nIGluIFF0LiBOb3RlOiB5b3UgbmVlZCAKdG8gZW5h
YmxlIFdQRVdlYktpdCB0byBiZSBhYmxlIHRvIGVuYWJsZSBjb2cgaW4gQnVpbGRyb290LgoKICBj
b2cgaXMgbXVjaCBiZXR0ZXIgbWFpbnRhaW5lZCAtIEkgYWRkZWQgQWRyaWFuIGluIENjIHdobyB3
b3JrcyBvbiBXUEVXZWJLaXQgCmFuZCBjb2cgaW4gQnVpbGRyb290LgoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAKPiBPbiBNb24sIEFwciAxLCAyMDI0IGF0IDI6MzjigK9QTSBBcm5vdXQgVmFuZGVj
YXBwZWxsZSA8YXJub3V0QG1pbmQuYmUgCj4gPG1haWx0bzphcm5vdXRAbWluZC5iZT4+IHdyb3Rl
Ogo+IAo+IAo+IAo+ICAgICBPbiAwMS8wNC8yMDI0IDIwOjAwLCBQYXRyaWNpYSBIb2xkZW4gd3Jv
dGU6Cj4gICAgICA+IEkgZm91bmQgYSBmZXcgdG9waWNzIG9ubGluZSBhYm91dCBhIHBhdGNoIGZv
ciBjaHJvbWl1bSwgYnV0IHRoZXkgYXJlCj4gICAgIGRhdGVkIDIwMTgKPiAgICAgID4gb3Igb2xk
ZXIuwqAgSXMgdGhlcmUgYW4gb2ZmaWNpYWwgcGF0Y2ggdG8gYWRkIHRoZSBjaHJvbWl1bS1icm93
c2VyIGFzIGEKPiAgICAgcGFja2FnZQo+ICAgICAgPiBmb3IgQnVpbGRyb290P8KgIE9yIGhvdyBh
Ym91dCAibWluaWJyb3dzZXIiLCB3aGljaCBJIGhhdmUgYWxzbyBzZWVuIHRvcGljcwo+ICAgICBp
biBhbgo+ICAgICAgPiBvbmxpbmUgc2VhcmNoPwo+IAo+ICAgICAgwqAgSSBkb24ndCB0aGluayB0
aGVyZSBoYXMgZXZlciBiZWVuIGFuIGF0dGVtcHQgdG8gYXR0ZW1wdCBjaHJvbWl1bSBpdHNlbGYs
IGJ1dAo+ICAgICB0aGVyZSB3YXMgYW4gYXR0ZW1wdCBhdCBwYXRjaGVzIGZvciBDaHJvbWl1bSBF
bWJlZGRlZCBGcmFtZXdvcmsgKENFRikuIFRoYXQncwo+ICAgICBub3QgYSBicm93c2VyLCBob3dl
dmVyLCBqdXN0IGEgYnJvd3NlciBlbmdpbmUuIEFuZCBhbnl3YXkgaXQgdHVybmVkIG91dCB0aGF0
Cj4gICAgIENocm9taXVtIChhbmQgZmlyZWZveCkgYXJlIHdheSB0b28gY29tcGxpY2F0ZWQgd2l0
aCB0b28gbWFueSB2ZW5kb3JlZAo+ICAgICBkZXBlbmRlbmNpZXMgYW5kIGNyYXp5IGJ1aWxkc3lz
dGVtcy4KPiAKPiAgICAgIMKgIFRoZXJlIGFyZSBhIGJ1bmNoIG9mIGFsdGVybmF0aXZlIGJyb3dz
ZXIgZW5naW5lczogcXQ1d2ViZW5naW5lLCBxdDV3ZWJraXQsCj4gICAgIHdlYmtpdGd0aywgd3Bl
d2Via2l0Lgo+IAo+ICAgICAgwqAgVGhlcmUgYXJlIGFsc28gYSBmZXcgc2ltcGxlICJmcm9udGVu
ZHMiIGZvciB0aGVzZSwgdGhhdCBiYXNpY2FsbHkgcmVuZGVyIGEKPiAgICAgc2luZ2xlIHdlYnBh
Z2UgYW5kIHRoZW4gYWxsb3cgeW91IHRvIGJyb3dzZSAoc28gbm8gdGhpbmdzIGxpa2UgaGlzdG9y
eSwKPiAgICAgYm9va21hcmtzLCBwbHVnaW5zLCBldGMuKTogcXQtd2Via2l0LWtpb3NrLCBxdDV3
ZWJ2aWV3OyBhbmQgYSBtb3JlIGNvbXBsZXRlCj4gICAgIGJyb3dzZXI6IG1pZG9yaS4KPiAKPiAg
ICAgIMKgIEZpbmFsbHksIHRoZXJlJ3MgYWxzbyB0aGUgdGV4dC1tb2RlIGJyb3dzZXIgbGlua3Ms
IGJ1dCBJIGRvbid0IHN1cHBvc2UgdGhhdAo+ICAgICB0aGF0IGlzIHdoYXQgeW91J3JlIGxvb2tp
bmcgZm9yLgo+IAo+IAo+ICAgICAgwqAgUmVnYXJkcywKPiAgICAgIMKgIEFybm91dAo+IAo+ICAg
ICAgPgo+ICAgICAgPiBUaGFua3MhCj4gICAgICA+IFBhdCBIb2xkZW4sIE5LIExhYnMKPiAgICAg
ID4KPiAgICAgID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiAgICAgID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICAgICAgPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZyA8bWFpbHRvOmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgo+ICAgICAgPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAgICAg
PGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdD4K
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
