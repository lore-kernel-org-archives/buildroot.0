Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718F1C61DD3
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 14:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2547260B6E;
	Thu,  3 Sep 2026 14:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OINlAPXINjJw; Thu,  3 Sep 2026 14:59:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2E99160B64
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788447561;
	b=jEgatIEkeE1nPznki7zpN6il4Fh51lJn6B8p4aNUPheWtNF+szzFX/2lP0Gia/hhviWw
	 4SYn06ZEBjaVWIy8MFj6n4TUw6+RqUVPPYCvKwSeUk6MzkpX592rYOjiBjYIEwsE9oAS3
	 f8O263VSi2WNV1iT/OzqzeM8SL8fqBKWl1ucPvy39M4ZwKJXE2aLhGUNEIuhb3hUZutYC
	 T4Mbcy/pGRsamZP5G6kMohrnL9d4lwaihbQlO0WScM36vDiMJmXIvEhIGeTHszcB3uDq7
	 lUwZGP/5Au5SoUi2/oZIXVrYHsfxnO1VQv3+06M/zTsKDhhCS4okaEaXKkSJTFkOkBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788447561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=BDK2fkPoiKAHD+oAUz7bGlAjQFhZep3HbCmhuHEMFKc=;
	b=R7sOLVVf68UifF+zwkPCeCKiLrwvwO4fgdofAvpmMwwv9IvcWnb2riBqQ5syrCvXxasA
	 MIsbRPLmb6jdTkbEPnzTD/5Z7x9PFVm32WKrVwWGtYO/ex6dugs8yzr5P64aKZv7a7CBC
	 2Ij0t9DlbdK/evniGMHKDWZcLowtUvotqWfC6PaUBOPTwTrvxLW+6tc4OQE4QqvcJm6X6
	 ZkM6V1DkdCxTC7TqlWMegsM7AsiCvpqyZ5E2Y0L3L3R1gKVVCjd21BJIH/KYrToK7CHfn
	 xhCwQ7TINe1R3vqRSHxdYU5trMKHaGN5blt5DL0FOeZSUAX48fVNagrdnC3JBmoY4cw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788447561;
	bh=BDK2fkPoiKAHD+oAUz7bGlAjQFhZep3HbCmhuHEMFKc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=K1AOiQddM39s0MPyVij013f7YN2M4ijOjQYe0lRQEF41jr5ll6lhOXZjKluaAhp5Q
	 e9DB5DTxffDvFjmyCnlMlBXn/wTZ5fHiALUQaP7AG9i8kQ6LaiCVhlTtgTKC1KStEs
	 jtAXRoMAE38Hl0A4lzv9qIRbPuu9yA0fT1QGQ1DelABrFwMoMh1SPzuE807WApwrky
	 po4BF2QL1akkPE6y03B0RqbekxN08ax3JaxfJxIYUaUV1jmvOe/MOst880e3I/nWAd
	 RZvlnc2VsltRxo+BX0rapdSS8hSNk15nP5AFpFFHmOIwAT3QLpwoksRJXWvIV0ZRnB
	 cGUiFHYD2sSSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E99160B64;
	Thu,  3 Sep 2026 14:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC68363
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 14:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7FCC40A61
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 14:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0B5HH8ayxL9L for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 14:59:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 015A940A5C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788447559;
 b=SURI/dzl6I+5s8cecuHOzmeVx8MlGUle7LTuNJOClzgtlI1oSC9mH2wrTSEXydCFhEU1
 PiXPHXbRDOIb0wppMQBHEa35czksQQFUorBju6IB9L9mx9tD+TYHFK8aNaqDV+EYYUE/f
 VC3j6v/QUcQBB8nclgf9Gf9i3zFwPu6t+wC3jLTqcsMxOLKZrvSM4lNJ/IYPZj2HEDqfH
 +D7UOOb2cQ1uQCqlzQW/kT+VrMncjFCUQBZyuHWL3I+PsKfIoQ4cxz5jQlcMH4zFOe4sG
 dOS0sEMR7dYe36xuv03VXDPDpNDC8Op0F6ylmF+cGxYo5mqhBumzZoQt0fUwR5dgJdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788447559;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:References:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=67DAXioh97BZOieTnFrGwa3KkDpzSOIroDfYZFGQqgA=;
 b=AF1Ow97BDG+KR58f85nAzGz5kptQFq/8kVBKzKZ1lMvBxdr8AXBRLH/nSydxjddKsOJQ
 NVN9H3rhKO8dBO75D3tprEzt/PG1h++neNvQNDr0U8yXgvozamfHfGl2EQs6tZ+HuPMe8
 ABx5PRWtjCQZDN2izjxySLLZspcrge+nqVJxKK8LShpFBGk8VQ83NOrPIjGFU88g99Lfl
 SP1SVs9D6Ac8zjd+OQSaSTHwGmUGsGm3R/ZEWme2Ah55fDCPRLHN5xDc24fDVjw3Pqinc
 EZN+Eu6mIEQV8PP5u5KF7q85M211ptWO0ctYkzNINwdOc0HC4VMQ8H45+wr7DfRtMaw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=gSLhM0TS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 015A940A5C
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 14:59:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso10814395e9.0
 for <buildroot@buildroot.org>; Thu, 03 Sep 2026 07:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788447556; x=1789052356;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=67DAXioh97BZOieTnFrGwa3KkDpzSOIroDfYZFGQqgA=;
 b=pdVrAsWa2KbWIRZXLrfMQhdvx89dPI/0sfu61KDT1vBy/5XRXvzc4f/HFS7RXB5NnU
 mzZ6xA+SNin6+Z2oIaUA8EAjUYYHJVSp5nWRRZZ9G1kMAXmWeRR+sWxm6UY/G2Srn0HV
 P1IoEMD4FejMMIi9ZGz2ykJqjZQb2vsyGOSrSbSt2Aix2GRwxygIYT9tJ3v9LPFuLVY3
 iI+tl6hYaEZuoyr4CDgPt7pgJwv6H4EAmm/g1tchkMxshX9xGxHEqyjlD7TUZopis4EL
 KMNSx4O2W87Yggl9u7oG+mWQOfaMF4+reaG3jxCkNq4w7w9ppIYgn6GaFn53QF8ALgXZ
 i9mg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhMsD+iG/0DwEaVnmyaoZBsX1f6apBgRZVa2C8S+m63TT7phJirtCUv8mUqNjEA4UAtB1EsVMC0/A=@buildroot.org
