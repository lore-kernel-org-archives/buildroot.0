Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB7ACA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 056BD6078A;
	Thu, 14 Aug 2025 20:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4tSyKLbc2uk; Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE181607C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE181607C8;
	Thu, 14 Aug 2025 20:32:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A18401BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9385A60763
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ0a-v2bug0o for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6312960771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6312960771
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6312960771
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b05d252so8515715e9.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203513; x=1755808313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0CJxZgFjlhZB9U5jYewzCod7ZIntz9JZO8OpKOdusw=;
 b=o0102AKF/t02h240Hi27qgIRvxgVsd46HhYS6im535XktVDLHlzmYlA3Szec4R9QBV
 nHBKRgOdh+yeMFF/m3cD3Zzyap2ueNrltdfoMJC4Mg7/TUx0KS9F0CucIQ1WEIK+pSRA
 X1UiKi5VkzFD/PLk00JISCMOdn5pU4Fm043EgHR9EXIl6Ku0BlrEOFDURgQGRFcUVmD8
 OcX//vcSgjh3I+4OQRJDkv+M9cnNlNd/ODn6rU/LifHjiX0TBa0bJAR22eZySWeTGJiK
 YA1zR6fom9qofrF2yCBK5Gklex62P4Rk18kv5IbiRWp/H/aJCZVMPTx+wa/4XHhTO7IP
 SuXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq3MsOSogoF2bMZoJqX20hZmdFUVHsghlgzk7PTKdV+LhYsOj95g5MF5gyvPfO/32pdn/t0hzMLbg=@buildroot.org
X-Gm-Message-State: AOJu0Yx3HeKQ7pCm9tQlnmgSPcwwa3q9+A2NJnbnIdjvEnmF9Z9vrJgh
 ItG5nM7FaONkO5edu6p129USDP3+T3PkRgtbrU7qyG7EK9Ln9Ip5Z7K2Ht8f+kK5BCXGBXC37OA
 oriyn0vc=
X-Gm-Gg: ASbGncsvDIdleR0lyYnGtlBZeNSsLY9hdMAvbF3DChAh8CXiu4InwdYJ55J3jbqz8GU
 K5wSbDV4mVbYCBW3eGcezTTAz24PXnRmy1adITZiPtpQm6xUZMFzpF0wCwVm8+jXggOB5gBFzjp
 xjnst4cX/OzFzFBjGCq6ab3xHPTEGkU/vXhgdtEKwCxLv0p3zcWI/IABDoLmXW5U8dL5LKcgj1w
 YBBQoqT07Zi4j76ZNh/LeuOJjl2ONK3FcIxfu4zZz7gtEgI/vIPJ2lmtEAQBm9vQQA/3JzIpI90
 kxiWGEaMPcyByWBZ7LdEHo0b86FU2ZlallBJ5w1mYGwkfgYid5bEFdKBfBFuf8itrAfMFvwfuEF
 hInjdCFEJ/D68nHnQLWj6A7kv
X-Google-Smtp-Source: AGHT+IFKGCvUm6lLxZIkUUbtVApvGuWgDvzXAsPOlMv9DU+WN+S6BMlmpyoiEdX+/WWb9nGYKNiTqQ==
X-Received: by 2002:a05:600c:1c1b:b0:459:ddd6:1ca3 with SMTP id
 5b1f17b1804b1-45a1b5a2033mr39717245e9.0.1755203513378; 
 Thu, 14 Aug 2025 13:31:53 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bc85csm32910095e9.5.2025.08.14.13.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:53 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:51 +0200
Message-ID: <20250814203152.2815763-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <074fd671f8e750d51a13fc48c0355c3fa6fc73fa.1753982959.git.yann.morin.1998@free.fr>
References: <074fd671f8e750d51a13fc48c0355c3fa6fc73fa.1753982959.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203513; x=1755808313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0CJxZgFjlhZB9U5jYewzCod7ZIntz9JZO8OpKOdusw=;
 b=L1eBOF7kojRnVJ7dCWarr7vKLpVY30JiQbFkDr/lxHSmLEiRVnL62mnen4WRl/Unja
 s7KSOD3e5Y7TdZZ/HhD8yTzm/pC5FMqCjTjJ0x0Bj2SUphxGpQJj+iIX4zPYAIvE+skK
 wcgcVt8kGuPSYPO3n/b81H9eBEE/7O/GSeKqajTiDws8Q4I/mhaN3vOQkNCgVRSoh3ZJ
 snRisUl1Epnih9JaMJolp4WaFsQBFTmEzzqo+51Re5xGnwP2cz7Y9K4qPdGy8VJDIhDV
 EU07zGfN8mi7RPbEXAmC9By/L25YQg1SXr4qiTI3hYU80RNFzhuHYcc1iLZn+fXtC9Te
 XArQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L1eBOF7k
Subject: Re: [Buildroot] [PATCH 2/2] Makefile: silence list-defconfigs for
 br2-external with no defconfig
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gV2hlbiBhIGJyMi1leHRlcm5hbCB0cmVlIGhhcyBubyBkZWZjb25maWcs
IGxpc3QtZGVmY29uZmlnIGN1cnJlbnRseQo+IHdoaW5lcyB3aXRoIGFuIGVycm9yIGZyb20gZmlu
ZDoKPiAKPiAgICAgZmluZDog4oCYWy4uLl0vbXktZXh0ZXJuYWwvY29uZmlnc+KAmTogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+IEZpeCB0aGF0IGJ5IG9ubHkgcnVubmluZyBmaW5kIGlm
IHRoZSBkaXJlY3RvcnkgZXhpc3RzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjA1
LnguIFRoYW5rcwoKPiAtLS0KPiAgTWFrZWZpbGUgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBi
L01ha2VmaWxlCj4gaW5kZXggZmE4MmFmYTQ5Yy4uNTQwMTgzZjE2ZSAxMDA2NDQKPiAtLS0gYS9N
YWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4gQEAgLTEyMTksNyArMTIxOSw3IEBAIGhlbHA6Cj4g
ICMgJCgyKTogYnIyLWV4dGVybmFsIG5hbWUsIGVtcHR5IGZvciBidW5kbGVkCj4gIGRlZmluZSBs
aXN0LWRlZmNvbmZpZ3MKPiAgCUBmaXJzdD10cnVlOyBcCj4gLQlmb3IgZGVmY29uZmlnIGluICQk
KGZpbmQgJCgxKS9jb25maWdzIC1uYW1lICcqX2RlZmNvbmZpZycgfHNvcnQpOyBkbyBcCj4gKwlm
b3IgZGVmY29uZmlnIGluICQkKFsgLWQgJCgxKS9jb25maWdzIF0gJiYgZmluZCAkKDEpL2NvbmZp
Z3MgLW5hbWUgJypfZGVmY29uZmlnJyB8c29ydCk7IGRvIFwKPiAgCQlbIC1mICIkJHtkZWZjb25m
aWd9IiBdIHx8IGNvbnRpbnVlOyBcCj4gIAkJaWYgJCR7Zmlyc3R9OyB0aGVuIFwKPiAgCQkJaWYg
WyAiJCgyKSIgXTsgdGhlbiBcCj4gLS0gCj4gMi40Ny4wCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
