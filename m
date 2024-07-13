Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A778C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1677B409AE;
	Sat, 13 Jul 2024 14:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6ilIMqdaJnt; Sat, 13 Jul 2024 14:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C505740C2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C505740C2B;
	Sat, 13 Jul 2024 14:20:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 810231BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ABDD400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDL6r3bUYFtA for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2534440096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2534440096
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2534440096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:20:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so22752095e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720880412; x=1721485212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m9AL23FshQznsjPFo+jEU8E4ch4kWJowW0tvqckenp4=;
 b=F8Uu+vCCw88TPnBlzKjXc3JgDeXwej5vEPHh0KaYZH84NrMzhyrdm4oybJWYjGz8cm
 XQQDGHUQmCHD9+GdeJJmsrAK/hbPVumPTZ36TIFcj2fJ/lzv3mN7nElC+R+t9BKocbtp
 rOGvp3KKRpxXbKX3Q/AtVzUkCI6D7iOSY65vLizwO2LxKrHUgaiPGv2jHUD6rxquKh5u
 72u9wY4aWde0zZlNtPLyXL3xRnLvUo0WsoCqIY4QYScch+jtqWFRzM1EGW875hef5hmt
 7Oz2OjWzLQibOLEpi0Gce7yrDQ3pnZznwrs/wyqhVz0/Ioxvm8xrnzmuwrbVqDvqUkUB
 6sBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0arx8w4Rk0jRpDxtV0lhUvn4/BrAEOAMoMupwHpgcAUrkKodWgCNZiWMBku6B0fbxx2BoVcv9B5DBzbB5CjGNCkD/W+xk7g==
X-Gm-Message-State: AOJu0YzJWdLfHobzhA+X1kzdt5q7Hcc9ej63cer6ZQ75fWye0+8YIO8U
 rP1F5Kq+crIWBn+TMpPbMiXaTrRNGZc7v6UDkvPUQk4IGQaSDlOq+O9iR1FGn3YOcwguRfXOVZ6
 +wHo=
X-Google-Smtp-Source: AGHT+IEI8y/zcEv4b0i102XecG8LwSJpUAaB/e1vPogwyu3NiI65cHtawssk82DTfciowxz6vmEC9g==
X-Received: by 2002:a05:600c:3013:b0:426:63f1:9a1b with SMTP id
 5b1f17b1804b1-426708f1c97mr110879245e9.33.1720880411934; 
 Sat, 13 Jul 2024 07:20:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7047sm57311195e9.41.2024.07.13.07.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 07:20:11 -0700 (PDT)
Message-ID: <cfe5521c-eb26-4f79-9192-cc06e1ca2f31@smile.fr>
Date: Sat, 13 Jul 2024 16:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZpJJRjTc24UClMCY@waldemar-brodkorb.de>
Content-Language: fr, en-US
In-Reply-To: <ZpJJRjTc24UClMCY@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720880412; x=1721485212; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m9AL23FshQznsjPFo+jEU8E4ch4kWJowW0tvqckenp4=;
 b=j1eI6TvLTGjy7BCALFVzunXLsU3bIS/g/wVO0kbr3boO510yF8HpKS4EGoGFRiSs1e
 1rzopVlgF6STgRBzVpqFBnv1J1eFDEmOoOskrJT4ZE5iAmtJE7DtutSi7aAce2G0r65V
 zHmKMvcrSNGJlOy6AxL+/IMGI3PyHTni/mXeI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=j1eI6TvL
