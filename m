Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661D0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C07261151
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C07261151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ED2A4022F;
	Sun, 17 Oct 2021 16:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WJ2UcIpj9H3; Sun, 17 Oct 2021 16:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EE340234;
	Sun, 17 Oct 2021 16:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A721C1BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9630340234
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAZBLeljLWgM for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 678154022F
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:18:03 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w14so60393033edv.11
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=o0ZkqGwQoza7s1ODbS80zKW+wJGK+iiY53ruYvvbzXo=;
 b=Tl+jBmhgKzXscn/+gmHb3y3oxg5XycYhIKYTDJdhXQaRC02g4P/qAtKvqitGKtuAVe
 rHiTLIKmfQfhgHjgLlLbj9evGsfclKsIPOGPgFO8lyi10skexcVeG1MJCkviJoIN4540
 kHmvwg+4kZzP3a47B9hZtX7i2PU7GSxJEqdXlsN6/QIZU8t3Q+IMAQOF7SUCbrh7TAAx
 F73sVSjp3QqH/6O2yrWDlyxsO2B0seeVMCqk+ilI0+AcI36rdh7h0CejB7nobxFxKbod
 lQ9+0eInibvHCFnZIUZ/w9jcIfViKihFhmfam9OIMLCHuuwR6k5jtdatgdZ72FHkbnxN
 nx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=o0ZkqGwQoza7s1ODbS80zKW+wJGK+iiY53ruYvvbzXo=;
 b=RtkGw7bVKbfxArv5XReNLQmFFk4ZdaGCpFJZCmd5N5+g3x2B5hSD4OnE2ttXmg0Y50
 HDCd6SMCBErWqUdflCaODI92uAfuJIY8AVBbyyB5T3vyD0m5QOht7xJXDl5IM8uZWgUf
 vrb+nCjz3GITzUu1+uFVwjySTqHphShoMLndC4tEZt5SkQiLZ/RZJJI1sZkTdb5/rw16
 0v+ZfyBnNJgn/bpFC8oWmTTXjdDexi8qXa4WIdqgUbsevuMcajxj54ec4BAGcRCS5vNu
 H9RuzmDcPV0ZvqhYs+XMt0wBCXht3t5U8XVWs0d7OD12r6Iypd0aXxwDatv8F12mCKkJ
 3t4w==
X-Gm-Message-State: AOAM531Lq6H8soAcZ3JdX4QB2fEjmfWC39gRIbzsKorGYlZCRKtobVPx
 vwJEXCXOa8i7OYPJNlDcyxYE5w0QUHn0Utx5
X-Google-Smtp-Source: ABdhPJznjBlh/1x16LRl2JiE55dDzkdTBf1wQlDBTWJkAqIvMDTHj7cMJ8/hZtubRpsxzN1YWNcUKQ==
X-Received: by 2002:a17:906:eb05:: with SMTP id
 mb5mr23996888ejb.88.1634487481440; 
 Sun, 17 Oct 2021 09:18:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dj8sm8214501edb.53.2021.10.17.09.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 09:18:01 -0700 (PDT)
