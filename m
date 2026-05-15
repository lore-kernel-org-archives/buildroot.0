Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C100CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D693413E4;
	Fri, 15 May 2026 14:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAGsh0z8LSLW; Fri, 15 May 2026 14:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A06413E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778854419;
	bh=v03dZvHLhQlfHu5CJl2xXPQGhFOwPA9hemGsaAbkfv8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Aorc7gsWCnh03kkQHua0vkruhmYi+gF38pRJakT5imWVWOQYtdYu8ccBwXlsArEOi
	 vVyDmsQce/z7ae19l11B+Ol+QjonsDfNw7YvSDYmJ4yXDpNdL5c0lMHKDp9A+tcU/0
	 AG+jIZmKIqxkNLSc2iMiwW9DmSyboLjlqb8ohxyRXxFFvryoQeiJRz1ceOjvSy+koY
	 0bM/mvtuXEg8xN3zFaVgiGw1n+0RqPuKjQQnn0gxSxH2eZLpZmG6SL9bz/ePV7Umn6
	 DbsvYm3D6r9JDmBQO8xwkHkkfeWZ+o7wtMbSJ2g4yg7CSkxNzqqCNJfEf4WmReyVzE
	 tXlOh4GIxl/Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A06413E7;
	Fri, 15 May 2026 14:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6890836E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59BE940E49
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IatoBXtzaFOl for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:13:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 486D440E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 486D440E24
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 486D440E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-452169ae568so7135451f8f.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 07:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854415; x=1779459215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IjM9ieRZsv9pChPdA9eayrVOiRzGI/pg3yU/m+8Hyfo=;
 b=jDWZx0ILg8mmIUVBm/BJM62eoSpmmpF1KxY09COKs0N+ZQP0YXzRJOPz40ti/fnEZW
 y6gYv1weT5ZAh8tuRnNO/bqWuS/J6Np4m6e/PJFgw5BktZHCRvm3+B1u07UTnK2kTUI6
 zhr1ZJdUAN5YhORzpCdO+ZTos3ml6e2uC6NkG2KpVsdyyoz5Rz6Zt375Io4oWGHDbcQ3
 dyLQDnJSuZshOGssQPKJYoQQmuNJxamP2TTjp092DZAW/X9ZbXS2XXSgGGtdrvtd/23q
 wpKQMbEw6n1i8fWG5KHE//NeYKzDGyY8idVvT/xzaWpixFMupXsC917vw6FbaJA7YZFK
 /kIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gkMKI5csMdDcEGTRNlZk64ntZv7sSirWE++wJlNPCUBcSvOp3fUnWFiSS+UJ3ZThAoxw4kAVOtgo=@buildroot.org
X-Gm-Message-State: AOJu0Yw8CMiwQdCxMIgrCstR9iiIPeCf6iPR5AnPBCxhxHZ5xbVvxJtt
 9Lyuz8qlD62BQSpTrd2EXJ9QYyrIHDeKFl+Ox3rlNSeJhxTRn7FYvNQWvnc0LLMBFajWPQKVj/m
 cTJ03QBQ=
X-Gm-Gg: Acq92OF8v2PdFkh3my1PHJyj0y3uCcWBlHH6V14jSvitbnQ1cULyGGN4MdWicgHOziI
 F2yjpmrp+QwarrXElx8Vpn+HEjDVW5QrLUtVJimedwPcex1h/13EOtoKU8mRdNWeSSGRKGVtVlg
 5KFr2IUdP9KoK8V7pjOOF783tF33qqxWnksY0y5nDGfCiWlF0ZBmxxCJuH3ZCkRa9HkvxhZxTvu
 Mb+cPv/7lFf7d2HsRZnJwUvI95ecrPW0PwB4qQE2CIw+KiG74m1f9zZyVrPHWCny/14MQkx0bd9
 L30Br8nrtYOTvo12GELSGYK3UZJQtH1LTVn+5qRmKcGBpXKtwUu3Ra9qJ17NQ+L2226JIPvjuri
 4BsHzzdP8SYEVsZYMzHFATcvhNoY+3Oci0T6ji/oG0aWZZApCPj41vA1OLznZU+JWhs8rOWrvdE
 jXr///L/SCgUSx824Eh5iG+ix62jae8CMi9EL5IH9abSQCjY3qKcNZVikriL0+FSU7LN+nFhYt2
 YfZre8q32MrkQi15gIUrKHNkBebIIlflC5NzUPkNhuOjzXNTAfio5K4rAzOIxDJ6w==
