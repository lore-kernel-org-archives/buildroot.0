Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C799C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D698E61289;
	Wed, 18 May 2022 20:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzl2AS944fLs; Wed, 18 May 2022 20:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC64161103;
	Wed, 18 May 2022 20:24:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A75561BF41B
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 20:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24CA4105B
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 20:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKJSunJ2TQ3a for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 20:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEDA44105A
 for <buildroot@buildroot.org>; Wed, 18 May 2022 20:24:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f2so4255078wrc.0
 for <buildroot@buildroot.org>; Wed, 18 May 2022 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=LRoZORy/3/Gnt7C4HFlCMGfmmonTdUYwFhaUCvBRtpE=;
 b=mXi7ecgl3tHU9sp0xJz77uRsKwHOTePZj386SbmI1FZ+fo5sMnq+tsCi2wPMFUC5xm
 3/b6/zPEf04W79u9tmiOKGmZpDwB1b4AGINRKBm/eLudCjuOrw0Aea2YxVe0PrJN2c7t
 RkJvShENWJmAj+s6OefeUqVx0ROlQexYDSXz+d5If8hPhwKaoHK1bRDEtwVgd0tNwPor
 USidMoMIYndqcHjpXUMw6UXiEWYFxy9UxKTRxvCHHpNLifxARQuEURndKtHuhexXpPPH
 RzPwNPxLG+Uc5w0mmi/jtEaa77wyzm+3OZQpmN7OSlltYS4KwiYSsrLO/wdo2JNLe2LK
 VUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LRoZORy/3/Gnt7C4HFlCMGfmmonTdUYwFhaUCvBRtpE=;
 b=OAWSFQp32B5Ej+84aSgtfJc7f2NpK18XROvw/8MWml+/VCRS2XoLW9oXwr9W8b5lEr
 7J7TUCZChODPtBq2D7svuBn7k7XPXC36ucOmNZslj0k5CDw2E9HAIKVB9WwSm/zhf1Le
 Somkbzs+zt2GBS0tKMhaGQSm0hRZy8Y8SbW+51wI7fmTH5VnuBROl8f7hoxrbDh1OWbR
 1TnwrNtw73gS0qvOhIMVKjenmqbsG6o9Rl91oOUQMK/My1s6QaOKsP+6Q5pNUzaFvoNE
 1NiqZ7Ns2jomsdtLFt3/1Hexje5JrtqETsew9ovbWlBsgXHv47CGHl+8Px+eppmNGOJw
 ci5g==
X-Gm-Message-State: AOAM533gTqMStgW/r7C02dE75or4s+lhG6CHln48XjcS5RGYZ1iB0+CH
 tSQL1G5TRrIDbq5B75Xq3TlU3hCaFl8=
X-Google-Smtp-Source: ABdhPJxGzB17/irVia1YebhBMyU6cxekpkkTu1NxbBE/AEvu3XjCGnyWDR3yKgWwrOFQoWgJ2muBPg==
X-Received: by 2002:a5d:50c2:0:b0:20d:918:f022 with SMTP id
 f2-20020a5d50c2000000b0020d0918f022mr1182101wrt.196.1652905470988; 
 Wed, 18 May 2022 13:24:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 h15-20020adfa4cf000000b0020c5253d8d3sm3314333wrb.31.2022.05.18.13.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 13:24:30 -0700 (PDT)
Message-ID: <22e590f7-80a4-0e7f-9b36-33f6d0e6ddae@gmail.com>
Date: Wed, 18 May 2022 22:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
 <20220419213450.887728-3-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220419213450.887728-3-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 3/5] arch/Config.in.arm: re-organize MMU
 selection
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

