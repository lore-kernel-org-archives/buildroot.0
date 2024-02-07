Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9158EC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB3D823F6;
	Wed,  7 Feb 2024 11:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEyw94_QfaDz; Wed,  7 Feb 2024 11:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364BE824BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 364BE824BD;
	Wed,  7 Feb 2024 11:07:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A80661BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94BD841E12
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pl0vLLFLUNWH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:07:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DFFC42184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFFC42184
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DFFC42184
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:07:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51165efb684so855008e87.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 03:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707304034; x=1707908834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1BW4Y7T4rOfTTDdojoaHm7nKAo08QfvEZ0UnCk7cmic=;
 b=uyTqnsyspIaCWG17EQKisKK7eRp1Z0r6Aj0fi7j5r8F2yKpkFKj5/UAiPXd11KHf2z
 eYxWxDq6XGzsj7fJMPnDibvjcSlizrN7PJ2+WWnavPVBsVmZwnVgsiD58oyTAeNGMVRw
 mV/zDen7mPbCf7WdjGRwIjVWytOvsyIpCvqaIJd5BxAJCczYxUjV4tsxsHITEhZmf4Nz
 yg7fk4LOndCuCT2iev0GXizioE/foes393E6EKbgrgIOe1Isdd8yyMf0RPMDjguGno3a
 /EnjPxcy9GST11f2LlFr4mh6ZTGCEmzmTaNCL+fsTrRneVcHdfdJTeJp1fV0S+7PUd//
 l2uw==
X-Gm-Message-State: AOJu0YwbEqlBSGkOVxODyLbtJsDGyL9ibGqPMYw5nS32s8qLz0IRH8oo
 0ICciBpgR1IBNdgsiho5kTfZNn5RBCgjzh9O/QkRTiy6BrM7avhsqzv20WT9jeyicCOlq4RaQts
 wEzc=
X-Google-Smtp-Source: AGHT+IFYriiYMzIq7+u4kpE4m14LG3XAUZXu3dLh+cgVh3AImbceoNN2FHTL2acl18J+2zCgiGbP+Q==
X-Received: by 2002:a05:6512:31c7:b0:511:5711:4f36 with SMTP id
 j7-20020a05651231c700b0051157114f36mr4698307lfe.54.1707304033871; 
 Wed, 07 Feb 2024 03:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUi4Pwk8u/pC7U5vV0endkvkFCQ1Q9n/hqhZrC2ljKaN9+fPRwsgWBoqdcC697Mgl72JJ8c+wK0JIKWb65swWsIgPCEZQigjg==
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c359600b0040ffe1ca25bsm1729667wmq.21.2024.02.07.03.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 03:07:13 -0800 (PST)
Message-ID: <7fdd9207-c7e1-40db-a20e-e64cd8709a94@smile.fr>
Date: Wed, 7 Feb 2024 12:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707304034; x=1707908834;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1BW4Y7T4rOfTTDdojoaHm7nKAo08QfvEZ0UnCk7cmic=;
 b=dOjLWvhWqJHy/TUh2WHXsAe0lE9pa1NtMv6u6K3mT/Lv/A9Rst2QYOaIbKTQI86TV0
 idIBhPz4k9slHWWZwMwHrqlsXyV7G9BicUwz8Eim12q2tlcaJnpDfy8MwuPtbMoM5LFN
 AMBN6sQbl6BjUsHC6Es7R4BODh6rvSePquawgmAE9Crcre8woZ+aj05DF6BH83B4ZhhL
 hz/nXwnZFIwYZMFZkPgTJcbFZvk2izVpHLa496H/t2W4J15/9IUwN4mj7R94Sz9Kb9mI
 8mFSAtXG4j7qT2oIKSlAsezxAIKkfvMEBnj04LLNoKRcnkSAcUg4aENpPYNFkdtB36CS
 6hXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dOjLWvhW
