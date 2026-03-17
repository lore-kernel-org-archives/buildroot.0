Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE321FF6E8C
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 799DB83DAB;
	Tue, 17 Mar 2026 22:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVLHiziDOpAc; Tue, 17 Mar 2026 22:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 682C583E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785057;
	bh=mSBCDquHmmT3eJlAHh5WYh7HQdndHQ/RGAZiRtnmR6s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mwK//vf47PC6xDV0AVPx1l3rkpDjdD91LSk1CVR1VPM/DZzFmo/URZ3yaK+iS4nba
	 lKIJlEaPDeKP6QguOUVwAhIcPlr8kEuo4WKJUUEO+Lx3EtZZf4q0R5Cv1x2bWsfYyI
	 WlGCeChca9FviOkkQQZAYKE1wk2rneGW/dHeJFL84mJLe7xLKAnGaHXhjEEpz7HBe9
	 a609qqDCmLaPPKb2zb6+LvUArD3fEo6wX67PXFPJcy0f2aZlfccAs8wuj67I8koygj
	 8TF06wMHCsYVrwC+P2SEYfziztwKoaxefrNXRMjXqgbKQXrZxPs1BkdOJI0nuP4c4N
	 mxN/z3Sw6iOkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682C583E02;
	Tue, 17 Mar 2026 22:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5F381B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D79A640D29
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5G_RS2QYS8D for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A80A540CE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A80A540CE9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A80A540CE9
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso51392555e9.1
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785052; x=1774389852;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54UFv3iOgE6SJkjd9mGRYOvLGCmg6aynA5SxQMV1TKQ=;
 b=VJjjx1xt2yNiaaoEyOHCfs0wWyGyd9BJXKMY93SqfIw8ylAqd/5mA9iT7mTfFRXh/r
 XuXu/nbUz1xShtxprc/axfjnAEWoGGEf2rv83FztXz4KI78b1q77f1bRM3nuQCt1DLMn
 97jIhvy+IeYZ1QkRS6wEItzgPTvvb8WuLaeLhc86/8osglx6lePW3yhr8oF2eLqq8hUN
 aoeAKa+jxSttR0flbPTwRBJcp89jGs/oBcrZBsrG5e+HeAai6aw+e+kP0sAu5xEQxf1h
 3T0q7xYPKFwhxE1tK5dAustWAO8OCvkruAniFgeI7l1kVt7VwCEcfG5mDSde3kYURhGL
 s87A==
X-Gm-Message-State: AOJu0YwAiYWa4BVbnFxIKCpyIREZOh+kSYVRxq2CGU7eyv0CUC5R7Flu
 aR2Wyf1qflUcx8uZr3babnxDpMaFaKxL1SiA2Ex+sPP9uYB1b06OsDA3ug5zhRqd77qGj5KzI5T
 B876w
X-Gm-Gg: ATEYQzxnulKZ8uRePu7CUx2HBfnZz2GtMdHsTZ+Nn5F3tNDy4CCipkStGNr1j03cmb1
 Z6v4jbINYcqCpocOk8N9pP56+kVm0NTp8Hjh5VnmQnuz2Zbxrv18SZOK60Ie99wq34vZdq53Lhy
 qYig+i9VlcpoFOhkCeCJotFLUWeVhRyHF1pNp2HekpXhThYz7vuzL+Bv6KITINeUOzdS4C87NFH
 /vkvgzOWkfTuhd3RfeP7lbo+RTq/jHS5LoUtVsHDLLRyi4Fjt/jDRg37OmyKBMpxCVB5LxSR6BR
 vqW9mgMOHYpa12kEiYqsELQyKySTYIIjZoSx2Qd/zwIKU6IGFgpUQ6MX9PqWhzUvXBGDAVNOTUS
 MICGN+bdaTzoWiTzvjCh6Vb5KGe8pfCZbrZMWrBfzlp9iz7OjPU0gg++HdHomqKP/sXUSlho5Lz
 xsAFkcbCb/KItOAX1h558cur+wKrm6S9v5so1XFrBXA1SyitAr3oa38b7v8ctQnZ++kFx3eEsSo
 pbqu3xeOzVLZueiKsXr+E/JrVsuX1pk1nzEB++ujPf5iPRRqabMIgh/gs3M+k8ZAg==
X-Received: by 2002:a05:600c:3f10:b0:485:3af5:7e53 with SMTP id
 5b1f17b1804b1-486f4448577mr20740435e9.19.1773785052306; 
 Tue, 17 Mar 2026 15:04:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f45d8e3dsm5221145e9.0.2026.03.17.15.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 15:04:11 -0700 (PDT)
