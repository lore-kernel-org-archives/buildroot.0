Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76219C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 16:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192456FA8F;
	Thu, 23 Jan 2025 16:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg0j8wBE_o61; Thu, 23 Jan 2025 16:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC526FA51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC526FA51;
	Thu, 23 Jan 2025 16:48:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD74F94A
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A81EC6FA7D
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dqkp2fZxxeFf for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 16:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C29C36FA51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C29C36FA51
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C29C36FA51
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:48:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so8317355e9.3
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 08:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737650920; x=1738255720;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+dklIOY4hvLwASHtdw2e4LrF8m/T2Q0Z8KLJ+es+iH8=;
 b=vNK5kKUeDHRPPSlf0h4NELx83gneXgKjF1pR2JI6vwqr/xC+eSM8TWC/XX2U2iEagO
 wBAN6OIXJqCIIrbcBogciyiMDvxDrfKEyvS+uA8ypSay9YI2zvUW/p6emVl4nKlyl1py
 t7MAauNStBlPWK1Fe/bp2q5hIptN/c/YtwBwhfcUB0jbhORVGLrGl22orEZ3JFYcBPiG
 rDhPdcp9a3L1RlxqcF61lgSRC70nNvizOSU/CqspigXjp8sAOAu0RxZzpkWhoC/ObWxl
 cDLxB5PFsoyytiLdadkIlTVw6nzi6DsDQRMHeZoE5UcXIPZirqIC9sgMntpGrn2Jr9zW
 syWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyCCDb1fT8pv/Pnz7sJvC7oLl8sXkcz55jLM+ExpauvJKpI0YO8Z2mW4FSBcww0/cdleVEqfx9Cps=@buildroot.org
X-Gm-Message-State: AOJu0Yyruc/zBryOL7rVtOixsGNTXjb3FkcxE5m+0ghxeWgC07znA5be
 9ZlyNAiGzId6zsT71psVRzD6EcTNG32Xc3dVsaA5tlwdGDVnSUxKw1xZXzCKPUw=
X-Gm-Gg: ASbGncupInZhLOrOo84qxJ+RtO8unmOUfYJ1icQ1KabjIPJKyVKzj/WKgbX2uiV9M+Y
 /glLeYwoOel21mT3zJIkebYJk0mcHXHwXW9DVrpnifG4VnsAaLZ7lNa4ZZN0ZvhZbfrX3V+3b5h
 /rHMO6VKFVV0jZKZ+Y2E9PGevu7FstTFgjW07MwO0Xtt8POmqtAM8o2feQ/mq56DS362LI/ozSr
 mvmNPv/uCs97ABEIt3o1g0gWuChH0ew6/7yF1o23pNa7WMv6QoZaN7r+LhgAOuIfkMsQt5cHe14
 +rNlWjd4T8+bpm/9ni2PcFFl9aLAz5bL+36ZEj8=
X-Google-Smtp-Source: AGHT+IFBqq6o8AuxnJUO8yPYV4z5bR9jayTa3OHeeuznu9iV7e68+QcouBzavNshu9fOYgifI8NrFA==
X-Received: by 2002:a5d:4845:0:b0:385:f573:1f78 with SMTP id
 ffacd0b85a97d-38bf566e2b2mr19595319f8f.24.1737650919172; 
 Thu, 23 Jan 2025 08:48:39 -0800 (PST)
Received: from [10.5.0.131] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6f8sm168423f8f.28.2025.01.23.08.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 08:48:38 -0800 (PST)
Message-ID: <4b45904c-53ab-4e37-9776-c315a5354ff1@mind.be>
Date: Thu, 23 Jan 2025 17:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
References: <20250120113405.3938838-1-neal.frager@amd.com>
 <716b05a8-c26c-4c6e-aa01-4bcb43ce4303@mind.be>
Content-Language: en-GB
In-Reply-To: <716b05a8-c26c-4c6e-aa01-4bcb43ce4303@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1737650920; x=1738255720; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+dklIOY4hvLwASHtdw2e4LrF8m/T2Q0Z8KLJ+es+iH8=;
 b=D92VMXH3LLp5RL/4/qv4h9Z0/RDYQQBLWdm4J6/CtkzR/9nJlzFTlBLF5Zz1PPW4VN
 qcuZpj8iQ/RxKfrVXJBCYruG2UMN7RPkLFOG8Gft1MS/iLVAfEvnZ+rInD4c0z5moGQp
 uxH7QcSiOIH+0LCghAcXJjO/FpjtMuaL/jK7AM9HPkEatAngezB8rK5wHWeGaVe6DbXK
 b3oieS7XfVzv2ePH8XcyAOVONqH1AQCw9AA4wL2hwoTdSjUFcv0Gkb8CBAuV6dvCJJq2
 qadlczVHTl2UPVJMiZ/xn/aSTQWhRr0dHNMoY+Tkx2SdcmMWCyTi8vIsa94FOIUulg89
 +B9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D92VMXH3
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAxLzIwMjUgMTc6NDcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
TmVhbCwKPgo+IE9uIDIwLzAxLzIwMjUgMTI6MzQsIE5lYWwgRnJhZ2VyIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4+ICtYSUxJTlhfRU1CRURERURTV19MSUNFTlNFID0gTUlUCj4+ICtYSUxJTlhfRU1C
RURERURTV19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+Cj4gwqBJbnN0ZWFkIG9mIGFkZGluZyBh
IHBhdGNoIHRoYXQgYWRkcyBhIHN5bWxpbmsgZm9yIExJQ0VOU0UsIHlvdSBzaG91bGQgc2ltcGx5
IHNldAo+Cj4gWElMSU5YX0VNQkVEREVEU1dfTElDRU5TRV9GSUxFUyA9IGxpY2Vuc2UudHh0Cj4K
PiAoYW5kIHVwZGF0ZSB0aGUgaGFzaCBmaWxlIGFjY29yZGluZ2x5IG9mIGNvdXJzZSkuCgoKIMKg
U29ycnksIEkgaGFkbid0IHNlZW4geW91ciB2MyB3aGVyZSB0aGlzIGlzIGFscmVhZHkgZml4ZWQu
CgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
