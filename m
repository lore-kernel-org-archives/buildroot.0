Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19303C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 16:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92CF610D9;
	Wed,  5 Feb 2025 16:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31jFr9aC6JMB; Wed,  5 Feb 2025 16:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7097610FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7097610FB;
	Wed,  5 Feb 2025 16:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84AC512F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E87D40078
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeetNON9SL7n for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 16:17:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3566540001
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3566540001
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3566540001
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:17:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38da940e689so1090725f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 08:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738772236; x=1739377036;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EOqM1YlrHan6A5nbSPetFoyuT2meRufRY8saB3ZTJBI=;
 b=dgSNrKH2FpHvlpWLRX3NOZ/CVpgrlpi4gqDvoypgcrv82tBQtGjgieN+WG4HealdeE
 G+QlPm5aH5lewyiL8GdXlnhUu7OhZty2Ofa6JJ+CYjk13TQKs5gsElux4jzRqv82O3Wy
 a8E1B2CJTv+JAeAas9qtPSFimjKs/xVH6gZW2l20RQU6+ralsAcezqieyQw5HvqRBdDW
 7KEccIyvKRPPEwSpjVyadNkKOqO7d3xmtpVfFf9bTzB6XCeUb415BAyf/+ZD8dnheqcp
 I0dKGzwuAAMo6t/3a8aiBW8TRb+5RBhlIz6nqTqf14HJ0+alE4/53PHgExAgEEY8zWd4
 HmLw==
X-Gm-Message-State: AOJu0YzY3fA4iCY7NRajdEb1cUmdynoy9YkQb5tehipclgJRVyHb2By4
 yay6uF2BPYuA4UQZ3369UGQEUWoW4gG//JhP+s185gBPWDyMRKeh8e/nYqecnQfbybRfCso+17n
 w59g=
X-Gm-Gg: ASbGncshLmyd0YXMgbOrxgL7wn+VdYq0yJWSiJQuPVQ2aDCB9gurk5YEFuPvNDSPvis
 RXCahaI0gBtEVfxk6Iag1tawUET8xI6wLD31kNCSMn0DsUYEg8ccjm0jWwdKFPMSKQLqs9TqSDJ
 9tY5AmPtO3/c1ZKcAcb5pVMh9c+9J5M3wHk7Vdv8rNpZjqsZyilzCMXIGpvOy2osm4+pMWHpcfe
 8JFCNm3eMH3hnwXHmAaY4YG2gODpBlXomEaVuogUZiqCYYW35kl6qsh+SPo/Exo6l1pbhwWs6jt
 ispHApcQ+WfUaGLCDg==
X-Google-Smtp-Source: AGHT+IHNXJTHbg4NJMbF/kmA0VmLQjxtoIxKb2vaHsL2UJUn5yCfzOR1WMKDgdv3Z7Mz83aC7WEagA==
X-Received: by 2002:a05:6000:1569:b0:38b:da6a:8a02 with SMTP id
 ffacd0b85a97d-38db4920925mr2754105f8f.47.1738772235757; 
 Wed, 05 Feb 2025 08:17:15 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d896d70sm26437495e9.0.2025.02.05.08.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 08:17:14 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AB94E5F90B;
 Wed,  5 Feb 2025 16:17:13 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250205160743.3bc05438@windsurf> (Thomas Petazzoni's message of
 "Wed, 5 Feb 2025 16:07:43 +0100")
References: <20241205173643.2334343-1-alex.bennee@linaro.org>
 <20250205160743.3bc05438@windsurf>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 16:17:13 +0000
