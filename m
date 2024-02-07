Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CFBC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C0781F19;
	Wed,  7 Feb 2024 08:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 650u43j4_ll8; Wed,  7 Feb 2024 08:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F77781FC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F77781FC5;
	Wed,  7 Feb 2024 08:23:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4F9B1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAC6840A59
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDl3sJi66_ff for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:23:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 298A140B2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298A140B2E
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 298A140B2E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:23:23 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-511689e02d0so95612e87.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 00:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707294201; x=1707899001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y52tBikGDx5nzaHrRIjGywnIEt4m6dz4PCa+H/O4THM=;
 b=I1VOYlhWaIc1GJgo65bQP1L8R2qwSuAmhaK34o0Jvgn2GE5dj29Ka4C8T3CHjxZCks
 Aj/NLLPi0986eYzNRGbH6JGjcljKkVwiqKPIZCLbuuqpB6Mz+tDOfAv4ggClFhjKqZfd
 Wz3gzBj1Qaab6qvPK0LM65p3Q4DoE5g4eXRVIEPL4OccLQhmQ8k+GNNP4yoOhuQgqq6c
 A7X1xzQ+GEukXty2DZHpBifNmHFAX/AfopzlrFj0UFDvtQcaLxfH37C664y8E2TLrW/7
 mbWOTA9teD5hf5uQg5siuFe06+cCt2QFPlVKWYV5/X25ZbmLqeurB9zJsj+M+tvXMNEq
 dtdQ==
X-Gm-Message-State: AOJu0YzopdHRh0MtSb8vQQBB4er8H0oR00eVsA9EKzsNB6acGCoAIBx1
 6leDM78mDsnrAFeT5RBWFKDsAJFe2wsXZ5RT0X5N3b4+y/ou65DyZ58QAFG3dwM=
X-Google-Smtp-Source: AGHT+IG2DaqxflppVwKzpqlh9oVYUjJGsYzRqzoDfaLkKuBTI2GPHZLxw/DmjdsEwOVFj9RBA0opUw==
X-Received: by 2002:a05:6512:1091:b0:511:5ca2:2a3f with SMTP id
 j17-20020a056512109100b005115ca22a3fmr4211830lfg.9.1707294201372; 
 Wed, 07 Feb 2024 00:23:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwRKaOodSzNjqA2Ph7f8JSObyUkawCi9/VyapJVgf9X1xgoVeOdgpguIUnNAEs3UEXL9pXt4oCAbY2TVk6FIE2ngTwwQWsk07i9rYcfoqETFV4etv6CLONVqduIfPtIA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c358700b0040fe308ff25sm4404700wmq.24.2024.02.07.00.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 00:23:20 -0800 (PST)
Message-ID: <9b42a9e2-c741-41f3-be5a-cc36c421b1bf@mind.be>
Date: Wed, 7 Feb 2024 09:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
 <d2c62f63-c48e-4969-a287-b10ecb7b3b21@mind.be>
 <CADvTj4oueQe50PUw-9enTdUZ1pk3picVygzU3vkZPJsGDe+UwQ@mail.gmail.com>
In-Reply-To: <CADvTj4oueQe50PUw-9enTdUZ1pk3picVygzU3vkZPJsGDe+UwQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707294201; x=1707899001; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y52tBikGDx5nzaHrRIjGywnIEt4m6dz4PCa+H/O4THM=;
 b=RGgwlyIcsOYAPHDAWwsipBTs1W+ZWugRjQzn54P2+CoXVeEzyE7mJ/Ls3D8BtcHoZb
 JNcWvDBMjmUejSsBwJuXboh6SS5Rjatvg3NITqJQETNKD8Be13vbz5OCfpZd6k03oTGS
 papqF9dYchiMfPLyp2VJIV+XAUE1PYdnc+t6m1xqaJVmrwa8MxF5QMw6GCrgcizk979j
 ZImnaSY5XUtNUHkwbFr7/VfVeBgbyRnZZSxOaRtdc4JfB1izUM2u2fHrYLN5UcHrtwHe
 q9h9yydtZ2f3v89N8cMaZ3nyrCE5xUJKXvcCFPXwYhtwnlGC0AZZitnup6+gAwbHx9G1
 eoDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RGgwlyIc
