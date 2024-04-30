Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9579FC10F16
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 591BE40148;
	Tue, 30 Apr 2024 22:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAiz15tJBOyW; Tue, 30 Apr 2024 22:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F7A840481
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F7A840481;
	Tue, 30 Apr 2024 22:08:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7541BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0820A40794
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX2UJ2FRF9q0 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:08:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D91C240792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D91C240792
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D91C240792
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:08:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso1577225e9.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 15:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714514896; x=1715119696;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WdXzsAPOd5lIrWDgdfj/wrGjVFu2yQZuYHd5BLtE7go=;
 b=MaB8kJ1lyMAJtG14Py8WNmNYLamm5y9tYjTjmmVWNAPQVMyWCvxZKXAEgRjZkay2jY
 I5HeZEr7/I0yWauFb+aw5TXk9R/QFyRYM8p4No5bWLluVVAQzsV+WQNeJoMoUlIr9wHv
 gUXpjUXgbzBmAKuThrOsRhyYamDj1ncODzSuKC5nm2R9OQif8slgw7vwUPKZnRGxxMI6
 rpUW+770BFF/iik/Rgs8nQTPgI6TsEJEm1y/vZbUwRqrd5D/rCPhjo46sg8En2nuSiz5
 37AHkXSY57opbq6AhKR9bWUnPOMOdMma0t7ZD6HIzBaHJj4v14pboj2ngtX+GIk8SISu
 dNiQ==
X-Gm-Message-State: AOJu0Yz9exc5d986HgTAyCmTpCvq32MGO1HqIwBbRCFPA2wiowLBroLQ
 i5pDUzBiJ54/4WJjvv+f+hAwuiiSNpibzdiwL7FtZmZVobeomreU0Dm90kg3150=
X-Google-Smtp-Source: AGHT+IFgbMEBsNNBA/FM5fSY5fbAeaSkPzg1D1MJSd12nrT//33pv0wvPQWYW39hbdMIDipUDbYzxw==
X-Received: by 2002:a05:600c:1c1b:b0:41c:73d:63b3 with SMTP id
 j27-20020a05600c1c1b00b0041c073d63b3mr953427wms.3.1714514895745; 
 Tue, 30 Apr 2024 15:08:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b00418d68df226sm246619wmb.0.2024.04.30.15.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 15:08:15 -0700 (PDT)
Message-ID: <8e70209e-d4d7-4646-b094-e9c65e430803@smile.fr>
Date: Wed, 1 May 2024 00:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <20240412195346.1563030-1-ju.o@free.fr>
 <CAOMZO5BrL+67sDsVvPx-XKaOLiMXJHodhtBgo5mqZ1WuZTS4hw@mail.gmail.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAOMZO5BrL+67sDsVvPx-XKaOLiMXJHodhtBgo5mqZ1WuZTS4hw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714514896; x=1715119696;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WdXzsAPOd5lIrWDgdfj/wrGjVFu2yQZuYHd5BLtE7go=;
 b=h3GKitM5GmsTnit51j7/Cd8+/f0ORHCBzzzM8Pt0ZMWieaJjG21Rv/GbsoUqCsrurL
 +XSzbi5RqXYjv/Gbxs49v9lVhkDWDSa1k0cDC2vGDV0/toaBfTnrbE6GXV+s7fJTqQId
 O5ogYcNHyIa53it0yzh1lXOl4ODwBKI+J6eZdkL9NtcroG154mMOoPBxpAHAu+2GMfj+
 QPngHgkGhm1Aa16Ip2oWKdebarZPOk0Ym9Dski4SZy2I/1vjU4hPv/x0Bkxt6dt5aEFG
 soSvrP+NYXDL0B7KYs9qAm5ICAdXcrWTRrjvLnBqLXoyRnu0RXH2yWvaEoeR26pHohsZ
 QTyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=h3GKitM5
Subject: Re: [Buildroot] [PATCH 1/1] configs/wandboard: uboot needs openssl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTIvMDQvMjAyNCDDoCAyMjowMCwgRmFiaW8gRXN0ZXZhbSBhIMOpY3JpdMKgOgo+IEhpIEp1
bGllbiwKPiAKPiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCA0OjUz4oCvUE0gSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4+Cj4+IEZpeGVzOgo+PiBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzY2MDk0NjY2NDEKPiAKPiBUaGFua3Mg
Zm9yIHRoZSBmaXg6Cj4gCj4gUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
