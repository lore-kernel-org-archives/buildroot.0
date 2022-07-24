Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A71C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7744C40ACE;
	Sun, 24 Jul 2022 08:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7744C40ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7d73kmmr5fE; Sun, 24 Jul 2022 08:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6435E4163C;
	Sun, 24 Jul 2022 08:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6435E4163C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB001BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C964163B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C964163B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8K4ZWZGVgmH for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B84CC40ACE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B84CC40ACE
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:55:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k11so11509590wrx.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Co8cNfEPOKJTQHcsRR1R8WK4ouxtDqwGRnVLmfstgPM=;
 b=janIzwSxIfsSBFLdHnUCe1D4FOW7Io8phXvplQ+PA9ca6s+CopB0IT6mkzIIolfAfB
 AUmJBozCJtgZI28E/fEqmYcjaTyvpEq3lkG3QILo7XCt5M94R6cHbtiI5q+1TTHjoKIj
 YkEyLjH8yjh2iuAei6AbcBWKei+Vr8L60rVzz/JQYmLVUIuw7MJdx/gU3mD+0lCIJwcJ
 9RXtv7PvqPtTBZ/o1eNNredfzaO5VSK8YhTgCTY/KPi4OMtbCMGgUaGtegSfk+Mf93Ez
 xOKOybzl+h3HI0g1igMaTQleUscUGLOnYMYLvBV5tlJFsGC9l60OiII1izEfE1EmQWnt
 DvjA==
X-Gm-Message-State: AJIora8PI2eSv4ta9iYCjZEzjy3pgUtpbEhhEtYfhqSpqaFHpROPX5pV
 ja3OrbFV/QuOtfxNgLHauzrJ1w==
X-Google-Smtp-Source: AGRyM1tyLyUlSb7tKLYXMa36t0U5eavx7EbKyln8gK2PVAxBAzym+jqw3/DKYa3ZpLb0EJJH4airxA==
X-Received: by 2002:a5d:64a4:0:b0:21d:be80:de06 with SMTP id
 m4-20020a5d64a4000000b0021dbe80de06mr4447071wrp.107.1658652946531; 
 Sun, 24 Jul 2022 01:55:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 m16-20020adffa10000000b0020e6ce4dabdsm8986259wrr.103.2022.07.24.01.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 01:55:46 -0700 (PDT)
Message-ID: <30f9fc02-781b-27ac-ecec-5f03680f8a7d@smile.fr>
Date: Sun, 24 Jul 2022 10:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
 <20220705134402.5914-2-david.gouarin@thalesgroup.com>
 <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr> <20220724075906.GO2641@scaer>
 <c85bf232-28ca-8d43-06ca-8e2d78db1581@smile.fr> <20220724084611.GP2641@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220724084611.GP2641@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Co8cNfEPOKJTQHcsRR1R8WK4ouxtDqwGRnVLmfstgPM=;
 b=ixMPEBP30720rbeLCa5twT6lzEsoWLvkA11OQQ3/TcHtE81EQV/aJiKVsPE/L6nhKp
 X6bkIVg+tGKVmcBmsaPB7SkD9pYGt5KN/Wl+20FikGfvNrTQ1d944ErdtvfNSZo92izA
 gw7ABacmE9jtHMeDMJP9CgjPpOq/gfv6figSjmfB9dhJVmcDtMl/dRb6SBxLfJ8RWcTb
 57KWzyCaSSHbpv7jtPIlxKuNbIiBc/mXnXXf5GMmsrCVtNT3EBc6VPduOYxM4eJ/Bz9U
 DSqsiGIetG+Dns1HQ83JMvQ6cH42wgPrnDNHDzeP7jdL2s521getF6wlIxjmFV3QV89C
 7RiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ixMPEBP3
