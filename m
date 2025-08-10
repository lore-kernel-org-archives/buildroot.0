Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0F8C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038B3822E4;
	Sun, 10 Aug 2025 15:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avKHwmfToCR9; Sun, 10 Aug 2025 15:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330968220E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 330968220E;
	Sun, 10 Aug 2025 15:51:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B62B9138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E2D822E1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvrVU_kHAAeD for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0C86821FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C86821FD
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0C86821FD
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:51:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so24338865e9.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 08:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754841105; x=1755445905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CzOwY3sE5JwPBrqFbTCydDjGu57TeWEMVmwNO8hwcvQ=;
 b=KK+IBI5xo1mOghCWphTgklSP2nmB4VheLvW+wSLDyy48BdbzT9wnBGSK5DxZVu21TF
 EH2PxN/jwxFsxowyW2VU3J8ekhpJpkfpqJFd6SG5xugmuhEgxWmlkWTy8luaWAO0bZxZ
 8n79v3ZsNg31HgyH7FTf/41KwVnv/2GgTW8YYxLe9AI9CCxnznZ4K12CRXkIR7eecY79
 MsH80eGhIJIsH5nS1N1wEjISEj5mDN/cDu5AQwkOWxJ2okPuqR//3FpP+4uj747ymhdl
 5Ca6DOxbXNTfJGqQs0v5QEl4D127Qo/kpLCSMmotMhCovCHQiEG9QByeRkHuKH87Yj7Z
 l/sg==
X-Gm-Message-State: AOJu0YyWT3/wg8LAEHJIRyh6rGf9UyzNjINKpJLG+KUYHVRSyduErOnX
 DYpOJrPOJYu0Jpoydw6p+ftJV9f2k0Trl+p5RcnpEj/ecMk0EMnUIWMhXRTZf1pbtpI329q3gAK
 w05Nh
X-Gm-Gg: ASbGncubtf/IpdShCBgIwPdtSQvvHXhcLYCi/fCS8y3gWrBqrUUs/zYyPlQq1aGM8TA
 HklgHmj8jjUauii/f3edB/A7OPNvvtSPp6xRRxM9cLxT/53AqxmWs5GiMUyYD4mw1+H4AruZ6SA
 3IJlIHuNo9tBl4u3vXoVRnFs9VPgMPalx5T1w3ZKNmkyl8Sb+jEW18hBa6YwOux9CVRepzxezSI
 7A2E0cjjYco8jvFli6nlrB2J3c9/o9dzz0MGwVg9x1rwXXAbZcq399Rx2FbIUAcT2b8xfM1IrVC
 uoAeeq0nILEmtH0Ef0uC1Epo/X3p6XTdSAArIQi18H4IUc11XpPuwCRZIdKFqwl275yxKbb2+qK
 QjrURrqOo5xg05jVrIxPAWmnOU/RMFiLxvUcMEC4JsiXf7cvV7uxvDs0mk3pbZhVl4IUtiGbYrN
 8iBkXKVi79Qd5kxAJDS5BcyJIp5mpdM9pz9vwAEMP0sj1HM1zjr5h6Nk2tp9UKyLBgKFZwp9c=
X-Google-Smtp-Source: AGHT+IHS1sBU79Szm7O5CfZYtg6qxGQK9+Gvn1046l+5WWRjxOjefIwZCxhriHHNpNAPAETJS9vQ+g==
X-Received: by 2002:a05:600c:4ecd:b0:456:eb9:5236 with SMTP id
 5b1f17b1804b1-459f4f66908mr94066455e9.15.1754841105456; 
 Sun, 10 Aug 2025 08:51:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm39398839f8f.9.2025.08.10.08.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 08:51:45 -0700 (PDT)
Message-ID: <af5118d3-36cc-4f9e-8bab-9cb6fb257bfe@smile.fr>
Date: Sun, 10 Aug 2025 17:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
References: <20250810150509.13653-1-fl@n621.de>
 <d84a5c0a-2cc5-462b-9b28-bb5ad63c6adb@smile.fr>
 <20250810153921.ihmmge4dqvtxtbel@n621.de>
Content-Language: fr, en-US
In-Reply-To: <20250810153921.ihmmge4dqvtxtbel@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754841105; x=1755445905; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CzOwY3sE5JwPBrqFbTCydDjGu57TeWEMVmwNO8hwcvQ=;
 b=mE9jn1Plhn8uLfvXFGQAx7QfcVa/RaJJugxB4XBBSNCOpuAIU7VnbhiuJd9nziF2k8
 aziRAjhX3ClJ0HXUG+RyhqHNbDoFeE9eTBBTKrAtoQuAICqLC7uMY3nq1K8WGEKaqTfH
 5pU4mpCnR6gw7+jCl29Im3nk/Mt7/o0JaVV+8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mE9jn1Pl
Subject: Re: [Buildroot] [PATCH 1/1] package/nanocom: fix build with GCC 15
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

RmxvcmlhbiwKCkxlIDEwLzA4LzIwMjUgw6AgMTc6MzksIEZsb3JpYW4gTGFyeXNjaCBhIMOpY3Jp
dMKgOgo+IE9uIFN1biwgQXVnIDEwLCAyMDI1IGF0IDA1OjMyOjI3UE0gKzAyMDAsIFJvbWFpbiBO
YW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBJJ20gYWJsZSB0byByZXByb2R1Y2UgdGhlIGlz
c3VlIHdpdGggZ2NjIDE0IChub3RlIHRoZSBjb25maWcgdXNlZCBieSB0aGUKPj4gYXV0b2J1aWxk
ZXIgYWxzbyB1c2VzIEJSMl9HQ0NfVkVSU0lPTl8xNF9YPXkpLgo+IAo+IEZhaXIuIFRoZSBpbXBs
aWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbiBwcm9ibGVtIHRyaWdnZXJzIHdpdGggR0NDIDE0IGFu
ZAo+IEdDQyAxNSB0cmlnZ2VycyBib3RoLiBJJ2xsIHJld29yZCB0aGluZ3MgdG8gbWFrZSBpdCBt
b3JlIHNwZWNpZmljLiBPcgo+IHdvdWxkIHlvdSBwcmVmZXIgdGhhdCBJIHNwbGl0IHRoZSBwYXRj
aCBpbnRvIG9uZSBmb3IgdGhlIEdDQyAxNCBpc3N1ZQo+IGFuZCBvbmUgZm9yIHRoZSBHQ0MgMTUg
aXNzdWU/CgpJZGVhbGx5IHllcy4KQnV0IHNpbmNlIHRoZSBwYXRjaCBpcyByZWFsbHkgdGlueSwg
aXQncyBvayBhcyBpcyAoZXNwZWNpYWxseSBpdCdzIHRoZSB2ZXJzaW9uCnlvdSBhbHJlYWR5IHNl
bnQgdXBzdHJlYW0pLgoKVGhlIGdjYyBpbmZvcm1hdGlvbiBpcyB1c2VmdWwgdG8ga25vdyBpZiB3
ZSBoYXZlIHRvIGJhY2twb3J0IHRvIEJ1aWxkcm9vdCBzdGFibGUKYnJhbmNoZXMuCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gCj4gRmxvcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
