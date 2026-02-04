Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA31E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9EFC605B0;
	Wed,  4 Feb 2026 15:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99vswjL4IXMH; Wed,  4 Feb 2026 15:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D33C660C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219690;
	bh=K+BC2uYWBkx/DNITwdOGjsi93QMDroAvLIO/NIwuAdo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JCGHadLha1GRCzdUWo8cx+LMZeeq/H+JEV0ZDQAwY7+7nz/+fW3aZBDDrrNRhJCis
	 TSrjS1kY3YC9YKRIqQ/gozqTdxq05ojX6y3YLBvazl0mHw9JNXIqn9dKiHTDYWWlx1
	 JO0LIo0RL0gKS0Mo0B9sP3RcC7Lg6UKxeP6DCzaCvbzYyEQ7QPD8pBdoYJZ+z/VxXU
	 v/2VysNTq/+2DvGwWVUzL1Sjk++sc2uEZCTh0/4qPBZkM9KOCYdVw7/DZTzskOaLpn
	 z6sBYHPW2i5vh86IkyeiVD9q1vsgM8wP839vvKXHQM4IJDfGwgbrSYE7f2Fuxcojhe
	 rIcDhk5Z2lZ9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33C660C23;
	Wed,  4 Feb 2026 15:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45982F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2765460C23
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8gAr5hUCXmj for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA8AC605B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8AC605B0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA8AC605B0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:41:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so6575336f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219685; x=1770824485;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PgdWxxgWNjNE3tb/+cNg0jW/dwFNfj3WppSeA+lNh0=;
 b=HibVGe+XdKhGBglQfiYI3GOptmXTXYieUeR7BfYQkJcPL0xddKuAjVGjGpznSmnPX+
 E8vMqzfuLDadty+EMBPncF+G+TzWtcV9nDLW5dnXP+nGgfqxk8y+bCtuThdA8s6IlRCt
 KxROOrzG8T0wZ4N7vy+iwJtUFc1Ab09i74cN6ajvc660mdpp9OwSIMHlgTiaYX0jPAXF
 6CIrDMkn/0NarMox8PLr7luZy21j1ypgaSqZX3hSaiWR3T203Z8uZ8/BTN6yB7+lZdH+
 tNPcz6jcSj+vQPTjsMmHX2DrotFoWwPxVAcbkF9h7H7RDBLyy2TjnE0pxUXyF9oWBPJg
 A7Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBRr9XhUyzAG1pin48jqq6hGw++aYYtMr13M9UnZulEY7fzCn4VJ6Ks5SJS+AC1LsUjihNjO0IAwQ=@buildroot.org
X-Gm-Message-State: AOJu0YxLvmbYecVCMOx1/ygZJg0Bkkd97PhKPNHLyI/t3a4wZqP66cAc
 0c66AfiyJA4kVVoB2UKtTSD9Mug2j2uHjMviyMPvv7S8Z3QVUGMJ9YwtGkLHj8NtkuY=
X-Gm-Gg: AZuq6aJfD0vO3LOrZF/1l+luvPfmmWjaSX9bufp0DgDK5sspIiTmAefxzJstKV2XHt+
 +prl/6ms8tky0Msqj3zc14scxkId5zcIl50yrviyhE8v53UU3RMXm/RadwjIuH+8T2CIEFoDyxU
 q9q5VDhB3Spc6xszFrns98JW4Rv0lrMxmngVTUhDK8Ri70VR+fjcbk0twsWrFLPSnL3GsH0VuTT
 6DYXa45ZkeQnvg1Jc129fvmDxC+H4mkp4jbSmtfAl6hedcTiKqfEaVJhiBfTxkjm97EZ1COqhxe
 Iu2b7l0VZbgHs+GCQmYCCXhY8V9OyuhhkUbzWXFtt8O5gPmZKdmS+hF1nCWEYpi3CGssxhb/c0K
 9izXO5qTrtdPWvXpzIiIc3TAAzDwlfDaoz+cScG1k+ALw5lZ9EBaUsRZsl88IjfaazdJGbdeoVZ
 3Z1r1587EunP50y7XthNvehQUvamByognaCO3/dH8IUF0sOvOV73KTd3tVe7C3bCJCqH71iMrOs
 MktLcRdkdNzOmGgjT5DGCLwWJU0uJIfm/qQwmdyfks0f8B7UgM=
X-Received: by 2002:a05:6000:290b:b0:430:f241:a11f with SMTP id
 ffacd0b85a97d-4361805392dmr4477560f8f.30.1770219684829; 
 Wed, 04 Feb 2026 07:41:24 -0800 (PST)
Received: from ?IPV6:2a02:8440:9501:c6d4:a70:6c91:93ab:53a1?
 (2a02-8440-9501-c6d4-0a70-6c91-93ab-53a1.rev.sfr.net.
 [2a02:8440:9501:c6d4:a70:6c91:93ab:53a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805f8b4sm7036477f8f.36.2026.02.04.07.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:41:24 -0800 (PST)
Message-ID: <3d2ef204-736c-42d4-b875-c816b7af8dcc@smile.fr>
Date: Wed, 4 Feb 2026 16:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
 <20250801150722.4003476-3-raphael.melotte@mind.be>
Content-Language: fr, en-US
In-Reply-To: <20250801150722.4003476-3-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770219685; x=1770824485; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4PgdWxxgWNjNE3tb/+cNg0jW/dwFNfj3WppSeA+lNh0=;
 b=DboqgxCDfC9fvWJFfH1dcOiFdo04NUG9iGAKAJbE2Ogap+/kqsWHLMjU1L/Haw5kRv
 kOe1jGz09/pYgvC8i2X7FuvWvsRvhrSIvajTfnvcqkEVy7cOmiZdkADJxZCedFGfXmN6
 8qWR2LIFNOGm5eRco/JOTJ8Hf/3pWxVrmpfzI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=DboqgxCD
Subject: Re: [Buildroot] [PATCH 2/6] package/python-pymupdf: add missing
 depends on python3
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

SGVsbG8gUmFwaGHDq2wsIEFsbCwKCkxlIDAxLzA4LzIwMjUgw6AgMTc6MDcsIFJhcGhhw6tsIE3D
qWxvdHRlIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOr
bCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gIHBhY2thZ2UvcHl0
aG9uLXB5bXVwZGYvQ29uZmlnLmluIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5pbiBi
L3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCj4gaW5kZXggZTZlN2MzOGM5ZS4uODM5
OTBhYzdmZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCj4gQEAgLTQsNiArNCw3IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fUFlNVVBERgo+ICAJZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX0hBU19TWU5DXzQgIyBtdXBkZiAtPiBoYXJmYnV6ego+ICAJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBtdXBkZiAtPiBoYXJmYnV6ego+ICAJZGVwZW5k
cyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgcnVudGltZSBmYWlsdXJlCj4gKwlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX1BZVEhPTjMKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1NXSUcKPiAgCXNl
bGVjdCBCUjJfUEFDS0FHRV9GUkVFVFlQRQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01VUERGCgpU
aGlzIGlzIG5vdCBuZWNlc3Nhcnkgc2luY2UgdGhpcyBwYWNrYWdlIGFscmVhZHkgZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9QWVRIT04zCgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9ibG9iLzIwMjUuMTEueC9wYWNrYWdlL0NvbmZpZy5pbj9yZWZfdHlwZT1oZWFk
cyNMOTU5CgpJbmRlZWQsICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIgY2FuIG9ubHkgYmUgc2Vs
ZWN0ZWQgd2hlbiBCUjJfUEFDS0FHRV9QWVRIT04zCmlzIHNldC4KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
