Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5161FE9A05A
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 19:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0947A60EFC;
	Thu, 19 Feb 2026 19:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85niC526H_Ie; Thu, 19 Feb 2026 19:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089CD60EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771528353;
	bh=IrrWWp7/IK9zCzCgxse4ATK8A5kNJEm4NukHwsiBBsg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rx9FGC0hlMfSaygKL1C10iv6c1vrCTCz3Aw8qW/DhpWc6UxLPGfDIlYPS13UCfwvU
	 1PUIxrCH9SeW0MBZA/ArjbMq+On70f/HdXASsOycnTAbY0nVjl2LNRztpPnfwTlABL
	 ymk/hmVKV6Dp+B2hcQP4zE+DoxxYZ+6uYTJtATcuA90+JFGpZ7ju7M21QtLzyjslM3
	 ditlb+CNx0bS3JtXx80lxxeLCrRQj7L/nSPR4oxQrurF2MHjFkN36+pgUtPARqYAQb
	 8ZgfFAU/GIi0TthqGuEFV4G2hhkJlXq0exPNzgKvEfi+/7mgAGXj0u2bGeURVYoyZF
	 Jp9Gr/B3t3MDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 089CD60EF8;
	Thu, 19 Feb 2026 19:12:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 348E7206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 19:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A6C68096F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 19:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzfQ7YxaV2K3 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 19:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FF2F8038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF2F8038B
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FF2F8038B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 19:12:31 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-40f20af93aaso460156fac.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771528350; cv=none;
 d=google.com; s=arc-20240605;
 b=fq2oow6js5QRlL7ZRxZw7WSBnHt6LCHsjg6Qz6LtITbKjPslWZlqeAg4NWQPqiIh2c
 xixd0NfuroAmtezjIV/61acmFdmPS50Twqnj+uO4YBzAqWAg+kMjCdgQKMgMuBjcRgyT
 ElmoIDKgJ9JucjhNfmUq4LxNACCglfU1sbHyJuXULtZeFDHdYa5z++bwv3RfEtiORT+g
 m/o+1PMDLs0ZxlZWR4kREJo6TsoWuypWyYZYd6yzjLg18MzKqAY8k1CxWAz7LHnqqaMA
 TEP40KtRfb9mvC+xEpnoV9wZqgL/YqH4rE5KXoPENq2hx4HyMDpS0iXHu5ZnuV8HgKGw
 DgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tl8CQ2+UlyJJhdhQ+gkeGOxILutpUIRG647GYcBLN6A=;
 fh=wo7tCDjhCybiN53hXWmbFG5LuhEyalG3Ts7dxuq/aEU=;
 b=h49EIfXlzeaGUSvWaqIyeyiPzu5BHGGiRITslAL3GbPvQQD3+TO7Moeu9k9JzQQZca
 ZpFHPKFbXtPxpGkwjBUYJfF8MTtTQ+iDqtevTAvz806P13FU1HhsFl1P9M035XbRX5JK
 5Voqe38jseZUGoB0frl3RUYotGlKohjStCfbr2nKYA66Y9LbAJFPIDNog5B8SaJSABtX
 GYXI7xmmTWT1BcjjhBpnppXZcJWIYDVGhzDjGCCTBeCULFrFkJlKcnefs55cXqpwUChs
 GuulwgJ0fRxZ1XUVOQ8hkEUh409iZlM+XNoH3Y5NcLKSvwdPI69e+vxVk+Ql+BPESUzG
 8l6w==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771528350; x=1772133150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tl8CQ2+UlyJJhdhQ+gkeGOxILutpUIRG647GYcBLN6A=;
 b=hrZii9vBPHGMf3Akc/0A0jRxVAY0QfyWo28Aw2htYZSjI5OnsZjHUbSn6aNAsp1gPm
 oCh9zjGovYqbOL3jl7TJGAAdH1d/BHEwjAMpUcWrxZ1CjNzqojIM6T3W68ODbJmyTDnw
 inGLVQSpOish4UxfVN/1ufzA8eImJ+mk5/TdbGkln422yZC7F6kDTge4CXxZAzuMQrMs
 762/y0KUPNaktAPFudT/xJwvIWVeZ63X5ajSwptPm4XM+AeoLIUpuIo8WDh2uk9C+8j2
 8GT8jsMVW6DvMX17xL81D4n9VjeGOwA5D1boU6BTsMy3DB1Y9M/MWbyumaaX1PZY2KpV
 hwwA==
