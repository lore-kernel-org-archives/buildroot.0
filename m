Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE0C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7920B61339;
	Sat,  5 Jul 2025 20:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BB0_nUxY9BS; Sat,  5 Jul 2025 20:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B89612E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B89612E3;
	Sat,  5 Jul 2025 20:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D88BF12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF4C940BAC
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mj2JL98nab7C for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 20:53:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E70A340BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E70A340BA5
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E70A340BA5
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:53:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4539cd7990cso10763595e9.0
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 13:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751748819; x=1752353619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aFEp/bQTx06paOvwRhzlk5Fcy9og2jlmOVrIMngZsHM=;
 b=DXIcFarJoKPYqxFxPdeTRvt64pY0Kd17AO/5kJssLmDYl8k4ZsqLB+ieC8KeK/rA49
 sd/FwgSsgxdd5xsqk+xOI6NOsdqHCTrGXbgR70fye58IKz/cLaHQhxMiJOcdV3rn05bj
 yvNMGXGhbRUVqnDLXBy9VAXPwIqiBZKFsmHQ0C4dpI+Iu8t5VzGZkxC+YHqXvPj3LMk9
 pftpf1fCCghIQ7qr747LJ3ZHQcLWPbR/fqOj1DZXyJngYHnqtMR8QGAUqNOMxlHqD1JR
 OL+WTr9WwcqvUDldwXAngS3pmxMXSkorKk5XSgLHEfsyiBPT0fQT34ZbraL3o6kOqcLp
 FqSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUISNkGAfJ9lmiIiTX4Bhet64I0at2NgcXlC0DHKNsHK6zgJj+iSbCsDhsPLcSa6DbXpb9q1Qas0bg=@buildroot.org
X-Gm-Message-State: AOJu0YwjQ0pXTHXSKhE9LhY4GSP9oXExEMjlLfjYnm1wzLBS8bGZn0wg
 jW5hgnHyh4IQNaQBIRPe8/DJoU5qRVLLd/QvvY2lkU/kFYAQzcglfAl3SYIHJffEVcK1dObw7Wh
 t1V81
X-Gm-Gg: ASbGncuMuV8arsJYHe80qd/nbZG/Hqor/PP2kulHR9uazCvi3QpndIvBlOBdNspAgm9
 nla3cO3AKQ/DLUzFgtuceS9V0eL+FLSMYvIM/9Y9sRr4VeJCVtKP5LJiNg7qIAuKA3Z6RFYeuHP
 FyYujkEvU1t9tQPcNUQO4UZ+ZlvKE9lsDF9wHJLIpl1uItiNU4PJujivC4imYQtIGYZ9rKUOjLe
 qQVvWjSYByXbv+hjeMweFldnMIpSjUUC55vioiFBq6SMhMBtpKmOtDR7kb5cdLjtHYufNNzLCrT
 UWRMf6fSBxNv3ESvtHcBNVk7a+4wJ7tNkMzqZl1j6gR0L/u6uZeZzu9vjf8ITrYgI7WcS03VTh2
 fyBih0iwT7HSiPhAkgWkXI81P5UW2lyi0ER5TVV6tOoemabdZjCuhX/+xOtARl3Xdsp5g1PkFAG
 mPv6cJQi3t2qSJOTcOM34okpnMK+GkXM9M+VU=
X-Google-Smtp-Source: AGHT+IHWwxlygYVKC/kOocqOR2XlyaAY6jJmqilg1tl9/efjWD07Xg50OcXp6oIo9gcrpnW3Fd8xiw==
X-Received: by 2002:a05:600c:524c:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-454b2697c5amr75099315e9.5.1751748818891; 
 Sat, 05 Jul 2025 13:53:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d099esm5785909f8f.21.2025.07.05.13.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 13:53:38 -0700 (PDT)
Message-ID: <f85540f5-a5f9-4736-8411-410f743b6360@smile.fr>
Date: Sat, 5 Jul 2025 22:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <cover.1751377540.git.yann.morin@orange.com>
 <9bae67a128b0ad2744c28f3dbbd124dc28f5430d.1751377540.git.yann.morin@orange.com>
Content-Language: fr
In-Reply-To: <9bae67a128b0ad2744c28f3dbbd124dc28f5430d.1751377540.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751748819; x=1752353619; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aFEp/bQTx06paOvwRhzlk5Fcy9og2jlmOVrIMngZsHM=;
 b=Rn4rO8FcD2KgDcm8oAYfuc63PlmRaMCp6U4fbPdRha8an0PE012xAd1RsLR/hgv6HV
 NE59K0jptZLK3UBidDVGkYmeyghGXrYpQHXv8wgSXu59YMxP+spajOsgSFGlykPEt9or
 va85seWrtdsLvPSqr7k2SsF6DaSrD49ZhlfWA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Rn4rO8Fc
