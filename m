Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123CBC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 16:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9521A40DA3;
	Sat, 19 Jul 2025 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXbqTSm_WUUV; Sat, 19 Jul 2025 16:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CA840D18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CA840D18;
	Sat, 19 Jul 2025 16:36:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77CDA117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 16:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E26740D18
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 16:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShzIL2i76GxU for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 16:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 636FE40C62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636FE40C62
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 636FE40C62
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 16:36:55 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e8bb69cdb90so2909360276.0
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 09:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752943014; x=1753547814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02lzMVuvX9HfJ/AyWrU95QifT5w6EpPzB2CLFDuW4Yk=;
 b=nhN/aKS8TrI+PEANYzqdcAVE7dHbSF+dxnp/iE+UbZKhz6Rng9j3pfcBSqRGC3xLQ1
 Lv3MqpYhNaxgqi/xfoMixKrV4Fv9qojAQwIh4doUkT428zFvJMRW0ePiXLF7wsVnp2z0
 EQbuvEiL73FkMh6GbkDQhtcFW1xft1TOQ5VXjpSNCmbkbSbX3wcJXmdA2Y/w6jjdIjG4
 nDQhUteJ0GJEEB/DPujqBddbuxPx/nXjIdTq+ECb0W1J4Xmo1lE3fJKJCg9mSOwOky/j
 w76S6p4/PVR4DM1rDaAjC7a5eZrAWK9C9jo7ZoOhttr+dr0N+7M6vkwx7kPCXm5eSMAc
 wbJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeQm7RxskyF9pUW6LeDzvBjIBJF8OUwt7f+1uEiWj4RYHm51JUhu3ShQ0FBm5z/HRUmOCBPkujnr0=@buildroot.org
X-Gm-Message-State: AOJu0Yzdkkg26q1/9QnFHERTHWdh/1xyaGnqgjK8VaDaw3GMc1Rq8oyM
 Duy8YyWziAun7L/6JdKtoec6titidGUKe8XHduo1R3sWdtWK3g6IHLRFnmO59+Otqh/Qf9eZW8D
 v1Giy
X-Gm-Gg: ASbGnctsIh6nLlLAVUHYUOV+V4vbOu3BQiMamL3seSUi7zCsHVh++M2xgXjl3x+tXgR
 0Ly6RZoBneuDBY6ZzAhXDxsXxIhO/w30Jg1k68sewdX5nVOMZTgG7Fa7LzNCTw4PvNoYZ9U+bBY
 o86q8z4opAVLxT42RJe13CA/INNDIpHVmQBYQDtAe6y2UiifjgQN9yiCahqViSv/jFrW5nglSkR
 kKYUJoG2OfPqkMwthX4tkR9u8akng9kO2K4MHYE9qwxFT6dYIg089UIJj72M9azzOPlT6nMRyCR
 miaBBFjBY5uW2KnrOsjXbWwKWjJYiFYxzbjCm1iSRRvuPecYInEBhbOwgI/YMxiwfGCpXLbYKOv
 ovMGhXNOHjD6L9mea8OZTIGgLaWfT3JxTEEafyItQsipGCaXcPuSYWy0DXUlkMfWW2Q==
X-Google-Smtp-Source: AGHT+IGMgg4vj1luIobp93tvpW6FWGGcHwTsWHR3ZkzmVKBOzzOgtJUbPHbwE1yaEaYf/mIp98yeLA==
X-Received: by 2002:a05:690c:a058:b0:718:344f:73d0 with SMTP id
 00721157ae682-71836ca9a8amr152521267b3.3.1752943014032; 
 Sat, 19 Jul 2025 09:36:54 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71953145a83sm8999637b3.34.2025.07.19.09.36.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jul 2025 09:36:53 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e733e25bfc7so2624950276.3
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 09:36:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV45QnolXcceZx58Y0ZlLsBc2QxGqGYs4WKMuS3VgWGqsz84W3KuN9kgOp6u2/E9WwV/TV/lHr2/Tw=@buildroot.org
X-Received: by 2002:a05:690c:7243:b0:719:592e:cfb7 with SMTP id
 00721157ae682-719592ef0dfmr82284267b3.28.1752943013292; Sat, 19 Jul 2025
 09:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250314154252.10248-1-tom5760@gmail.com>
 <20250331153438.4103-1-tom5760@gmail.com>
 <20250518141452.4f6ea693@windsurf>
 <CA+h8R2qBG0XV2591Y5BXo0_RvNcqCnZXJdtYsXoq=NAEff3R2Q@mail.gmail.com>
 <CAGQD++g87TTcswJDZFPL_4moRiZ7t4GSb71E3-hZyDAe9A47Hw@mail.gmail.com>
