Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D498AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E40606C8;
	Sat, 13 Jul 2024 09:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDmxnpqGkt7I; Sat, 13 Jul 2024 09:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64CEC60683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64CEC60683;
	Sat, 13 Jul 2024 09:10:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D46901BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C084541306
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbxATq_UC3_l for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50B7F410D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B7F410D7
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50B7F410D7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:10:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52e94eaf5efso3350875e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720861798; x=1721466598;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8Bg321pChhd4LhUIqC30mcVCJSn1mDV5h/jvjal8nA=;
 b=hjmolJ4aofkKaE+O6lHx1BjVjdzNhcoUIrQ1Z0O6TNzhlqWwg9DPqgfrmB7o7oSMdp
 BnTxrGLL6gXRJyWKwHyMH5P+V678LOcVQLhncaCk01D4wzvYg3AfpipcEv7mKdpLIRdC
 RHfhQc7oeX26h4t4dbUmJR/S7nbozQCJKpKbRpKJfAPuSkZGZ6cBkWteC+Wrqcuf5aR5
 AccgLAA1BoJyVZ3ys/F8CQCvXdpPTTs8vHZkF2BR3jxuA8Jt8L/wktePEY3/Uz+FtejJ
 Jv7TqJyExAJad1D6sXbrtb1Us9sKWfQ574qZmekTeRF5vq3aJcxOigvz0QRz1gI48RsQ
 84JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJCufPhvmnRVHdgd2AjYyovYNTbSVGbG1qvdttR2mIjwm4aV8r/bF467ggXL50c4cv4ByfXWfpKOMz025t0JsCQe41KSNkCg==
X-Gm-Message-State: AOJu0YwJORmU0VNxZTGO0DL8FFJIUOUM9IBImLzQxyG+2KOVVKrNS9lb
 3D54oD6aXkBZolXuSNqJLZWdMyN/ai4Y0mBd/AhICb4/Gx0ZjMkbPnSP+H46+LQ=
X-Google-Smtp-Source: AGHT+IGHkXQ2tR4qTBp65ui1TOX5AYJBjLOYoVB/Oog8YzjV+LYB22tK3tlvErGTxSgK81F3W0Z0UQ==
X-Received: by 2002:ac2:58e8:0:b0:52e:9b87:233c with SMTP id
 2adb3069b0e04-52eb99a3116mr7088392e87.36.1720861797700; 
 Sat, 13 Jul 2024 02:09:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25942csm47909175e9.15.2024.07.13.02.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 02:09:57 -0700 (PDT)
