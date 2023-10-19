Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B19CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 19:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B43D9430F0;
	Thu, 19 Oct 2023 19:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43D9430F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgFi_IPWbxAz; Thu, 19 Oct 2023 19:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E49B4312E;
	Thu, 19 Oct 2023 19:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E49B4312E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C32881BF5F8
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C1F841D93
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C1F841D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjbeQQK4P6AQ for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 19:44:57 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 573FF41739
 for <buildroot@uclibc.org>; Thu, 19 Oct 2023 19:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 573FF41739
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-323168869daso54996f8f.2
 for <buildroot@uclibc.org>; Thu, 19 Oct 2023 12:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697744695; x=1698349495;
 h=in-reply-to:references:subject:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QyCTUYDR9Kv/4WDUT7gdoHtuxpWSW12By9xc8R0Zq9w=;
 b=AOHmgbdgqo+DqPPVmGvM2ufEnxBlk/ARG9LauOIqhKSOzWTS79NEYFJ2bu9/r5JcLy
 qi9bwMJV8JntrVAWCYxCktL4o1b7matOuJ7dqNjA51se0VpkNghZyVFV/HXRVyPEtbFy
 USE2BZPMRkPPAtXRBHlgmtOe1NSdI5W+X3PZHadzMU8HIMdDKK9elMA0s0XJq4Q2fNMJ
 BtIqH86FMivsjoCKKzV/IHjq6snSuIJLn+rte6E/vUNhOSDeLkcoO+V+d+8d5wAY35pG
 vDnccxfqXAK4nIXCY9gTtqvhFmhSdRmXK+P8slEoUG3xOQ8d7vWpvA9bfHLUDflUqEe/
 bxtA==
X-Gm-Message-State: AOJu0Yzd9GUOQxzz6TNlxz07LMSzXIb5WVWqdIB52xSNE9DUcumO7IUm
 wunATXTIVmrRlzcHP53NZZbPDw==
X-Google-Smtp-Source: AGHT+IHpCTNkdOClditHyCd4NoziOvdnBkH5471LFWRvLNQ9D9zFGsVs11AVF3GYodkJ9LHwrj2o7w==
X-Received: by 2002:adf:f510:0:b0:317:70da:abdd with SMTP id
 q16-20020adff510000000b0031770daabddmr2133832wro.59.1697744695307; 
 Thu, 19 Oct 2023 12:44:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b0032d09f7a713sm91247wrt.18.2023.10.19.12.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 12:44:54 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 19 Oct 2023 21:44:54 +0200
Message-Id: <CWCO9LKB0ENU.23BT4C77MQJCA@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@uclibc.org>
X-Mailer: aerc 0.15.2
References: <20231019075440.2568312-1-andyshrk@163.com>
 <20231019075512.2568398-1-andyshrk__14620.458455623$1697702154$gmane$org@163.com>
 <pan$3c018$26562eb$5b2af76e$232b3d48@ID-313208.user.individual.net>
In-Reply-To: <pan$3c018$26562eb$5b2af76e$232b3d48@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697744695; x=1698349495; darn=uclibc.org;
 h=in-reply-to:references:subject:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QyCTUYDR9Kv/4WDUT7gdoHtuxpWSW12By9xc8R0Zq9w=;
 b=N1wMtUcb9mmxvaxX4KJf9RqyPbNJiM8i+yhuIHTplLEQrT40ofp6239+igVFDzV+dX
 Z33gSAtOrvJ13SBV0s1EBK772RYcxWSAys2j6qn05yv4JX9v2PLyJWK7kswTrv9hT2sE
 SBFEMaCE5H89i/2fAehX/oGsgbWCN4zNC5mLM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=N1wMtUcb
Subject: Re: [Buildroot] [PATCH v2 1/1] igt-gpu-tools: add igt-gpu-tools
 package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5keSwgSGVsbG8gQmVybmQsCgpPbiBUaHUgT2N0IDE5LCAyMDIzIGF0IDc6MjUgUE0g
