Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6B4CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 10:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CE780CB4;
	Fri, 19 Sep 2025 10:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO0fewWo5ahT; Fri, 19 Sep 2025 10:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53AC81DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53AC81DBF;
	Fri, 19 Sep 2025 10:37:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93CFCE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 10:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8476F81DBF
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 10:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2VluzKBZm0Q for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 10:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F02D481D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02D481D7C
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F02D481D7C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 10:37:31 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4694ac46ae0so3195195e9.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758278250; x=1758883050;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YemBvHIwkqLZyf6cGh9+svKvu+/DEpqLVj174f1G3AU=;
 b=mGLXUWtN26ac53rjPQ9ea3BRVOoRAtWF/gVpD4DN7hkGZbYgLu1+V8Z3jjtmXgw3J2
 /RxYHfrqVlFj4YXq4j1BjgvvMqs7I+SCjsMvCQ5AZLfiCoypWlhSeHUprpXeS68VecdS
 H8SaeHImCJjYjHmN+s8uOOeMSISelKu5WOSlk1Xlg0yjLKsaFsBi5z/quhqY5nm2ItCr
 V3wDBYW1g+LPiZwb2hBTss/kI9YyO9v6uacQfWOvHtTFuxIGmJHsGkPNgCf49w65u3Vt
 2gXNs8kxI/901s+7o+SNVnUSaeH5ISVgKXKqgRQ3ppsIXsmW4g70wCqrk69crQ6UU5xx
 s4Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz8gK7O4L6LzTr9FoFZadlKn04tzmLPbeGx0evX73DT1+8cUpFjWETMMpVCi/GievlIrAJe2nxH+M=@buildroot.org
X-Gm-Message-State: AOJu0YzSlwwp/E8HRDa9s0J31mhIb7jwbYCAchS1jlxah54EUunTn9Rf
 f0iVkxni34FLf0ufQ40T8TZiIhaRapgyA+8o1Zd05w8FqUQ4wr8m3TS9uIIg4QgAokc=
X-Gm-Gg: ASbGncs0yBoeDl1wPkhmhENSy2f44CzEw3++9t3qaLLZB/A5H+OIGq+0UeGJRQf2hcW
 yim8Ywm1IoQLRtIxKWOxnWmb1wLeDm8PDr8yr4k6Lika2mvijDXD/d7utlD7+o3GRyFD0R3pzeJ
 UAcSK4KlOAAV4Er2zfl2cJaUNThqlwfJPda0XJ8aMsJCNZmN9U+oIIoVkhjAIKy+AWcJUct/KLC
 qy8PpwVajy5o6jrKpeJZy+gUL9xl9WqaehsnSvCHLbPFslSjQ4sqm5cl3t2IAf775LYPUA8B9Av
 +bJZMMlGc3TbS9ndtD+szp9Errw+Pnpomp0ozb0npT0zzOgxfPRKEWhBM2Jm4Ct8SfwJ50+h5ZM
 tqEkRq1ni7b2M/OKmnpG8wOUwzj9tfChXa5mV58BBcoXyaBWBcouDLED9r/eXpKEiUcoNh2EVmR
 BYjB+vH0PChuC/bQNVEh+D6iC317Mj3k7ERwUj40A0qXqQy6yKcF31t2fY0A8twA==
X-Google-Smtp-Source: AGHT+IFDRpawM/YtmmMfr0ozyBV1EWu63o9fhBlP+v7TeOM3Ah8HVTs1a7n8g/LXhIOGBP4vvWMjWw==
X-Received: by 2002:a05:600c:8a0c:20b0:468:11af:77f7 with SMTP id
 5b1f17b1804b1-46837c5b280mr19606705e9.16.1758278249647; 
 Fri, 19 Sep 2025 03:37:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d14d212sm136212495e9.12.2025.09.19.03.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 03:37:29 -0700 (PDT)
