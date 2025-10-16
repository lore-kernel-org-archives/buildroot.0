Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21FDCCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 12:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C471418D6;
	Thu, 16 Oct 2025 12:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAjwCh0mFYnR; Thu, 16 Oct 2025 12:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67224417E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67224417E9;
	Thu, 16 Oct 2025 12:13:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D6FE93E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 12:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6326F803D5
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 12:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz_hn_Iv-Xsx for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 12:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E08EF845B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E08EF845B1
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E08EF845B1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 12:13:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so107855366b.3
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760616825; x=1761221625;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BvIDSDG2fR54oE73pMyvP81e8wxPDy/b9ZLPbEjOqQM=;
 b=v0ylF1HJGTDzr1PO8xrD80eBZ4g39Cy1HpiWAVs50uNZnH1Iyu8PDk9GSVQyopOhgM
 /NthCq+GfNgxOEoHnlER6QEu0vCRVaT6JLeKjV6DhyGPgXQNb8ZZmcTVqKKNFJwekIfz
 i1LUjfqo1KbE/qsNNjZ7sQMeHWLiPNZEV5YBiMSn/VbVw52XBwWjJKDqJDrrm3JGrBMq
 oJ1SPDO6gM0hnTepYCuFJzYHpEOQ0YS+lBSl9wFP8c86nQ7DSoJSVGMg7Imt2IYn4ajI
 XGU3GJAcV+m3Z6AjrCOeOcpHutNSwRW6T9uKD4YiOcgcovRi27sZMFOuXRDs6OLTDRcm
 sOAw==
X-Gm-Message-State: AOJu0YxtHF4/ZEhj7NJeZOiEQruaxMGVI0eTmSu1JWEGxvW3KXtZiO0M
 8FWqNEMR6N3qtKPMb/9dHa2P45xq7Y65GsDmTxH0N44hHmT0Zfrx/XM599yqvbrT8twjttrmSwf
 l5Isa
X-Gm-Gg: ASbGncsE+zUlMmTOOhmI0+eut3gS9WX9ZWEoZCSggBzFLkhY8+yLjM9FXoq2ua3hqa/
 m6faw5i4OwVJ/YWlE/n//zg40pN8ZBpobyKQ59+oNP5bkpOv7os3co6ogZOFaE9CDPB/VZbCx1L
 Cb7pYHuadAlESYbwBweFW6djjsV1PKRHS5MSv0/JDveaiumglWqlJnVoiTAKVoOpI1Yd/hSY4cx
 4iaZsjl6XfvIJ7lHYNuItpOTwNyUgOeEOBuuTA1ChACuUD2MxsbfGIwKKxQH6XjWMB1Oj/kBhuV
 9RpglqF8D5fS+BRPVKHDwoBEDY8UTQO6KL65gbW4w3puD/GdX7NcLc6SEm3Dv6EaRvmBXw3fSVt
 pmyfx+4yHORUJcfyEQZFZRd2o0C6dLINzGqAJfIm+p4NFofFvC81UrlighHHTnlwNstTZo8o9pc
 jleV61PgB/jYSXqgaD4UUsT/RI8f0=
X-Google-Smtp-Source: AGHT+IEefeUxkqw+UwB72i0e+DOR542WU6RhO1e3cvuuHci+W384wXYGcz1HDqUjVXqVjOolY8nGoA==
X-Received: by 2002:a17:907:9621:b0:b49:86ac:9004 with SMTP id
 a640c23a62f3a-b50ac7e7a34mr3778154066b.48.1760616824757; 
 Thu, 16 Oct 2025 05:13:44 -0700 (PDT)
