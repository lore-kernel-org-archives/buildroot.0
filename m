Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4396CA6007
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 11:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC4340669;
	Wed,  7 Oct 2026 11:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HaH7z0gY-A6; Wed,  7 Oct 2026 11:02:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5B0E1405F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791370920;
	b=Zexc2VYSKgOvb0zYn9vZUbh99e+gLP6LQIHKW/lo6R83Oc2sLmIzmnbHZw9F7FWEXWG5
	 B/1N7KZwd6iK2muKu8ICcpACCqEoRJgFonJ3DcmUDC3N4gJLB0kChU+qpbhz0Wzkoo+Mr
	 MOY8deyl/lXulmByWEO4MTLRjbT1HJFon0f8tAEnUM9uRFNQM/rg7M6EGJjZwMuyMBcne
	 pWy6ieCwdeU9ll2+F0DrfyXNKJT0uoNUjiuyH23F/z4LtV+gO/KzerhTmwJW/fmEcvVjN
	 MkOJApaYXoj7cTsD2DWZjliWcEgm7ymaYTIJ1JqpDeu+Z6z45h3ckEe2E/9OMFfzVzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791370920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4TO7avpBMkZAg4TW57Du+BWDNfRTFExsB0Ka2FwEEq4=;
	b=fZaJFmRjM0qCFpErgOlqEmJTO4zSY0rykrX2bJae9bt3BNFNb8mGgekj23NrThwZdhht
	 SZQ0CQL3sQJ5YWwiaed19Vn9L6jeVOaET4n0TB4vKKg945Ond/r3YumFd/cnZgCyEECJ8
	 tFLQTgpdBwDe9kGa3oByY2D8btgTZGjrXIKEGK2mtGkB9lXPdpnzoFYIOqDAzBOKwqyh3
	 +erOy/nZB1hJ3a5EjOq5juIKX9l55hS1NttB2TwmdVER3JbTe8+XMFT3AAhV8HVA7r0bl
	 kLb5iJJhRGJfA+Wb5Fph8pwkhMZ9sOLux0gvAoFxm9QjjKgiBThhlNf8QRoYQvWUrnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791370920;
	bh=4TO7avpBMkZAg4TW57Du+BWDNfRTFExsB0Ka2FwEEq4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yn2SUeAdcb3CgiKq8suCADTEG88cIenLEgzkLjGaGZ/PH7KYhSWWueQ/vYzXk2/Z0
	 Byvw//SoiMFBdQxKSG/qOHRbuQ1n7NPnDYhd9koxLu6aAXf88i5LAllXD6zlpRHqd6
	 3m0SydKoik1rdzGQBpCV7dPUmCUKC1wqzFXbBzs9E6KxKDn+9kHKHFbaxZlWjp7kHP
	 DQjw8CxsPql6fNIdAhdLAd5Jw85Bw723zB/r+pSufRKqL3cY5+MzyFQDr4Wzsnsg5z
	 n6jxrfpLeP5DxphuzgDC8KFtGgAskt3MWRUfKX0Okx2qRmjBfrNHBam+4uV6gHVrDp
	 qQbviSGV8DnYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0E1405F4;
	Wed,  7 Oct 2026 11:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C56B317
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 10:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CB4240080
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 10:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JA60Po4Uxcrd for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 10:47:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6525540057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791370022;
 b=fcqUnIx1WH4bkZLAi0pGTuQGyQFHincXECKvMNE3rnXb7bwUMLqfPh3fCkPAEylSNEqK
 wSXv+10fXi+2pq19rWL2iPoB6wv3OoZB669rNm12UXvZYnHw26nDOJznMfoClXk1380VJ
 UtoVr+szu/6/P0v4fjlPYvfoiQRTv9c0LDMpw7KNqrXB+i/eKUlwXLC5iE8OM4n2nnyQB
 WnX1V28oaaB9JsZl1M1ECczu6RoNqDXp7ajXlMfJfdyl2Pc0rYUGYH1fGphUPQOC1ifWb
 Z5jkMvpaDWWUmEz3mFDQ/F/36wREfJReWS0Dl76THkkQPEyiM47dBOQhXr8xd9BvT/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791370022;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=mknkoHpgUv0QbvLj+r7G57qmix83lPAem02WUV2QJ9o=;
 b=q8TlNwGtLNL3eRGRwTLK0TKHchMoTOcNZEzUFmS9JcgGRT5ALvZHCXDHVAd7/ypSqb2j
 aCZ/9vl15DMVKj+nvF365HMHwgF4g5JHRHM3EzKk4QTooEu53jH0xaApFRxSx4lpG6xgB
 CKqLYfD223y21Hio8oD/2fZSeRbMyBUAYDBGWGaMb4EnReWZjRnruT0kDD9TT0JWLBdgw
 MQbTnbjlfi674txo1OvVWc1Ca3GWKeqWAO8k2+WQA8x+dunbwBJvlu0WgRvc0ee1i60gj
 +KKxjzJ/MJhM5dKsgR18K0Z5QxNi0yUrAzoFy226X3XE3rGH+VKDasykvVWZIf9yKDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XdVP6IxO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6525540057
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 10:47:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so37774895e9.2
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 03:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791370019; x=1791974819;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mknkoHpgUv0QbvLj+r7G57qmix83lPAem02WUV2QJ9o=;
 b=k5QTCU9wDpWpx0huE5VAYK6wBWLlgkca+vyR+xwlkSBBJ5TTmwirEsRF5eRxMFr2LK
 cB+7gYuppVbOnjVUYZU07iorsIn8TcrwYanUlOvsb8iMr/2M9M8aGjeR5V2mNmS/LP8V
 JaU4UJVR6njiyi/pijRm8A6tuAsVKspKOIevhZLYKpBZhk4fVe0RXLUMV3ZouCR2ZrF2
 rssl8dBRkgRUdtG+DFXr7crLFYKGk4DDUQVsqX6JOiKqdKCCmIjq2VnYzl1LpJPRLG0q
 3qLe4AN1kSZCGUT6rNnT293XwI5JHzXvGA4t/17/8BV3ykuM35YBp4c/hIybIbrhd8x4
 vcHw==