In-Reply-To: <CAGQD++g87TTcswJDZFPL_4moRiZ7t4GSb71E3-hZyDAe9A47Hw@mail.gmail.com>
Date: Sat, 19 Jul 2025 09:36:42 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oCtFA9UHtR7Uv1fp-zzUUxdjtAXQWWv1qsehCeZrTcpw@mail.gmail.com>
X-Gm-Features: Ac12FXzS1RruHqB8x5Fh3nkgw_aiUMfSKtG6VxAwVf536x3wKaAFH1mPdsOUa4Q
Message-ID: <CA+h8R2oCtFA9UHtR7Uv1fp-zzUUxdjtAXQWWv1qsehCeZrTcpw@mail.gmail.com>
To: Tom Wambold <tom5760@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1752943014; x=1753547814; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02lzMVuvX9HfJ/AyWrU95QifT5w6EpPzB2CLFDuW4Yk=;
 b=kHzjvVXPuR7QqyCIumuMKn/HuTxjI7X5125dP4k1iU2ufredXD+QiTTKKhu6zSsm5n
 ENvE1wRFSixUV2pMX8wxOds6wMGspy8+mypJQWsS+z+iXmwKl2bmzmB27iIKisPpJtXI
 2yqaWGKNYgvXZCpoJIWLfdHuorfivoxvq9HoR4TPQIaKGUVWuWu1Vh5eqnocHK5901vi
 Muh8ujvEM7xWTv6LOy8OAW2aMdGlj4BPZY+5DqB60OnRKRBei0b3r/2rJDcLX81iEAL2
 kGfNP2OWxJB3qt56Ii3wklaDC/lhNr006hN4FKkARdkAf4t6tkKxm84+tQf+lUgOw/g8
 puPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=kHzjvVXP
Subject: Re: [Buildroot] [PATCH v2] package/go: go-bin host-go provider
 implies target support
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

SGkgYWxsLAoKCgpPbiBTYXQsIEp1bCAxOSwgMjAyNSBhdCA2OjEy4oCvQU0gVG9tIFdhbWJvbGQg
PHRvbTU3NjBAZ21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvIENocmlzdGlhbjoKPgo+IE9uIFN1
biwgTWF5IDI1LCAyMDI1IGF0IDM6MTPigK9BTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFu
QGFwZXJ0dXJlLnVzPiB3cm90ZToKPiA+IE92ZXJhbGwgbGd0bSBhbmQgSSBjYW4gdGVzdCB0aGlz
IG91dCBhcyB3ZWxsLiBXaWxsIGhhdmUgYSBsb29rIGF0IGl0IG9uIE1vbmRheS4KPiA+Cj4gPiBU
aGlzIG9uZSBzbGlwcGVkIHRocm91Z2ggdGhlIGNyYWNrcywgYXBvbG9naWVzIGZvciB0aGUgZGVs
YXkhCj4KPiBKdXN0IGEgcXVpY2sgYnVtcC4gIEFueSBjaGFuY2UgdGhpcyBjb3VsZCBnZXQgYXBw
bGllZCBzb29uPwo+Cj4gVW5kZXJzdGFuZCBhYm91dCBkZWxheXMsIEkgZm9yZ290IGFib3V0IHRo
aXMgdG9vIQoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gU3Rld2Fy
dCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgoKVGhhbmtzIQoKVGhpcyBvbmU6IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA1MTgxNTMzNTcu
MTAwMDMtMS10b201NzYwQGdtYWlsLmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