X-Gm-Message-State: AFuF++lkT6AVjRF6BLnclFh8YMSGnj7+euNtWPys9PaJPgaWeBUMbwa5
 V8oV6FO1M0GgS1mAlbUuMBQMF3M4p/ce8OI48yuTJ+Qtqp3qoCNXj2D3o4X0I7mT5ZBQp565btM
 NpPESHIc=
X-Gm-Gg: AYBFou2fI1lccBM8v7uRTEe/uF82B3RLyymm15wAmIntrmx4vfI4NNOu66gkvkLePtL
 n6uzsK8nuJTR6UTX9kFkZtoN2aM3/n/9zibTA+emnwc5GB/RO740vXE9KYAzzaJFkWyl/niMy2z
 j6W3N0IBxAwnBxCbkO4Qz8Gu0IBtidj60qqObbsHGcN9jp+UXmaT9UscmKwHof7NBWkLn4ZzVth
 4RKITegIZbiNmSsrWWuXyVCg4UboOtjArG+1C4iWbpIFTbImYWnMSbTtnG/svDmzo+MuGfKNDCZ
 qGdQL6OcWUso/Ttg0tx1Qe0JCnjhyeOeVasRnF0JcUtj39qZ1oZB8Z2y6O0UQBUny0vxQSNojID
 qWxjwxRwVSjieoShd017Jkb3u6AYgDAsLCbiAx6Rp29wgEDQyulBqfTjDgCX31rZRStueS5TrEs
 hx33ylSZtrjzlNdo0bgPHifJEQblym87jqB9fyyMc8Hi00PIcfSemt1WM1QlGgntioA02kRgty+
 06HmgAE1jb5LSdgPhXopyLd7wLyMQbv9sOW7tf+JVnggG1EMzy1pW0=
X-Received: by 2002:a05:600c:348a:b0:49c:f13e:e4d with SMTP id
 5b1f17b1804b1-49cf15a3672mr42358685e9.10.1788447556343; 
 Thu, 03 Sep 2026 07:59:16 -0700 (PDT)