Subject: Re: [Buildroot] [PATCH 3/4 v2] package/cni-plugin: simplify
 installation
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDEvMDcvMjAyNSDDoCAxNTo0NSwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gSW4gYWxsIHRoZW9yeSwgd2UgY291bGQgaXRlcmF0ZSBvdmVyIENOSV9Q
TFVHSU5TX0lOU1RBTExfQklOUywgd2hpY2gKPiBhbHJlYWR5IGNvbnRhaW5zIHRoZSBiYXNlbmFt
ZXMgJChub3RkaXIpIG9mIHRoZSBiaW5hcmllcyB0byBpbnN0YWxsLAo+IGJ1dCAqX0lOU1RBTExf
QklOUyBpcyBub3cgYW4gaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsLCBhbmQKPiBjYW4n
dCBiZSBndWFyYW50ZWVkIHRvIGJlIHN0YWJsZS4KPiAKPiBIZW5jZSwgaXRlcmF0ZSBvdmVyIHRo
ZSBsaXN0IG9mIHRhcmdldHMsIGFuZCBzb21ld2hhdCBkdXBsaWNhdGUgdGhlCj4gaW5zdGFsbCBj
b21tYW5kcyBmcm9tIHRoZSBpbmZyYSwgdXNpbmcgbWFrZSdzICQobm90ZGlyKSByYXRoZXIgdGhh
bgo+IGNhbGxpbmcgdG8gdGhlIHNoZWxsJ3MgdG8gY2FsbCBiYXNlbmFtZS4KPiAKPiBOb3RlOiB3
ZSBuZWVkIHRvIHN0b3Agc2V0dGluZyBfSU5TVEFMTF9CSU5TLCBhcyBhIGZvbGxvd2luZyBjb21t
aXQgd2lsbAo+IGNoZWNrIHRoYXQgaXQgaXMgbm90IGV4cGxpY2l0bHkgc2V0LCBhbmQgZmFpbCBv
dGhlcndpc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBv
cmFuZ2UuY29tPgo+IENjOiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVz
PgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBwYWNrYWdlL2NuaS1wbHVnaW5zL2NuaS1wbHVn
aW5zLm1rIHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY25pLXBsdWdpbnMvY25pLXBs
dWdpbnMubWsgYi9wYWNrYWdlL2NuaS1wbHVnaW5zL2NuaS1wbHVnaW5zLm1rCj4gaW5kZXggYmNj
YzE2NzRhYS4uOWE5ZWNmMTAzYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NuaS1wbHVnaW5zL2Nu
aS1wbHVnaW5zLm1rCj4gKysrIGIvcGFja2FnZS9jbmktcGx1Z2lucy9jbmktcGx1Z2lucy5tawo+
IEBAIC0yNyw3ICsyNyw2IEBAIENOSV9QTFVHSU5TX0JVSUxEX1RBUkdFVFMgPSBcCj4gIAlwbHVn
aW5zL21ldGEvcG9ydG1hcCBcCj4gIAlwbHVnaW5zL21ldGEvdHVuaW5nIFwKPiAgCXBsdWdpbnMv
bWV0YS92cmYKPiAtQ05JX1BMVUdJTlNfSU5TVEFMTF9CSU5TID0gJChDTklfUExVR0lOU19CVUlM
RF9UQVJHRVRTKQo+ICAKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJBUFBBUk1PUikseSkKPiAg
Q05JX1BMVUdJTlNfREVQRU5ERU5DSUVTICs9IGxpYmFwcGFybW9yCj4gQEAgLTQ2LDkgKzQ1LDkg
QEAgZW5kaWYKPiAgCj4gIGRlZmluZSBDTklfUExVR0lOU19JTlNUQUxMX1RBUkdFVF9DTURTCj4g
IAkkKElOU1RBTEwpIC1kIC1tIDA3NTUgJChUQVJHRVRfRElSKS9vcHQvY25pL2Jpbgo+IC0JJChm
b3JlYWNoIGQsJChDTklfUExVR0lOU19JTlNUQUxMX0JJTlMpLFwKPiAtCQkkKElOU1RBTEwpIC1E
IC1tIDA3NTUgJChARCkvYmluLyQkKGJhc2VuYW1lICQoZCkpIFwKPiAtCQkJJChUQVJHRVRfRElS
KS9vcHQvY25pL2Jpbgo+ICsJJChmb3JlYWNoIGQsJChDTklfUExVR0lOU19CVUlMRF9UQVJHRVRT
KSxcCj4gKwkJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL2Jpbi8kKG5vdGRpciAkKGQpKSBc
Cj4gKwkJCSQoVEFSR0VUX0RJUikvb3B0L2NuaS9iaW4vJChub3RkaXIgJChkKSkKPiAgCSkKPiAg
ZW5kZWYKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
