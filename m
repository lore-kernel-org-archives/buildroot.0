Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB20C3DA63
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00A680AA9;
	Thu, 18 Jul 2024 14:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3WlyT2nI2xw; Thu, 18 Jul 2024 14:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1244781EDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1244781EDF;
	Thu, 18 Jul 2024 14:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75EEC1BF59C
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 14:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63A03606CB
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 14:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZWGrvpsHOas for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 14:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=gnijieb@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80BC660648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BC660648
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80BC660648
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 14:54:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-367b6e5ffbfso492390f8f.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 07:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721314480; x=1721919280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J2UkJ8ZV2f099Yrmx5YyQCM5AXo8a3vAfepVYxNIhIs=;
 b=KH/sHDVk2z4UJS3HJF79F+X2knMCd8P0QrOVs8rYLenF8YSPpnM26gto9un43ngADb
 3tsb9FeAdEizogbHYSrNl6Rz5ett0LoT/EZg6XWc4GMyagVk3WGHw1Oc1x4edfl0FMpq
 j3fE+kxfoywlj7oeEDl8r2hQ9cETqpItLi1e9o3ltcGxSpF/l8Y3WBMLW0MtbBTAWA9j
 92p0bjP5y50kTl5fYeaxRgSDQ4l/k0YwaXtIVceSGmtP0RX7QR6Dg4OYN1QLaNWmR+M6
 p3SOVzXbTEHs5YrpWEXq+qy2W/is9hPmSfHTe2B/C9VLp1i9NyohrufS+vVAGLL/CGMe
 e5MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMKDqhD3k4dI2w2rRryMmb/ba3+H8zYZdlw1Jld5BQpMMadVV7Uz/VMsDmby5tAE8zJZ+Xs8G5xP0d6DjKeHmn7Gix5z5KHg==
X-Gm-Message-State: AOJu0Yxagz3e6mb9SMCEaJPirJ4ICdYbAU4cYXo4edQJLVtH9IyhT6ww
 crs5OVm6qmfRs5itKjueX8o33bFEwecCnHWVVgUOfOPlN9a5KDjyPobF2PbK8cGmMA6v+lH5H0F
 bRyYEi/FnK1K62TmAhUeYukz0cCA=
X-Google-Smtp-Source: AGHT+IGOJ9qvpRbn63GR1QdyBXdUVB01l2Gw4MPQwCnIMWUYzHaWkymwYHg423GfdwZ2aw3Iiu40laE6Hb+zdh2t84o=
X-Received: by 2002:a5d:584c:0:b0:367:98e6:2a1a with SMTP id
 ffacd0b85a97d-36831737bdemr4854567f8f.49.1721314480127; Thu, 18 Jul 2024
 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <ab972f7e-5540-4703-bd51-4f6384a030bd@logicway.de>
 <c3151785-3627-45f3-a4c0-49c69c13aa6a@mind.be>
In-Reply-To: <c3151785-3627-45f3-a4c0-49c69c13aa6a@mind.be>
Date: Thu, 18 Jul 2024 16:54:29 +0200
Message-ID: <CANabuZdOQ5AhJFrma0r4i9P-MS1KL7840wf_E5AgoG1TwBz=LQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1721314480; x=1721919280; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J2UkJ8ZV2f099Yrmx5YyQCM5AXo8a3vAfepVYxNIhIs=;
 b=aNUYL+c3v2AhdAvHuXfTurKO4T4SYDbG/iaRsVOYznkHlcHvDQw5r1D/ZlGSP3OwJG
 WeYdd85O5T5bGaFIkcuG6IaI2x8pTWtUf8bsJzQFfYwa5NIJlvgedvHTqrjhGUUbnvnu
 c4YjAbFDryr07XYvQ6SfjLRm4cEd+jkTkS94bF21Zr1EIfYS4J20tgSsCxFjfAEjhlzX
 4OcVT2mLUZisw7NIBrIVF4XJveH/CqUOKasn1RUxuyGE7E4s3Agkyk9NN2/4oAPJ2/z3
 x6FssaT4EeRg1+t09w1neYOGfSwkmR9njHOQZ3piWIUXLxe+mZKbFlIvgjbcgnlr32pK
 de9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aNUYL+c3
Subject: Re: [Buildroot] kernel 6.1.46
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
From: Andreas Hilse via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Hilse <andreas.hilse@googlemail.com>
Cc: buildroot@buildroot.org, Ralph Nemitz <nemitz@logicway.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFscGgsIEhlbGxvIEFybm91dCwKCk9uIFRodSwgSnVsIDE4LCAyMDI0IGF0IDEyOjE2
4oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyb3RlOgo+ICAgWW91IGRpZCB1cGRhdGUgaXQsIHJpZ2h0PyBBIG51bWJlciBv
ZiBub2RlcyBoYXZlIG1vdmVkIGFyb3VuZCBhIGJpdCAoSSdtIG5vdAo+IHN1cmUgaWYgdGhpcyB3
YXMgYWxzbyB0aGUgY2FzZSBvbiBBTTMzNVgsIGJ1dCBJIHRoaW5rIHNvKS4gVGhlcmUncyBhIGdv
b2QgY2hhbmNlCj4gdGhhdCBhbiBleHNpdGluZyBkdHMgZG9lc24ndCBlbnRpcmVseSB3b3JrIGFu
eSBtb3JlLgoKVGhlIEFNMzM1eCBEVFMgc3RydWN0dXJlcyBoYXZlIGJlZW4gcmV3b3JrZWQgcXVp
dGUgZGVlcGx5IGluIExpbnV4IDUuMTAgSUlSQy4KCkkgaGF2ZSB0cmllZCBteXNlbGYgdG8gdXBn
cmFkZSBvdXIgb3duIExpbnV4IDQuNCBiYXNlZCBBTTMzNXggRFRTIHRvCjYuMSBidXQgY291bGQg
bm90IGdldCBpdCB3b3JraW5nIGFuZCBoYWQgdG8gc3RvcCBkdWUgdG8gbGFjayBvZiB0aW1lLgpJ
IHRoaW5rIGl0IGFjdHVhbGx5IHN0b3BwZWQgZHVyaW5nIGJvb3QgKG5vIG1vcmUgY29uc29sZSBv
dXRwdXQgYW5kCmFsc28gbmV0d29yayBub3Qgd29ya2luZyBkdWUgdG8gRFRTIGlzc3VlcykuCgpS
YWxwaCwgaWYgeW91IGNhbiBtYWtlIGl0IHdvcmsgSSB3b3VsZCBiZSBpbnRlcmVzdGVkIGluIGFu
eSBoaW50cyB0bwp5b3VyIHNvbHV0aW9uLgpJJ20gYWxzbyBvcGVuIGZvciBhbiBpbmZvcm1hdGlv
bmFsIGV4Y2hhbmdlLCBJIG1pZ2h0IGhhdmUgc29tZSBub3Rlcwpmcm9tIG15IHRlc3RzIGZyb20g
bGFzdCB5ZWFyIHNvbWV3aGVyZS4KClJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
