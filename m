Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44ECD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 10:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2670760633;
	Mon,  8 Jun 2026 10:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TtF_LCkGFoz; Mon,  8 Jun 2026 10:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4834D606DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780915265;
	bh=/6XxQgUzi1adHmWA5pcU1ZuO0WO7ixjiRFHrITdrtaQ=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D36oW4GYqpuxV106gE4IcueuRUW2O+46nEi5kOvfajSLBmP4Lglm4hOlFyEsVXhFv
	 /h9MbLyqqVmdj7mzzMTLoRehvuG6sjw2K43kMb8TOC39QXdKYaqxNh9ihCUROSnUVL
	 rcC2anjh70cr4CNflNAIcyO27zOzv5/2rFFZ0OmJNYHauwc3+6QMP9KGLbQbRZZRV1
	 Wkx29Oyy4TJKv/rHQOZ9GqOBywuRBwKGJUPF3YTSpde8HCv5MiQn6wHtkpdbpB7yrQ
	 pOpG1L4gp2z5YpKVqHOGnn1RdQrIpdNL8hboDcXzWq8TXhuJ4s6VVb+UrQZ2Jj4IB7
	 7UieKN6qnTQPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4834D606DA;
	Mon,  8 Jun 2026 10:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 495EE2C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47300606DA
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtcCS1Z8DeHx for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 10:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0B2160633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B2160633
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0B2160633
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:41:02 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-39677234558so41831201fa.1
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 03:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780915260; x=1781520060;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bl9Ra29HiJZFV2nzUtEXohKRWkOBDty0w1Qfo+++HOI=;
 b=CJ676mRW8R77F0E7x1BjVG4O0p8PBLMbWdQlwqDID4gtvMWxgc3gD7Op8JVfr9S5Vy
 D9+D0B7ryz3Ct36OSA0U9fYlNvRhPrKwSp5P8i5xa2egicezpkN3xO/MiXYu5ELgvKVL
 LKEcuAfi5UG3GGAZVCl64/JebqZ38F/cmfW5ECYo+oL0+t1Spsunqdq59rGQQRn/efPW
 GCZME9eHyDdn90vlc2yVzgXpidEPR/Cb2Z5JKcvzeeELwRv+5o0xI7FoqMGjPfPYeH6Y
 44AiMatjB6HK38H/FsAoc62BciGKJ4pzVbG4Iz9tJrLvbylhHDIjOlAhm0Lv8ltaad9o
 Pzsg==
X-Gm-Message-State: AOJu0YytBbhrTJT9PF0XeKXZOojac1vtdf/wBWUHq+R2ifvkEzDeeeWe
 ZeHQskcEfouJYQwhFKwZmvXWYND8/bZkai8/nYvdYYhOerejZJzk0mS9Y7ojAZuKgr0IXfQ8ZsL
 WJT9W3P897w==
X-Gm-Gg: Acq92OHu58B3PiKmXBLL5oy4PwCuN8uLXKFw6TyDtlgMQZMtuzIwiH0m65YgvJOvKzN
 QhLUC3bmLyIk94ucuRGeP3kOWNX81srVlpYHjkRQWuyLT+K/aUF8SaVK1bOlJ5Gc4qREJUS0VCd
 aYwtuwFskzCWjR++9Wbg3Vl5RvectgtYDjhdKPQJTS79XR2pyQUuyWAF2km67knbrOcRzxKn47p
 ylXaMeGN2KQFIv//OtrV7fwSjmAHFf+ndUmvuQ8lZCYWGKofXuwdcvv+/xvPX19lnQH07WszSa5
 2XvMmJDtakVAzs+e9SsEBiztA7r1VgfJqzGNI8BHdXwWo0cZLmjlrkJRmlT1ltkPzFQz6PZqu92
 iY/UG8/jIlYwQ+LURoPmKWtBjFRZPRhmU2WYxd0tFZdfCjkKEVK+E4f3/+d7p0cS47Z8cYSdRXd
 P6bNuL7LZpCG2HQ9qn5suFHyrXFDTa8M005iuTnwvu+9347q3wrQ5MvAGOqSoFSfjieh5c0f/ZN
 can
