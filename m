Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD545E9D401
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B644608A3;
	Wed,  4 Feb 2026 15:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFTcdkPX_7iq; Wed,  4 Feb 2026 15:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5770260A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770218388;
	bh=fqg22gaUQQxPti3oRFD1v2V0kcBaS3+nf/ANv92F0TQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F8eaIwwagtjshYIl4Qp+PZmu/kOQT93SCOWHMANMykdM6aLheMooZVjXJWb5UlSML
	 HUt+hIulG/C/oVFN14cfzjZqn3oZU7XGJDmsZGTWjQVHz1Itud8pADp43cB6zulhLn
	 BDashY9CbWt3g2LmJWM97f92zy5UIOkWA5FEyveaGV5VfaONXAxOwSW1GRJiqfLm09
	 Www++01Vnix4xX1CzVTuK9+7xkLuOE9ldFnwjIZ/wGqDX5uJIw0NsdUi9ZwqqCog+R
	 6p8/KXqDKVXHngw4h6IzCMXM17gRHH6PFVrToy8fX79VEqwtDKkei14HY5Ci5I8zdL
	 rdMKXndMPRoBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5770260A5E;
	Wed,  4 Feb 2026 15:19:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A74AF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 773A4401DD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYaQOmHULq39 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6053340137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6053340137
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6053340137
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:19:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so73914285e9.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770218384; x=1770823184;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gQO4ITBv7QFpT1KfHFBUmhm/UFNeo6waOPY/+wFUvf8=;
 b=lPZReX9eObQPJXgr1aEIUY2Vph9YHKaFEKzqi+t9ofbnPybIdEIInphwVO2zzMmKW7
 aIjK3VN8MZi2V6C5xTSt8OU/UE9fjiotD2aWACh/9IQDgqVgXBV2f46itP/yQ3IlA7fS
 yJL8OvAqAkhbaOj35L2ZYWoRpAR4kK2MMOR9kzqmBYiZpsHLxEWK/9G3eZF8lVIFt3yb
 lge4n6bQbBYn3C0V1eCsGb8cAQAWp2pVddrjpShapV7jZ5uPQHJ8cKOMjIXf8AF/ewzl
 8XLDZz4R4VApE9K8qJTZJWiD6XiX8d///qLNbMg3RlvwJz+wFnpcmpRWCRZEaVfm+f0m
 Nz2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsyKVczIMGHB7kntzWsvxvi7Tk+tUI4IbyaaLlE5sxVY9Kb36kgeJD4WgyjjO0Y4DzL6ql4LN7/B0=@buildroot.org
X-Gm-Message-State: AOJu0YxICIMxlAMPSeTozTzZYMPG2NsHPWCcTApsYgLZKxnXh/5PqK/G
 qON2VFdXmkrG8g8gpE5N1ViWkGm8d1X3KJulnoVB1kios+8Iv8Cl/cWA5Oj+sZzT3Ee1Z9ar7UA
 /vMED5nM=
X-Gm-Gg: AZuq6aL2ynoD+eFOOVbYlr2isX6XT5V0Z52sC3dopY2orDpVV0Mi+R1jBge+iEHqNq9
 I0HzvCgLa1veAkI0HKbOiI5FnZ4w4tuLjIL9SLcGiluKd4nSyKrUN3IhhP/8BRvFeyDM6nvmu4t
 v9Cm/LBxhqfHOtrEYxB1FocWCVMhcg7UABYb/nCbXpujuhQcrcSkeT9+aZQ82/gAAzHOyrfiNew
 uIM06sL+DCA/rxaoiz12xB3qfLIKToaNXCw/zAitxJ2NaBHBsfybS9+t+4qdjDR7wT2OqDG82mW
 D2EC52U6WA6RAZYH9jmkSotrkTBpxZmcQlYYEBgn1D9dnYpXNpl83MkRuF7HKrrqQtp1pkk2nvv
 7eZ8tI2yElUQ5WWcaVVZDut8MlJPSq28pP9UQ/HAFs2DVWx3qL3yUfz10boAnOOtYpHaJymkcJx
 yodow+s+HozHXcng1saTc2xLaHULDnepCBucws57x2esjS3lfmgk4WaOb6w9IdyHx0P2yPEG/dw
 4106jOowZ+oGW9XEit2xvVkqW1fd9kGPsYgDhm+UHIhFNjgFsM=
X-Received: by 2002:a05:600c:35c8:b0:477:9ce2:a0d8 with SMTP id
 5b1f17b1804b1-4830e8d1e59mr54573325e9.0.1770218383802; 
 Wed, 04 Feb 2026 07:19:43 -0800 (PST)
