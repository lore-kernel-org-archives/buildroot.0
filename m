Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5090C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 17:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E0080C7A;
	Thu, 22 Aug 2024 17:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNlkyV6pWkPy; Thu, 22 Aug 2024 17:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA93280C7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA93280C7F;
	Thu, 22 Aug 2024 17:25:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7BB1BF35C
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 17:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13D5E80C7F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 17:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LRw95dhPVES for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 17:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23A4080C7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23A4080C7A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23A4080C7A
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 17:25:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a869f6ce2b9so20297066b.2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724347516; x=1724952316;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JkU0rfjbAYlzmAAWzIM9ohBlcN4sTmX7XOwti1KXOUg=;
 b=w96CqKEEcc7GBLz6Q7EPswlweVqsnWV81nf1UAQUBn0Afr7a78p8p8Y372W6v4Ch5x
 2sfMoE1k3a7Zpm8/eHYbcfeihGM2mStIVSUn6THxLbdKEWcR0f7v32aB9zWU3DdzCXc5
 Xzz4v05PIDRdy5QLmdLFufrTQgCm+BquAkakHvK1ajRikjlxo9a4Nw3W9H0fzSidnTo6
 JqLNhXC8SlXfAtSZvburwNmxy5I8m5QFkYGdxyMx8oP/1aldg1eoA6wPez/Isoo5dfCd
 WU/gKyGt/ItZHU3USze6etkyXH9wD1twjtDK7DAW2ya+nX3dhnl9COno2kHoyTjc7c/B
 DtpA==
X-Gm-Message-State: AOJu0YywfXAldKstggnltkF8grha2q92X+JCCruuLttoA+Uo0PcNSgy6
 1pgK7baq5X/qfwBDI+p4xCeJ3iiWGb68lhMHS4QCzgOX0WzDzTxMYd2jfQkZPTA7chkxUuBhWc+
 R
X-Google-Smtp-Source: AGHT+IGHWgS523yTVOHIY3LYRQJ24osGZAbAzNaVDx+I+Fk7VQ0gu4UL9CxgGAsdZOe55IDj1e5Imw==
X-Received: by 2002:a17:907:2cc6:b0:a7a:be06:d8e7 with SMTP id
 a640c23a62f3a-a866f8f45b4mr494108066b.44.1724347515887; 
 Thu, 22 Aug 2024 10:25:15 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8696e1f70esm88863866b.152.2024.08.22.10.25.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 10:25:15 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 899F75F8D5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:25:14 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
In-Reply-To: <20240822130220.4135741-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 22 Aug 2024 14:02:16 +0100")
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
Date: Thu, 22 Aug 2024 18:25:14 +0100
Message-ID: <87wmk8lbb9.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724347516; x=1724952316; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JkU0rfjbAYlzmAAWzIM9ohBlcN4sTmX7XOwti1KXOUg=;
 b=lJqsgzUWx//4GXGzwZ4YayGijhAkVwYKZBrDnl7+dO1LSI6BvR1rO3RLhiH0mo8J7I
 FdTVF4lKvzzGg5fQMfR7pF8OfLPSBwEmExKLBSGw/sR5UhxKDnt9y4Kl43TSG73it0x8
 4WZriSG3FR44dOLOOjM7VwiF2xW7iQafPsfA9kfTkvKZr7G1KRl3pOinpDLhAJbkIz+q
 fEd7YSBH+ajIwRCBWqUXdOtI5ctqRVnm6NLgsNfU1qjJP62GD0wpORw7qGERemexpm3v
 Z4BeYvWRNH1SQiCuMMGRZjdAB/CeOqqXECHvOdCurHNhYBAsVFG5kXty6ycy20sW6e4o
 4DvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lJqsgzUW
Subject: Re: [Buildroot] [PATCH 0/4] Update Mesa and enable vkmark
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+IFRoaXMgaXMg
cGFydCBvZiBidWlsZGluZyB0ZXN0IGltYWdlcyBmb3IgdmlydGlvLXZ1bGthbiBzdXBwb3J0IGlu
Cj4gUUVNVS4gV2UgbmVlZCB0byB1cGRhdGUgTWVzYSwgZW5hYmxlIHRoZSBWaXJ0SU8gZHJpdmVy
IGFuZCBhZGQgdGhlCj4gdmttYXJrIHRvb2wuIFRoZXJlIGlzIGFsc28gYSBzbWFsbCBwYXRjaCB0
byBlbnN1cmUgd2UgZW5hYmxlIGEgZ2V0dHkKPiBvbiB0aGUgY29uc29sZSBzbyB3ZSBjYW4gc3Rh
cnQgd2VzdG9uIGFuZCBzcGF3biB0aGUgdmttYXJrIGJpbmFyeS4KPiBDdXJyZW50bHkgaXQgaXMg
bm90IGFibGUgdG8gcnVuIGRpcmVjdGx5IHdpdGggdGhlIERSTSBkZXZpY2UuCgpJJ20gc3Bpbm5p
bmcgYSB2MiBub3cgSSd2ZSBzZWVuIHNvbWUgbmlnZ2xlcyBmcm9tIHRoZSBDSS4KCi0tIApBbGV4
IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
