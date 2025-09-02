Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58C9CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 15:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8128260E17;
	Tue,  2 Sep 2025 15:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kam1kHm_8HQR; Tue,  2 Sep 2025 15:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2997360DD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2997360DD2;
	Tue,  2 Sep 2025 15:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D5DCD2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC4860E0C
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYEeB0Jo3Z5n for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 15:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DE90608A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE90608A3
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DE90608A3
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:28:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b7e69570bso28550935e9.0
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 08:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756826923; x=1757431723;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mSTbpKbYSEavchfkdS9KMj98wJnJqbWB8GgG3mS7xms=;
 b=MCL0lL33B24QyWM1r2gXGQm8zGp4zLHXva3pD2heqWyo9SGOjvqxwmATuPVEyqcbkT
 ZQSgFCTjaKNRtAfpdeYKFEzi1mGDFPYQNDNLFmAZLWU4VdHWzBqN3J7GgizUP2tG77YQ
 0SHvZkoOmSuRpGvn79gzedxTke82ZoM4sb3oiOePuSFH+WoqFVFAnkdEkP3ybl4CnN6A
 AyG8P+nrc1itoqIdtKsCWIR803UJuH5xx+4QfhbPdBh//LXa8AO67+djPIGKVBAydL65
 N9aw8xHkbTvc1lTXQoOaEnUmDkDr3XUAIlqfBwmImQAX2myDHhCr1Rdy8wJxzxRO6UMw
 vg3A==
X-Gm-Message-State: AOJu0YzrfkMf6jXRhO3tIFa2IETYqbVZGOOmYYXdHI6oWS2cxatx9IR+
 mbKmyNVcsgz/wkuFGCHpXuazCgUolHawO/vOOJ1j2v8oJ5CoCe7GWKB630EOj9MRguw=
X-Gm-Gg: ASbGncto/JguYTfwPPYD7qSbJ9vqZ0nF8VhFGWKD4vcs+Ewz8ovJPVbhDHlpiAupfdB
 LN6Hb2GdbFZNSRI80uvVq7se45MrMypgFRpNUZTHBRwTtEN4mhyqxDSFlHhi9JCmJtDzuER8XeY
 dq+DzyzjFhv/6eSVgkwVZSGUjJUvQ7E4DtNyRWK/j2l2Sid1c5uvSn85mYCTe7mTao4e9ePJUZq
 4YHZpIXXdFUBIAFpnsX+ykmbcQs5h8ucj5YGRTb+v8sA4n0Sskg6Ab8ZbP0S/2eiBCfesIdnzjp
 XuNF57oIkYp7lLsU0c7Vm1H45VuNMeQigQKiRbyvnjWP/DtUPyRl4KG6L2yu3w3vfd9m7DoCGAd
 Kj59DegqDJbbeVzxMc+c6JTyOnwQTpaa6lENimBJZo9gYZqhlc8ZVVwWFeQVUw+aoLNkryKwupG
 eSIh26pJr8NtZu
X-Google-Smtp-Source: AGHT+IEOQixCANAv2u8dI5j7OuoOyoMCnVEyBPemkllIvF2iBrR74QGhHRHgLHpv6VQ24hIPljsUFA==
X-Received: by 2002:a05:600c:4513:b0:45b:7eb4:cee4 with SMTP id
 5b1f17b1804b1-45b8557b769mr87498455e9.32.1756826923320; 
 Tue, 02 Sep 2025 08:28:43 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a1f807f9sm19290190f8f.38.2025.09.02.08.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:28:42 -0700 (PDT)
Message-ID: <f834c040-70df-46dc-91b1-c50b9a91a69d@smile.fr>
Date: Tue, 2 Sep 2025 17:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>,
 Romain Naour <romain.naour@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
 <20250902154936.1563f079@windsurf>
 <cdae50eb-2553-4baf-ac3d-450838705c32@smile.fr>
 <20250902171144.479f13a6@windsurf>
