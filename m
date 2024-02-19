Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D40AC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4EC4012F;
	Mon, 19 Feb 2024 10:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 799Y0t9aTZYy; Mon, 19 Feb 2024 10:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BCAE4027F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BCAE4027F;
	Mon, 19 Feb 2024 10:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0871BF3DB
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173FC81E42
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNFFvDVTe1yI for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E52E81AF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E52E81AF5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E52E81AF5
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:31:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4125df8f347so11381005e9.3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708338679; x=1708943479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JizVJ/Lg//0mPmoUJcABPhMVqd/i4qsWmzgbDPqq65c=;
 b=vbKfmARVX85ACITBnWER+k7flSncyqpypW/u8KzAW8rgNVKwDkqFph1CuaPtyz1Fv8
 jpWc2e7Qu0XFPeTmD3e20UFSeQOOulA13I0zHkLsaxPsnftVOe4xhVUyK1HrfIZuWYLu
 06n3orFOVbGDUMe9IpX0kPQT58oPRFKAcre0NvpWA3cN9kZRXRe8jbjtCRWTpPuoV44s
 W474X1hnXbwFh7vPWfUbZSLvPUFXu/z0YkyC7nVMwwePD+sqjK2xenvzQaCJRBRguUG4
 fXE35fUKvoGihSpzwprHTVMcgiydMddU4BgNgJ4cxT3VByxsjEGeZHArk4NavPDmGZp0
 0few==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Fp9UJsBBfH6ii4f4eOn77ngcBSwIPs1Jc5MX0Co9/EA99uNzXya1dw3H9r18e500cZ7HpBaezkYIAj2gA2xmj7AI9FGljg==
X-Gm-Message-State: AOJu0Yy/Y7AJL4MKngMrYG3W1kXb8sRdTk0NmFD/p19ArymxOaEGP6y+
 KfGRfZPrfORLRESwjTxTHfdphsIdIJbOg9bbU0yFyjKTRlSgHuxtt/jbMu4BKDs=
X-Google-Smtp-Source: AGHT+IH1wWUSUO0gTt6hf4y2MLL2OO2NDRTbhk2E3KjBl1OXEhf+Owcbum/PrzqOCEYReM2pvdOXVw==
X-Received: by 2002:a05:600c:19d0:b0:412:5dbc:7530 with SMTP id
 u16-20020a05600c19d000b004125dbc7530mr3923242wmq.14.1708338679171; 
 Mon, 19 Feb 2024 02:31:19 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d68c8000000b0033b2799815csm9948062wrw.86.2024.02.19.02.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:31:18 -0800 (PST)
Message-ID: <a59e6ad3-7683-443d-95e9-197609dabdfc@smile.fr>
Date: Mon, 19 Feb 2024 11:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-21-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-21-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708338679; x=1708943479;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JizVJ/Lg//0mPmoUJcABPhMVqd/i4qsWmzgbDPqq65c=;
 b=tegIIKOL929n/IkbUafwgxyPdHC8MLSKJze8/rBBe/RyaR42U7hyhedX53eQ1Aipi4
 NDHYxnUktf0FaAnbxERB0ivqZy8hWVomfCv2R5OVdOMChSO5430gQsyMdMKvyygVMmZ8
 /O6fUTZLhnmXWNereyZUn0zhMw3Aqym0rkmKZIu/sLB2G2oXK5HJj6qUi6sWftzVVxxq
 KhkWWzlgQ0VCvmXUnewIrgv7hb2wQkGsHo4A2IXw6+1Yz/QqWBBYIaLmpvxF/aHczCND
 mZlwndpOnWvWlExL+oIGhkA96t3MpWTj8EmUfk8aQk6rp9MgfCk+RrLIuzhp+K5KG19i
 JDxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tegIIKOL
Subject: Re: [Buildroot] [PATCH v4 20/20] configs/ti_am62x_sk_defconfig:
 don't use ti-k3-image-gen anymore
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9ucyBvZiBVLUJvb3QgYXJlIGNhcGFibGUgb2YgYnVpbGRp
bmcgdGlib290My5iaW4gdXNpbmcKPiBCaW5tYW4uIFNvIGl0J3Mgbm8gbG9uZ2VyIG5lY2Vzc2Fy
eSB0byB1c2UgY3VzdG9tIHRvb2xzIGxpa2UKPiB0aS1rMy1pbWFnZS1nZW4uCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IAo+IC0tLQo+IAo+IEFkZGVkIGluIHY0Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8g
QmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBj
b25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlf
YW02Mnhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBpbmRl
eCBjZmVmY2UwYTc3YTQuLjYyNTlkZWM1OTg1ZCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3RpX2Ft
NjJ4X3NrX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4g
QEAgLTI1LDcgKzI1LDcgQEAgQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMtYW02Mngi
Cj4gIEJSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk1fRkxBVk9SPSJhbTYyeCIKPiAgQlIyX1RB
UkdFVF9USV9LMz15Cj4gIEJSMl9UQVJHRVRfVElfSzNfU09DX0FNNjJYPXkKPiAtQlIyX1RBUkdF
VF9USV9LM19JTUFHRV9HRU49eQo+ICtCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkU9eQo+
ICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15Cj4gIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9B
REVSX0NVU1RPTV9WRVJTSU9OPXkKPiAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjIwMjQuMDEiCgpUaGUgYW02NHggZGVmY29uZmlnIHNob3VsZCBkbyB0
aGUgc2FtZSwgdGhlbiB0aGUgdGktazMtYm9vdC1maXJtd2FyZSBjYW4gYmUgcmVtb3ZlZC4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