Message-ID: <c4828e8b-63af-41dc-a227-4acfe19bdec2@smile.fr>
Date: Tue, 17 Mar 2026 23:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>
References: <20260218063123.546067-1-james.hilliard1@gmail.com>
 <20260218063123.546067-2-james.hilliard1@gmail.com>
 <20260223151300.GG2359969@igalia.com>
Content-Language: fr
In-Reply-To: <20260223151300.GG2359969@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773785052; x=1774389852; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54UFv3iOgE6SJkjd9mGRYOvLGCmg6aynA5SxQMV1TKQ=;
 b=Jxh5M1pUKbqdK2kjyE8rMH7MquGnHBFc8g/sNjZEw50Ha18+gH0X0QUDnMuR08YGdL
 KYH6w5oBMNTUnyTwiJUi+WVvE1kjgbS+J1g3TLZ7399IcSCnqW2nK+fBxeHiX9mhzQiF
 EDisntoMXHEpctaG/zgoKoMS2bWkm5h3gAhn4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Jxh5M1pU
Subject: Re: [Buildroot] [PATCH 2/2] package/wpebackend-fdo: fix
 EGL_NOT_INITIALIZED crash
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

SGVsbG8gSmFtZXMsIEFkcmlhbiwgQWxsLAoKTGUgMjMvMDIvMjAyNiDDoCAxNDoxMywgQWRyaWFu
IFBlcmV6IGRlIENhc3RybyBhIMOpY3JpdMKgOgo+IE9uIFR1ZSwgMTcgRmViIDIwMjYgMjM6MzE6
MjMgLTA3MDAgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3Rl
Ogo+PiBDb21taXQgNGNkNGIyZTFlNmU4ODE2NTU1ZGIzODc3MWQxOGRhYWQ0NmRmM2E2YyB1cGRh
dGVkIG1lc2EzZAo+PiBwYXN0IHZlcnNpb24gMjUuMi4wIHdoaWNoIGRlcHJlY2F0ZWQgdGhlIGxl
Z2FjeSB3YXlsYW5kCj4+IEVHTF9XTF9iaW5kX3dheWxhbmRfZGlzcGxheSBpbnRlcmZhY2UsIGFz
IHdwZWJhY2tlbmQtZmRvCj4+IGN1cnJlbnRseSBzdGlsbCByZWxpZXMgb24gdGhpcyBmdW5jdGlv
bmFsaXR5IGVuc3VyZSB0aGF0IHdlCj4+IGVuYWJsZSBFR0xfV0xfYmluZF93YXlsYW5kX2Rpc3Bs
YXkgaW4gbWVzYTNkLgo+Pgo+PiBGaXhlczoKPj4gIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL0NBRHZUajRwWWYwdXltcmtaVXVXZ2FoV0s9cG01Q2dUSkw1VStnd2J3S0V4SzFzbzVqQUBt
YWlsLmdtYWlsLmNvbS8KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gCj4gQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0
cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4+IC0tLQo+PiAgcGFja2FnZS93cGViYWNrZW5k
LWZkby9Db25maWcuaW4gfCAxICsKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGViYWNrZW5kLWZkby9Db25maWcuaW4gYi9wYWNr
YWdlL3dwZWJhY2tlbmQtZmRvL0NvbmZpZy5pbgo+PiBpbmRleCA5YjRkZDI4NzQxLi5iZDBhYjU0
MjFlIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3dwZWJhY2tlbmQtZmRvL0NvbmZpZy5pbgo+PiAr
KysgYi9wYWNrYWdlL3dwZWJhY2tlbmQtZmRvL0NvbmZpZy5pbgo+PiBAQCAtMTQsNiArMTQsNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8KPj4gIAlzZWxlY3QgQlIyX1BBQ0tB
R0VfTElCR0xJQjIKPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCV1BFCj4+ICAJc2VsZWN0IEJS
Ml9QQUNLQUdFX1dBWUxBTkQKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0xFR0FDWV9C
SU5EX1dBWUxBTkRfRElTUExBWSBpZiBCUjJfUEFDS0FHRV9NRVNBM0QKPj4gIAloZWxwCj4+ICAJ
ICBXUEVCYWNrZW5kIGludGVyZmFjZSB1c2luZyBmcmVlZGVza3RvcC5vcmcgQVBJLgo+PiAgCj4+
IC0tIAo+PiAyLjQzLjAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPj4KPiAKPiBDaGVlcnMsCj4g4oCUQWRyacOhbgo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
