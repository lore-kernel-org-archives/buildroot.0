Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9040C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 15:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6E7F400B5;
	Fri, 19 Jul 2024 15:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n-0B7n14qIn; Fri, 19 Jul 2024 15:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DCDC40FC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DCDC40FC8;
	Fri, 19 Jul 2024 15:32:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 400351BF2E4
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 15:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A62340B40
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 15:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrQbKxzacioi for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 15:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A852C409CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A852C409CB
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A852C409CB
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 15:32:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3685b3dbcdcso774008f8f.3
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 08:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721403149; x=1722007949;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nJtBx5qhwu56saU//blxGTY8o4CEANFw5kUXt3UyiOE=;
 b=rsmGCS4XhJwS6Tf16FvqW98WSGerck7kzW88xeczfvpznc6lQ5Umgu1rmbvceCMKZ7
 wpECN/m5RNBe5DRPFm5aq7yYdUBAfHbQ8ePUz289qTGZDi/7dVbxYxFuUmXQZ5SpVf4r
 zOoiMNHqpjtVza5HFTtCamI00nMLpjhxGFeY0JqvTvTsxsLxShQO7ZwMRy2DVTArx0mN
 q/ZSjtdnJQD2dpEZW8OTRgGPBP5ah2E3uBtvCkWj4dos6AdMghivQhGvznGp+NXpd2jX
 G1IoLn/hJ9uZRHEltd9IDJz1jhg0xlR0ySZJOP1J5uSO1Jf3MKxydHqAINSFw4+DY6vo
 bcVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcQAvuhGXGRN7hbWu1BM8fvw3V+0bqVYYEMEu/qwWWy/QgpDzIAj0uDnLDqX94nst9NwJsmmKacM/HJ0KY/68pcffJLaiEXA==
X-Gm-Message-State: AOJu0YwkDjrNfxFuoGPkQQfBxV2srOurfDf3L3DVSrSIwycuzfuKZuw8
 JEomxtRK4EkhRk3gyuvQV/0kjH7PVmMHslela4IigE1jgZFlqkP2LSwOl6It7Mo=
X-Google-Smtp-Source: AGHT+IF5U9rlx5DJL0/KDkbpVZ+n4UtLVY9KqzGaDkpybrCcq0oCrGs3mS3KY4SeXEcDMrb1s2qLZQ==
X-Received: by 2002:adf:e58e:0:b0:367:8f81:f9fc with SMTP id
 ffacd0b85a97d-368316f8752mr5331850f8f.50.1721403149158; 
 Fri, 19 Jul 2024 08:32:29 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787caefdsm1913587f8f.66.2024.07.19.08.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 08:32:28 -0700 (PDT)