Q0VTVCwgQmVybmQgS3VobHMgd3JvdGU6Cj4gSGkgQW5keSwKPgo+IHdoaWxlIHRyeWluZyB0byBi
dWlsZCB0aGUgcGFja2FnZSBJIGZvdW5kIG1vcmUgdGhpbmdzOgo+Cj4gQW0gVGh1LCAxOSBPY3Qg
MjAyMyAxNTo1NToxMiArMDgwMCBzY2hyaWViIEFuZHkgWWFuOgo+Cj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gaW5kZXggODMxMzRmYjUy
ZC4uZDc5OGZlNjg1MCAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gPiArKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gQEAgLTE2MDUsNiArMTYwNSw3IEBAIG1lbnUgIkdyYXBo
aWNzIgo+ID4gIAlzb3VyY2UgInBhY2thZ2UvZ3RrbW0zL0NvbmZpZy5pbiIKPiA+ICAJc291cmNl
ICJwYWNrYWdlL2d0a3NvdXJjZXZpZXcvQ29uZmlnLmluIgo+ID4gIAlzb3VyY2UgInBhY2thZ2Uv
aGFyZmJ1enovQ29uZmlnLmluIgo+ID4gKwlzb3VyY2UgInBhY2thZ2UvaWd0LWdwdS10b29scy9D
b25maWcuaW4iCj4KPiBQbGVhc2UgYWRkIHRoZSBwYWNrYWdlIHRvICJUYXJnZXQgcGFja2FnZXMi
IC0+ICJHcmFwaGljIGxpYnJhcmllcyBhbmQgCj4gYXBwbGljYXRpb25zIiwgSSBkaWQgbm90IGV4
cGVjdCB0byBmaW5kIGl0IHVuZGVyICJMaWJyYXJpZXMiIC0+ICJHcmFwaGljcyIKPgo+ID4gKwlk
ZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgcHJvY3BzLW5nCj4gPiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfTElCVU5XSU5EX0FSQ0hfU1VQUE9SVFMgIyBsaWJ1bndpbmQKPiA+ICsJZGVwZW5kcyBv
biAhQlIyX1NUQVRJQ19MSUJTICMga21vZCwgbGlidW53aW5kCj4gPiArCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGxpYmRybSwgbGlidW53aW5kCj4gPiArCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfSEFTX1VERVYKPgo+IEFjY29yZGluZyB0byB0aGVzZSBkZXBlbmRlbmNp
ZXMgdGhlIHBhY2thZ2UgZG9lcyBub3QgZGVwZW5kIG9uIHdjaGFyLi4uCj4KPiA+ICtjb21tZW50
ICJpZ3QtZ3B1LXRvb2xzIG5lZWRzIHVkZXYgL2RldiBtYW5hZ2VtZW50IGFuZCB0b29sY2hhaW4g
dy8gCj4gdGhyZWFkcywgd2NoYXIsIGR5bmFtaWMgbGlicmFyeSIKPiA+ICsJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9MSUJVTldJTkRfQVJDSF9TVVBQT1JUUyAjIGxpYnVud2luZAo+ID4gKwlkZXBl
bmRzIG9uIEJSMl9VU0VfTU1VICMgcHJvY3BzLW5nCj4gPiArICAgICAgICBkZXBlbmRzIG9uICFC
UjJfUEFDS0FHRV9IQVNfVURFViB8fCBCUjJfU1RBVElDX0xJQlMgfHwgXAo+ID4gKwkJIUJSMl9U
T09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgIUJSMl9VU0VfV0NIQVIKPgo+IC4uLiBidXQgeW91IG1l
bnRpb24gQlIyX1VTRV9XQ0hBUiBpbiB0aGUgQ29uZmlnLmluIGNvbW1lbnQuCj4KPiA+ICtJR1Rf
R1BVX1RPT0xTX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBjYWlybyBrbW9kIGxpYmRybSBs
aWJnbGliMiAKPiBsaWJwY2lhY2Nlc3MgbGlidW53aW5kIHBpeG1hbiBwcm9jcHMtbmcgemxpYgo+
Cj4gU2luY2UgdmVyc2lvbiAxLjI0IHRoZSBwYWNrYWdlIGRlcGVuZHMgb24gbGliZHcsIGEgcGFj
a2FnZSBjdXJyZW50bHkgbm90IAo+IHByZXNlbnQgaW4gYnVpbGRyb290Ogo+IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy8tL2NvbW1pdC8KPiBlMzllMDk5
MTBmYzhlMzY5ZTI0ZjZhMGNhYmFlYjkzNTZkYmZhZTA4Cj4KPiBCdWlsZGluZyB0aGUgcGFja2Fn
ZSBpcyBicm9rZW4gYXRtIGR1ZSB0byB0aGlzOgo+Cj4gUnVuLXRpbWUgZGVwZW5kZW5jeSBsaWJk
dyBmb3VuZDogTk8gKHRyaWVkIHBrZ2NvbmZpZyBhbmQgY21ha2UpCj4KPiBvdXRwdXQvYnVpbGQv
aWd0LWdwdS10b29scy12MS4yOC9tZXNvbi5idWlsZDoxNDE6ODogRVJST1I6IERlcGVuZGVuY3kg
Cj4gImxpYmR3IiBub3QgZm91bmQsIHRyaWVkIHBrZ2NvbmZpZyBhbmQgY21ha2UKPgoKVGhlIGxp
YmR3IGlzIHNoaXBwZWQgYnkgdGhlIGVsZnV0aWwgcGFja2FnZS4gdGhlcmVmb3JlLCB5b3Ugc2hv
dWxkCgoJc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCgphbmQKCglJR1RfR1BVX1RPT0xTX0RF
UEVOREVOQ0lFUyA9IC4uLiBlbGZ1dGlscwoKPiBSZWdhcmRzLCBCZXJuZAo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKClJlZ2FyZHMsCkdhw6tsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