Message-ID: <ab3a31ee-f76c-4e94-8a66-3cf00805f3a8@smile.fr>
Date: Fri, 19 Sep 2025 12:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20250919081032.1132163-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250919081032.1132163-1-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1758278250; x=1758883050; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YemBvHIwkqLZyf6cGh9+svKvu+/DEpqLVj174f1G3AU=;
 b=Rj1O/c5bznFeetP0KoVPXZTG/j2rZpWR3AIQZDd+cMNBLmcFCbSkY+YGsQhpPvgdDL
 7EU3ugMvFzVYMPAv4LcH84VqQBdkPdsXuUSMc17RSQhIDdTCf8Hgz+1nr1aJ5kBxfTqd
 VHBzW5bBn9cw+ZnlLs+qMee/diuF2zN+hW4U0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Rj1O/c5b
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 10.1.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2NvdHQsIEFsbCwKCkxlIDE5LzA5LzIwMjUgw6AgMTA6MTAsIFNjb3R0IEZhbiBhIMOp
Y3JpdMKgOgo+IENoYW5nZXMgbG9nOgo+IGh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2cv
MTAuMQoKVGhhbmtzIGZvciB0aGlzIHBhdGNoIQoKSG93IGRpZCB5b3UgdGVzdCBpdD8KClFlbXUg
aXMgdXNlZCBieSBvdXIgR2l0bGFiLUNJIHRlc3RpbmcgZm9yIGFsbW9zdCBhbGwgYXJjaGl0ZWN0
dXJlcyBzdXBwb3J0ZWQgYnkKQnVpbGRyb290LiBTbyBhbnkgdmVyc2lvbiBidW1wIGNhbiBjYXVz
ZSBzb21lIGlzc3VlLgoKSWYgcG9zc2libGUgY2FuIHlvdSB0ZXN0cyBhdCBsZWFzdCBlYWNoIHFl
bXUgZGVmY29uZmlncyAoc2VlIHByZXZpb3VzIHZlcnNpb24gYnVtcCk6CgogICAgUWVtdSBkZWZj
b25maWdzIHdlcmUgcnVudGltZSB0ZXN0ZWQgb24gR2l0bGFiLUNJOgogICAgaHR0cHM6Ly9naXRs
YWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9waXBlbGluZXMvMTgwNTY3MjY4NQoKICAgIHFlbXVf
czM5MHhfZGVmY29uZmlnLCBxZW11X2FybV92ZXhwcmVzc190el9kZWZjb25maWcsCiAgICBxZW11
X2FhcmNoNjRfZWJicl9kZWZjb25maWcgd2VyZSB0ZXN0ZWQgbG9jYWxseS4KCiAgICBSdW50aW1l
IHRlc3RzIHVzaW5nIGhvc3QtcWVtdSB3ZXJlIGxvY2FsbHkgdGVzdGVkOgogICAgVGVzdFh2aXNv
ciwgVGVzdEZ3dHMsIFRlc3RFZGsyLCBUZXN0R3J1YkFBcmNoNjRFRkkuCgpJJ20gZmluZSBpZiB5
b3UgdGVzdGVkIGlmIG9ubHkgb24gb25lIHRlc3QgY2FzZS4KSW4gdGhpcyBjYXNlLCB3ZSB3aWxs
IG5lZWQgdG8gcGVyZm9ybSBhZGRpdGlvbmFsIHRlc3RpbmcgYmVmb3JlIG1lcmdpbmcgdGhlCnZl
cnNpb24gYnVtcC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
Y290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcWVtdS9xZW11
Lmhhc2ggfCAyICstCj4gIHBhY2thZ2UvcWVtdS9xZW11Lm1rICAgfCAyICstCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoIGIvcGFja2FnZS9xZW11L3FlbXUuaGFzaAo+IGluZGV4
IGE4YjdkNjg4ZTguLjg3NmQzNGE2MzggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xZW11L3FlbXUu
aGFzaAo+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAg
IyBMb2NhbGx5IGNvbXB1dGVkLCB0YXJiYWxsIHZlcmlmaWVkIHdpdGggR1BHIHNpZ25hdHVyZQo+
IC1zaGEyNTYgIDIyYzA3NTYwMWZkY2Y4YzdiMjY3MWE4MzllYmRjZWYxZDRmMjk3M2ViNjczNTI1
NGZkMmUxYmQwZjMwYjM4OTYgIHFlbXUtMTAuMC4wLnRhci54ego+ICtzaGEyNTYgIGUwNTE3MzQ5
YjUwY2E3M2ViZWMyZmE4NWIwNjA1MGQ1YzQ2M2NhNjVjNzM4ODMzYmQ4ZmMxZjE1ZjE4MGJlNTEg
IHFlbXUtMTAuMS4wLnRhci54ego+ICBzaGEyNTYgIDZmMDRhZTgzNjRkMDA3OWExOTJiMTQ2MzVm
NGIxZGEyOTRjZTE4NzI0YzAzNGMzOWE2YTQxZDFiMDlkZjYxMDAgIENPUFlJTkcKPiAgc2hhMjU2
ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhh
YjAzMmZlNTUxICBDT1BZSU5HLkxJQgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5t
ayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gaW5kZXggZmRjODU5MWU1NC4uMGQxZDE1NDM3MSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3BhY2thZ2UvcWVtdS9x
ZW11Lm1rCj4gQEAgLTYsNyArNiw3IEBACj4gIAo+ICAjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNp
b24sIGNoZWNrIHdoZXRoZXIgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIHRhcmdldHMKPiAgIyBuZWVk
cyB0byBiZSB1cGRhdGVkLgo+IC1RRU1VX1ZFUlNJT04gPSAxMC4wLjAKPiArUUVNVV9WRVJTSU9O
ID0gMTAuMS4wCj4gIFFFTVVfU09VUkNFID0gcWVtdS0kKFFFTVVfVkVSU0lPTikudGFyLnh6Cj4g
IFFFTVVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcKPiAgUUVNVV9TRUxJTlVYX01P
RFVMRVMgPSBxZW11IHZpcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
