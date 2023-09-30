Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38E6E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A023641833;
	Sat, 30 Sep 2023 19:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A023641833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNpwVo-XExt4; Sat, 30 Sep 2023 19:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE87F41807;
	Sat, 30 Sep 2023 19:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE87F41807
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2EB1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73FFD4021C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73FFD4021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baHcKT5hHEcp for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:53:02 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EE6A4013B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EE6A4013B
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40535597f01so154279905e9.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696103580; x=1696708380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hqGQOhavSf++3dCMaoZ4I8K66MCNieZQxHogVOJgDS0=;
 b=KiuRD99m6Osiep7GOtsmk5OJTjsZ9nvZvC5tr/6QPqaH2q709/21uP4Fu67Gqj8fkp
 wRD4zTbbpXF/ssExyCKo0hQgqPSLSUFtdJWconGHubXdGeWF/0LIdu28IQWeUuc3xobz
 fbNbOzvUDhzkZ/572Wb6mGv71oiKUnm8iCj+8XFmT90acztymnm9YscwCDj4Zgqxc5nw
 oOSs8/ggsd4gu55nnmibYySXMYYSKt93lR0B0Sq4bnIwq24bOyIXEnWIcVnM2QOgswT7
 jdRo7T8t0n9HPE6g5yMTeMoZmg40E5J+8mXzm3rjnYJv3FbUxAiid2Shd9KZMMS8Q9X+
 RLfw==
X-Gm-Message-State: AOJu0YxR2AShQAuqMCbZheJQSl/pvf9r61cm9rgoxxliNgx2s8RWAjus
 /A2uqAcDJ5YW1WF/uuZD7xwHig==
X-Google-Smtp-Source: AGHT+IEFCxpsHj1epUwNL+wircUbIgKrcNSTHO01sJj0+kNePfjnmQSEoQnmRchRInIcVO0pVeC9iw==
X-Received: by 2002:a5d:4a89:0:b0:31f:b6ea:af48 with SMTP id
 o9-20020a5d4a89000000b0031fb6eaaf48mr6513574wrq.49.1696103580176; 
 Sat, 30 Sep 2023 12:53:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a0560001acb00b0032415213a6fsm9315586wry.87.2023.09.30.12.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 12:52:59 -0700 (PDT)
Message-ID: <c7eedbc6-e73b-8fc0-ecb5-3c218d561b2f@smile.fr>
Date: Sat, 30 Sep 2023 21:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230827194254.3475756-1-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230827194254.3475756-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696103580; x=1696708380;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hqGQOhavSf++3dCMaoZ4I8K66MCNieZQxHogVOJgDS0=;
 b=Vv7bvQKYygCTdbQ0gz4OGYWTgh75Udpx52NkKuRtYUUXa2MImFDtWQ2x5qhVO6LJuH
 ZLMbFnLbt1P36V3Uf449dTjLLlBYiznSNo6R+MZ/jPAXzzkwj6v36vlAAl3HL4/4x6YW
 fXIG8PJwAUwsIrJ0oPcSqjTnlfFrBLK2QXjZ+O7an9b4MzEK1TT9NwhmbyKSGB3oX6Gs
 Tuq1CxqlCWX1YfwQujCKzKPYyBWI6jd033uiw+TbvxJ50mr5jnWaMvmsyxokxAPnXysu
 AfwC+pTmUuqdeLHdr4BbqwZw3gdEleUwcsFh7qjxg7o11gc3LdNlVWJBPy2dIgwv3mBa
 1Ung==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Vv7bvQKY
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add pipewire support
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAyNy8wOC8yMDIzIMOgIDIxOjQyLCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IEFkZCBvcHRpb25hbCBwaXBld2lyZSBzdXBwb3J0IGludHJvZHVjZWQgaW4gcWVt
dSA4LjEuMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyIQoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IC0tLQo+ICBwYWNrYWdlL3FlbXUvcWVtdS5tayB8IDggKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVt
dS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gaW5kZXggODQxNjY5NThiYi4uODM3OWYzMmJm
NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3BhY2thZ2UvcWVt
dS9xZW11Lm1rCj4gQEAgLTIzNCw2ICsyMzQsMTMgQEAgZWxzZQo+ICBRRU1VX09QVFMgKz0gLS1k
aXNhYmxlLW51bWEKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfUElQRVdJUkUp
LHkpCj4gK1FFTVVfT1BUUyArPSAtLWVuYWJsZS1waXBld2lyZQo+ICtRRU1VX0RFUEVOREVOQ0lF
UyArPSBwaXBld2lyZQo+ICtlbHNlCj4gK1FFTVVfT1BUUyArPSAtLWRpc2FibGUtcGlwZXdpcmUK
PiArZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfU1BJQ0UpLHkpCj4gIFFFTVVfT1BU
UyArPSAtLWVuYWJsZS1zcGljZQo+ICBRRU1VX0RFUEVOREVOQ0lFUyArPSBzcGljZQo+IEBAIC00
NzYsNiArNDgzLDcgQEAgZGVmaW5lIEhPU1RfUUVNVV9DT05GSUdVUkVfQ01EUwo+ICAJCS0tZGlz
YWJsZS1uZXRtYXAgXAo+ICAJCS0tZGlzYWJsZS1vc3MgXAo+ICAJCS0tZGlzYWJsZS1wYSBcCj4g
KwkJLS1kaXNhYmxlLXBpcGV3aXJlIFwKPiAgCQktLWRpc2FibGUtc2RsIFwKPiAgCQktLWRpc2Fi
bGUtc2VsaW51eCBcCj4gIAkJLS1kaXNhYmxlLXZkZSBcCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