Message-ID: <1c7577ac-1ced-4571-a0a0-61abd6c4e1a1@mind.be>
Date: Sat, 13 Jul 2024 11:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sagi Mor <sagimor6@gmail.com>, buildroot@buildroot.org
References: <5DD722F6-F9EE-4517-9E55-5A61BB01F196@gmail.com>
Content-Language: en-GB
In-Reply-To: <5DD722F6-F9EE-4517-9E55-5A61BB01F196@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720861798; x=1721466598; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S8Bg321pChhd4LhUIqC30mcVCJSn1mDV5h/jvjal8nA=;
 b=XXeUFZ7eR4/DZtcERWnIYuL0DtnVEjop6abs7D5FSkGWPS8jy8ASQLGQ+AwKW06JMw
 Yku+Bxd8rmzJawATCkeO1O6JNXKnnesliHENob+Ry2jW/DtPAfXJMtNGMe/7PyVvcfuV
 HibtkLkMTnzB34seo9LrYslXM1Y383CDDJwfc8arsiKAsif9hpaIB1A5GGR2Gefjk+MD
 HHhiCntNzCcqnTvc2AIbzZPp/nLoNvHw3gd1m2fBaYKxzRbgpdS5yFHWCVkFVEozekdi
 YfFi+gSqPQUfXH72Uc0ZjL0EGEnkjtz44a92abwsweMOvX24Vd+OrA/NLOVG4XjoJghH
 YDlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XXeUFZ7e
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wMS8yMDIzIDE5OjA5LCBTYWdpIE1vciB3cm90ZToKPiBtYWtlICJnY2MgLS1oZWxw
IC12IiBkaXNwbGF5IGFsbCB0aGUgb3B0aW9ucywgc29tZSBwYWNrYWdlcyBkZXBlbmQgb24gdGhp
cwo+IGh0dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTUyMzEgCj4gPGh0
dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTUyMzE+Cj4gCj4gU2lnbmVk
LW9mZi1ieTogU2FnaSBNb3IgPHNhZ2ltb3I2QGdtYWlsLmNvbT4KCiAgRXZlbiB0aG91Z2ggdGhl
IHJlYXNvbiB0byBzdXBwb3J0IHRoaXMgaXMgYSBiaXQgaWZmeSwgaXQgZG9lcyBtYWtlIGEgbG90
IG9mIApzZW5zZSB0byBieXBhc3MgZXZlcnl0aGluZyBpZiAtLWhlbHAgaXMgc3BlY2lmaWVkLiBU
aGVyZSBhcmUgcHJvYmFibHkgc29tZSBvdGhlciAKb3B0aW9ucyB0b28gd2hlcmUgd2UgY291bGQg
YnlwYXNzLgoKPiAtLS0KPiAgwqB0b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYyB8IDExICsr
KysrKysrKysrCj4gIMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLmMgYi90b29sY2hhaW4vdG9vbGNo
YWluLXdyYXBwZXIuYwo+IGluZGV4IDM3YjI0ZGQyNGEuLjg1ZDU5MmFkMmQgMTAwNjQ0Cj4gLS0t
IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLmMKPiArKysgYi90b29sY2hhaW4vdG9vbGNo
YWluLXdyYXBwZXIuYwo+IEBAIC00OTgsNiArNDk4LDE3IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICoqYXJndikKPiB9Cj4gfQo+ICsvKiBkcm9wIGFsbCBub24gZm9yd2FyZHMgYXJncyBpZiAt
LWhlbHAgaXMgc3BlY2lmaWVkICovCj4gK2ZvciAoaSA9IDE7IGkgPCBhcmdjOyBpKyspIHsKPiAr
aWYgKCFzdHJjbXAoYXJndltpXSwgIi0taGVscCIpKSB7Cj4gK2N1ciA9IGFyZ3MgKyAxOwoKICBU
aGlzIGlzIGEgYml0IGV4b3RpYyBhbmQgaGFyZCB0byB1bmRlcnN0YW5kLCBzbyBpbnN0ZWFkIEkg
bW92ZWQgaXQgdG8gdGhlIApiZWdpbm5pbmcgYW5kIGNoYW5nZWQgdG86CgoJCWZwcmludGYoc3Rk
ZXJyLCAiVG9vbGNoYWluIHdyYXBwZXIgd2FzIGNhbGxlZCB3aXRoOiIpOwoJCWZvciAoaSA9IDA7
IGkgPCBhcmdjOyBpKyspCgkJCWZwcmludGYoc3RkZXJyLCAiJXMnJXMnIiwKCQkJCShkZWJ1ZyA9
PSAyKSA/ICJcbiAgICAiIDogIiAiLCBhcmd2W2ldKTsKCQlmcHJpbnRmKHN0ZGVyciwgIlxuIik7
CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICsj
aWZkZWYgQlJfQ0NBQ0hFCj4gK2N1cisrOwo+ICsjZW5kaWYKPiArYnJlYWs7Cj4gK30KPiArfQo+
ICsKPiAvKiBhcHBlbmQgZm9yd2FyZCBhcmdzICovCj4gbWVtY3B5KGN1ciwgJmFyZ3ZbMV0sIHNp
emVvZihjaGFyICopICogKGFyZ2MgLSAxKSk7Cj4gY3VyICs9IGFyZ2MgLSAxOwo+IC0tIAo+IDIu
MzQuMQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
