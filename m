Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF15CD8CB2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 18:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9093F40B22;
	Tue, 10 Oct 2023 18:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9093F40B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPVKV6oY8MBw; Tue, 10 Oct 2023 18:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E9640734;
	Tue, 10 Oct 2023 18:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E9640734
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03CD91BF2B0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D179182289
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D179182289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cH9BCzLxU1h4 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 18:24:08 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FEDB82278
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 18:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEDB82278
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso1017101966b.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 11:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696962245; x=1697567045;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6jm9kYYdqjTUCna1kPw2xvyzy2VNwBg6trw3YEBK4o=;
 b=am5ZKEYNB2qrewoPXhsvtTJ+nKG+COq0bjcAihSPomdfZOQNPQM05QHlJtli8aJvPZ
 KIExP6QdPjIimFtqYUVR6dSlfEJcXrnglp4K0PqzlBxg2feSHamqLrdYneaYsuUxttbq
 +tSjE6HcNJRBIsrr5RDENjzJ0zyrEF8zpOutQ6FCaLILketkpuiUNKmo2ttTOq0Wk/KP
 P0g2N+pDDzOd5M/N7Lednoa1OzKxW2CHsNgkUpt44X4ZOnocp9V34wRv/YyQTy9PfLZb
 Mv4CLQYuw2ql/m6j9R9gKeN4voNHIzjqExrL3ehS78BM6grnH+Ald3W30uZ+LG3QNW5m
 qzCg==
X-Gm-Message-State: AOJu0Yysfvea1n/lk+9tAwJP9Q63DYIZrHu4INi/MDCGBScRMl/u6yZA
 CRyzjLHFC813SpsEzOzIa2DZYsYA9krhUmrKkaY=
X-Google-Smtp-Source: AGHT+IGdTeM/RIZrYDx712Q3gK3ID9bvLvjSPyzjg3x/q1hKbi4V7fBdedEZOrZFhM918nCt7xoZqQ==
X-Received: by 2002:a17:907:2cef:b0:9ae:6355:5ef4 with SMTP id
 hz15-20020a1709072cef00b009ae63555ef4mr16349047ejc.3.1696962245557; 
 Tue, 10 Oct 2023 11:24:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a170906831100b0098e78ff1a87sm8638669ejx.120.2023.10.10.11.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 11:24:04 -0700 (PDT)
Message-ID: <5ea9bca9-6e26-ad12-6bd0-c131a3281460@mind.be>
Date: Tue, 10 Oct 2023 20:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?Q?Sch=c3=a4ffner=2c_Florian?= <florian.schaeffner@physiomed.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
 <94908e37-932a-4626-8fcb-c39d3293fe38@benettiengineering.com>
In-Reply-To: <94908e37-932a-4626-8fcb-c39d3293fe38@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696962245; x=1697567045; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6jm9kYYdqjTUCna1kPw2xvyzy2VNwBg6trw3YEBK4o=;
 b=ClMH5UplGlEUc5vB2uQtdwTdnf8/GNuhcktoAV5Xvo2nqLLHP76TD2FSQO/WCBvV+h
 fbFiuwfPs0Ot77lxLImqimFXV/mh62kUI7FDF7drXMGiEqDamBaRMabA5CcoHWADy/Jo
 g22/JV8PhyH7HoMvLJeZ4hctafIx1lkrxHCd3WryXTqy8xChjGVAB7B+Z4BymMXwcg/a
 i6ySXjzDfNZPW1Jhxsk3nbev1hfd99eCN1W5Sok6A3pjmHRm4d60ezlSn5Ok4NkBfISO
 xpANUNVwEz2BL4WFu2wPZVXUS4aCswogBBdYNVsps0oBY7yca3pSdqKBzFtbCT2ulp0a
 zdTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ClMH5Upl