X-Received: by 2002:a2e:bc0f:0:b0:393:a37e:b131 with SMTP id
 38308e7fff4ca-396d079d2e6mr37537681fa.9.1780915260284; 
 Mon, 08 Jun 2026 03:41:00 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-396abf66eb6sm46070851fa.6.2026.06.08.03.40.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:40:59 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3966c0d5ac9so40451591fa.2
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 03:40:59 -0700 (PDT)
X-Received: by 2002:a2e:b8c2:0:b0:394:1192:5e0c with SMTP id
 38308e7fff4ca-396d091c3d3mr44425061fa.21.1780915259036; Mon, 08 Jun 2026
 03:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260608095745.737902-1-titouan.christophe@mind.be>
In-Reply-To: <20260608095745.737902-1-titouan.christophe@mind.be>
Date: Mon, 8 Jun 2026 03:40:45 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pnLUW6EgCT1vo4-T=MyYvux=mL=WoCHW789m+rhEGkcA@mail.gmail.com>
X-Gm-Features: AVVi8Cezzx5b3HYWYWFijAxIkGM5x9FtKOfqjfoKNKnQHNMAE-AzMmQbnD14RFs
Message-ID: <CA+h8R2pnLUW6EgCT1vo4-T=MyYvux=mL=WoCHW789m+rhEGkcA@mail.gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1780915260; x=1781520060; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bl9Ra29HiJZFV2nzUtEXohKRWkOBDty0w1Qfo+++HOI=;
 b=GIV9a7iCFG8QUiCp9xKzk7IzztqmozvqpViQ41MKjUi6eCXkZgJ4SKh8gcSAmvEN31
 2GhfW12Bl5jybmx6Sy7XFbQ3ZscMmNvFUGsViSFAJcE60/gwk1rbNeGtRE5gE94p9aoi
 /w/5O+ZLRFjEeYpadDso8pTm2wKeUuxFUevlEC5lTEUmusn/2gVlMFA5TwsJPeoPAXWl
 +Q8fXd9Oin9y9f1G1DKDnJa6x2BPoIl6JAMOCg54FBR8t/JASg3Jqf8M098dxTfCXBe7
 99xP/KDOnd3LRypRj0uJG8ipN1N9/LjVDbPc8eAEXSuxYn4P/3IL21U8+LRWbPs+ZJYD
 Zgxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=GIV9a7iC
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/runc: security bump
 to v1.2.9
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