X-Gm-Message-State: AFuF++mV+/QPcbo38W7HCZ5/oBBqjRhyC0XEU0MMQYl9mBBIcBQKTYjC
 k6UWmbCGn/lRJ2ti6I8/QSMuhh93VlyzP4heHBBjuReZ/rq4JoWBEIV6BKYAyGe4Qn8=
X-Gm-Gg: AYBFou2TYUl0mNZRuSVg64SWkP7cWWIupfB7ckWUppW0CZPX4GxhHaX5jSOTrAjwBaF
 NXJcw069/DBZq3h4p5FHzNi2fwsG1lYnajOrT1WYLsQuutQ7rhUVa8v5izEmiLznzdXlNH0h2Cl
 BFFk7oBYclzWRAkhp0EA19omFXMBnc20hV6Hmszynsw4o+TIMWYo50tDFIbSRV+/BaCItzKtZZ/
 07FpKRpWZgfW5+DRVBH/CkY9Lpwn4t+WDWM0nXsOoQIR0O1p7/LR2gNO67cTV2/ceGw9N/t9INv
 NEHgOq7lFzMR2TpJP8f+zBc+QlSCzQf6Yf+g5qEyH01xKUXveqf8gWGDQdj5+Nnw7GqqLtXT1j8
 oIj159a1l/xDUMNY3Vg1OY95aJOBrhKOXdjqlyViPCFISWxY43OPw7XRAyb5RAsPr/fM9kYxAA5
 2H4pSlnguagMD9DTFn26/bhGCgKK+qGyul5fqGJ6jy71xFGhmMGKmpBUSQiCYA7mqGqztq5xQrv
 gmqkTftjQun0xfiay6T727f0TtBdumrcXbWQK3wy1pSIqrxKUN5MpMg+A==
X-Received: by 2002:a05:600c:e548:10b0:4a1:813f:2a65 with SMTP id
 5b1f17b1804b1-4a1813f2d75mr14539035e9.15.1791370019254; 
 Wed, 07 Oct 2026 03:46:59 -0700 (PDT)
Received: from [192.168.40.181] (183.242-244-81.adsl-static.isp.belgacom.be.
 [81.244.242.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f54a650sm57654945e9.4.2026.10.07.03.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:46:58 -0700 (PDT)
Message-ID: <ca01f386-0df1-4b18-ad11-c6091c354d82@mind.be>
Date: Wed, 7 Oct 2026 12:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20260930120101.474560-2-raphael.melotte@mind.be> <asJzHhtAaiN13HMS@windsurf>
 <bf405ebf-ba9f-4033-8150-a5069ad151bb@mind.be> <asPHCM2j8FJcUQgn@windsurf>
Content-Language: en-US
In-Reply-To: <asPHCM2j8FJcUQgn@windsurf>
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMTAvNS8yNiA1OjUwIFBNLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+
IAo+IEFuZCBpcyBpdCBwb3NzaWJsZSB0byBiYWNrcG9ydCBqdXN0IHRoZSBzZWN1cml0eSBmaXhl
cz8gT3RoZXJ3aXNlIG91cgo+IExUUyBtYWludGFpbmVycyB3aWxsIGhhdmUgbm8gY2hvaWNlIGJ1
dCB0byBidW1wIHRoZSB2ZXJzaW9uLCBidXQgeW91Cj4gc2FpZCB5b3Vyc2VsZiB0aGF0IHRoaXMg
c2hvdWxkIGJlIGNvbnNpZGVyZWQgdmVyeSBjYXJlZnVsbHkuCj4gCgpUaGF0IHdvdWxkIGJlIGlk
ZWFsIHllcy4KSSBuZWVkIHRvIGNoZWNrIGZvciBlYWNoIG9mIHRoZW0gaG93IGVhc2lseSB0aGV5
IGNhbiBiZSBhcHBsaWVkL2JhY2twb3J0ZWQuCgoKS2luZCByZWdhcmRzLAoKUmFwaGHDq2wKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
