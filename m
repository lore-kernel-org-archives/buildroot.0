Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC90E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5548A60BCF;
	Wed, 11 Dec 2024 13:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ja9goKprSV1; Wed, 11 Dec 2024 13:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1346F60D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1346F60D9C;
	Wed, 11 Dec 2024 13:25:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5D5962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA53240609
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkf0tbfAa-UZ for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1676240428
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1676240428
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1676240428
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:25:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3862b364538so410967f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 05:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733923524; x=1734528324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=msh/dxy8UujgPNbA6dajm9pE4lOYAt+ooscqN4W2UQI=;
 b=VEA2c728QqcbyPAr6GEzUH/nPhd2tb6+ISNwC2FVrIgzi3FXVQCNKDK0jaKOAczCjB
 4XecyTYFuR+reQPH7LvBvW6lSPXW7FVg1tOZIkCwegylJ/hi7EC0TltH6A3Ny/k9TRkD
 Ds4JudLeEILbU7CTj+BDwiB5z3d+dLy/P+ZPz634kLPHHnUyuaRhW6YB1jMkDKUzVSUW
 mFbehwzxiIzX/JlModkvQf9UHddE2cGKmwoJ9uXoS1s+JzQKNIMcRD9UT7jgYwFV56YD
 iL2AnduirYkze2qzCNM8Z4NwspziLirB3lJzkDQXgPn0XrQgj1EECOWGOKVKoM2HKR78
 G/7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb929hapaKqarAIi/IRCJdv6pVcmWO6jRAl3LMr4CsilUS/OdPRTLDa3guFn8uf1cicy3xj9/EW5E=@buildroot.org
X-Gm-Message-State: AOJu0Yx0uKFL9nm79FUkZtXaytcpkGyvx13A5ybW+UNGFeGKF/r9QmSa
 MwFSBdjnEV4p6XyYqalSvrLn2QebsNaja56QTX5PgkEEYViJU/3bbMbsVD/gy9uVCJZAZVFTmF5
 H6k0=
X-Gm-Gg: ASbGncuqu3y7J08noDG+Y5NCvE8GR11qQ8gK2LBN7LspUw4R00EYIYS7TWkpll2Ut7b
 KSplaZBNcPI+pE9KvAUyq3Ocn7tGe8F3gAhvZk2sbJb/faer4dOVH/Fzy59cST6hMZXx9pVDijV
 BKzCoeHuH7gY5k7PcWhfkFdq7qXgOAjsQLrRzBqb1OAsrGt60KMTZgDc788G0pfaP/oOEtXtyHU
 7YuOOuF+ySQ+LTi7GCeA3DByKhobn7q2QSgje4+0DTXtx0kcsDo6u/UO/e/qToTAvNZk/btyW30
 bsZHyYUIjzFzXNKjtRaRqjdbQDEvQUgCM6L8R7mG5Q==
X-Google-Smtp-Source: AGHT+IH0Q5WLGg137IbMBUMSfXdWuSPTOIYuwSmS6QRkwWZn4H4ZmVUC8b7p6dfX6ZgD3owXrQgPMA==
X-Received: by 2002:a05:6000:1a85:b0:386:3c93:70ff with SMTP id
 ffacd0b85a97d-3864de9e47emr2247845f8f.8.1733923523937; 
 Wed, 11 Dec 2024 05:25:23 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43622130a6bsm176075e9.23.2024.12.11.05.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 05:25:23 -0800 (PST)
Message-ID: <a6861da0-6ed2-43c3-b6e4-97ee407d56a9@smile.fr>
Date: Wed, 11 Dec 2024 14:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryce Johnson <bryce@redpinelabs.com>, buildroot@buildroot.org
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
References: <20241022225457.568323-1-bryce@redpinelabs.com>
Content-Language: en-US
In-Reply-To: <20241022225457.568323-1-bryce@redpinelabs.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733923524; x=1734528324; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=msh/dxy8UujgPNbA6dajm9pE4lOYAt+ooscqN4W2UQI=;
 b=pG4XmACgFDWLUFuEGFGtX0po1UCvW55TVQNpWAXpcqxsi0mENGoprW1Z3iYpvNcVes
 6n1t0W/Sggf1JNIYX6t3VJRz8vgD+bpDLQiu5l+mL8TPVXkBkgkfr9qkKiGCj/z/We4/
 xUv7V6EIXzk+zaJvLcNZQSLGWFnwa9H7DMXAc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=pG4XmACg
Subject: Re: [Buildroot] [PATCH 1/3] package/arm-gnu-toolchain: Add support
 check for x86_64 and aarch64
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

SGVsbG8gQnJ5Y2UsIEFsbCwKCkxlIDIzLzEwLzIwMjQgw6AgMDA6NTQsIEJyeWNlIEpvaG5zb24g
YSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBCcnljZSBKb2huc29uIDxicnljZUByZWRwaW5l
bGFicy5jb20+CgpJIHNsaWdodGx5IGltcHJvdmVkIHRoZSBjb21taXQgbG9nLgoKQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IC0tLQo+ICBwYWNrYWdl
L0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIHBhY2thZ2UvYXJtLWdu
dS10b29sY2hhaW4vQ29uZmlnLmluLmhvc3QgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXJtLWdudS10b29s
Y2hhaW4vQ29uZmlnLmluLmhvc3QKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4u
aG9zdCBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiBpbmRleCBlNGZiZWU0ZjJhLi4zNjBiYTlk
YWQ2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNrYWdl
L0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTUsNiArNSw3IEBAIG1lbnUgIkhvc3QgdXRpbGl0aWVzIgo+
ICAJc291cmNlICJwYWNrYWdlL2FnZW50LXByb3h5L0NvbmZpZy5pbi5ob3N0Igo+ICAJc291cmNl
ICJwYWNrYWdlL2FtbG9naWMtYm9vdC1maXAvQ29uZmlnLmluLmhvc3QiCj4gIAlzb3VyY2UgInBh
Y2thZ2UvYW5kcm9pZC10b29scy9Db25maWcuaW4uaG9zdCIKPiArCXNvdXJjZSAicGFja2FnZS9h
cm0tZ251LXRvb2xjaGFpbi9Db25maWcuaW4uaG9zdCIKPiAgCXNvdXJjZSAicGFja2FnZS9hc24x
Yy9Db25maWcuaW4uaG9zdCIKPiAgCXNvdXJjZSAicGFja2FnZS9iYWJlbHRyYWNlMi9Db25maWcu
aW4uaG9zdCIKPiAgCXNvdXJjZSAicGFja2FnZS9ibWFwLXRvb2xzL0NvbmZpZy5pbi5ob3N0Igo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FybS1nbnUtdG9vbGNoYWluL0NvbmZpZy5pbi5ob3N0IGIv
cGFja2FnZS9hcm0tZ251LXRvb2xjaGFpbi9Db25maWcuaW4uaG9zdAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZGZkMzBlNTIyMwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wYWNrYWdlL2FybS1nbnUtdG9vbGNoYWluL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTAsMCAr
MSw0IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0FSTV9HTlVfVE9PTENIQUlOX1NVUFBP
UlRTCj4gKwlib29sICJob3N0IGFybS1nbnUtdG9vbGNoYWluIgo+ICsJZGVmYXVsdCB5IGlmIEJS
Ml9IT1NUQVJDSCA9ICJhYXJjaDY0Igo+ICsJZGVmYXVsdCB5IGlmIEJSMl9IT1NUQVJDSCA9ICJ4
ODZfNjQiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