SGVsbG8gVGhvbWFzLAoKTGUgMTkvMDQvMjAyMiDDoCAyMzozNCwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gU28gZmFyLCBhbGwgQVJNIGNvcmVzIHdlcmUgc2Vs
ZWN0aW5nIEJSMl9BUkNIX0hBU19NTVVfT1BUSU9OQUwsIGV4Y2VwdAo+IG5vLU1NVSBjb3JlcyB3
aGljaCB3ZXJlIHNlbGVjdGluZyBub3RoaW5nLgo+IAo+IEluIHByYWN0aWNlLCBNTVUtY2FwYWJs
ZSBBUk0gY29yZXMgYXJlIGFsd2F5cyB1c2VkIHdpdGggdGhlaXIgTU1VCj4gZW5hYmxlZCwgc28g
aXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIHN1cHBvcnQgdGhlIHVzZSBjYXNlIG9mIG5vdCB1c2lu
Zwo+IHRoZSBNTVUgb24gc3VjaCBjb3Jlcy4KClNvLCBpdCBtZWFucyB0aGF0IHdlIGNhbiByZW1v
dmUgcWVtdV9hcm1fdmVyc2F0aWxlX25vbW11X2RlZmNvbmZpZyBzaW5jZQpCUjJfYXJtOTI2dCAt
PiBCUjJfQVJNX0NQVV9BUk1WNSAtPiBCUjJfQVJDSF9IQVNfTU1VX01BTkRBVE9SWQoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCgo+IAo+IENvbnNlcXVlbnRseSwgdG8gc2ltcGxpZnkgdGhpbmdzLCB3
ZSBncm91cCB0aGUgTU1VIGhhbmRsaW5nIGluIHRoZQo+IEJSMl9BUk1fQ1BVX0FSTSogb3B0aW9u
czogQlIyX0FSTV9DUFVfQVJNVjQsIEJSMl9BUk1fQ1BVX0FSTVY1LAo+IEJSMl9BUk1fQ1BVX0FS
TVY2LCBCUjJfQVJNX0NQVV9BUk1WN0EsIEJSMl9BUk1fQ1BVX0FSTVY4QSBhbGwgc2VsZWN0Cj4g
QlIyX0FSQ0hfSEFTX01NVV9NQU5EQVRPUlksIHdoaWxlIEJSMl9BUk1fQ1BVX0FSTVY3TSBjb250
aW51ZXMgdG8KPiBzZWxlY3Qgbm90aGluZywgaW5kaWNhdGluZyB0aGF0IHRoZXJlIGlzIG5vIE1N
VSBhdmFpbGFibGUgYXQgYWxsLgo+IAo+IEZpeGVzOgo+IAo+ICBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy8zMzI3N2Q0Njg3Y2E5YTA0ZGJmYjAyYzUwZTU3NTVmZjllNTVi
MGI0LyAoRkxBVAo+ICBzZWxlY3RlZCBvbiBBQXJjaDY0KQo+IAo+ICBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy81ZTM0ZDExMzkzZTE0ZmMzNmZkNmU3MmI2OTY3OWJjNGZk
MWUzNzk4LyAoRkxBVAo+ICBzZWxlY3RlZCBvbiBBQXJjaDY0IGJpZy1lbmRpYW4pCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KPiAtLS0KPiAgYXJjaC9Db25maWcuaW4uYXJtIHwgNTkgKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4uYXJt
IGIvYXJjaC9Db25maWcuaW4uYXJtCj4gaW5kZXggODUwNDBhYzg5Zi4uZmEyZTg4MjU1MCAxMDA2
NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5hcm0KPiArKysgYi9hcmNoL0NvbmZpZy5pbi5hcm0K
PiBAQCAtNzMsMjEgKzczLDI2IEBAIGNvbmZpZyBCUjJfQVJNX0NQVV9IQVNfVEhVTUIyCj4gIAo+
ICBjb25maWcgQlIyX0FSTV9DUFVfQVJNVjQKPiAgCWJvb2wKPiArCXNlbGVjdCBCUjJfQVJDSF9I
QVNfTU1VX01BTkRBVE9SWQo+ICAKPiAgY29uZmlnIEJSMl9BUk1fQ1BVX0FSTVY1Cj4gIAlib29s
Cj4gKwlzZWxlY3QgQlIyX0FSQ0hfSEFTX01NVV9NQU5EQVRPUlkKPiAgCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