Received: from [192.168.129.33] ([109.136.97.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5ccd1af87bsm502075766b.63.2025.10.16.05.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 05:13:44 -0700 (PDT)
Message-ID: <1b152039-4caf-41af-939a-366a56b482a7@mind.be>
Date: Thu, 16 Oct 2025 14:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: GitHub Security Lab <securitylab@github.com>
Cc: buildroot@buildroot.org
References: <59c225f0-289d-4f14-b9d6-053ea8eacf40@mind.be>
 <CAM6WK6kGu+uoK6AXpxFgBG5NPkBDgc53hih-rh4saffZ==L5TA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAM6WK6kGu+uoK6AXpxFgBG5NPkBDgc53hih-rh4saffZ==L5TA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760616825; x=1761221625; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BvIDSDG2fR54oE73pMyvP81e8wxPDy/b9ZLPbEjOqQM=;
 b=F+ZB4D0bwYcqVQhahsR/+zL3NWZ6xNvr8vi7hzsSP6fg5SCdQGWKmHXOPq221BivJW
 mFd+8Qj5oBA0KQAGFy8LT5R1KcEismoNVWdUZ6iMuewnx+gIKXf376t0yDZ7fSk1j57a
 8vfrJlUvVTDL/QA+npdL3EcuN2RvPeUY0XhoDSMDNFPNqJ0BFylAZOWvLCE6E+SEunKe
 Gmr68AauTk6mtehQ9cWliv+om5sGNaWkKiu1s2SibPmvVTlAntEEnSwrPvPhqI+KAUsM
 Ujbj9r3GzenG/b6cFWpAfuLhkmV9pZ0PenftGcTeGjC7BqsuMo5tSS6Zv1ZPcUFYIgTY
 zeEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F+ZB4D0b
Subject: Re: [Buildroot] GHSL-2025-057 - Does not affect OpenCV 3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJlcGx5LgoKSSBzZWUgdGhhdCB0
aGUgQ1ZFIGRlc2NyaXB0aW9uIGhhcyBiZWVuIHVwZGF0ZWQgb24gTlZELiBIb3dldmVyLCB0aGUg
CiJLbm93biBBZmZlY3RlZCBTb2Z0d2FyZSBDb25maWd1cmF0aW9ucyIgc2VjdGlvbiBbMV0gaXMg
c3RpbGwgaW5jb3JyZWN0LCAKYXMgaXQgbWF0Y2hlcyBhbGwgT3BlbkNWIHZlcnNpb25zIGJlbG93
IDQuMTIuCgpDb3VsZCB5b3UgcGxlYXNlIGFsc28gdXBkYXRlIHRoZSAiQWZmZWN0ZWQgU29mdHdh
cmUgQ29uZmlndXJhdGlvbnMiIG9mIAp0aGF0IENWRSA/CgpUaGFua3MhClRpdG91YW4KClsxXSBo
dHRwczovL252ZC5uaXN0Lmdvdi8vdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNTM2NDQjdnVsbkNvbmZp
Z3VyYXRpb25zQXJlYQoKT24gMjcvMDkvMjUgMDA6MDUsIEdpdEh1YiBTZWN1cml0eSBMYWIgd3Jv
dGU6Cj4gQXBvbG9naWVzwqBmb3IgdGhlIGRlbGF5LCB0aGUgaXNzdWUgd2VudCB1bmRlciB0aGUg
cmFkYXIuCj4gV2UgaGF2ZSB1cGRhdGVkIHRoZSBhZmZlY3RlZCB2ZXJzaW9ucy4gSXQgbWF5IHRh
a2UgYSBmZXfCoGhvdXJzIHRvIAo+IHN5bmNocm9uaXplwqBiZXR3ZWVuIGRhdGFiYXNlcy4KPiBU
aGUgQ1ZFIGFmZmVjdHMgNC4xMC4wIGFuZCA0LjExLjAgdmVyc2lvbnMgb2YgT3BlbkNWLgo+Cj4g
T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgNToyMOKAr1BNICdUaXRvdWFuIENocmlzdG9waGUnIHZp
YSBzZWN1cml0eWxhYiAKPiA8c2VjdXJpdHlsYWJAZ2l0aHViLmNvbT4gd3JvdGU6Cj4KPiAgICAg
RGVhciBHaXRodWIgU2VjdXJpdHkgTGFiLAo+Cj4gICAgIEFzIHBhcnQgb2YgdGhlIEJ1aWxkcm9v
dCAoaHR0cHM6Ly9idWlsZHJvb3Qub3JnLykgTFRTIG1haW50ZW5hbmNlCj4gICAgIHByb2dyYW0s
IEkgYW0gbG9va2luZyBhdCB0aGUgaXNzdWUgQ1ZFLTIwMjUtNTM2NDQgWzFdIC8KPiAgICAgR0hT
TC0yMDI1LTA1NyBbMl0uCj4KPiAgICAgSW4gQnVpbGRyb290LCB3ZSBwcm92aWRlIGJvdGggT3Bl
bkNWMyAoY3VycmVudGx5IHYzLjQuMjApIGFuZCBPcGVuQ1Y0Cj4gICAgIChjdXJyZW50bHkgdjQu
MTEuMCksIGFuZCB0aGUgYWJvdmUgaXNzdWUgaXMgcmVwb3J0ZWRseSBhZmZlY3RpbmcgYm90aAo+
ICAgICB2ZXJzaW9ucyBvZiB0aGUgcGFja2FnZS4gTG9va2luZyBhdCB0aGUgTlZEIGVudHJ5LCB0
aGUKPiAgICAgdnVsbmVyYWJpbGl0eSBpcwo+ICAgICBtYXJrZWQgYXMgYWZmZWN0aW5nIE9wZW5D
ViB1cCB0byB2NC4xMi4gSG93ZXZlciwgbG9va2luZyBhdCB0aGUgcGF0Y2gKPiAgICAgdGhhdCBm
aXhlcyB0aGUgaXNzdWUgWzNdLCBpdCB1cGRhdGVzIGEgZmlsZSB0aGF0IGRvZXMgbm90IGV4aXN0
IGluCj4gICAgIE9wZW5DVjMgKDNyZHBhcnR5L29wZW5qcGVnL29wZW5qcDIvanAyLmMpLgo+Cj4g
ICAgIFRvIHRoZSBiZXN0IG9mIG15IHVuZGVyc3RhbmRpbmcsIGl0IGxvb2tzIGxpa2UgdGhpcyBp
c3N1ZSBvbmx5Cj4gICAgIGFmZmVjdHMKPiAgICAgT3BlbkNWNCwgZG8geW91IGFncmVlIHdpdGgg
dGhhdCBmaW5kaW5nID8gSWYgc28sIGNvdWxkIHlvdSBwbGVhc2UKPiAgICAgdXBkYXRlCj4gICAg
IHRoZSBDVkUgZW50cnksIHN1Y2ggdGhhdCBpdCB3b3VsZCBvbmx5IGFmZmVjdCBPcGVuQ1Y+PTQ7
PDQuMTIgPwo+Cj4gICAgIEJlc3QgcmVnYXJkcywKPiAgICAgVGl0b3VhbiBDSFJJU1RPUEhFCj4K
PiAgICAgWzFdIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL2N2ZS0yMDI1LTUzNjQ0
Cj4gICAgIFsyXSBodHRwczovL3NlY3VyaXR5bGFiLmdpdGh1Yi5jb20vYWR2aXNvcmllcy9HSFNM
LTIwMjUtMDU3X09wZW5DVi8KPiAgICAgWzNdCj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Y3Yvb3BlbmN2L2NvbW1pdC9hMzlkYjQxMzkwZGU1NDZkMTg5NjJlZTEyNzhiZDZkYmI3MTVmNDY2
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