Subject: Re: [Buildroot] [PATCH] configs/qemu_riscv32_nommu_virt: remove
 duplicate entry
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDEzLzA3LzIwMjQgw6AgMTE6MzAsIFdhbGRlbWFyIEJy
b2Rrb3JiIGEgw6ljcml0wqA6Cj4gQ29tbWl0IGQwMzdkOWMyZDYzZTljZDQ3YjM3MDFhYWVmOGUy
OGMzMmI4ZjViMzcgYWRkZWQgYWNjaWRlbnRhbGx5Cj4gYSBkdXBsaWNhdGUgb2YgQlIyX0RPV05M
T0FEX0ZPUkNFX0NIRUNLX0hBU0hFUy4gUmVtb3ZlIHRoYXQuCgpBY3R1YWxseSB0aGlzIGNvbW1p
dCBhbHNvIGZvcmdvdCB0byByZW1vdmUgdGhlIHFlbXUvcmlzY3YzMi12aXJ0IHNwZWNpZmljCnBh
dGNoZXMgZGlyZWN0b3J5LgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9w
ZW5hZGsub3JnPgo+IC0tLQo+ICAuLi4vcmlzY3YzMi12aXJ0L3BhdGNoZXMvbGludXgtaGVhZGVy
cy9saW51eC1oZWFkZXJzLmhhc2ggICAgIHwgMiAtLQo+ICBib2FyZC9xZW11L3Jpc2N2MzItdmly
dC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICAgICAgIHwgMiAtLQo+ICBjb25maWdz
L3FlbXVfcmlzY3YzMl9ub21tdV92aXJ0X2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwg
NCAtLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL3FlbXUvcmlzY3YzMi12aXJ0L3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51
eC1oZWFkZXJzLmhhc2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3FlbXUvcmlzY3YzMi12
aXJ0L3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11
L3Jpc2N2MzItdmlydC9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoIGIv
Ym9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRl
cnMuaGFzaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGE2Yzc3NzE5MmMuLjAw
MDAwMDAwMDAKPiAtLS0gYS9ib2FyZC9xZW11L3Jpc2N2MzItdmlydC9wYXRjaGVzL2xpbnV4LWhl
YWRlcnMvbGludXgtaGVhZGVycy5oYXNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDIgKzAsMCBA
QAo+IC0jIEZyb20gaHR0cHM6Ly9jZG4ua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y2Lngv
c2hhMjU2c3Vtcy5hc2MKPiAtc2hhMjU2ICA0ZTQzZDhjNWZiYTE0ZjdjODI1OTc4MzgwMTE2NDgw
NTY0ODdiNzU1MGZkODMyNzZhZDUzNDU1OWU4NDk5YjFkICBsaW51eC02LjYuMTgudGFyLnh6Cj4g
ZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvcmlzY3YzMi12aXJ0L3BhdGNoZXMvbGludXgvbGludXgu
aGFzaCBiL2JvYXJkL3FlbXUvcmlzY3YzMi12aXJ0L3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+
IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGE2Yzc3NzE5MmMuLjAwMDAwMDAwMDAK
PiAtLS0gYS9ib2FyZC9xZW11L3Jpc2N2MzItdmlydC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gK
PiArKysgL2Rldi9udWxsCj4gQEAgLTEsMiArMCwwIEBACj4gLSMgRnJvbSBodHRwczovL2Nkbi5r
ZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYwo+IC1zaGEyNTYg
IDRlNDNkOGM1ZmJhMTRmN2M4MjU5NzgzODAxMTY0ODA1NjQ4N2I3NTUwZmQ4MzI3NmFkNTM0NTU5
ZTg0OTliMWQgIGxpbnV4LTYuNi4xOC50YXIueHoKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11
X3Jpc2N2MzJfbm9tbXVfdmlydF9kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcmlzY3YzMl9ub21t
dV92aXJ0X2RlZmNvbmZpZwo+IGluZGV4IDM4YTFjZjc5MWYuLmI5NThkNDJkMDIgMTAwNjQ0Cj4g
LS0tIGEvY29uZmlncy9xZW11X3Jpc2N2MzJfbm9tbXVfdmlydF9kZWZjb25maWcKPiArKysgYi9j
b25maWdzL3FlbXVfcmlzY3YzMl9ub21tdV92aXJ0X2RlZmNvbmZpZwo+IEBAIC03LDEwICs3LDYg
QEAgQlIyX1JJU0NWXzMyPXkKPiAgQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJkL3FlbXUvcGF0
Y2hlcyIKPiAgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15Cj4gIAo+IC0jIEhhc2hl
cwo+IC1CUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcGF0Y2hl
cyIKPiAtQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15Cj4gLQo+ICAjIExpbnV4IGhl
YWRlcnMgc2FtZSBhcyBrZXJuZWwKPiAgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NV
U1RPTV82XzY9eQo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
