Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B843FEB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 02:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D88E440912;
	Tue, 27 Jun 2023 02:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88E440912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_jAcg-WVuDL; Tue, 27 Jun 2023 02:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7374090A;
	Tue, 27 Jun 2023 02:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7374090A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4027B1BF36A
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 02:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 196E681FAE
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 02:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 196E681FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMPV3IQ37kAO for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 02:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3953281F86
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3953281F86
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 02:11:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f90b8ace97so55334765e9.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 19:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687831895; x=1690423895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hD65n/Ex/yamwUm7svs8XHWuAbgOJDpw76mq5FxrU/A=;
 b=AlnToFv7pkiZ0dAnkZj1N9zhrQAd1p9FQOaPPUFh4LukX9ejVrD/jaW/BKEBTR1fBs
 SghRCr4W7FSQzJDs5GlYXdP3ZIuo/ur1pKeyDETRkamxT+clFoYgHe82PjCrmXG8i3GJ
 DsaajlRSiGNJq6pvlRTno8sPBTrDqSEDsBEiF1ld3IhVmr7I1tU7dEOAUXU22CGc1kFy
 8yODn6WDp8cVSSjC7Y5oupOaKThTf0xq2M0ILqrVI9HzuJmUhjBsYUhleVYF38xdxEbk
 EOk1NK9Cn8AzqpIAzzbbS98CqTnz1Og33OiQTjN57rFnq69ssEJLqMYoTMFivwzEF1E6
 zsVg==
X-Gm-Message-State: AC+VfDyyubJkR4g85Lf5G2iaBp9kC61KkWr8vqDxFdy9GrBb9Io2XEOf
 OfNNTdp9nGYZIXjayJwsDIMNj0sLfTEsrinSQWwlZIdSsmPRSg==
X-Google-Smtp-Source: ACHHUZ6s3EARIS7ZRE/36shOWcrhOj0BTd6RwBfAl2Nb1RUjQ/eSbrmik89k7Q14gXsZPTxdLjkOeTKtqGTRlYogzIo=
X-Received: by 2002:a05:600c:2041:b0:3f9:871:c2da with SMTP id
 p1-20020a05600c204100b003f90871c2damr21902572wmg.40.1687831894959; Mon, 26
 Jun 2023 19:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-7-bmeng.cn@gmail.com>
 <20230626171047.GE646621@scaer>
In-Reply-To: <20230626171047.GE646621@scaer>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Jun 2023 10:11:23 +0800
Message-ID: <CAEUhbmW47WVOM+Zhxa4=T4tgumKU+koEcf+QfivjsUGsUZj2Dw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687831895; x=1690423895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hD65n/Ex/yamwUm7svs8XHWuAbgOJDpw76mq5FxrU/A=;
 b=ldxvGwz090bQBOJnWNZjFyx7OPa5Dax1E/UY5WOVaLkp6W1YwkW6ySwWE2z5t0cHnA
 +uPzQsX69Y+nLfSYlW956GWTCOSqe1x/I/cHPnZuvtr6v3W/p8NnZQ8lxH7dWdDd2u51
 Na+ytaQvlc27szCWeICriwje5tKUOYl8Fmm9iyBnow4C8vGC5LB0FqrU9hQNftcKOCSB
 M2DxclLFRrHhNjQT6FKHtMLEfqa/+Ezwzye2/1cAK0bwdBhjXkzEFfq9e5re+LrFDGtQ
 TY6EWP6CGHKADajbqJibu3AUZbTt9jJ2U7gWwhdxjHElOOw78uhKaGzv7bpfpz1h9Pok
 sXdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ldxvGwz0
Subject: Re: [Buildroot] [PATCH 06/10] configs: riscv: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDE6MTDigK9BTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBCaW4sIEFsbCwKPgo+IE9uIDIw
MjMtMDYtMjcgMDA6MDAgKzA4MDAsIEJpbiBNZW5nIHNwYWtlIHRodXNseToKPiA+IEZyb206IEJp
biBNZW5nIDxibWVuZ0B0aW55bGFiLm9yZz4KPiA+Cj4gPiBTaW5jZSBjb21taXQgNjRmMWY4MjM4
NWIyICgiYm9vdC9vcGVuc2JpOiBCdW1wIHRvIHZlcnNpb24gMS4yIiksCj4gPiB0aGUgZGVmYXVs
dCBPcGVuU0JJIHZlcnNpb24gaGFzIGJlZW4gYnVtcGVkIHVwIHRvIDEuMi4gV2l0aCB0aGF0LAo+
ID4gdGhlcmUgaXMgbm8gbmVlZCB0byBkZWZpbmUgYSBjdXN0b20gdmVyc2lvbiBpbiBlYWNoIFJJ
U0MtViBib2FyZCdzCj4gPiBkZWZjb25maWcgZmlsZXMuCj4KPiBJbiBmYWN0LCBubywgYmVjYXVz
ZSBvcGVuc2JpIGlzIGEgImNyaXRpY2FsIiBjb21wb25lbnQgcGFydCBvZiB0aGUgYm9vdAo+IGNo
YWluIGFuZCwgbGlrZSB1Ym9vdCBvciB0aGUga2VybmVsLCB3ZSB3YW50IHRvIHBpbiB0aGUgdmVy
c2lvbiB3ZSB1c2UKPiBpbiBkZWZjb25maWcgZmlsZXMuIFdlIG9ubHkgd2FudCB0aGUgdiBlcnNp
b24gdG8gYmUgYnVtcGVkIGluIGRlZmNvbmZpZywKPiB3aGVuIHNvbWVvbmUgYWN0dWFsbHkgdGVz
dGVkIHRoZSBkZWZjb25maWcgc3RpbGwgZ2VuZXJhdGVzIGEgYm9vdGFibGUKPiBzeXN0ZW0uCgpN
YWtlcyBzZW5zZSB0byBtZS4KCkJ1dCBJIHdvdWxkIGFyZ3VlIGF0IGxlYXN0IHdlIHNob3VsZCB1
cGRhdGUKcWVtdV9yaXNjdjMyX3ZpcnRfZGVmY29uZmlnIGFuZCBxZW11X3Jpc2N2NjRfdmlydF9k
ZWZjb25maWcgdG8gdXNlIHRoZQpsYXRlc3QgT3BlblNCSSBkdWUgdG8gdGhlIHJlYXNvbiB0aGF0
OgoKMS4gdGhleSBhcmUgdGhlIG1haW4gcGxhdGZvcm1zIHRvIGRldmVsb3AgYW5kIHRlc3QgT3Bl
blNCSQoyLiBsYXRlc3QgT3BlblNCSSBiaW5hcmllcyB3aWxsIGFsd2F5cyBiZSBpbnRlZ3JhdGVk
IGludG8gUUVNVSBhcyB0aGUKZGVmYXVsdCBiaW9zCgp0aG91Z2h0cz8KClJlZ2FyZHMsCkJpbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
