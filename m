Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6B2C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 14:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671D7606D0;
	Sun,  5 Jul 2026 14:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0disPbWeqatT; Sun,  5 Jul 2026 14:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8E4606DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783261569;
	bh=+n6N0qA+Vvo8FxpogXtsp/l2YjEC8tSRjz5+aTtB+iE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8BD7bcq680x/+agUAntd2KpgZU10x/aQr0lIyDZoKXIajFXIgFQ09x+q3uuYfMp/
	 lFZSErKYG8sZVhvM/1xeJ8zA4EsThrYLqYm9/Ng+v55CX0jGaVuepGgTRg6kUuVAas
	 NKhjGnBp76reGhzOMdoQcgBQjIgKi0j4XINcZ19pUgTJ+e0Os+o/rB5fe3Gkxqq31j
	 uxxQI9p1T3M5xFJXDtp7tmfxLdTUdiT+8gV/iek85UVMoMDsAfFDSfbokEN8+1nP9S
	 ub3ntwUTxwTZgzaEZnyUmledkG4jKpy9b4qthZajm/+PbNpCTB7IQiAfdCGmeVhM2/
	 C4I7u+j1NgD9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8E4606DF;
	Sun,  5 Jul 2026 14:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0612A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 14:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F38B6606DF
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 14:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzRsliZYHF3i for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 14:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13444606D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13444606D0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13444606D0
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 14:26:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-493b61b52b6so13702615e9.1
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 07:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783261566; x=1783866366;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WvpMEv7IaGCvEEpOjwHlxiNUy+vYwY0wPxxiQkjcVZE=;
 b=T0b0PFOsYxSBc0tH6T1FwJJQWOg97CNck3RH1BR9iQOPmB1dQp2UIIJ4G0yVPeJl1R
 faAxpMC8hpMnGgBppRt8FWl7ZAor/wPY/WIVjdyX5Ho/xrBPKsi626i5x8MQS9dhaJA9
 AWu5oOIgBEfeA1Zbx75q2N6/gojzFhjRk2oSlyBg+I2Le9wUnfr75qdMcoQoYutPRUKW
 l9/UF7b9aMoJCOT7emYlepQzDZSHlk7xeDzrauWSQfOhCMuJuw53dubvvQdcRAz1DsVg
 DyBjY3RN+TuWAtA66U/5aBKO3sT5FzAG9WIf4Ps4tQOC3hbuv7qzTn2iDXYCkdRWwVXW
 rJDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qCi+WSDcLBH7lgfVQOCY65zPri0lu8EsTUGAQSM+aJbtyxJGxaatxO7WvbCs3HiPdp+gBRIM+DlI=@buildroot.org
X-Gm-Message-State: AOJu0Yw/977bUjkYfvnsVTUhdYocV2CHA2Pex1JIPtXR4h0AeRRhH8lx
 9f4Wa80UdY9nIWlcvywQcNDZ2yyML+8STo+KdDsDFuhag4VPw3OuSdMoH5BIfNMAHsg=
X-Gm-Gg: AfdE7ckcOuHZFDjBo1+AVSZ/g7m/iAAnT6kLPz8LNttysm1DdZataxaxCF6X5gaIZER
 SV6lZyFVbsOGw3ZX8NzxmZJMVKSsHK/wNK5Wp7c66C2apmm0H0UYaMZ0CSA29HV7yG6GUzxLkqT
 AnvyHa1VnXIFkV7JEr0TobZplZFdTsQOK5iWsXLfsrkpomaja3Hyi/sbxhRVflqqodWYsJUeG6+
 /dN/Caj+R8c0fOcWoz8CccO7J73fS1Fiwcd7aU2az4lsLYkbUQbSavbFUrnltBTUdv3p8RNhOgf
 fENRQhvHI64saNuGND6BGZsu7M/iT23d48V8sKoM+5K+yp1TsOSyKbyw0aXOTnltk0WgUO9NZDL
 Jx4DCDJyDejMd1pnooyA9q3B41u1jTiMbttpkzMI0yYHO+WTF4g5zfA7QuLC30JLWvzEv6rB0UK
 gX+svVyfp+SUp4lc8ORQe4+f4Pc6mcBzSPs2R3jHbjq869N0xeKK+ZRKXOaAPT2Z+z1ZWduHoIg
 uDAvAvLVXi481IACzAYydRStwX8dwHBFoYYL+6dSPBisYn250bdDGk=
