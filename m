Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF36CA1002
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 17:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 584514152D;
	Sat,  6 Sep 2025 17:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7VNtLtvNnv8; Sat,  6 Sep 2025 17:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737D441515
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737D441515;
	Sat,  6 Sep 2025 17:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65B0CE0E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43FF361100
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmlLAPhmyoe2 for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 17:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A61B61128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A61B61128
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A61B61128
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:24:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso2053124f8f.0
 for <buildroot@buildroot.org>; Sat, 06 Sep 2025 10:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757179465; x=1757784265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cvu7WHDLcI+nZfvHyhwMA8nC3BTP1wEtg2JIVt68mNc=;
 b=kknDilZgQFAeeCpmrv/tvec9XSI0AISwUICG0tQ3pvDdJa77BVX0aViY7kIBLav/Eq
 mv9s0gM5NSBIw5MCOgbLgBudhVD2GZ8BjEXeTcfRT5romjoHPxu7i2Voa/t6jToteY4r
 bKL8Lf5hHx+qv4E28SGysDKjlE7b370BlFAsmQVg4BwSNs4ha46ViDjohPcKEp7MLLm5
 jNk59oRP17RvNNxFKz2rG3+Jshzjz8V47sFEfzWIlSIcwQlUSuolQmREjOdn9T44MdMp
 ynTVOu0PAI9z6/ldu6TXADgeML1cu5jIneb+dEfm952sbCd5zC9u7ry2l+lcoZ+sBE8y
 x5kw==
X-Gm-Message-State: AOJu0YzWKxUofq9CFMgzUQXWYx61QfC8rH6kuLEjh+6VsBWLEQzaHJc/
 ecZEts9F8RLaHSVfsCcbYEXj9+cB9cTjH8j1lxEclUK6vU0uDEWqDEXFRko1A3N5kitJTXWyTm6
 6bQ/uppl4Dw==
X-Gm-Gg: ASbGnct8b4VugdTZRG0R1oXYzTnn9DroAM3qn/3Gyc6Ij1Ccu74WaNVep0TEv/Ts2yP
 uk7zeMphHGgBrmLLP9x6rrftlvwjHiOKMUwOfAFEW9B5Tbns9uU01NlKgt6OITwJwAQYfO+tGfe
 SofSK/MSWQONJqcg6qzeZo5SH5yfXPJ/SInMbd73sWZOcZtelXKHEgB+vvzjCa4vg6URdcskNkK
 YF1oqD0L4dwUhQ2cmINFlj69XM1iVABXRsFNBlzZbudk5bUl1Uu73WdtthwmTzkphREuz9ghxUy
 R6mpAj3g9X+Ex79Y/xcfc0mq5KOQCArpYmYbP4wshfyU6VUWiLXWg4/dHZLYuC8qW5SOjrFAkZw
 Nmom3A24VbYjUYeaXy7mY7yotsd3MArK+3DciJ0elf3X7Hk/TZ7W6yoqDHjzV4Kii750IJfYy/c
 ZIC9Uv9wM/M+6OKwg8o+jj8AXSUpUCMrI=
X-Google-Smtp-Source: AGHT+IE+0MB5PNxRqZpzHvLAtPGuSbRKjudMt5YYHRlI4OyQCPONXH5MGofClSNN2ylCai6ZA63eCw==
X-Received: by 2002:a05:6000:22c7:b0:3ce:9872:fd3 with SMTP id
 ffacd0b85a97d-3e642f90dfdmr1866684f8f.34.1757179465023; 
 Sat, 06 Sep 2025 10:24:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dcfa3ec60sm125765185e9.15.2025.09.06.10.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 10:24:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  6 Sep 2025 19:24:08 +0200
