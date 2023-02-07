Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49CFC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387B640894;
	Tue,  7 Feb 2023 13:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387B640894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SDO_iiM92Um; Tue,  7 Feb 2023 13:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1611641740;
	Tue,  7 Feb 2023 13:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1611641740
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0301BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2048960E22
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2048960E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jf46_pdrBq-Z for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:40:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CB560E8B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1CB560E8B
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:40:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g6so5599323wrv.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 05:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AiBbgZWwf+xvxlFmQ1vOynfL0GLMCFlvgmLIkn1azbs=;
 b=LpiUX9hGZYDIbN1pDcqhKTK7fHAl+45FmphRUudn1MYDxOmskDk/KoNUJbpB2jHI+B
 X3Kv1ZmMGK4BYHQUOL/BiWKpGJWgzjFq2/PQXUKcIyxW/aQoRaQ+2vbyWKH+8Uh3GVaw
 cCr1Q9wJUxN/e/Ks3clhTUvwkraEfcigXrHQWLvM5oQjQ6X/on7I+LOzGUjc6ONOhf3l
 gvjcRRQ9QmUjxkgnEKubCwPvt7Kqp69H0W4kLrzOEH3XljMfUvTT5HPP25NTiN21bPoF
 lsc636qWN3j46hG2LDHBiTNtUX6XBy9s7/og51M57WokIva7SHBW7vQm3YCXNs8cm5T/
 QPGw==
X-Gm-Message-State: AO0yUKUKpr0LQrSxbrYknq8ctaliZye5QBm4rrLwh4lw03ifGJCrT5Bz
 /DfWVdi7U6eMykJGKCslEwJOflhLfCJItUju
X-Google-Smtp-Source: AK7set9hZGBft7t271/pGcS5RUbP57M4ifeJcnwdUyv7m2MPoqq4fBajkK8iHkoxH+MlV36Uq7czbw==
X-Received: by 2002:adf:d08a:0:b0:2bf:95d0:fa5d with SMTP id
 y10-20020adfd08a000000b002bf95d0fa5dmr2812154wrh.9.1675777201719; 
 Tue, 07 Feb 2023 05:40:01 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056000114300b002c3f9404c45sm132852wrx.7.2023.02.07.05.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:40:01 -0800 (PST)
