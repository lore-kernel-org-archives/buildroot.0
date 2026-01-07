Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FDECF6BE1
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 00:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2E840950;
	Wed,  7 Jan 2026 00:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lOdoS8yFuVI; Wed,  7 Jan 2026 00:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357B74093B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767746588;
	bh=6q5l/I6f33UyP2PGcIm8Ga/b6Bi2Tmu88hyLXw00ZZY=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MTr+CIXeirr61LRxxGznbb0y77zpaxyJYvHttpurmyezyKP9UlBswrSN3wDku8+7v
	 lpbV/GZc3w6dkGLC5h/fUyVScdyj236ORBsohMvwai4DGun7Wxkpv+jm8fIQ1dJcr4
	 a8PiPy5RcYDGgWLfiqKAjayIyucKLFZN7brohMAnltRxmagKiwmrA8wZS9gfR1zcGC
	 HOQXYVzgimnvf12nYuGcAzN9wE/ufhe/tq61oYT0xzrGPJrn1nqKStA4LiG90abKw+
	 qrb3mmTJQ/wdEWWcBeS+2OQf4uHKDlUF7wnbaccr+UZ/Ld1c5Axt7Df4BEtjMpmZ5k
	 IG4GB1IFQ7jvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357B74093B;
	Wed,  7 Jan 2026 00:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E57249
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 00:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0907460788
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 00:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8WMvn_JMF4R for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 00:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0A9E60706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A9E60706
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0A9E60706
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 00:43:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-59b67388c9cso1419487e87.2
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 16:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767746583; x=1768351383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZqTncunycjHs2EIQCk9XcY5PzHnmJa0N16i6BkiWHyc=;
 b=tc2qCwcyRwLrtE5H6Jj5eCdIDqhRNmqyjaFEHE2SxK3GVf2E4HBOKYfxbM5dvCY+wG
 3EKRNkV+tBXFMsJH6nurYHEyQcQ1Ikpf0lncUZzB6/v+jVa3OxLzO1S/f/CjOc6TrTI0
 v4MeAZlPa6eUn8j9uS6+jebF1djjczKV/8yAGbvf/8J2SW3QLMOkICcL22XRzGnUL2Ws
 mDXQ390umO7BRY/6ZIW0nOp8/FmUIHsccRuNqOFqGNw+3nDuTx7khlfnaZdUcHtFijLO
 1y0TwH+2gwfpc4fewqgBaF2Kbb+8m5qkSKKwwbnob+FL0DWvRblrqM5rJ9XkeF3uiGwE
 fuGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW87Z0JfXUEObSUUVXAIQ97AIVq7RV2gh4HEd+/lt5gRx0XsV+m0CRNpQFGwVU3t5Dsu1DMTbLp3Ik=@buildroot.org
X-Gm-Message-State: AOJu0YzSvjpHLituetyVzZczRtLVQVlSa5pVxtA9NMchhDrWq/Y/VTDF
 oB09Z5S/33zZValIeSxxRaQGmCMDYrN/h3kvZ/8cCTl/1au9pJfA1fyWTCBPotch0j6WCmn4iGe
 5Y5OcS1D6Fw==
X-Gm-Gg: AY/fxX5x/oei6jqqz2MCjuCH8kfEeOeuoykjiaInVP8ykEsSRtPje8McJ/ju5GB/NiD
 lEjZ/R2NNLsCjjCmvGhubJBcBtJZhYpUBCHjVsBJcm5w6JOEfhsVgnvc1UYO09TmvzOg3etiFwv
 qSF4hbMj4UdMZgbyUpBpqZwMNGgEExDrd4bKrwqcdbPZEzL9k30lXBf/XnZg8WzFqziN651c8QP
 55hc34rqNQXfWr/iFABmQRR5V+rI1SGieR7+rJnyEEKwshExgFl6GpaM+IDtdGUQ3UhwuYIx/gb
 qwqBUE2qIX6SD6HtuiVErKD7+Qz2NTBQOsJ9Q4mGYFYGSH+xUuHhP51gU8UQ/dvxbDa74hcVdmu
 PbbgBPjlcLeu5G65RgXwgpHnHIH8q2Dr4jxpmEea6okQo8y7LQlHmn2FYa2aio2eBULIT0kqSnP
 x1152MpZECuSuz5liI0dPSUBbWXC5Pm4Bo6YVAIbvxji24LXS+KA==
X-Google-Smtp-Source: AGHT+IGs0FO+G/G0xxCZAVsxeXirFB6Wwx0HnGGoSRa9Bq1N5/FZU93dX0LTTTcxtlv3bz1mVCUhCg==
X-Received: by 2002:a05:6512:304c:b0:594:357a:220c with SMTP id
 2adb3069b0e04-59b6f04098amr198473e87.40.1767746582811; 
 Tue, 06 Jan 2026 16:43:02 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8ad930sm7825581fa.28.2026.01.06.16.43.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 16:43:01 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59b6f59c4f5so199857e87.3
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 16:43:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYNSh/HrJNmfdwU2H1OuxoMqWPJf2zU/ydFRlzuRAGhLKHRmErc25ow5NOq4/cUFe4Nucvp28X8Ek=@buildroot.org
X-Received: by 2002:a05:6512:2305:b0:59a:11a4:4c29 with SMTP id
 2adb3069b0e04-59b6f0410a5mr193427e87.41.1767746580170; Tue, 06 Jan 2026
 16:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20251227212244.3098285-1-festevam@gmail.com>
 <20260106220704.3283de69@windsurf>