X-Received: by 2002:a05:6000:1862:b0:43d:7946:baee with SMTP id
 ffacd0b85a97d-45e5c5fd6cdmr5704619f8f.23.1778854414937; 
 Fri, 15 May 2026 07:13:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm15211880f8f.12.2026.05.15.07.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:13:34 -0700 (PDT)
Message-ID: <bbc73d85-0c71-4d83-82a1-5ca62a156b0d@smile.fr>
Date: Fri, 15 May 2026 16:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260511192527.3886468-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
In-Reply-To: <20260511192527.3886468-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778854415; x=1779459215; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IjM9ieRZsv9pChPdA9eayrVOiRzGI/pg3yU/m+8Hyfo=;
 b=3r6BGB1IyXzWXL+xRDoFIX7rc+JuYvZpVP3xKXmcsgS7IGcxjBJ6Xyc+hPFfEDnauG
 SQBodcMBUo+nSP5qB2f4PWJSptuu2VJnpMbdgc9xeA8Rq92pxzoxVnx/mb1nO9RBJMyg
 SxoR3Enim48PaaXFigtngJ0M5IEcXMFRXaAw0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=3r6BGB1I
Subject: Re: [Buildroot] [PATCH] package/libblockdev: fix build failure due
 to missing dependency json-glib
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

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAxMS8wNS8yMDI2IMOgIDIxOjI1LCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IFdoZW4gQlIyX1BBQ0tBR0VfTElCQkxPQ0tERVZfTFZNMiBpcyBlbmFi
bGVkIGl0IHJlcXVpcmVzIHBhY2thZ2UKPiBqc29uLWdsaWIgdG8gYmUgZW5hYmxlZCBzdGFydGlu
ZyBmcm9tIGxpYmJsb2NrZGV2IHZlcnNpb24gMy41LjAKPiBzbyBsZXQncyBlbmFibGUgaXQgYWNj
b3JkaW5nbHkuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzL2ZjZWI2NGJiN2ZjZmNlZDYxZWY5MDBiNTgwYjQ1ODEzNWJhYTM3MTMvCj4gCj4gU2ln
bmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+CgpJIGFkZGVkIHRoZSBjb21taXQgaGFzaCBpbnRyb2R1Y2luZyB0aGUgYnVpbGQg
aXNzdWUuCgpBcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cj4gLS0tCj4gIHBhY2thZ2UvbGliYmxvY2tkZXYvQ29uZmlnLmluICAgICAgfCAxICsKPiAgcGFj
a2FnZS9saWJibG9ja2Rldi9saWJibG9ja2Rldi5tayB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJibG9ja2Rldi9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmJsb2NrZGV2L0NvbmZpZy5pbgo+
IGluZGV4IDA4ZDYxODk0NWIuLmU5ZTlmYWFhMDUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJi
bG9ja2Rldi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2xpYmJsb2NrZGV2L0NvbmZpZy5pbgo+
IEBAIC00Nyw2ICs0Nyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJCTE9DS0RFVl9MVk0yCj4g
IAlib29sICJsdm0yIgo+ICAJZGVwZW5kcyBvbiBCUjJfRU5BQkxFX0xPQ0FMRSAjIHBhcnRlZAo+
ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF81ICMgcGFydGVkCj4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfSlNPTl9HTElCCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUEFSVEVE
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWUFNTAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xW
TTIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJibG9ja2Rldi9saWJibG9ja2Rldi5tayBiL3Bh
Y2thZ2UvbGliYmxvY2tkZXYvbGliYmxvY2tkZXYubWsKPiBpbmRleCBlNWNiZTQ1YjkzLi44OWEz
OThjNmU1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliYmxvY2tkZXYvbGliYmxvY2tkZXYubWsK
PiArKysgYi9wYWNrYWdlL2xpYmJsb2NrZGV2L2xpYmJsb2NrZGV2Lm1rCj4gQEAgLTQ3LDcgKzQ3
LDcgQEAgTElCQkxPQ0tERVZfQ09ORl9PUFRTICs9IC0td2l0aG91dC1sb29wCj4gIGVuZGlmCj4g
IAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkJMT0NLREVWX0xWTTIpLHkpCj4gLUxJQkJMT0NL
REVWX0RFUEVOREVOQ0lFUyArPSBsaWJ5YW1sIGx2bTIgcGFydGVkCj4gK0xJQkJMT0NLREVWX0RF
UEVOREVOQ0lFUyArPSBqc29uLWdsaWIgbGlieWFtbCBsdm0yIHBhcnRlZAo+ICBMSUJCTE9DS0RF
Vl9DT05GX09QVFMgKz0gLS13aXRoLWx2bQo+ICBlbHNlCj4gIExJQkJMT0NLREVWX0NPTkZfT1BU
UyArPSAtLXdpdGhvdXQtbHZtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