Subject: Re: [Buildroot] Future buildroot with QtQuick/QML Support
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMC8yMDIzIDE1OjE4LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIZWxsbyBGbG9y
aWFuLAo+IAo+IE9uIDEwLzEwLzIzIDE0OjU5LCBTY2jDpGZmbmVyLCBGbG9yaWFuIHdyb3RlOgo+
PiBIZWxsbywKPj4KPj4gb3VyIGFwcGxpY2F0aW9uIGlzIGJ1aWx0IGluIHRoZSBkZXZlbG9wbWVu
dCBlbnZpcm9ubWVudCB3aXRoIFF0IDYgYW5kIAo+PiBRdFF1aWNrL1FNTC4gTm93IGkgdHJpZWQs
IGJ1dCB3YXNu4oCZdCBhYmxlIHRvIHNldHVwIGEgd29ya2luZyBidWlsZHJvb3QgZm9yIG91ciAK
Pj4gYXBwbGljYXRpb24gdG8gcnVuIG9uIGEgZW1iZWRkZWQgZGV2aWNlLgo+Pgo+PiBJIGZvdW5k
IHRoZSBjb252ZXJzYXRpb24gYWJvdXQgcXQ2IGFuZCBRTUwgU3VwcG9ydCBvbiB0aGUgYnVpbGRy
b290IG1haWxpbmcgCj4+IGxpc3QgYW5kIHRoYXQgaXQgc2VlbXMgdG8gYmUgbm90IHBvc3NpYmxl
IHRvIHNldHVwIGEgYnVpbGRyb290IGZvciBvdXIgbmVlZHMgCj4+IHdpdGggUXQ2IGFuZCBRTUwg
c3VwcG9ydC4KPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2YyMmNlMDZk
LWQ5Y2YtYzU2MS03NDU1LTE5ZGNlNzI0YzE1OEBiZW5ldHRpZW5naW5lZXJpbmcuY29tLwo+Pgo+
PiBJZiBJIHVuZGVyc3Rvb2QgdGhlIGFuc3dlciBmcm9tIEdpdWxpbyBCZW5ldHRpIGNvcnJlY3Rs
eSwgdGhlcmUgaXMgY3VycmVudGx5IAo+PiBubyBjaGFuY2UgdG8gbWFrZSB0aGlzIGNvbmZpZ3Vy
YXRpb24gd29yayBmb3Igb3VyIGVtYmVkZGVkIGJvYXJkIHdpdGggYnVpbGRyb290Pwo+Pgo+PiBD
YW4geW91IHBsZWFzZSB0ZWxsIG1lIGlmIHRoZXJlIHdpbGwgYmUgc3VwcG9ydCBmb3IgdGhpcyBp
biB0aGUgbmV4dCBtYWpvciAKPj4gYnVpbGRyb290IHZlcnNpb24/IE9yIGlzIGl0IG5vdCBwbGFu
bmVkIG9yIGZvcmVzZWVhYmxlIHdoZW4gYSBRTUwgc3VwcG9ydCBpcyAKPj4gcG9zc2libGUgd2l0
aCBidWlsZHJvb3Q/CgogIEJ1aWxkcm9vdCBpcyBhIHZvbHVudGVlciBwcm9qZWN0IC0gbm90aGlu
ZyBpcyAicGxhbm5lZCIgdW5sZXNzIHNvbWVvbmUgZ29lcyAKdGhyb3VnaCB0aGUgZWZmb3J0IG9m
IGNvbnRyaWJ1dGluZyBpdC4KCj4gYXMgSSBjYW4gc2VlIGZyb20gQnVpbGRyb290IHBhdGNob3Jr
IGF0IHRoZSBtb21lbnQgdGhlcmUgaXMgbm8gcGVuZGluZwo+IHBhdGNoZXMgdG8gYWRkIGZlYXR1
cmVzLCBidXQgdGhpcyBkb2Vzbid0IG1lYW4gaXQgd29uJ3QgYmUgYWRkZWQuCj4gCj4gV2hpY2gg
bW9kdWxlcyB3b3VsZCB5b3UgYmUgaW50ZXJlc3RlZCBpbiBtb3N0IG9mIGFsbD8KCiAgSWYgeW91
J3JlIG5vdCBhYmxlIG9yIHdpbGxpbmcgdG8gZGV2ZWxvcCB0aGUgUXQ2IFFNTCBzdXBwb3J0IHlv
dXJzZWxmLCB5b3UgbWF5IAp3YW50IHRvIGhpcmUgc29tZSBoZWxwIHRvIGRvIGl0LiBBdCB0aGUg
Ym90dG9tIG9mIHRoZSAic3VwcG9ydCIgcGFnZSBvbiB0aGUgCndlYnNpdGUgWzFdIHNvbWUgY29t
cGFuaWVzIGFyZSBtZW50aW9uZWQgdGhhdCBjYW4gcHJvdmlkZSB0aGF0IGhlbHAgKEkgd29yayBm
b3IgCm9uZSBvZiB0aGVtKS4gT3IgeW91IGNhbiBmaW5kIGEgZnJlZWxhbmNlciAtIGxpa2UgR2l1
bGlvLgoKICBZb3UgY2FuIGFsc28gYXNrIHRoZSBvcmlnaW5hbCBjb250cmlidXRvciBvZiBRdDYg
KEplc3NlLCBhZGRlZCBpbiBDYykgaWYgdGhleSAKcGVyaGFwcyBoYXZlIHNvbWUgUG9DIGZvciBR
TUwgYWxyZWFkeS4gT3IgcGVyaGFwcyB0aGVpciBlbXBsb3llciB3b3VsZCBiZSAKd2lsbGluZyB0
byBzaGFyZSB0aGUgY29zdCBvZiBkZXZlbG9waW5nIGl0LgoKICBSZWdhcmRzLAogIEFybm91dAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
