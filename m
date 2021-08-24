Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A2C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 17:23:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F020613D3
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 17:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F020613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DE842501;
	Tue, 24 Aug 2021 17:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mesHwArJ2Z-2; Tue, 24 Aug 2021 17:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECC642502;
	Tue, 24 Aug 2021 17:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99AAA1BF983
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 17:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9615681003
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 17:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZV1Ow1ZxOuy for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 17:23:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4160581A46
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 17:23:03 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id f5so32366960wrm.13
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AiaykCTj1FB9GYo/dgQH4r6c38cdt2VTCcoLaPdqH9o=;
 b=dNSwxL8HNj8LHaSe+XrF10GEHFe3vkEMDrUPuSgF1dyrJGYJc1g+ApBjfBqYX8j50N
 VBp6OwON3DzJm3T8wKiTtXmj7VPj5Ldb6UhQCA6XR/nIOiXm7SCI7jbrndIuNrTKTRLv
 2Twu+TKROYlPpF/NYIR7d3hkeHFJgz97F4ABYhAsvDZjiGEtyG4GYakEyciOHtuf2Gw7
 bhBmCfzdMQSRFakVkOKWRg32FThLoDnOSt1m1tb2DpMcVcnlNhVSR1LvfuCKKY09nymm
 NJrg69dVLDV/rLftIVu8g9AT0aFlzQPsZBev7dtrdtwiAA2S0RJf6AIE+qhkLQlSI0m5
 KElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AiaykCTj1FB9GYo/dgQH4r6c38cdt2VTCcoLaPdqH9o=;
 b=cAUJLiYI4Gnbfn6FghjcUmjamWhP6QSrpaL/pRoDAfoVZwJqtxfoCc5hgVuCGK5jU3
 6HEoNNKMT/QSWKN2WsJl2jykrKrgCYabgZCFaP06bs82mlRnmRgvtszVJKfnFHPYImxc
 uW0iFq+oJanVCcPlJHhLehvTERZ4C9+Pi/AkG2N5PhaAjZCuU0E332KyoTGd//tGvIDd
 tuP3pWkIlA3BG2+FIso91Xwgxoo/3fhCRdIgQV/ZGsP6cKJXPTGtgg4mCYLJTn0JznBW
 y8LookYK7AbHU+T6sNxb9Y0nKhJ0baj/Xk3eHBvwiUUDWMO/FTKXNLXz2B0CqfuXgSGn
 MdHg==
X-Gm-Message-State: AOAM5330Ymrl/f5ZOjMgX2ijCu5VTXKcfBit8GK1JK6wqHUA0d4u+cVt
 dT/KOK94VU79cOeGe0fRK3w=
X-Google-Smtp-Source: ABdhPJzxUJI41GLp/YE9qaasKin/V2FW5R7L8A5V/4aWYOxg6+ni2U1WkqTlJR1dCkmsWqzwhrsMyQ==
X-Received: by 2002:a5d:6e84:: with SMTP id k4mr5465410wrz.426.1629825781629; 
 Tue, 24 Aug 2021 10:23:01 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o12sm782320wro.51.2021.08.24.10.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 10:23:01 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210824070141.94164-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <8e359c85-595c-ca73-3827-758bef460ac1@gmail.com>
Date: Tue, 24 Aug 2021 19:23:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824070141.94164-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: use
 BR2_PACKAGE_MESA3D_GBM
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gRmFicmljZSwKCkxlIDI0LzA4LzIwMjEgw6AgMDk6MDEsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBVc2UgQlIyX1BBQ0tBR0VfTUVTQTNEX0dCTSBpbnRyb2R1Y2VkIGJ5IGNv
bW1pdAo+IGI2YzA1MWFjZjc4N2M4MDRlNzMyYmM1OGJhOGQ3ZTQ0MDcwMWExNjgKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
PiAtLS0KPiAgcGFja2FnZS9tZXNhM2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1rIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tZXNhM2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1rIGIvcGFja2FnZS9tZXNh
M2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1rCj4gaW5kZXggNDI4OWFjZmZmYi4uNmI1MjYyYTJlOSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC1kZW1vcy9tZXNhM2QtZGVtb3MubWsKPiArKysg
Yi9wYWNrYWdlL21lc2EzZC1kZW1vcy9tZXNhM2QtZGVtb3MubWsKPiBAQCAtNDMsNyArNDMsNyBA
QCBlbHNlCj4gIE1FU0EzRF9ERU1PU19DT05GX09QVFMgKz0gLS1kaXNhYmxlLXZnCj4gIGVuZGlm
Cj4gIAo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRUdMKSx5KQo+ICtpZmVx
ICgkKEJSMl9QQUNLQUdFX01FU0EzRF9HQk0pLHkpCgpCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdM
X0VHTCBzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0dCTSwgYnV0CkJSMl9QQUNLQUdFX01FU0Ez
RF9HQk0gY2FuIGJlIHVzZWQgd2l0aG91dCBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTC4K
CkhhdmUgeW91IGNoZWNrZWQgd2l0aG91dCBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTCBl
bmFibGVkID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgTUVTQTNEX0RFTU9TX0RFUEVOREVO
Q0lFUyArPSBtZXNhM2QKPiAgTUVTQTNEX0RFTU9TX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1nYm0K
PiAgZWxzZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