Message-ID: <20250906172419.3848350-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757179465; x=1757784265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cvu7WHDLcI+nZfvHyhwMA8nC3BTP1wEtg2JIVt68mNc=;
 b=SXfKTtsbD4PL5P3YUV7ydMkdEleA+S6/9vbHwKFJB3QFTHRRNwHCBmJZUziSltqwXF
 28xQBU/5TNbPYr+sw492KeC2YcCN62OkxmIV4QQKlWD9OPLlqlGb3jIB4ceX0tUKafjj
 vUiuu6b5+hccoZQSTOWm8KhPj7Kko3TC2Kzpk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=SXfKTtsb
Subject: [Buildroot] [PATCH] package/lua-utf8: fix missing header
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

QmFja3BvcnQgYW4gdXBzdHJlYW0gcGF0Y2ggYWRkaW5nIG1pc3NpbmcgbGltaXRzLmguCgpodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExMTc2Nzc0NjMw
IChUZXN0THVhaml0VXRmOCkKClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPgotLS0KIC4uLmRlLWxpbWl0cy5oLWluc3RlYWQtb2YtdHJhbnNpdGl2ZWx5
LS5wYXRjaCB8IDU4ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sdWEtdXRmOC8wMDAxLUV4cGxp
Y2l0bHktaW5jbHVkZS1saW1pdHMuaC1pbnN0ZWFkLW9mLXRyYW5zaXRpdmVseS0ucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2x1YS11dGY4LzAwMDEtRXhwbGljaXRseS1pbmNsdWRlLWxpbWl0
cy5oLWluc3RlYWQtb2YtdHJhbnNpdGl2ZWx5LS5wYXRjaCBiL3BhY2thZ2UvbHVhLXV0ZjgvMDAw
MS1FeHBsaWNpdGx5LWluY2x1ZGUtbGltaXRzLmgtaW5zdGVhZC1vZi10cmFuc2l0aXZlbHktLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmY4NzkzMGU2YTkKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2x1YS11dGY4LzAwMDEtRXhwbGljaXRseS1pbmNsdWRl
LWxpbWl0cy5oLWluc3RlYWQtb2YtdHJhbnNpdGl2ZWx5LS5wYXRjaApAQCAtMCwwICsxLDU4IEBA
CitGcm9tIGZlZGEzOGM2YjdlZjRjNTY0Zjc3MjEzMDM3ZGMyMDc2OGM2MzhkOWMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tOiBDYWxlYiBNYWNsZW5uYW4gPGNhbGViQGFsZXJxdWUuY29t
PgorRGF0ZTogVGh1LCAyIEphbiAyMDI1IDE1OjQyOjA1ICswMzAwCitTdWJqZWN0OiBbUEFUQ0hd
IEV4cGxpY2l0bHkgaW5jbHVkZSBsaW1pdHMuaCBpbnN0ZWFkIG9mIHRyYW5zaXRpdmVseSBhc3N1
bWluZworIGl0CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1JlY2VudCB1
cHN0cmVhbSByZWxlYXNlcyBvZiBMdWFKSVQgaGF2ZSBicm9rZW4gYnVpbGRpbmcgdGhpcyBMdWEg
Um9jaworZW50aXJlbHkuIFBVQyBMdWEgYW5kIEx1YUpJVCBidWlsZHMgdXAgdG8gYSBjZXJ0YWlu
IHBvaW50IGluY2x1ZGVkIHRoaXMKK2hlYWRlciBpbiBsdWEuaCwgd2hpY2ggbWVhbnQgdGhhdCBp
dCB3YXMgYWx3YXlzIGFyb3VuZCBhcyBhIHRyYW5zaXRpdmUKK2RlcGVuZGVuY3kuIFJlY2VudCB1
cHN0cmVhbSBMdWFKSVQgYnVpbGRzIG5vIGxvbmdlciBpbmNsdWRlIHRoZSBoZWFkZXIKK3NpbmNl
IHRoZXkgYXJlbid0IHVzaW5nIGl0IGRpcmVjdGx5IGFueSBtb3JlLCBidXQgdGhhdCBtZWFucyB0
aGluZ3MgdGhhdAoraW5jbHVkZSBsdWEuaCBkb24ndCBnZXQgaXQgZm9yIGZyZWUgYW55IG1vcmUu
IEl0IHNob3VsZCBuZXZlciBoYXZlIGJlZW4KK2Fzc3VtZWQgYW55d2F5LCBidXQgdGhhdCdzIGJl
ZW4gdGhlIHN0YXR1cyBxdW8gZm9yIGEgd2hpbGUuCisKK1RoaXMgZml4ZXMgYnVpbGQgZXJyb3Jz
IHdoZW4gdXNpbmcgTHVhSklUIGhlYWRlcnMgaW5zdGVhZCBvZiBQVUMgTHVhOgorCitgYGAKK2x1
dGY4bGliLmM6IEluIGZ1bmN0aW9uIOKAmEx1dGY4X2NvZGVwb2ludOKAmToKK2x1dGY4bGliLmM6
Mzk4OjIyOiBlcnJvcjog4oCYSU5UX01BWOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKKyAgMzk4IHwgICBpZiAocG9zZSAtIHBvc2kgPj0gSU5UX01BWCkgIC8qIChs
dWFfSW50ZWdlciAtPiBpbnQpIG92ZXJmbG93PyAqLworICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+CitsdXRmOGxpYi5jOjEyOjE6IG5vdGU6IOKAmElOVF9NQVjigJkgaXMgZGVm
aW5lZCBpbiBoZWFkZXIg4oCYPGxpbWl0cy5oPuKAmTsgZGlkIHlvdSBmb3JnZXQgdG8g4oCYI2lu
Y2x1ZGUgPGxpbWl0cy5oPuKAmT8KKyAgIDExIHwgI2luY2x1ZGUgInVuaWRhdGEuaCIKKyAgKysr
IHwrI2luY2x1ZGUgPGxpbWl0cy5oPgorICAgMTIgfAorbHV0ZjhsaWIuYzozOTg6MjI6IG5vdGU6
IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFj
aCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCisgIDM5OCB8ICAgaWYgKHBvc2UgLSBwb3NpID49IElO
VF9NQVgpICAvKiAobHVhX0ludGVnZXIgLT4gaW50KSBvdmVyZmxvdz8gKi8KKyAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fgorYGBgCisKK1RoaXMgaXMgYmVjYXVzZSBgSU5UX01B
WGAgaXMgZGVmaW5lZCBhcHByb3ByaWF0ZWx5IGZvciBhIGdpdmVuIHBsYXRmcm9tCitpbiBpbiBs
aW1pdHMuaC4KKworVXBzdHJlYW06IDFiYjcwZDQ1MjA4ZDQwMzNkY2M3NWVmZWU5NjhiZTcwNTM0
ZGQzYWIKK1tSb21haW46IHJlYmFzZSBvbiAwLjEuNV0KK1NpZ25lZC1vZmYtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgorLS0tCisgbHVhdXRmOC0wLjEuNS9sdXRmOGxp
Yi5jIHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQg
YS9sdWF1dGY4LTAuMS41L2x1dGY4bGliLmMgYi9sdWF1dGY4LTAuMS41L2x1dGY4bGliLmMKK2lu
ZGV4IDUyMjU5OWUuLjcxZjJmNDIgMTAwNjQ0CistLS0gYS9sdWF1dGY4LTAuMS41L2x1dGY4bGli
LmMKKysrKyBiL2x1YXV0ZjgtMC4xLjUvbHV0ZjhsaWIuYworQEAgLTcsNiArNyw3IEBACisgI2lu
Y2x1ZGUgPGFzc2VydC5oPgorICNpbmNsdWRlIDxzdHJpbmcuaD4KKyAjaW5jbHVkZSA8c3RkaW50
Lmg+CisrI2luY2x1ZGUgPGxpbWl0cy5oPgorIAorICNpbmNsdWRlICJ1bmlkYXRhLmgiCisgCist
LSAKKzIuNTEuMAorCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