Message-ID: <bb350139-b94d-dde4-dfd1-911b1df61a5e@smile.fr>
Date: Tue, 7 Feb 2023 14:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sagi Mor <sagimor6@gmail.com>, buildroot@buildroot.org
References: <5DD722F6-F9EE-4517-9E55-5A61BB01F196@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5DD722F6-F9EE-4517-9E55-5A61BB01F196@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AiBbgZWwf+xvxlFmQ1vOynfL0GLMCFlvgmLIkn1azbs=;
 b=RILuOnwsmUovtYZOFsF6TK1S2/MO4MasLh3s80tdMRGU7micf3KNk1E4KQ3vft1buQ
 XvjFtVLbYlQsy5sIb3fIFLMqcZHb2mkeitjNq5zIS3ov5G7CFeVwQeopR0Gs6NMD/zRU
 hNC0wRoua0+4+Ie2Q7uYVVmyP4hz5o0o9LiKuAennR1zS+9tzolmRyrK1cWnofXUftiL
 UADbVTosbiSn8OTvRp+9V8SJSKnWzQFnM9pwytADXrWap9KveZsAOdi3dXAo673Ip6FY
 mu0VQEw8Sm18lDELeCNlRplAJI0VYiedmP8tN2bDz74W7nFdVTAnJCcPlTwI5ABVdIhb
 JeuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=RILuOnws
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper: make gcc
 --help -v work correctly
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2FnaSwKCkxlIDA3LzAxLzIwMjMgw6AgMTk6MDksIFNhZ2kgTW9yIGEgw6ljcml0wqA6
Cj4gbWFrZSAiZ2NjIC0taGVscCAtdiIgZGlzcGxheSBhbGwgdGhlIG9wdGlvbnMsIHNvbWUgcGFj
a2FnZXMgZGVwZW5kIG9uIHRoaXMKPiBodHRwczovL2J1Z3MuYnVzeWJveC5uZXQvc2hvd19idWcu
Y2dpP2lkPTE1MjMxCj4gPGh0dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9
MTUyMzE+CgpUaGFua3MgZm9yIHRoZSByZXBvcnQuCgpBY3R1YWxseSBpdCdzIHN1cnByaXNpbmcg
dGhhdCAtLWhlbHAgLXYgb3B0aW9ucyBhcmUgcmVhbGx5IHVzZWQgdG9nZXRoZXIgYnkgYQpidWls
ZCBzeXN0ZW0gdG8gY2hlY2sgZ2NjIHN1cHBvcnQuCgpJcyBzb21ldGhpbmcgdG8gZml4IGluIHRo
ZSBweXRob24gYnVpbGQgc3lzdGVtIGluc3RlYWQgWzFdPwoKQXMgbm90aWNlZCBieSB0aGUgR0ND
IG1haW50YWluZXIsIHRoZSAtZndyYXB2IG9wdGlvbiBpcyBhdmFpbGFibGUgc2luY2UKZ2NjLTMu
NC41IFsyXSwgc28gaXQncyB1bmxpa2VseSBzb21lb25lIHN0aWxsIHRyeWluZyB0byBidWlsZCBw
eXRob24gd2l0aCBnY2MgMy4KCklzIGFueSBvdGhlciBwYWNrYWdlIHVzaW5nICJnY2MgLS1oZWxw
IC12Ij8KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vYmxvYi92My4xMS4x
L2NvbmZpZ3VyZS5hYyNMMjA2MgpbMl0KaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQvP3A9Z2NjLmdp
dDthPXBhdGNoO2g9NGZhMjZhNjA3OTFlYzMxNDEyOGE5NjgzZmQ0ZDY1N2IyNTFkMDI2OAoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhZ2kgTW9yIDxzYWdpbW9y
NkBnbWFpbC5jb20+Cj4gLS0tCj4gwqB0b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYyB8IDEx
ICsrKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYyBiL3Rvb2xjaGFpbi90b29s
Y2hhaW4td3JhcHBlci5jCj4gaW5kZXggMzdiMjRkZDI0YS4uODVkNTkyYWQyZCAxMDA2NDQKPiAt
LS0gYS90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYwo+ICsrKyBiL3Rvb2xjaGFpbi90b29s
Y2hhaW4td3JhcHBlci5jCj4gQEAgLTQ5OCw2ICs0OTgsMTcgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKiphcmd2KQo+IMKgfQo+IMKgfQo+IMKgCj4gKy8qIGRyb3AgYWxsIG5vbiBmb3J3YXJk
cyBhcmdzIGlmIC0taGVscCBpcyBzcGVjaWZpZWQgKi8KPiArZm9yIChpID0gMTsgaSA8IGFyZ2M7
IGkrKykgewo+ICtpZiAoIXN0cmNtcChhcmd2W2ldLCAiLS1oZWxwIikpIHsKPiArY3VyID0gYXJn
cyArIDE7Cj4gKyNpZmRlZiBCUl9DQ0FDSEUKPiArY3VyKys7Cj4gKyNlbmRpZgo+ICticmVhazsK
PiArfQo+ICt9Cj4gKwo+IMKgLyogYXBwZW5kIGZvcndhcmQgYXJncyAqLwo+IMKgbWVtY3B5KGN1
ciwgJmFyZ3ZbMV0sIHNpemVvZihjaGFyICopICogKGFyZ2MgLSAxKSk7Cj4gwqBjdXIgKz0gYXJn
YyAtIDE7Cj4gLS3CoAo+IDIuMzQuMQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