X-Received: by 2002:a05:600c:8b6c:b0:493:b6d5:72df with SMTP id
 5b1f17b1804b1-493d11fed9amr77073195e9.35.1783261565680; 
 Sun, 05 Jul 2026 07:26:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6?
 (2a01cb0594a2a2005e8944d0fdb416c6.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c636e9e9sm281460825e9.2.2026.07.05.07.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 07:26:05 -0700 (PDT)
Message-ID: <1bf1701c-a585-4fd3-932e-370570a309a3@smile.fr>
Date: Sun, 5 Jul 2026 16:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com
References: <20260202142825.2804939-1-jimmy.wesolowski@mobileye.com>
 <20260202142825.2804939-2-jimmy.wesolowski@mobileye.com>
Content-Language: fr, en-US
In-Reply-To: <20260202142825.2804939-2-jimmy.wesolowski@mobileye.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783261566; x=1783866366; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WvpMEv7IaGCvEEpOjwHlxiNUy+vYwY0wPxxiQkjcVZE=;
 b=dTyb4vWq5vv/+9oBTHzczeaYIxZL+YTsx3yjh1BSeDaCWd05cf01SAOPKHkVxHRpAH
 +OWyjLxG8KsfMQIsLyNWgWtq1DYaWZ3ibaL/XhbmYgNKp4SZFa5sFi5AotbtB+Me6WVE
 TCm0iIUvEkJHpDb9AsaxcsHuIqofmel3G18+8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=dTyb4vWq
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-kconfig: add step_start and
 step_end
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmltbXksIEFsbCwKCkxlIDAyLzAyLzIwMjYgw6AgMTU6MjgsIEppbW15IER1cmFuZCBX
ZXNvbG93c2tpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGlzIGFkZHMgdGhlIHN0ZXBf
c3RhcnQgYW5kIHN0ZXBfZW5kIGNhbGxzIHRvIGVuYWJsZSB0aGUKPiBHTE9CQUxfSU5TVFJVTUVO
VEFUSU9OX0hPT0tTIG9uIGtjb25maWcgcGFja2FnZXMga2NvbmZpZy1maXh1cCBzdGFnZS4KCnN0
ZXBfc3RhcnQvc3RlcF9lbmQgYW5kIEdMT0JBTF9JTlNUUlVNRU5UQVRJT05fSE9PS1MgYXJlIGRl
ZmluZWQgYW5kIHVzZWQgaW4KcGtnLWdlbmVyaWMubWsKCldoYXQncyB0aGUgYmVuZWZpdCB0byBo
YXZlIGl0IGluIHBrZy1rY29uZmlnIGluZnJhPwoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmltbXkgRHVyYW5kIFdlc29sb3dza2kgPGppbW15Lndlc29sb3dza2lA
bW9iaWxleWUuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3BrZy1rY29uZmlnLm1rIHwgMiArKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGtnLWtjb25maWcubWsgYi9wYWNrYWdlL3BrZy1rY29uZmlnLm1rCj4gaW5kZXggMTM2ZmU2YzQ5
MC4uMGFmNGFiMDllNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1rY29uZmlnLm1rCj4gKysr
IGIvcGFja2FnZS9wa2cta2NvbmZpZy5tawo+IEBAIC0xNzQsOCArMTc0LDEwIEBAICQkKCQoMilf
RElSKS8kJCgkKDIpX0tDT05GSUdfU1RBTVBfRE9UQ09ORklHKTogfCAkJCgkKDIpX0tDT05GSUdf
REVQRU5ERU5DSUVTKQo+ICAjIEluIG9yZGVyIHRvIGdldCBhIHVzYWJsZSwgY29uc2lzdGVudCBj
b25maWd1cmF0aW9uLCBzb21lIGZpeHVwIG1heSBiZSBuZWVkZWQuCj4gICMgVGhlIGV4YWN0IHJ1
bGVzIGFyZSBzcGVjaWZpZWQgYnkgdGhlIHBhY2thZ2UgLm1rIGZpbGUuCj4gIGRlZmluZSAkKDIp
X0ZJWFVQX0RPVF9DT05GSUcKPiArCUAkJChjYWxsIHN0ZXBfc3RhcnQsa2NvbmZpZy1maXh1cCkK
PiAgCSQkKCQoMilfS0NPTkZJR19GSVhVUF9DTURTKQo+ICAJJCQoY2FsbCBrY29uZmlnLXBhY2th
Z2UtcmVnZW4tZG90LWNvbmZpZywkKDIpKQo+ICsJQCQkKGNhbGwgc3RlcF9lbmQsa2NvbmZpZy1m
aXh1cCkKPiAgCSQkKFEpdG91Y2ggJCQoJCgyKV9ESVIpLy5zdGFtcF9rY29uZmlnX2ZpeHVwX2Rv
bmUKPiAgZW5kZWYKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