X-Gm-Message-State: AOJu0YxyeJUaHML0dK5E4Ma3Rf2ufUldEUT+78pcS4JRy0gy2/Be6HrT
 o8C9e4s4eK285CSWihvcLcUHhjQ8HWTZyJHAPdbJk/Ca+wVWimAGKehaVe5WEymmKv6Fpexu3W4
 sbTsVDkOCSBn7Hkh/8WbK7whtZdtYwbA=
X-Gm-Gg: AZuq6aJnmTnLpfeBHw8RWbiUPO2BdA4icdM5drsFS3DYYDvCU6zUrSOwjaRwyntpa73
 LKq5P8+Q2wU/lf3IVOrji3HXjxSECqfMHbBn73plHcM6K0UNwEnd+FTYcaMmN8l1paS2wNWjWt0
 I/EH1HA4/DQg02E4X7Q7QeYjyyneSoAyUCS6q2D85wRk9SVKSoM4ZqK5yRN1rZQ9DPD1Ko1sRng
 Ha/DAKI9IXv0DkEsPSXUI8a2w0u5pGT739QfkkE8XMU0panwhRBO3SbnZSnrCjmGFw27o4wwYPG
 ZtvSfQ==
X-Received: by 2002:a05:6820:f00a:b0:663:3cb:3f0d with SMTP id
 006d021491bc7-677696934bdmr14252686eaf.66.1771528349944; Thu, 19 Feb 2026
 11:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
 <20251203-virglrenderer-v2-v2-2-2846fc1a579a@gmail.com>
 <badd479f-f2e3-43eb-8271-e142c9426724@smile.fr>
In-Reply-To: <badd479f-f2e3-43eb-8271-e142c9426724@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Feb 2026 11:11:53 -0800
X-Gm-Features: AaiRm50goTgx7ECvkXpc5xJNjiEHAYC74Ytp2fOtPMfVY4k-_s9hQvJYAR_BnpE
Message-ID: <CAMWSM7iq3TGb4-j0VFf8n2GMS+qZtGbvft1MTv0HjivJYX3E2g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, Steve deRosier <derosier@cal-sierra.com>,
 Adam Ford <aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771528350; x=1772133150; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tl8CQ2+UlyJJhdhQ+gkeGOxILutpUIRG647GYcBLN6A=;
 b=feZsrDAoORI1CKmPfGJ2gIgWbJ+ZbrauC7Wj8aqOqoUXCnqgGPHBEuSC74/O7Ay8pL
 ofuy3ZPIG44RT9Qjb+Ys02Ccn2T/Id1DdUfhSWeQD7dAp00cqOkn7257Rvxl/cDaXMdg
 W88p5qYeMT06SDvMB9IXN9ZH4Nyts6yUbZ5PhRjkhFyTysjLck8I29DtKQAH6bKde5Ot
 zs+mDfIHaIuG/2ktThcpNNObsC/h8waZkgTSYQSb3bH7MbxuBYpTy60Ce3+zY8KPWctj
 15LZDjB+hh0wfWUNb4XSfmjv6p+Xkcmsa0kLw7IG9z3MNVDXf0kzfAES0LtyMOqy+NRI
 cZ9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=feZsrDAo
Subject: Re: [Buildroot] [PATCH RESEND v2 2/2] package/qemu: add
 virglrenderer support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgMTE6MDLigK9BTSBSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBKb3NlcGgsIEFsbCwKPgo+IExlIDA0LzEy
LzIwMjUgw6AgMDU6MjksIEpvc2VwaCBLb2d1dCBhIMOpY3JpdCA6Cj4gPiBBZGQgb3B0aW9uYWwg
dmlyZ2xyZW5kZXJlciBzdXBwb3J0LCBhbG9uZyB3aXRoIGVuYWJsaW5nIE9wZW5HTCB3aGVuCj4g
PiBuZWNlc3NhcnkuCj4gPgo+ID4gaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0ZXIvc3lz
dGVtL2RldmljZXMvdmlydGlvLWdwdS5odG1sI3ZpcnRpby1ncHUtdmlyZ2xyZW5kZXJlcgo+Cj4g
VGhpcyBpcyBhIDQwNCBsaW5rLgo+Cj4gaHR0cHM6Ly9xZW11LnJlYWR0aGVkb2NzLmlvL2VuL21h
c3Rlci9zeXN0ZW0vZGV2aWNlcy92aXJ0aW8vdmlydGlvLWdwdS5odG1sI3ZpcnRpby1ncHUtdmly
Z2xyZW5kZXJlcgoKWWVzLCBpbmRlZWQuIEknbGwgcmVwbGFjZSB3aXRoIHRoZSBsaW5rIHlvdSd2
ZSBzaGFyZWQuIFRoYW5rcyBmb3IgdGhlIHJldmlldyEKCkJlc3QsCkpvc2VwaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