Content-Language: en-US
In-Reply-To: <20250902171144.479f13a6@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756826923; x=1757431723; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mSTbpKbYSEavchfkdS9KMj98wJnJqbWB8GgG3mS7xms=;
 b=peIbSxgm9AkGgr5O8fILhqN2UtyJAeegKBU3TPOnBJDWMljKu09s/MoYs7a/P+j6at
 kYsVCoWFGObSrooPjaXQ1vbDIyMZ1Dpz1INRkfk+zwR9NHmzQaswpA/4k92fLv88MA45
 RSa3Dhd0m0EDDMSPzDWH+XLSb1BZuEtPCZk78=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=peIbSxgm
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkxlIDAyLzA5LzIwMjUgw6AgMTc6MTEsIFRob21hcyBQZXRhenpvbmkgYSDDqWNyaXTCoDoKPiBP
biBUdWUsIDIgU2VwIDIwMjUgMTY6NTY6NTkgKzAyMDAKPiBFbCBNZWhkaSBZT1VORVMgPGVsbWVo
ZGkueW91bmVzQHNtaWxlLmZyPiB3cm90ZToKPgo+Pj4gVGhpcyBsaW5rIGRvZXNuJ3QgbWFrZSBz
ZW5zZSBhcyBpdCBjYW4gY29udGFpbiBmYWlsdXJlcyB1bnJlbGF0ZWQgdG8KPj4+IHRoaXMgb25l
LCBlc3BlY2lhbGx5IGluIHRoZSBmdXR1cmUuIFlvdSBuZWVkIHRvIGluY2x1ZGUgdGhlIGxpbmsg
dG8gb25lCj4+PiBzcGVjaWZpYyBidWlsZCByZXN1bHQuCj4+IEkgY2FuIGZpeCB0aGlzIGluIGEg
djIgaWYgbmVlZGVkLgo+IPCfkY3vuI8KPgo+Pj4+ICtVcHN0cmVhbTogbm90IHN1Ym1pdHRlZAo+
Pj4gV2h5Pwo+PiBEbyB5b3UgbWVhbiB3aHkgd2UgYXJlIHN3aXRjaGluZyBmcm9tICdyZWdleC1v
bmlnJyB0byAncmVnZXgtZmFuY3knLAo+Pgo+PiBvciB3aHkgdGhlIHBhdGNoIGhhcyBub3QgYmVl
biBzdWJtaXR0ZWQgdXBzdHJlYW0/Cj4gV2h5IHRoZSBwYXRjaCB3YXMgbm90IHN1Ym1pdHRlZCB1
cHN0cmVhbS4KVGhlIHBhdGNoIHdhcyBub3Qgc3VibWl0dGVkIHVwc3RyZWFtIGJlY2F1c2UgdGhl
cmUgaXMgYWxyZWFkeSBhbiBvbmdvaW5nCmRpc2N1c3Npb24gYWJvdXQgcmVtb3ZpbmcgT25pZ3Vy
dW1hIGZyb20gYmF0IGFsdG9nZXRoZXIsIHNpbmNlIE9uaWd1cnVtYQpoYXMgYmVlbiBkZWNsYXJl
ZCBhcmNoaXZlZDoKCiDCoCBodHRwczovL2dpdGh1Yi5jb20vc2hhcmtkcC9iYXQvaXNzdWVzLzMy
ODUKCkZvciBub3csIHNvbWUgZmVhdHVyZXMgaW4gYmF0IHN0aWxsIGRlcGVuZCBvbiBPbmlndXJ1
bWEgYnkgZGVmYXVsdCwgc28KdXBzdHJlYW0ga2VlcHMgJ3JlZ2V4LW9uaWcnIGFzIHRoZSBkZWZh
dWx0IGVuZ2luZS4gVGhhdOKAmXMgd2h5IEkgZGlkIG5vdApwcm9wb3NlIHRoaXMgcGF0Y2ggdXBz
dHJlYW0uCj4KPj4gSW4gdGhpcyBwYXRjaCwgSSBzd2l0Y2hlZCB0aGUgZmVhdHVyZSBmcm9tICdy
ZWdleC1vbmlnJyB0byAncmVnZXgtZmFuY3knLgo+PiBUaGlzIGRvZXMgbm90IGFmZmVjdCB2ZW5k
b3JpbmcgaW4gb3VyIGNhc2UsIHNpbmNlIHZlbmRvcmluZyBpcyBiYXNlZCBvbgo+PiBDYXJnby5s
b2NrLiBJbiB0aGUgY3VycmVudCBDYXJnby5sb2NrLCAnc3ludGVjdCcgYWxyZWFkeSBsaXN0cyBi
b3RoCj4+ICdmYW5jeS1yZWdleCcgYW5kICdvbmlnJyBhcyBkZXBlbmRlbmNpZXMuIFRoZXJlZm9y
ZSwgdGhlIHNldCBvZiBjcmF0ZXMKPj4gaW5jbHVkZWQgaW4gdmVuZG9yaW5nIHJlbWFpbnMgZXhh
Y3RseSB0aGUgc2FtZSBiZWZvcmUgYW5kIGFmdGVyIHRoZSBwYXRjaAo+PiAoSSB0ZXN0ZWQgdGhp
cyBsb2NhbGx5KS4KPj4KPj4gV2hhdCByZWFsbHkgY2hhbmdlcyBpcyBvbmx5IGF0IGNvbXBpbGUg
dGltZTogYWZ0ZXIgdGhlIHBhdGNoLCBDYXJnbyBidWlsZHMKPj4gd2l0aCAnZmFuY3ktcmVnZXgn
IGluc3RlYWQgb2YgJ29uaWcnLydvbmlnX3N5cycuCj4+Cj4+IERvIHlvdSB0aGluayBJIHNob3Vs
ZCBhdm9pZCB0aGlzIGFwcHJvYWNoPyBJZiBzbywgSSBjYW4gbG9vayBpbnRvIGFub3RoZXIKPj4g
d2F5cyB0byBmaXggdGhpcwo+IEFhYWgsIG1ha2VzIHNlbnNlLiBJIHdhcyBub3QgYXdhcmUgb2Yg
dGhpcyBtZWNoYW5pc20uIFNvdW5kcyBnb29kLgo+IENvdWxkIHlvdSBzdWJtaXQgYSB2MiB0byBm
aXggdGhlIG90aGVyIG1pbm9yIGlzc3Vlcz8KQWNjb3JkaW5nIHRvIHRoZSB1cHN0cmVhbSBkaXNj
dXNzaW9uLCBpdCBzdGlsbCBtYWtlcyBzZW5zZSBmb3IgYmF0IHRvCmtlZXAgT25pZ3VydW1hIGFz
IHRoZSBkZWZhdWx0IGVuZ2luZSBmb3Igbm93LiBTbyBiZWZvcmUgc2VuZGluZyBhIHYyLCBJCndv
dWxkIGxpa2UgdG8gdGFrZSBhIHN0ZXAgYmFjayBhbmQgZXhwbG9yZSBhbm90aGVyIGFwcHJvYWNo
LgoKSSBrbm93IHRoYXQgJ29uaWdfc3lzJyBjYW4gc29tZXRpbWVzIGxpbmsgYWdhaW5zdCBhIHN5
c3RlbS1wcm92aWRlZApPbmlndXJ1bWEgbGlicmFyeSBpbnN0ZWFkIG9mIGNvbXBpbGluZyBpdC4g
SW4gQnVpbGRyb290IHdlCmFscmVhZHkgaGF2ZSAnb25pZ3VydW1hJyBhdmFpbGFibGUgYXMgYSBw
YWNrYWdlLCBzbyB3ZSBjb3VsZCBjb25zaWRlcgp1c2luZyB0aGF0IHN5c3RlbSBsaWJyYXJ5IHJh
dGhlciB0aGFuIHBhdGNoaW5nIGJhdCB0byBzd2l0Y2ggdG8KJ3JlZ2V4LWZhbmN5Jy4gVGhpcyB3
YXksIHdlIGNvdWxkIGtlZXAgYmF0IGFsaWduZWQgd2l0aCB1cHN0cmVhbSB3aGlsZQpzdGlsbCBm
aXhpbmcgdGhlIEdDQyAxNSBidWlsZCBpc3N1ZS4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhp
cz8KCnNlZQoKaHR0cHM6Ly9jcmF0ZXMuaW8vY3JhdGVzL29uaWcvNi41LjEKCkkgd2lsbCBsb29r
IGludG8gdGhpcyBvcHRpb24gYW5kIHRoZW4gY29tZSBiYWNrIHdpdGggd2hhdCBJCmZpbmQsIHRv
IGdldCB5b3VyIG9waW5pb24gYmVmb3JlIHNlbmRpbmcgYSB2Mi4KPgo+IFRoYW5rcyBhIGxvdCEK
Pgo+IFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
