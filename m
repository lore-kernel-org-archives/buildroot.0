Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008C4C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C24D3400C4;
	Tue, 30 Apr 2024 22:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NHW9vOWJlXF; Tue, 30 Apr 2024 22:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFCB540169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFCB540169;
	Tue, 30 Apr 2024 22:15:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD2801BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B90C3404C5
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7muusXrnPCz for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ACB6404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ACB6404BF
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ACB6404BF
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:14:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so43796615e9.2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 15:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714515296; x=1715120096;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vMQOK/L2f5oiRFcM3j1gTqNX1NqqCgtaJNffIlsB04w=;
 b=FWgmu9OMRBCQBMQG8uexsk/rzEMG9Z5qZk4ngS8dNz5dNPB9ZUUTFpqKGyM0DLdQOo
 G5frLhW6KKLIrY8WMxS0nbixqFNSgr/2Vl0qojjPMtRVLOXWOvmEa1PiiiEcJlwTnR7P
 tpG3Qqyvckx5ZchtTWmHzymXcnlwJ9Tvhe4e+OpNfd42F/D96T+2f1FOKoeQRYRZIfmZ
 20KwVF6bXEefdgej4jvZEIPI4ugNhXsHhJlpR/qZu76bHmCbSBsGeSUyyOVEMFSHNH50
 Zp8VZWPj1nj7j98kvt4/Vts5OowjPT0KzCrzG/dv0BVUK02RXls959g93Cphbtf+pr8D
 D9zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBz3XLt8EtSHsuRz4XU/whAJcYpuByQJSbSn01prHmclKKZibmEgfbmouD8CHstXvuvqULBwdMOSbBxGjGnqOOZ/DxUqhm/A==
X-Gm-Message-State: AOJu0YwPBZ1lnZTbXkyWbkgrwBz25eQVwGLk8Bl0mICTICl+FzsfPozp
 31MDPojqWIZEDieelZz/nCIa63GihBJv+RF5LuO9FRoCC3ZknlB2W6is7hhMao8=
X-Google-Smtp-Source: AGHT+IHOP6gaHxGd8qfPfzlfa4pa+f3PIA8KF7iL4tkaLtI1gVIVzMsTTAt8Hh70hZkxJBECWli/VQ==
X-Received: by 2002:a05:600c:3d89:b0:41b:eb15:8cd5 with SMTP id
 bi9-20020a05600c3d8900b0041beb158cd5mr561816wmb.22.1714515296206; 
 Tue, 30 Apr 2024 15:14:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b0041be58cdf83sm232958wmq.4.2024.04.30.15.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 15:14:55 -0700 (PDT)
Message-ID: <38d2c69f-3f0b-46a3-bcdd-1479b12f3e95@smile.fr>
Date: Wed, 1 May 2024 00:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>,
 buildroot@buildroot.org
References: <20240402210856.67418-1-gero.schwaericke@posteo.de>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240402210856.67418-1-gero.schwaericke@posteo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714515296; x=1715120096;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vMQOK/L2f5oiRFcM3j1gTqNX1NqqCgtaJNffIlsB04w=;
 b=ATHm0ylD6rlQ0y+Jf1oLMPnfd1W2zfS1N2oUWUPn85cxOE8nsCI7CUXA82IIS+l4oP
 ftGfV75gNHMPBkABzAdK7u0h3fVxjU452IQLltWrZCU7YewZ/MCNpVi9SbvuFk3NI2p9
 OVddrQajMy0IA+bHc5lp/11F61MgZGE1RdhVZ8goOAcN2IYJBaG9lqkmHzFG3mt4hnpu
 SPQWVfEoQHdJHueaxC9TmqkDqWcFktaQ5A8/iZ57OiISIi4mly6xk0vFOJi7puUvg4o8
 lCoNKjhDnu/56q6lu39BlUB1OxXBcepuwiucuP4wgGrSqzlyXmIn6anj+Qt/nLwYKyR9
 oXjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ATHm0ylD
Subject: Re: [Buildroot] [PATCH] configs/sipeed_licheepi_nano_defconfig: fix
 missing linux headers
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2VybywKCkxlIDAyLzA0LzIwMjQgw6AgMjM6MDgsIEdlcm8gU2Nod8Okcmlja2UgYSDD
qWNyaXTCoDoKPiBUaGUgYnVpbGQgZmFpbGVkIHdpdGg6Cj4gCj4gICBJbmNvcnJlY3Qgc2VsZWN0
aW9uIG9mIGtlcm5lbCBoZWFkZXJzOiBleHBlY3RlZCA2LjgueCwgZ290IDYuNS54Cj4gCj4gRml4
ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjQ5
ODI3ODA3OAo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Fl
cmlja2VAcG9zdGVvLmRlPgo+IC0tLQo+ICBjb25maWdzL3NpcGVlZF9saWNoZWVwaV9uYW5vX2Rl
ZmNvbmZpZyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9zaXBlZWRfbGljaGVlcGlfbmFub19kZWZjb25maWcgYi9jb25m
aWdzL3NpcGVlZF9saWNoZWVwaV9uYW5vX2RlZmNvbmZpZwo+IGluZGV4IDhiZTI2MTY1ZDkuLjZl
YjRhMzA2OWQgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9zaXBlZWRfbGljaGVlcGlfbmFub19kZWZj
b25maWcKPiArKysgYi9jb25maWdzL3NpcGVlZF9saWNoZWVwaV9uYW5vX2RlZmNvbmZpZwo+IEBA
IC05LDYgKzksOSBAQCBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfQkFVRFJBVEVfMTE1MjAwPXkK
PiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdl
LnNoIgo+ICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3NpcGVlZC9saWNo
ZWVwaV9uYW5vL2dlbmltYWdlLmNmZyIKPiAgCj4gKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtl
cm5lbAo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNT15Cj4gKwo+
ICAjIEtlcm5lbAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTj15CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApS
b21haW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