SGkgVGl0b3VhbiwKCk9uIE1vbiwgSnVuIDgsIDIwMjYgYXQgMjo1N+KAr0FNIFRpdG91YW4gQ2hy
aXN0b3BoZQo8dGl0b3Vhbi5jaHJpc3RvcGhlQG1pbmQuYmU+IHdyb3RlOgo+Cj4gRml4ZXMgdGhl
IGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXMgKGluIHYxLjIuOCk6Cj4KPiAtIENWRS0yMDI1LTMx
MTMzOiBjb250YWluZXIgZXNjYXBlIHZpYSAibWFza2VkIHBhdGgiIGFidXNlIGR1ZSB0byBtb3Vu
dCByYWNlCj4gICBjb25kaXRpb25zCj4gICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmNvbnRhaW5l
cnMvcnVuYy9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtOTQ5My1oMjlwLXJmbTIKPgo+IC0gQ1ZF
LTIwMjUtNTI1NjU6IGNvbnRhaW5lciBlc2NhcGUgd2l0aCBtYWxpY2lvdXMgY29uZmlnIGR1ZSB0
byAvZGV2L2NvbnNvbGUKPiAgIG1vdW50IGFuZCByZWxhdGVkIHJhY2VzCj4gICBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmNvbnRhaW5lcnMvcnVuYy9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtcXc5
eC1jcXIzLXdjN3IKPgo+IC0gQ1ZFLTIwMjUtNTI4ODE6IGNvbnRhaW5lciBlc2NhcGUgYW5kIGRl
bmlhbCBvZiBzZXJ2aWNlIGR1ZSB0byBhcmJpdHJhcnkKPiAgIHdyaXRlIGdhZGdldHMgYW5kIHBy
b2NmcyB3cml0ZSByZWRpcmVjdHMKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuY29udGFpbmVy
cy9ydW5jL3NlY3VyaXR5L2Fkdmlzb3JpZXMvR0hTQS1jZ3J4LW1jOGYtMnBybQo+Cj4gVGhlcmUg
YXJlIGFsc28gbnVtZXJvdXMgYnVnZml4ZXMuCj4KPiBTZWUgdGhlIHJlbGVhc2VzIG5vdGVzOgo+
Cj4gLSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmNvbnRhaW5lcnMvcnVuYy9yZWxlYXNlcy92MS4y
LjUKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuY29udGFpbmVycy9ydW5jL3JlbGVhc2VzL3Yx
LjIuNgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5jb250YWluZXJzL3J1bmMvcmVsZWFzZXMv
djEuMi43Cj4gLSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmNvbnRhaW5lcnMvcnVuYy9yZWxlYXNl
cy92MS4yLjgKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuY29udGFpbmVycy9ydW5jL3JlbGVh
c2VzL3YxLjIuOQo+Cj4gU2lnbmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFu
LmNocmlzdG9waGVAbWluZC5iZT4KPiAtLS0KPiAgcGFja2FnZS9ydW5jL3J1bmMuaGFzaCB8IDIg
Ky0KPiAgcGFja2FnZS9ydW5jL3J1bmMubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9y
dW5jL3J1bmMuaGFzaCBiL3BhY2thZ2UvcnVuYy9ydW5jLmhhc2gKPiBpbmRleCBkMjVkOGZhY2Zk
Li4zMzg1MDIzOGYzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnVuYy9ydW5jLmhhc2gKPiArKysg
Yi9wYWNrYWdlL3J1bmMvcnVuYy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBj
b21wdXRlZAo+IC1zaGEyNTYgIDk3ODVjMTQ0Yzk3OTc0YjUyYjYwOTFiN2E3OTE2OGI3MzY4MWZm
NTc0YmM4NDM4YjQ0ZjNmNWY4YzExMmYxNzEgIHJ1bmMtMS4yLjQtZ28yLnRhci5nego+ICtzaGEy
NTYgIDhlMjk4NDY5ZmM3MjlkMzc5MjBhN2VlNDVjN2NkNTg3YTQxMzkxNDlhYmNjY2E0ODVlMDhk
NjE2YjgwZDJmYWQgIHJ1bmMtMS4yLjktZ28yLnRhci5nego+ICBzaGEyNTYgIDU1MmE3MzljM2Iy
NTc5MjI2M2Y3MzE1NDIyMzhiOTJmNmY4ZDA3ZTlhNDg4ZWFlMjdlNmM0NjkwMDM4YTgyNDMgIExJ
Q0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydW5jL3J1bmMubWsgYi9wYWNrYWdlL3J1bmMv
cnVuYy5tawo+IGluZGV4IDUxYWMzMmRlMjYuLjBkYWZmYTEzNjggMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9ydW5jL3J1bmMubWsKPiArKysgYi9wYWNrYWdlL3J1bmMvcnVuYy5tawo+IEBAIC00LDcg
KzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAtUlVOQ19WRVJTSU9O
ID0gMS4yLjQKPiArUlVOQ19WRVJTSU9OID0gMS4yLjkKPiAgUlVOQ19TSVRFID0gJChjYWxsIGdp
dGh1YixvcGVuY29udGFpbmVycyxydW5jLHYkKFJVTkNfVkVSU0lPTikpCj4gIFJVTkNfTElDRU5T
RSA9IEFwYWNoZS0yLjAsIExHUEwtMi4xIChsaWJzZWNjb21wKQo+ICBSVU5DX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCj4gLS0KPiAyLjU0LjAKPgoKTGd0bSwKQ2hyaXN0aWFuIFN0ZXdhcnQgPGNo
cmlzdGlhbkBhcGVydHVyZS51cz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