Received: from ?IPV6:2a02:8440:9501:c6d4:a70:6c91:93ab:53a1?
 (2a02-8440-9501-c6d4-0a70-6c91-93ab-53a1.rev.sfr.net.
 [2a02:8440:9501:c6d4:a70:6c91:93ab:53a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d0dsm7276780f8f.7.2026.02.04.07.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:19:43 -0800 (PST)
Message-ID: <87231dec-b0c4-4016-9941-c19f4cceb0bf@smile.fr>
Date: Wed, 4 Feb 2026 16:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20250919133837.7065-1-thomas@devoogdt.com>
Content-Language: fr, en-US
In-Reply-To: <20250919133837.7065-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770218384; x=1770823184; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQO4ITBv7QFpT1KfHFBUmhm/UFNeo6waOPY/+wFUvf8=;
 b=nMMyu4uxZpNl8HAbW9ywV2hYtfOlkHONF1RuRlq2JCfsSCnuXkCKk+Kr5b/r3ovuTU
 OhfCUxrBvQqont4aQH+TqZMGA3EmUWjqmRft0Z9fcon+2vge1Me3SlzReRIH+ESDsdDB
 0EizPK+taQ8W9ZNmLTVN46g+ynMfNsPi+Y3UM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nMMyu4ux
Subject: Re: [Buildroot] [PATCH] utils/test-pkg: allow to override the
 default build directory with an environment variable
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxOS8wOS8yMDI1IMOgIDE1OjM4LCBUaG9tYXMgRGV2b29n
ZHQgYSDDqWNyaXTCoDoKPiBGcm9tOiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBi
YXJjby5jb20+Cj4gCj4gQ3VycmVudGx5LCB0aGVyZSBpcyBvbmUgd2F5IHRvIG92ZXJyaWRlIHRo
ZSAke0hPTUV9L2JyLXRlc3QtcGtnIGRlZmF1bHQsCj4gdXNpbmcgdGhlIC0tYnVpbGQtZGlyIGFy
Z3VtZW50LiBCdXQgd2hlbiBkb2luZyBmcmVxdWVudCB0ZXN0IHJ1bnMsIGl0J3MKPiBqdXN0IGVh
c2llciB0byBmb3JjZSBpdCB3aXRoIGFuIGVudmlyb25tZW50IHZhcmlhYmxlLCBzbyBhZGQgaXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFy
Y28uY29tPgo+IC0tLQo+ICB1dGlscy90ZXN0LXBrZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS91dGls
cy90ZXN0LXBrZyBiL3V0aWxzL3Rlc3QtcGtnCj4gaW5kZXggY2VhN2FjZTdjYi4uMzJiMjQ4NmI2
MSAxMDA3NTUKPiAtLS0gYS91dGlscy90ZXN0LXBrZwo+ICsrKyBiL3V0aWxzL3Rlc3QtcGtnCj4g
QEAgLTg5LDcgKzg5LDcgQEAgbWFpbigpIHsKPiAgICAgICAgICBwcmludGYgImVycm9yOiAlczog
bm8gc3VjaCBmaWxlXG4iICIke2NmZ30iID4mMjsgZXhpdCAxCj4gICAgICBmaQo+ICAgICAgaWYg
WyAteiAiJHtkaXJ9IiBdOyB0aGVuCj4gLSAgICAgICAgZGlyPSIke0hPTUV9L2JyLXRlc3QtcGtn
Igo+ICsgICAgICAgIGRpcj0iJHtCUjJfVEVTVF9ESVI6LSR7SE9NRX0vYnItdGVzdC1wa2d9Igo+
ICAgICAgZmkKPiAgCj4gICAgICBpZiBbICIke3JhbmRvbX0iIC1ndCAwIF07IHRoZW4KPiBAQCAt
MjcxLDcgKzI3MSw3IEBAIE9wdGlvbnM6Cj4gIAo+ICAgICAgLWQgRElSLCAtLWJ1aWxkLWRpciBE
SVIKPiAgICAgICAgICBEbyB0aGUgYnVpbGRzIGluIGRpcmVjdG9yeSBESVIsIG9uZSBzdWItZGly
IHBlciB0b29sY2hhaW4uCj4gLSAgICAgICAgSWYgbm90IHNwZWNpZmllZCwgZGVmYXVsdHMgdG8g
XCR7SE9NRX0vYnItdGVzdC1wa2cKPiArICAgICAgICBJZiBub3Qgc3BlY2lmaWVkLCBkZWZhdWx0
cyB0byBcJHtCUjJfVEVTVF9ESVJ9LCBvciBcJHtIT01FfS9ici10ZXN0LXBrZy4KClRoZSBwcmVm
aXggQlIyXyBpcyBmb3IgQnVpbGRyb290IGVudmlyb25lbWVudCB2YXJpYWJsZSBsaWtlIEJSMl9W
RVJTSU9OX0ZVTEwgb3IKQlIyX0RMX0RJUiBmcm9tIHRoZSBtYWluIE1ha2VmaWxlLiBCUjJfVEVT
VF9ESVIgaXMgbm90IHVzZWQgYW55d2VyZSBlbHNlLgoKTWF5YmUgdXNlIEJSXyBsaWtlIGZvciBC
Ul9DT01QSUxFUl9QQVJBTk9JRF9VTlNBRkVfUEFUSD8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAgCj4gICAgICAtcCBQS0csIC0tcGFja2FnZSBQS0cKPiAgICAgICAgICBUZXN0LWJ1aWxkIHRo
ZSBwYWNrYWdlIFBLRywgYnkgcnVubmluZyAnbWFrZSBQS0cnOyBpZiBub3Qgc3BlY2lmaWVkLAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