Subject: Re: [Buildroot] [PATCH 1/4] configs/stm32f429_disco_xip_defconfig:
 drop redundant defconfig choice
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwNy8wMi8yMDI0IMOgIDExOjA0LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZyBpcyB0
aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uCj4gZm9yIE1NVS1sZXNzIHN5c3RlbXMsIHNvIHRoZSBz
ZXR0aW5nIGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQKPiB3aXRob3V0IGVmZmVjdC4K
ClRoaXMgaXMgZHVlIHRvIGEgY2hhbmdlIGluIEJ1aWxkcm9vdCAyMDIzLjExIFsxXSBhbmQgc2V2
ZXJhbCBvdGhlciBib2FyZHMgYXJlCmV4cGxpY2l0bHkgc2VsZWN0aW5nIGJ1c3lib3gtbWluaW1h
bC5jb25maWcKCiQgZ2l0IGdyZXAgQlIyX1BBQ0tBR0VfQlVTWUJPWF9DT05GSUcgfCBncmVwIG1p
bmltYWwKY29uZmlncy9jYW5hYW5fa2QyMzNfZGVmY29uZmlnOkJSMl9QQUNLQUdFX0JVU1lCT1hf
Q09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZyIKY29uZmlncy9p
bXhydDEwNTAtZXZrX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9CVVNZQk9YX0NPTkZJRz0icGFja2Fn
ZS9idXN5Ym94L2J1c3lib3gtbWluaW1hbC5jb25maWciCmNvbmZpZ3MvcWVtdV9tNjhrX21jZjUy
MDhfZGVmY29uZmlnOkJSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gv
YnVzeWJveC1taW5pbWFsLmNvbmZpZyIKY29uZmlncy9xZW11X3Jpc2N2NjRfbm9tbXVfdmlydF9k
ZWZjb25maWc6QlIyX1BBQ0tBR0VfQlVTWUJPWF9DT05GSUc9InBhY2thZ2UvYnVzeWJveC9idXN5
Ym94LW1pbmltYWwuY29uZmlnIgpjb25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29u
ZmlnOkJSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1t
aW5pbWFsLmNvbmZpZyIKY29uZmlncy9zaXBlZWRfbWFpeF9iaXRfZGVmY29uZmlnOkJSMl9QQUNL
QUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZp
ZyIKY29uZmlncy9zaXBlZWRfbWFpeF9iaXRfc2RjYXJkX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9C
VVNZQk9YX0NPTkZJRz0icGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1hbC5jb25maWciCmNv
bmZpZ3Mvc2lwZWVkX21haXhfZG9ja19kZWZjb25maWc6QlIyX1BBQ0tBR0VfQlVTWUJPWF9DT05G
SUc9InBhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnIgpjb25maWdzL3NpcGVl
ZF9tYWl4X2RvY2tfc2RjYXJkX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9CVVNZQk9YX0NPTkZJRz0i
cGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1hbC5jb25maWciCmNvbmZpZ3Mvc2lwZWVkX21h
aXhfZ29fZGVmY29uZmlnOkJSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3li
b3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZyIKY29uZmlncy9zaXBlZWRfbWFpeF9nb19zZGNhcmRf
ZGVmY29uZmlnOkJSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVz
eWJveC1taW5pbWFsLmNvbmZpZyIKY29uZmlncy9zaXBlZWRfbWFpeGR1aW5vX2RlZmNvbmZpZzpC
UjJfUEFDS0FHRV9CVVNZQk9YX0NPTkZJRz0icGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1h
bC5jb25maWciCmNvbmZpZ3Mvc2lwZWVkX21haXhkdWlub19zZGNhcmRfZGVmY29uZmlnOkJSMl9Q
QUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNv
bmZpZyIKY29uZmlncy9zdG0zMmY0MjlfZGlzY29feGlwX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9C
VVNZQk9YX0NPTkZJRz0icGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1hbC5jb25maWciCmNv
bmZpZ3Mvc3RtMzJmNDY5X2Rpc2NvX3NkX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9CVVNZQk9YX0NP
TkZJRz0icGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1hbC5jb25maWciCmNvbmZpZ3Mvc3Rt
MzJmNDY5X2Rpc2NvX3hpcF9kZWZjb25maWc6QlIyX1BBQ0tBR0VfQlVTWUJPWF9DT05GSUc9InBh
Y2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnIgpjb25maWdzL3N0bTMyZjc2OV9k
aXNjb19zZF9kZWZjb25maWc6QlIyX1BBQ0tBR0VfQlVTWUJPWF9DT05GSUc9InBhY2thZ2UvYnVz
eWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnIgoKQ2FuIHlvdSBkbyB0aGlzIGNoYW5nZSBpbiBv
bmUgY29tbWl0ID8KClsxXQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9jb21taXQvODBiNTY4ODcwMDZjZmJhNTA4MzM4ODFkYzMxZjA0NWQ0OTRhZjE4NQoKQmVz
dCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBjb25maWdzL3N0bTMy
ZjQyOV9kaXNjb194aXBfZGVmY29uZmlnIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZj
b25maWcgYi9jb25maWdzL3N0bTMyZjQyOV9kaXNjb194aXBfZGVmY29uZmlnCj4gaW5kZXggZDRl
MDAwNDg3YTgwLi45OWFlOGNjNzUzM2IgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9zdG0zMmY0Mjlf
ZGlzY29feGlwX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9k
ZWZjb25maWcKPiBAQCAtMTMsNyArMTMsNiBAQCBCUjJfTElOVVhfS0VSTkVMX0lNQUdFX1RBUkdF
VF9DVVNUT009eQo+ICBCUjJfTElOVVhfS0VSTkVMX0lNQUdFX1RBUkdFVF9OQU1FPSJ4aXBJbWFn
ZSIKPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gIEJSMl9MSU5VWF9LRVJORUxf
SU5UUkVFX0RUU19OQU1FPSJzdG0zMmY0MjktZGlzY28iCj4gLUJSMl9QQUNLQUdFX0JVU1lCT1hf
Q09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZyIKPiAgQlIyX1BB
Q0tBR0VfQlVTWUJPWF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL3N0bWljcm9lbGVjdHJv
bmljcy9jb21tb24vc3RtMzJmNHh4L2J1c3lib3guZnJhZ21lbnQiCj4gICMgQlIyX1BBQ0tBR0Vf
SUZVUERPV05fU0NSSVBUUyBpcyBub3Qgc2V0Cj4gIEJSMl9UQVJHRVRfUk9PVEZTX0lOSVRSQU1G
Uz15CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