In-Reply-To: <20260106220704.3283de69@windsurf>
Date: Tue, 6 Jan 2026 16:42:49 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pb=eD8o1yxvStZDHTdFzrTSUGR2Tt0t-g_H_-M==LedQ@mail.gmail.com>
X-Gm-Features: AQt7F2qzDf66KZ0LE_3fSU6h9_rekrcwQxzvBe3RszLkobXwMkrQqFV0PRmdeZ8
Message-ID: <CA+h8R2pb=eD8o1yxvStZDHTdFzrTSUGR2Tt0t-g_H_-M==LedQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1767746583; x=1768351383; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqTncunycjHs2EIQCk9XcY5PzHnmJa0N16i6BkiWHyc=;
 b=YTn8gcg5aeruL54alfYRVbK7MvAY4ClzrilenD5/st60ZomDVKJkucOrIodP1BxqjH
 vrQvdlILMlatwPgJQbQgWVVDgeC1YSy6ag9LVGuAdIB7tzbmtAirb7AkgX2Yb0q0y2ah
 4bXLmrVT0YMtR/Mhn2oDe6MNPfZrcdQ6sR3pMesUjJj0h6TjaVx5X1rwSxJuvgK81AA/
 +KSFX1Sg5bDOX2Vh/6pdwTN0atuWYFMkx87xaVIZJQkKkIzQK/QBtU5zoVKzq36jwvaC
 URh5zJS5OWEHhkvU7rZmcyZ7nQxqnG+kzk0Rv6FVxyrC9CFDM8ZL6KCK0zmtb0I55FHy
 cMFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=YTn8gcg5
Subject: Re: [Buildroot] [PATCH] package/crucible: disable cgo to fix 32-bit
 build failures
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxOjA34oCvUE0gVGhvbWFzIFBldGF6em9u
aQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBGYWJpbywK
Pgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBBZGRpbmcgQ2hyaXN0aWFuIHRvIHRoZSBsb29wLiBD
aHJpc3RpYW4sIGNvdWxkCj4geW91IGNvbW1lbnQgb24gdGhlIGJlbG93IHBhdGNoIGFuZCBoZWxw
IHVzIHVuZGVyc3RhbmQgd2hldGhlciB0aGlzIGlzCj4gdGhlIHJpZ2h0IGZpeD8KPgo+IEZhYmlv
LCBvbmUgY29tbWVudC9yZXF1ZXN0IGJlbG93Lgo+Cj4gT24gU2F0LCAyNyBEZWMgMjAyNSAxODoy
Mjo0NCAtMDMwMAo+IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4gd3JvdGU6Cj4K
PiA+IFRoZSBCdWlsZHJvb3QgYXV0b2J1aWxkZXIgZmFpbHMgd2hlbiBidWlsZGluZyBjcnVjaWJs
ZSBvbiAzMi1iaXQKPiA+IGFyY2hpdGVjdHVyZXMgKG5vdGFibHkgaTM4NikgZHVlIHRvIHVucmVz
b2x2ZWQgX2Nnb18qIHN5bWJvbHMgZHVyaW5nCj4gPiBsaW5raW5nLgo+ID4KPiA+IENydWNpYmxl
IGRvZXMgbm90IHJlcXVpcmUgY2dvLCBhbmQgYnVpbGRpbmcgaXQgd2l0aCBDR09fRU5BQkxFRD0w
Cj4gPiBhdm9pZHMgdG9vbGNoYWluIGFuZCBsaW5rZXIgaXNzdWVzIHdoaWxlIHByb2R1Y2luZyBh
IGZ1bGx5IGZ1bmN0aW9uYWwKPiA+IGJpbmFyeS4KPiA+Cj4gPiBEaXNhYmxlIGNnbyBleHBsaWNp
dGx5IHRvIGVuc3VyZSByZWxpYWJsZSBidWlsZHMgYWNyb3NzIGFsbCBzdXBwb3J0ZWQKPiA+IGFy
Y2hpdGVjdHVyZXMuCj4gPgo+ID4gRml4ZXM6Cj4gPgo+ID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzBiNTlmYjM4MmY3YTFkOWMzNjQ0ZGE3MWU3YmQ1M2I2YTE5NDE4
Y2UvYnVpbGQtZW5kLmxvZwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4KPgoKSWYgQ2dvIGlzIG5vdCByZXF1aXJlZCwgdGhlbiBkaXNhYmxp
bmcgaXQgc2hvdWxkIGJlIE9LLgoKTG9va3MgZ29vZCB0byBtZSEKClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