Message-ID: <87bjvg8iye.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738772236; x=1739377036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOqM1YlrHan6A5nbSPetFoyuT2meRufRY8saB3ZTJBI=;
 b=EBQzRWfWBjia0KmZ2Qwex8jmwRv9n4kSvkAgcPMG1yZ8YiXZYOBqdXfK+NRLtF6R0F
 9Oj7v9e0FcY5xn7KcDPE7uxVyy0j6f/rmOT5E1WUkjr/ZRHZSC6EZ2waDRXbADDg91fu
 dB1ynlsK6LzS1NCBLE76Iwl0mQ2jzh9vGAd4A5LKqLs8SIY7bbfwgN5Ig2E7vdti18vc
 R3jCBHDYxd7QIcA0NJcT3LrYA75uRGXfFKxlQVnhCMErPsrJpoOfdInqTK2BFZ8+ERiq
 4HQIUuEqm4V/zVEwRf+JCuTStsHz/LjQQIOcZdrw3fyfRMDev/gFuhmcLjeiJoVXBDDQ
 fDCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EBQzRWfW
Subject: Re: [Buildroot] [PATCH v2 0/4] Enable venus vulkan encapsulation
 and add vkmark
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JpdGVzOgoK
PiBIZWxsbyBBbGV4LAo+Cj4gT24gVGh1LCAgNSBEZWMgMjAyNCAxNzozNjozOSArMDAwMAo+IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPj4gVGhpcyBpcyBh
IHJlc3BpbiBvZiBhIHNlcmllcyBJIHNlbnQgb3V0IGluIEF1Z3VzdC4gVGhpcyB0aW1lIGl0Cj4+
IGFwcGxpZXMgb24gdG9wIG9mIHRoZSBzZXJpZXMgQmVybmQgaGFzIGp1c3Qgc2VudCBvdXQ6Cj4+
IAo+PiAgIFN1YmplY3Q6IFtCdWlsZHJvb3RdIFtQQVRDSCAxLzddIHBhY2thZ2UvbGliZHJtOiBh
ZGQgaG9zdCB2YXJpYW50Cj4+ICAgTWVzc2FnZS1JZDogPDIwMjQxMjAyMTc0MDA4LjExMzQ2Njct
MS1iZXJuZEBrdWhscy5uZXQ+Cj4+ICAgRGF0ZTogTW9uLCAgMiBEZWMgMjAyNCAxODo0MDowMiAr
MDEwMAo+PiAgIEZyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4KPiBCZXJuZCBo
YXMgc2VudCBhIG5ldyBzZXJpZXMgYXQ6Cj4KPiAgIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQ0MDg5Mgo+Cj4gc28gSSdtIGNvbmZ1
c2VkIGhvdyB0aGlzIHNlcmllcyBvZiB5b3UgZml0cyB3aXRoIGl0Lgo+Cj4gSW4gd2hpY2ggY29t
bWl0IHNob3VsZCAic3VwcG9ydC90ZXN0aW5nOiB1cGRhdGUgdGVzdHMgZm9yIFNPRlRQSVBFIiBi
ZQo+IHNxdWFzaGVkPwoKVGhlIHBhdGNoIHRoYXQgYnVtcHMgbWVzYSB3aGVyZSBCUjJfUEFDS0FH
RV9NRVNBM0RfR0FMTElVTV9EUklWRVJfU1dSQVNUCmlzIGRlcHJlY2F0ZWQgZm9yIFNPRlRQSVBF
LiBUaGlzIHdhcyByZXBvcnRlZCBhcyBjYXVzaW5nIGEgbnVtYmVyIG9mIHRoZQpidWlsZHJvb3Qg
dGVzdCBjYXNlcyB0byBoYXZlIGZhaWxlZCBidXQgSSB3YXNuJ3QgYWJsZSB0byBmaWd1cmUgb3V0
IHdoeQp0aGV5IHdlcmUuCgpJZiB5b3UgaGF2ZSBtZXJnZWQgQmVybmQncyBzZXJpZXMgSSBjYW4g
cmUtYmFzZSBhbmQgc2VlIHdoYXQgaXMgbGVmdC4KCj4KPiBUaG9tYXMKCi0tIApBbGV4IEJlbm7D
qWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
