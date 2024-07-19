Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDFDC3DA49
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F22D3405FB;
	Fri, 19 Jul 2024 03:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aHNsvlp38n3; Fri, 19 Jul 2024 03:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B84E3407A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B84E3407A5;
	Fri, 19 Jul 2024 03:26:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D09701BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8AD981F12
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNmlvzG4Ovgh for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A877E8124F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A877E8124F
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A877E8124F
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:26:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77bf336171so242885066b.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721359584; x=1721964384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJscBr9tHoMnHrUAnQnbyzBjgS8mfoVHAu4JBf90I24=;
 b=OCIw07Y04y2CnBxkgQmJGMFZlr2EEIQycksbWrfVLzUqhRXGbnYaRkqvFArdMfqyK7
 ugN+ixXBfJnZ0gAWWl8vjFRFCaQva2Dmb/+MdI9U8BxIqfO0OdfFcrIdbrG251zk1K9T
 iGM5KH5xiXY1ViNUJ8/p1W6AebTtXjmuhLjPpOFjoFCQOQBlkHyJKDPXhCLFD5zxPwjP
 1mtCfjBoKrvtfQIBsAlRGHliwBhEzwt14mb9WRPEmDL5yiJNbsTQwVcw35g1/Ps8q5OI
 r9V/KBSI5sOpv2JtHoYpYuKmgRONlwzN/mSB+alTXafEBr7vqG8bYw5/Riey2k2xoHUN
 SSzQ==
X-Gm-Message-State: AOJu0YwgGoh+uI6XxlRf3EVT4mHg/iJhO2NO5WuFrRBpwAXSaxY6AIwF
 mXGamXbhtiS1DxpAgJNVe6e3N6cuHmqYa4rnDW2DXiQyekThS+/VUojvIO94WzcRxmXisnOl28s
 0gtNanA==
X-Google-Smtp-Source: AGHT+IG5FEpOxu3nKugGMkPha209fJyj6EVjiCsS7W0j7fCKdCOGz+cXdIV7TEVr7xsUqwBwn2nvng==
X-Received: by 2002:a17:906:e297:b0:a77:ce4c:8c9c with SMTP id
 a640c23a62f3a-a7a0f0ffe2amr438145066b.8.1721359583582; 
 Thu, 18 Jul 2024 20:26:23 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33de74e5sm37485766b.147.2024.07.18.20.26.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:26:23 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a79f9a72a99so472516666b.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:26:22 -0700 (PDT)
X-Received: by 2002:a17:906:4686:b0:a72:afd9:6109 with SMTP id
 a640c23a62f3a-a7a0f13cb46mr474786266b.16.1721359582508; Thu, 18 Jul 2024
 20:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
In-Reply-To: <20240719030537.3156999-1-james.hilliard1@gmail.com>
Date: Thu, 18 Jul 2024 20:26:11 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qXX_Xw0CseHvZ25JQF6H_AouHuFSf0xwkcQEdfqfF8JQ@mail.gmail.com>
Message-ID: <CA+h8R2qXX_Xw0CseHvZ25JQF6H_AouHuFSf0xwkcQEdfqfF8JQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721359584; x=1721964384; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJscBr9tHoMnHrUAnQnbyzBjgS8mfoVHAu4JBf90I24=;
 b=hUVcBFtSUAnwSDpxNAg455k3mD2uDg0CY1OWzl2gCK+AQ2wwFYqnrgOxBBK6jLl2Zz
 LuBQlSyvMNNCIPWOTCGyTfu+vuPNRRzzQeHA3SajADx0T+pgL4FwCB8H9HLe07DQBqLe
 inr32OXG03qrBKX1VcukfW3iSyI4ohfByPeuaUqZaSMRp0ieDAHy/hNdNeBzNm9EPOTl
 o+lLuw/GX+lbQSmbSHdCi18W3NpRTRrz2zTT8cEHBibe3+LeRVR0L/aPIEE3DZIvBKcn
 hmMr2owThHvLKP54dQyqi7Kr+kaLNKT85FXvOKYVDUz3Z19/pO7CbiKDCSfTxRW8a54N
 5aeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=hUVcBFtS
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages
 to override download GOPROXY
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBUaHUsIEp1bCAxOCwgMjAyNCBhdCA4OjA14oCvUE0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU29tZSBwYWNrYWdlcyBs
aWtlIHRoZSB1cGNvbWluZyB0YWlsc2NhbGUgcGFja2FnZSBuZWVkIHRvIHNldCBHT1BST1hZCj4g
dG8gZ2V0IHRoZSBjb3JyZWN0IGRlcGVuZGVuY2llcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKCkkgYW0gY29uZnVzZWQsIHdo
eSBkb2VzIHRoZSB0YWlsc2NhbGUgcGFja2FnZSBuZWVkIHRoaXM/CgpJZiBHT1BST1hZIGlzIHNl
dCB0byBkaXJlY3QgaXQgc2hvdWxkIGdvIHRvIHRoZSBnbyBtb2R1bGUgc2VydmVyLgoKV2hlbiBJ
IGJ1aWxkIHRhaWxzY2FsZSBmcm9tIHNvdXJjZSB3aXRoIEdPUFJPWFk9ZGlyZWN0IGl0IHdvcmtz
IGZpbmU6CgpnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3RhaWxzY2FsZS90YWlsc2NhbGUK
Y2QgdGFpbHNjYWxlCmV4cG9ydCBHT1BST1hZPWRpcmVjdApnbyBtb2QgdmVuZG9yCiMgd29ya3MK
CkFjY29yZGluZyB0byB0aGUgR28gc3BlYywgaXQgc2hvdWxkIGFsd2F5cyBiZSBwb3NzaWJsZSB0
byBkb3dubG9hZAp3aXRoIGRpcmVjdCBhbHdheXMuCgpJIHdvdWxkIHN0cm9uZ2x5IHJlY29tbWVu
ZCBub3Qgb3ZlcnJpZGluZyB0aGlzIHBlci1wYWNrYWdlLgoKQmVzdCByZWdhcmRzLApDaHJpc3Rp
YW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