Subject: Re: [Buildroot] [PATCH v2 1/4] package/python-poetry-core: new host
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wMi8yMDI0IDIwOjMyLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBUdWUsIEZl
YiA2LCAyMDI0IGF0IDEwOjQz4oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5k
LmJlPiB3cm90ZToKPj4KPj4gICAgSGkgSmFtZXMsCj4+Cj4+IE9uIDA2LzAxLzIwMjQgMjI6NDQs
IEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgIHBhY2thZ2UvcHl0aG9u
LXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5oYXNoIHwgIDUgKysrKysKPj4+ICAgIHBh
Y2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5tayAgIHwgMTQgKysr
KysrKysrKysrKysKPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1w
b2V0cnktY29yZS5oYXNoCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24t
cG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLm1rCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5oYXNoIGIvcGFja2Fn
ZS9weXRob24tcG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLmhhc2gKPj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi4zYzA3ZmVmMDRmCj4+PiAtLS0gL2Rl
di9udWxsCj4+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5
LWNvcmUuaGFzaAo+Pj4gQEAgLTAsMCArMSw1IEBACj4+PiArIyBtZDUsIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9wb2V0cnktY29yZS9qc29uCj4+PiArbWQ1ICA5ZWQyZjJlOTI0
NDE2NWIzNGQ3MjMzYzMwNmEzNGEyYSAgcG9ldHJ5X2NvcmUtMS44LjEudGFyLmd6Cj4+PiArc2hh
MjU2ICA2N2E3NmM2NzFkYTJhNzBlNTUwNDdjZGRkYTgzNTY2MDM1YjcwMWY3ZTQ2M2IzMmEyYWJm
ZWFjNmUyYTE2Mzc2ICBwb2V0cnlfY29yZS0xLjguMS50YXIuZ3oKPj4+ICsjIExvY2FsbHkgY29t
cHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+Pj4gK3NoYTI1NiAgZjE5NzgxMzM3ODJiOTBmNDczM2Jj
MzA4ZGRiMTkyNjdjM2ZlMDQ3OTdjODhkOWVkM2JjMjE5MDMyNDk1YTk4MiAgTElDRU5TRQo+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29y
ZS5tayBiL3BhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5tawo+
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLmUxYWNmMzE3OWMK
Pj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5
dGhvbi1wb2V0cnktY29yZS5tawo+Pj4gQEAgLTAsMCArMSwxNCBAQAo+Pj4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4+PiArIwo+Pj4gKyMgcHl0aG9uLXBvZXRyeS1jb3JlCj4+PiArIwo+Pj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+PiArCj4+PiArUFlUSE9OX1BPRVRSWV9DT1JFX1ZF
UlNJT04gPSAxLjguMQo+Pj4gK1BZVEhPTl9QT0VUUllfQ09SRV9TT1VSQ0UgPSBwb2V0cnlfY29y
ZS0kKFBZVEhPTl9QT0VUUllfQ09SRV9WRVJTSU9OKS50YXIuZ3oKPj4+ICtQWVRIT05fUE9FVFJZ
X0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zNi82
Ni82YWYyODkxNDk1ZDEyMDIwNDE5Yzg0NDdkMGIyOWMxZTk2ZjNiZTE2NjMxZmFhZWQ2YmRhNWI4
ODZkNWQKPj4+ICtQWVRIT05fUE9FVFJZX0NPUkVfU0VUVVBfVFlQRSA9IHBlcDUxNwo+Pj4gK1BZ
VEhPTl9QT0VUUllfQ09SRV9MSUNFTlNFID0gTUlUCj4+PiArUFlUSE9OX1BPRVRSWV9DT1JFX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+Cj4+ICAgIFRoaXMgcGFja2FnZSBoYXMgNCB2ZW5kb3Jl
ZCBkZXBlbmRlbmNpZXMsIGVhY2ggd2l0aCB0aGVpciBvd24gbGljZW5zZS4gVGhvc2UKPj4gc2hv
dWxkIGFsc28gYmUgc3BlY2lmaWVkIGluIHRoZSBMSUNFTlNFIGFuZCBMSUNFTlNFX0ZJTEVTLgo+
IAo+IERvZXMgdGhpcyBsb29rIHJpZ2h0Pwo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDAyMDYxOTMwNDguNjU4MDAzLTEtamFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbS8KCiAgRXhjZWxsZW50LCB0aGFuayB5b3UhCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+IAo+Pgo+PiAgICBJbiBhZGRpdGlvbiwgZm9yIGxhcmssIHRoZXJlJ3MgYSBmaWxl
IHVuZGVyIE1QTCBhbmQgYSBmaWxlIHVuZGVyIEdQTCwgZXZlbgo+PiB0aG91Z2ggbmVpdGhlciBp
ZiB0aG9zZSBsaWNlbnNlcyBpcyBtZW50aW9uZWQgaW4gdGhlIGxhcmsgbGljZW5zZS4gSWRlYWxs
eSB0aG9zZQo+PiB0d28gc2hvdWxkIGJlIG1lbnRpb25lZCBpbiB0aGUgTElDRU5TRVMgYXMgd2Vs
bC4gQW5kIG9mIGNvdXJzZSwgdGhpcyBzaG91bGQKPj4gaWRlYWxseSBhbHNvIGJlIGRvbmUgZm9y
IHRoZSBweXRob24tbGFyayBwYWNrYWdlIHdoaWNoIHN1ZmZlcnMgZnJvbSB0aGUgc2FtZQo+PiBp
c3N1ZS4uLgo+Pgo+PiAgICBSZWdhcmRzLAo+PiAgICBBcm5vdXQKPj4KPj4+ICsKPj4+ICskKGV2
YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