Message-ID: <17002fb1-13c6-4d47-adfd-cbd4b0490673@mind.be>
Date: Fri, 19 Jul 2024 17:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Hilse <andreas.hilse@googlemail.com>,
 Peter Korsgaard <peter@korsgaard.com>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
 <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
 <87v81jvko4.fsf@dell.be.48ers.dk>
 <CANabuZer5AXD=y-6Qc0y6h5DHB4yNoYdQF5P1w2uRBvtn51d8Q@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CANabuZer5AXD=y-6Qc0y6h5DHB4yNoYdQF5P1w2uRBvtn51d8Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721403149; x=1722007949; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nJtBx5qhwu56saU//blxGTY8o4CEANFw5kUXt3UyiOE=;
 b=eAwxZ+D0OBeAuV8DbCXCKTK0wIxBDTWzsMlc+KrJXvLr/ZhyxBZSJ289P9kYTMat5R
 ytVThQgfVGMnOZGNWHTNiipuvregolvpIAkXeVoXBzYWpVVBY36f+VdCOwoaCFYzC9On
 Ao0EW6ZUfhFC0ZX2t3N51Y4Y/y1H6a/EGopVwYZbnYD74RYOp9kQi1BFGnsTLT++O3Nd
 KStNMfdNH7ngHXKgoTbcxIeNoh/y0+Hop8BtzVzMhUeBR4mSG9zIhdSA9kffxlGk+GsP
 U0bC7i/3mTb+4OPCJXWzl1V3xzsQtthOzqQFximctCs6McDeSy9f9wSTWNZce9+/aVkA
 WeYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eAwxZ+D0
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wNy8yMDI0IDEwOjEyLCBBbmRyZWFzIEhpbHNlIHdyb3RlOgo+IEhlbGxvIFBldGVy
LAo+IAo+IEFzIEkndmUgYmVlbiBzZWVpbmcgdGhlIHBhdGNoIGZvciA5Ljcgb24gdGhlIDIwMjQu
MDIueCBicmFuY2ggSSBhbQo+IGFzc3VtaW5nIHRoZXJlIHdpbGwgYmUgbm8gYmFja3BvcnQgZm9y
IDkuOHAxPwo+IFRoaXMgd291bGQgbWVhbiB0aGF0IHRoZSBMVFMgcmVsZWFzZSAyMDI0LjAyIHdp
bGwgZ2V0IGZhbHNlIHBvc2l0aXZlcwo+IGJ5IHZ1bG5lcmFiaWxpdHkgc2Nhbm5lcnMgdGhhdCBv
bmx5IGNoZWNrIGZvciB0aGUgdmVyc2lvbi4KCiAgSSB3b3VsZCBzYXksIGluIHRoYXQgY2FzZSwg
Zml4IHlvdXIgdnVsbmVyYWJpbGl0eSBzY2FubmVyLiBXZSBoYXZlIGRvemVucyBvZiAKcGFja2Fn
ZXMgd2hlcmUgQ1ZFcyBhcmUgcGF0Y2hlZC4gU2VlIHRoZSBJR05PUkVfQ1ZFUyB2YXJpYWJsZXMg
aW4gdmFyaW91cyBwYWNrYWdlcy4KCiAgVGhhdCBzYWlkLCBQZXRlciBmb3Jnb3QgdG8gYWRkIGFu
IElHTk9SRV9DVkVTIHdoZW4gYXBwbHlpbmcgdGhlIGZpeCwgc28gb3VyIApvd24gcGtnLXN0YXRz
IHdpbGwgYWxzbyBoYXZlIGEgZmFsc2UgcG9zaXRpdmUuLi4gV2VsbCwgaXQgd291bGQgaGF2ZSBp
ZiBOVkQgd2FzIApzdGlsbCB3b3JraW5nLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBXZSB1
c2UgdGhlIExUUyB2ZXJzaW9uIGFuZCB1cGdyYWRlIGVhY2ggeWVhciwgYnV0IHdpdGggdGhpcyB3
ZQo+IHByb2JhYmx5IGhhdmUgdG8gdXBncmFkZSB0byB0aGUgbGF0ZXN0IHN0YWJsZSByZWxlYXNl
Lgo+IAo+IEkgZm9sbG93ZWQgdGhlIGRpc2N1c3Npb24gaGVyZSBhbmQgdW5kZXJzdGFuZCB0aGF0
IDkuOHAxIHJlcXVpcmVzIHNvbWUKPiBhZGRpdGlvbmFsIGNoYW5nZXMuCj4gQXJlIHlvdSBzdGls
bCBwbGFubmluZyB0byBiYWNrcG9ydCA5LjhwMSB0byAyMDI0LjAyLng/Cj4gCj4gQmVzdCByZWdh
cmRzCj4gQW5kcmVhcwo+IAo+IAo+IE9uIEZyaSwgSnVsIDUsIDIwMjQgYXQgNzowMOKAr1BNIFBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4+Cj4+Pj4+Pj4gIkpv
YWNoaW0iID09IEpvYWNoaW0gV2liZXJnIDx0cm9nbG9iaXRAZ21haWwuY29tPiB3cml0ZXM6Cj4+
Cj4+ICAgPiBPbiBUaHUsIDIwMjQtMDctMDQgYXQgMjI6MTAgKzAyMDAsIEFybm91dCBWYW5kZWNh
cHBlbGxlIHdyb3RlOgo+PiAgID4+IE9uIDA0LzA3LzIwMjQgMTQ6NTksIFBldGVyIEtvcnNnYWFy
ZCB3cm90ZToKPj4gICA+PiA+IFllcywgSSB3aWxsIGdldCB0byBpdCB0aGlzIHdlZWtlbmQuIEkn
bGwgaGF2ZSBhIGxvb2sgaWYgY2hlcnJ5LQo+PiAgID4+ID4gcGlja2luZyB0aGUgZml4IG9uIDku
NyBpcyBiZXR0ZXIgdGhhbiBidW1waW5nIGdpdmVuIHRoYXQgRFNBIGtleXMKPj4gICA+PiA+IGFy
ZSBubyBsb25nZXIgc3VwcG9ydGVkLgo+Pgo+PiAgID4gUGV0ZXIsIEkgaGFkIGEgbG9vayBhdCB0
aGUgaHR0cHM6Ly93d3cub3BlbnNzaC5jb20vcmVsZWFzZW5vdGVzLmh0bWwKPj4gICA+IGFuZCBh
cHBhcmVudGx5Ogo+Pgo+PiAgID4gICAgIkRTQSBzdXBwb3J0IG1heSBiZSByZS1lbmFibGVkIGlu
IE9wZW5CU0QgYnkgc2V0dGluZyAnRFNBS0VZPXllcycKPj4gICA+ICAgICBpbiBNYWtlZmlsZS5p
bmMuIFRvIGVuYWJsZSBEU0Egc3VwcG9ydCBpbiBwb3J0YWJsZSBPcGVuU1NILCBwYXNzCj4+ICAg
PiAgICAgdGhlICctLWVuYWJsZS1kc2Eta2V5cycgb3B0aW9uIHRvIGNvbmZpZ3VyZS4iCj4+Cj4+
ICAgPiBTbyBJIGd1ZXNzIHdpdGggdGhhdCA5LjhwMSBjb3VsZCBzdGlsbCBiZSBhIGNhbmRpZGF0
ZSBmb3IgMjAyNC4wMi54Pwo+Pgo+PiBZZXMsIGlmIG9sZCBrZXlzIHdvcmsgd2l0aCA5LjhwMSwg
dGhlbiB0aGF0IGlzIElNSE8gcHJlZmVyYWJsZSB0byB1c2UKPj4gZm9yIDIwMjQuMDIueCBhcyBp
dCBtYWtlcyBpdCBlYXNpZXIgdG8gdXBkYXRlIGluIHRoZSBmdXR1cmUgaWYgb3RoZXIKPj4gaXNz
dWVzIGFyZSBmb3VuZC4gV2UgY291bGQgZXZlbiBhZGQgYSBkZWZhdWx0LW5vIG9wdGlvbiBvbiBt
YXN0ZXIgdG8KPj4gc3VwcG9ydCB0aG9zZSBsZWdhY3kga2V5cyB0aGVyZSBhcyB3ZWxsLgo+Pgo+
PiAtLQo+PiBCeWUsIFBldGVyIEtvcnNnYWFyZAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
