Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F212C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D09040902;
	Sat, 22 Aug 2026 12:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9go3y6a73UU1; Sat, 22 Aug 2026 12:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402123;
	bh=92XdjNXl86Izjp5oyK+o12qbmAuEBfoevI0TrMvC5BM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eu5w8ggop/HPgGyCrt5Nd4Nw6YfqajMp559+K5M+sXOgOx6bd8q4ZrnZdNWRYm5V8
	 6Jv1QfULbHsg5NFhGOxBv/1LrnPOOU0SJaSwuXL7qanf2WlysBBm3RRHAZto09oGqr
	 W+Sq5K3kFbRffF9D0LMMtBz3HF54v25ACukjJdpDzw5N8hljLB9TfYe2R/iAqBuB6M
	 MYVMB8WntjjslIdt8N7tzyaP0i2isKQ3xpnAdVu1J8Tkn/3uQ3+YKyLzp2tk5QP1lQ
	 a490NLyth8EJyJTGaIzTFjh1RHxd7w/v/bKfOhfgu2VMfp7QWO9MQkWmEp9EFTgsjR
	 Wpo9ACQDpIfaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 033B04083B;
	Sat, 22 Aug 2026 12:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 866862B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BDA780F28
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMf4CbHbe38h for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C11580F03
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:35:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-69c108fee7fso3375030a12.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402118; x=1788006918;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e3Mmk9p/plg5JwoEd1Vi0934NgW/XkUgNE3ZxKJGpS4=;
 b=Lfb4W6ZGh9LV5jM1iCwRsKwDjg71FcnDmwe8krBai2bgfDyVNSfr/ByYtvb/zEc8/J
 oE+YbQPCvRJiif2c6JWpZseTE8iga+lQYvVqcQn1yU/XHe6EyLnLx3SOJxTVY8PsHjY1
 XdreSnRaXj6fIBDNoStWe5Ciu7WJSVAKsTblGYHhdmPJ4Z3HjJjL8squdtAvVwyHjPQA
 XhiYf90cUUWV5oCqpJTHPo1ldBu13QakKgilrt9X8KCHHSq+CqtBqshyRhA8/AUI4aeH
 QWZR2FbgMTG9qnAWYouUQjWgjYfhBeEB0hfRaHW2nvgIgPos9HuxykU5Bf9P6+nktAjO
 TPeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqNbCdntFBqAUFsxVNfCmU9uMW7CT+UKdb+xZ7w20WK2COUfNwSBfsjLnXYEKBp3JZDHjn/HKpQe9Q=@buildroot.org
X-Gm-Message-State: AFuF++nusoOPZ3up+LmL6tFzPoFqUjphPMusqnSdFbfJaKPVW+kg94sK
 yeq68s49b8ywhjXpNywuZNHkukYcQH7ciofDtLiTNkQlhGTdIJ5ZWF2b/2WHgEEP5N4=
X-Gm-Gg: AR+sD12gHL0sB6hWltfm4vrzrSg49VPFh/QIm4RYPblrC4Z24c4hX+u5PzBgctme3K9
 qdUtg3mkOFIbSsswagAkFbPufN+naUDsixwjQ7p+6ZSYr4LxRYYkGxVlgXm6/J2lhuVZUDkcszP
 FkKDtKiWsaQycIk7BzFYGa8jmpcIbT1PwlDOnb/h8s+ZwYkZs20tctPqmABy/aVtHdBtkVemExE
 jN+ysRBxywSXhwO9fTORdvQ5hnfePFHUFs7T9zY5GVorN61Mlij7YqDmU/OGJM4I4zt8FHCE/Ll
 w/7K/ioyZOJRbMF4kTeJuCUtN6BsFI//mtqXAjV4KFkqUV/fmRj9aHM0h1gC+Os5QBDK3DskjrF
 OUDRzCvW6XhKyU4fPdJgSRAxOToaVa0OnwnoqhkEjF4wUPkj1EKQTxmPSBmpfKsGwTiKUZ0Y1Hh
 aDs4fvReULfqZlvJc1Q9HXtV8RYqNk9ZADwd8pMR65/I76P0zSDfLhRMnX/QtQD6ShQNveUi3h6
 D1ROp5cQobPgEHwWKnnnBGIVryEsMD8it9HEZbf1ERXVw77
X-Received: by 2002:a17:906:ba88:b0:c24:670c:b8da with SMTP id
 a640c23a62f3a-c24926a1b7amr685161566b.11.1787402117908; 
 Sat, 22 Aug 2026 05:35:17 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24968ba7b6sm285951766b.62.2026.08.22.05.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:35:17 -0700 (PDT)
Message-ID: <628fbdf2-1bc0-4a53-8815-47e7697268dd@mind.be>
Date: Sat, 22 Aug 2026 14:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Maxim Kochetkov <fido_max@inbox.ru>
References: <20260818082809.952856-1-raphael.melotte@mind.be>
Content-Language: en-US
In-Reply-To: <20260818082809.952856-1-raphael.melotte@mind.be>
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.11
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTgvMDgvMjYgMTA6MjgsIFJhcGhhw6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gRm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHJlbGVhc2UsIHNlZToKPiAgICAtIGh0
dHBzOi8vd3d3LnBvc3RncmVzcWwub3JnL2RvY3MvMTcvcmVsZWFzZS0xNy0xMS5odG1sCj4KPiBG
aXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxpdGllczoKPgo+IC0gQ1ZFLTIwMjYtNjQ3MQo+
IC0gQ1ZFLTIwMjYtMTQ2NjMKPiAtIENWRS0yMDI2LTY0NjQKPiAtIENWRS0yMDI2LTE2MjM5Cj4g
LSBDVkUtMjAyNi0xNDY2OQo+IC0gQ1ZFLTIwMjYtMTQ2NjQKPiAtIENWRS0yMDI2LTE4MDI0Cj4g
LSBDVkUtMjAyNi0xNjIzOAo+IC0gQ1ZFLTIwMjYtMTQ2NjgKPiAtIENWRS0yMDI2LTE0NjYyCj4g
LSBDVkUtMjAyNi0xNDY3OQo+IC0gQ1ZFLTIwMjYtMTQ2ODAKPiAtIENWRS0yMDI2LTY0NjkKPiAt
IENWRS0yMDI2LTE1NzQxCj4gLSBDVkUtMjAyNi02NDcwCj4gLSBDVkUtMjAyNi0xNDY2Ngo+IC0g
Q1ZFLTIwMjYtMTQ2ODEKPiAtIENWRS0yMDI2LTE0NjcyCj4gLSBDVkUtMjAyNi0xNjI0MQo+IC0g
Q1ZFLTIwMjYtMTg0MDgKPiAtIENWRS0yMDI2LTE5Mzg1Cj4gLSBDVkUtMjAyNi0xNDY3MAo+IC0g
Q1ZFLTIwMjYtMTQ2NzcKPiAtIENWRS0yMDI2LTE0NjczCj4gLSBDVkUtMjAyNi0xNTc0Mgo+IC0g
Q1ZFLTIwMjYtMTQ2NzYKPiAtIENWRS0yMDI2LTE0Njc4Cj4gLSBDVkUtMjAyNi0xNDY3MQo+Cj4g
QXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0LTUKPiBTaWduZWQtb2ZmLWJ5OiBSYXBo
YcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIDIwMjUu
MDIueCwgdGhhbmtzICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