Message-ID: <dc50460f-e7cb-8863-9319-4904742ca2c8@mind.be>
Date: Sun, 17 Oct 2021 18:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211008110345.1901311-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211008110345.1901311-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH] package/opensc: add package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBKb3NlzIEsCgogIFNhbWUgY29tbWVudHMgb24gdGhpcyBwYXRjaCBhcyB3aGF0IEdpbGxl
cyBnYXZlIG9uIHRoZSBzb2Z0aHNtMiBvbmUuCgpPbiAwOC8xMC8yMDIxIDEzOjAzLCBKb3PDqSBQ
ZWtrYXJpbmVuIHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggd2lsbCBhZGQgYSByZWNpcGUg
dG8KPiBpbnN0YWxsIG9wZW5zYyBpbiBmaW5hbCBpbWFnZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Sm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4gICBw
YWNrYWdlL29wZW5zYy9Db25maWcuaW4gfCAgNyArKysrKysrCj4gICBwYWNrYWdlL29wZW5zYy9v
cGVuc2MubWsgfCAxNSArKysrKysrKysrKysrKysKCiAgWW91IG5lZWQgdG8gYWRkIGl0IHRvIHBh
Y2thZ2UvQ29uZmlnLmluLCB5b3UgbmVlZCB0byBhZGQgYSBoYXNoIGZpbGUsIGFuZCAKcHJlZmVy
YWJseSBhbHNvIGFkZCB5b3Vyc2VsZiB0byBERVZFTE9QRVJTIGZvciB0aGlzIHBhY2thZ2UuCgog
IEl0J3MgYWxzbyBjb252ZW5pZW50IGlmIHlvdSBwdXQgdGhlIHR3byBwYWNrYWdlcyB0b2dldGhl
ciBpbiBhIHNlcmllcywgYmVjYXVzZSAKdGhlIERFVkVMT1BFUlMgYW5kIHBhY2thZ2UvQ29uZmln
LmluIGFyZSBsaWtlbHkgdG8gY2F1c2UgY29uZmxpY3RzLgoKPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbnNjL0Nv
bmZpZy5pbgo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbnNjL29wZW5zYy5tawo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zYy9Db25maWcuaW4gYi9wYWNrYWdlL29wZW5z
Yy9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmFi
ZDI2YTliMDgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9vcGVuc2MvQ29uZmlnLmlu
Cj4gQEAgLTAsMCArMSw3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9PUEVOU0MKPiArCWJvb2wg
Im9wZW5zYyIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCAmJiBCUjJfUEFD
S0FHRV9QQ1NDX0xJVEUKPiArCWhlbHAKPiArCQlPcGVuU0MgcHJvdmlkZXMgYSBzZXQgb2YgbGli
cmFyaWVzIGFuZCB1dGlsaXRpZXMgdG8gd29yayB3aXRoIHNtYXJ0IGNhcmRzLgoKICBJbmRlbnRh
dGlvbiArIHdyYXBwaW5nLiBQbGVhc2UgdXNlIHV0aWxzL2NoZWNrLXBhY2thZ2UgdG8gdmVyaWZ5
LgoKPiArCj4gKwkJaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQy9PcGVuU0MuZ2l0CgogIFRoZSBV
Ukwgc2hvdWxkbid0IGhhdmUgYSAuZ2l0IHBhcnQuIFRoYXQgc2FpZCwgYSBiZXR0ZXIgbG9jYXRp
b24gaXMgCmh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDL3dpa2kKCgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL29wZW5zYy9vcGVuc2MubWsgYi9wYWNrYWdlL29wZW5zYy9vcGVuc2MubWsK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjc3NDFkYWMyYTUKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9vcGVuc2Mvb3BlbnNjLm1rCj4gQEAgLTAsMCAr
MSwxNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgb3BlbnNjCj4gKyMK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK09QRU5TQ19WRVJTSU9OID0gMC4yMi4w
Cj4gK09QRU5TQ19TSVRFID0gJChjYWxsIGdpdGh1YixPcGVuU0MsT3BlblNDLCQoT1BFTlNDX1ZF
UlNJT04pKQoKICBUaGVyZSdzIGFuIHVwbG9hZGVkIHRhcmJhbGwgYXQKaHR0cHM6Ly9naXRodWIu
Y29tL09wZW5TQy9PcGVuU0MvcmVsZWFzZXMvZG93bmxvYWQvMC4yMi4wL29wZW5zYy0wLjIyLjAu
dGFyLmd6Cgo+ICtPUEVOU0NfTElDRU5TRSA9IEdQTC0yCgogIEkgaGF2ZW4ndCBjaGVja2VkIGlu
IGRldGFpbCwgYnV0IGl0IHNlZW1zIHRvIGJlIExHUEwtMi4xKwoKPiArT1BFTlNDX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFCgogIFRoaXMgZmlsZSBkb2Vzbid0IGV2ZW4gZXhpc3QuCgo+ICtPUEVO
U0NfREVQRU5ERU5DSUVTID0gb3BlbnNzbCBwY3NjLWxpdGUKPiArT1BFTlNDX0FVVE9SRUNPTkYg
PSBZRVMKCiAgWW91IG5lZWQgdG8gYWRkIGEgY29tbWVudCB3aHkgdGhpcyBpcyBuZWVkZWQuIEl0
IHByb2JhYmx5IGlzbid0IHdpdGggdGhlIAp1cGxvYWRlZCB0YXJiYWxsLgoKPiArT1BFTlNDX0lO
U1RBTExfVEFSR0VUID0gWUVTCgogIFRoaXMgaXMgdW5uZWNlc3NhcnkgKGRlZmF1bHQpLiBfSU5T
VEFMTF9TVEFHSU5HLCBvbiB0aGUgb3RoZXIgaGFuZCwgKmlzKiAKbmVjZXNzYXJ5LgoKPiArCj4g
KyQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