Subject: Re: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDcvMjAyMiDDoCAxMDo0NiwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+IFJvbWFp
biwgQWxsLAo+IAo+IE9uIDIwMjItMDctMjQgMTA6MTkgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFr
ZSB0aHVzbHk6Cj4+IExlIDI0LzA3LzIwMjIgw6AgMDk6NTksIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPj4+IE9uIDIwMjItMDctMjMgMTk6MTUgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0
aHVzbHk6Cj4+Pj4gTGUgMDUvMDcvMjAyMiDDoCAxNTo0NCwgRGF2aWQgR09VQVJJTiBhIMOpY3Jp
dMKgOgo+Pj4+PiBUaGlzIHZlcnNpb24gbmVlZHMgdG8gZGVmaW5lIGFuIGVudmlyb25tZW50IHZh
cmlhYmxlIGluIGJ1aWxkIGFuZCBpbnN0YWxsIHN0ZXBzLgo+Pj4+PiBUaGlzIHJlcXVpcmVzIGFu
IHVwZ3JhZGUgdG8gcGtnX3dhZi5tay4KPiBbLS1TTklQLS1dCj4+Pj4+ICtMSUJUQUxMT0NfQ09O
Rl9FTlYgKz0gUFlUSE9OSEFTSFNFRUQ9MQo+Pj4+PiArTElCVEFMTE9DX01BS0VfRU5WICs9IFBZ
VEhPTkhBU0hTRUVEPTEKPj4+PiBUaGlzIGxvb2tzIHN1c3BpY2lvdXMuLi4gUFlUSE9OSEFTSFNF
RUQ9MSB3YXMgYWRkZWQgdXBzdHJlYW0gd2l0aG91dCBleHBsYW5hdGlvbgo+Pj4+IGJ5IHRoaXMg
Y29tbWl0IFsxXSBiZWZvcmUgbGlidGFsbG9jIDIuMy4wLgo+Pj4gSSBhZ3JlZSB0aGF0IHRoaXMg
bmVlZHMgbW9yZSBleHBsYW5hdGlvbnMgdGhhbiBqdXN0ICJ0aGlzIGlzIG5lZWRlZCB0bwo+Pj4g
YnVpbGQiIChvYnZpb3VzbHkgaXQgaXMgbmVlZGVkIHRvIGJ1aWxkLCBvdGhlcndpc2UgdCB3b3Vs
ZCBub3QgYmUKPj4+IHRoZXJlKS4KPiBbLS1TTklQLS1dCj4+PiBCdXQgbG9va2luZyB0IHRoZSBz
YW1iYSBjb2RlIHlpZWxkcyBiZXR0ZXIgcmVzdWx0czoKPj4+ICAgICAxOWE0ZDNjYTY5MmUgYnVp
bGQ6IFdvcmthcm91bmQgcHl0aG9uMyBoYXNoIG9yZGVyIGlzc3VlcyAoZm9yIG5vdykKPiBbLS1T
TklQLS1dCj4+PiBEYXZpZCwgY2FuIHlvdSB0cnkgdG8gc2VlIGlmIHRoZSBidWlsZCBzdWNjZWVk
cyB3aXRob3V0IFBZVEhPTkhBU0hTRUVEPwo+Pj4gSWYgaXQgcmVhbGx5IG5lZWRzIGl0IChlLmcu
IGJ1aWxkIGZhaWx1cmUsIG9yIHJ1bnRpbWUgZmFpbHVyZSksIHRoZW4KPj4+IHBsZWFzZSBleHRl
bmQgdGhlIGNvbW1pdCBsb2cgd2l0aCB0aGUgYWJvdmUgaW5mb3JtYXRpb24gYW5kIHRoZSBmYWls
dXJlCj4+PiByZWFzb24uIElmIGl0IGRvZXMgbm90IG5lZWQgaXQsIHRoZW4ganVzdCByZXNwaW4g
dGhlIGJ1bXAgd2l0aG91dC4KPj4gSSBmb3VuZCBhbm90aGVyIGNvbW1pdCBhZGRpbmcgdGhlIG9m
ZmVuZGluZyB3YWYgY2hlY2s6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJh
Ly0vY29tbWl0LzQyMGJiYjFkOTJmZDJhMjg3MjViNTNmNDI1YmEzZDIxNDgzMWI2NjAKPj4gYmVj
YXVzZSBpdCBkb2Vzbid0IHdvcmsgd2l0aG91dCBQWVRIT05IQVNIU0VFRC4KPiAKPiBJIGFtIG5v
dCBzdXJlICJpdCBkb2Vzbid0IHdvcmsgd2l0aG91dCBQWVRIT05IQVNIU0VFRCIuCgpJIG1lYW4s
IEkgdHJpZWQgbG9jYWxseSBiZWNhdXNlIEkgd2FudGVkIHRvIGtub3cgOikKClRoZSBidWlsZCBz
dG9wIHdpdGggdGhpcyBlcnJvciBtZXNzYWdlOgoiUFlUSE9OSEFTSFNFRUQ9MSBtaXNzaW5nISBE
b24ndCB1c2Ugd2FmIGRpcmVjdGx5LCB1c2UgLi9jb25maWd1cmUgYW5kIG1ha2UhIgoKPiAKPiBB
cyBzYW1iYSBkZXZlbG9wZXJzLCB0aGV5IG5lZWQgaXQgdG8gYXZvaWQgcmVidWlsZGluZyB3aXRo
IGVhY2ggY2FsbCB0bwo+ICdtYWtlJy4KPiAKPiBCdXQgZm9yIHVzLCBhIHdhZiBwYWNrYWdlIGlz
IG9ubHkgYnVpbHQgb25jZSwgc28gd2Ugc2hvdWxkIG5vdCBoYXZlIHRvCj4gY2FyZSBhYm91dCB3
YWYgYmVpbmcgY29uZnVzZWQgZHVyaW5nIHJlYnVpbGRzLCBiZWNhdXNlIHdlIGFyZSBub3QgZG9p
bmcKPiByZWJ1aWxkcy4KPiAKPiBXZSByZWFsbHkgd2FudCB0byBrbm93IHRoYXQgdGhlIGJ1aWxk
IGFjdHVhbGx5IGZhaWxzIHdpdGhvdXQgaXQuCgpTdXJlIGJ1dCBzYW1iYSBkZXZlbG9wZXJzIGFk
ZGVkIGEgY2hlY2sgZm9yIFBZVEhPTkhBU0hTRUVEPTEgaW4gbGlidGFsbG9jIDIuMy40LgoKQmVz
dCByZWdhcmRzLApSb21haW4KCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
