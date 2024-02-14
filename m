Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1588C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755764156C;
	Wed, 14 Feb 2024 09:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IV0d5rpI4N2; Wed, 14 Feb 2024 09:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2E04157F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2E04157F;
	Wed, 14 Feb 2024 09:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 886141BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74F5382077
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLWZNOVOKiwQ for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC5A88201C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5A88201C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC5A88201C
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:05:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so2894255e9.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 01:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707901546; x=1708506346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QG2+3rdkCtVeHuhMXtGWNeVNK2nUzsOCC9dVL4/ZYxc=;
 b=XLc6QY7R3fVxn66YNpZYdO28UoeH5eG6Q3tL05j7DbyTHJG1Bi4c4/BOl31wl3ekHU
 84/mY4V+x6EGbO6XvfQYmdpfASqzyEGqPZJQGvc9gYNmxXtgciFgy/LK4ahWMGbfNTF+
 hmSFRc0EJvCFyZ3TMU4BbJtBchDaRqyxw1uIMEiWSpy7+kPLLXw7+g6SBBbESfxCsypq
 zCs4anHpZ7Zp37sUtgxxNUMLOJ0UN+vVQhcDX5V5AcMxJR4aVdQK7Nn+izMS2CoqcsnF
 Gldvv/otQK+gvCBPaq3N4FNtrPO3ySBSmWhLYUyIQvCajEWmtdUK81p2R7l/wlYYpOFc
 QbgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtnM/2kWyABd9ABmk7vfttoVa5XqVSPxiCkvxztFBpP5PAX01hGPq9yAQ5JBt+k3cDasH1K/RDgJWqyeFoMA1rfo3WrJy2Tw==
X-Gm-Message-State: AOJu0Yzt+t+6PraVNSS2ZI2T7EIvNwPcyEc2v8FKRzJRO20iAeyHfGUI
 ZjHeYp7kZENqWEhwuZgweNrnmOxDVa8WhR8tykd0sWhPLIOVjxTElXxfhO25W3s=
X-Google-Smtp-Source: AGHT+IG9N5sx4AOVDKzPV6IcKR4RZTieEmY9dgRH2cApjH3qrrw5M8q3f3+QR8fj+Ud4hJ/cjBgoDA==
X-Received: by 2002:a05:600c:3b10:b0:411:aa3c:128d with SMTP id
 m16-20020a05600c3b1000b00411aa3c128dmr1143153wms.15.1707901546026; 
 Wed, 14 Feb 2024 01:05:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUXxv3sPj8I3pM9b0CFCzlugS1/PAw7brGD36nl05mhlgFO5qih2NPkfoTykm6zfYbt8pI55ZigI9Xeiqe24Hn+gTgYqRZiDrJuvJOYA4hCrOeL3zIdOOl6/sDrEMTa
Received: from [192.168.43.18] ([109.139.41.245])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b004117e45f12esm1321063wmo.22.2024.02.14.01.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:05:45 -0800 (PST)
Message-ID: <d3cd6291-7d61-4b0c-812c-b0907612830b@mind.be>
Date: Wed, 14 Feb 2024 10:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240213100948.5264-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20240213100948.5264-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707901546; x=1708506346; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QG2+3rdkCtVeHuhMXtGWNeVNK2nUzsOCC9dVL4/ZYxc=;
 b=PRZgzw+GQ6OyjyKGYC1BvPYx3ogZouIrecKeWFsNo8USvfRKesFxL2i3FxXe1JKj/X
 mQuar88PpUjwi6cxkmLkq8D563zmOkR5iUEOK5q7xbOVAyxfsYCdWaI7OTV4y4foooFX
 ZUkFxYHzMacaPAm41FVTejMTpQ0DGRdbvwf31PA1Ze9mXuX5eScPP6yAgGNcZic8iSdK
 onnzLSQS7hqtAT9N+iE2YUP53NR7OqZ9hsaSBkXdvUCMJEguvyrSwjYQ0neySLjFi68d
 2vZpCOxTU9HXtsX0+Tlsg3d4CEYRYJxaSKoYb7KDyhxNC4Hyb+Y6JTTdDrEPDk1pgJwc
 lSzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PRZgzw+G
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-ele-imx:
 fix dependency comment condition
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMy8wMi8yMDI0IDExOjA5LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGUg
ZGVwZW5kZW5jeSBjb21tZW50IG11c3QgYmUgc2hvd24gd2hlbiB0aGUgcGxhdGZvcm0gaGFzIG5v
IEVMRSBhbmQKPiBub3Qgd2hlbiB0aGUgcGxhdGZvcm0gaGFzIG5vIFZQVS4KPiAKPiBGaXhlczog
NjlkMTI3ZmUyOWRjICgicGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXg6IG5l
dyBwYWNrYWdlIikKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgogIFRoYW5rIHlvdSBmb3IgZml4aW5nIG15IG1pc3RrZXMhCgogIFJlZ2FyZHMsCiAgQXJub3V0
Cgo+IC0tLQo+ICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvQ29uZmln
LmluIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUt
aW14L0NvbmZpZy5pbiBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0Nv
bmZpZy5pbgo+IGluZGV4IDI0MWFkMzk0MmQ2NS4uYTk5Y2JjMzM5MmMyIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZpZy5pbgo+ICsrKyBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZpZy5pbgo+IEBAIC0x
LDUgKzEsNSBAQAo+ICAgY29tbWVudCAiZmlybXdhcmUtZWxlLWlteCBuZWVkcyBhbiBpLk1YIHBs
YXRmb3JtIHdpdGggRWRnZUxvY2sgU2VjdXJlIEVuY2xhdmUiCj4gLQlkZXBlbmRzIG9uICFCUjJf
UEFDS0FHRV9GUkVFU0NBTEVfSU1YX0hBU19WUFUKPiArCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdF
X0ZSRUVTQ0FMRV9JTVhfSEFTX0VMRQo+ICAgCj4gICBjb25maWcgQlIyX1BBQ0tBR0VfRklSTVdB
UkVfRUxFX0lNWAo+ICAgCWJvb2wgImZpcm13YXJlLWVsZS1pbXgiCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