Received: from [10.5.90.81]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf0c1728bsm62915695e9.15.2026.09.03.07.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 07:59:15 -0700 (PDT)
Message-ID: <2fc9798f-a5c7-4ca5-b1d3-88ecd8a4b062@smile.fr>
Date: Thu, 3 Sep 2026 16:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: theo.lebrun@bootlin.com, buildroot@buildroot.org
References: <20260828-xdp-tools-tleb-v1-4-463c25b5a99b@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260828-xdp-tools-tleb-v1-4-463c25b5a99b@bootlin.com>
Subject: Re: [Buildroot] [4/4] package/xdp-tools: new package
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
From: dowan gullient via buildroot <buildroot@buildroot.org>
Reply-To: dowan gullient <dowan.gullient@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGjDqW8gTGVicnVuLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfRUxGVVRJTFMKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJCUEYKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9aTElCCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCUENBUAo+ICsJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0hPU1RfTExWTV9CUEYKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9CQVNI
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyAjIGJhc2gKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9FVEhUT09MCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSVBST1VURTIg
IyB0Ywo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1RDUERVTVAKPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9XSVJFU0hBUksgIyB0c2hhcmssIGNhcGluZm9zCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTkZU
QUJMRVMgIyBuZnQKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9TT0NBVAo+ICsJc2VsZWN0IEJSMl9Q
QUNLQUdFX05ESVNDNgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX05ESVNDNl9ORElTQzYgIyBuZGlz
YzYgdG9vbApUaGUgbGlzdCBvZiBgc2VsZWN0YCBzdGF0ZW1lbnRzwqAgaXMgbm90IGluIGFscGhh
YmV0aWNhbCBvcmRlciwgaWYgeW91IApjb3VsZCBmaXggdGhhdCwKaXQgd291bGQgYmUgYmV0dGVy
IGZvciBtYWludGVuYW5jZS4KPiArWERQX1RPT0xTX0xJQ0VOU0UgPSBHUEwtMi4wLCBMR1BMLTIu
MSwgQlNELTItQ2xhdXNlCgpUaGUgbGljZW5zZSBzdHJpbmcgdXNlcyBiYXJlIFNQRFggaWRlbnRp
ZmllcnMgKGBHUEwtMi4wYCwgYExHUEwtMi4xYCkgCndoaWNoIGFyZQpkZXByZWNhdGVkLiBCdWls
ZHJvb3QgcmVxdWlyZXMgZXhwbGljaXQgdmFyaWFudHMgc3VjaCBhcyBgLW9ubHlgIG9yIApgLW9y
LWxhdGVyYAoob3IgdGhlIGhpc3RvcmljYWwgYCtgKS4gRnVydGhlcm1vcmUsIHdoZW4gYSBjb21w
b25lbnQgaXMgZHVhbC1saWNlbnNlZCAKKGUuZy4sCmxpYnhkcCB1bmRlciBMR1BMLTIuMSBPUiBC
U0QtMi1DbGF1c2UpLCB0aGUgYE9SYCBvcGVyYXRvciBtdXN0IGJlIHVzZWQgCmluc3RlYWQKb2Yg
YSBjb21tYS1zZXBhcmF0ZWQgbGlzdC4gUGxlYXNlIGF1ZGl0IHRoZSBzb3VyY2UgdHJlZSBhZnRl
ciBidWlsZCB0byAKZGV0ZXJtaW5lIHRoZSBleGFjdApsaWNlbnNlcyB0byB1c2UsIGFuZCB1cGRh
dGUgdGhlIHZhcmlhYmxlIGFjY29yZGluZ2x5LgoKPiArWERQX1RPT0xTX0RFUEVOREVOQ0lFUyA9
IGhvc3QtY2xhbmcgaG9zdC1icGZ0b29sIGhvc3QtbTQgaG9zdC1wa2djb25mIFwKPiArCWxpYmJw
ZiBlbGZ1dGlscyB6bGliIGxpYnBjYXAKQWxzbyB0aGUgYFhEUF9UT09MU19ERVBFTkRFTkNJRVNg
IGxpc3QgaW4gdGhlIGAubWtgIGZpbGUgaXMgbm90IHNvcnRlZAphbHBoYWJldGljYWxseS4KPiAr
VXBzdHJlYW06IE5vdCBzdWJtaXR0ZWQKQWxsIHRocmVlIHBhdGNoZXMgKDAwMDEsIDAwMDIsIGFu
ZCB0aGUgTUlQUy1zcGVjaWZpYyAwMDAzKSB1c2UKYFVwc3RyZWFtOiBOb3Qgc3VibWl0dGVkYCBh
cyB0aGVpciBzdGF0dXMgdGFnLiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gCmVpdGhlciBzdWJtaXQg
dGhlIHBhdGNoZXMKdXBzdHJlYW0gYW5kIHVwZGF0ZSB0aGUgdGFnLCBvciBjaGFuZ2UgaXQgdG8g
YFVwc3RyZWFtOiBOL0FgIHdpdGggYQpqdXN0aWZpY2F0aW9uIGV4cGxhaW5pbmcgd2h5IHRoZXkg
YXJlIEJ1aWxkcm9vdC1zcGVjaWZpYy4KCkJlc3QgcmVnYXJkcywKR3VsbGllbnQgRG93YW4uCkFz
c2lzdGVkIGJ5IEJ1aWxkcm9vdCBSZXZpZXcgQXNzaXN0YW50ICh1c2VkIG1pbmltYXgvbWluaW1h
eC1tMzpmcmVlKS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
