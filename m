Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7948AC282CD
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 14:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E905608D2;
	Mon,  3 Mar 2025 14:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iP5aY_Q8PccZ; Mon,  3 Mar 2025 14:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 148D9608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 148D9608D9;
	Mon,  3 Mar 2025 14:42:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40CEAB89
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218FC410DE
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNVjea_bEnUY for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 14:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B37E14110F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37E14110F
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B37E14110F
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:42:14 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30613802a6bso49086601fa.1
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 06:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741012931; x=1741617731;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GICGLmcCK2Rp0ZpsI4gcZlM2LlMkHnUuOzLeojF+rAQ=;
 b=ktgu3kpvzpbTAcQ1Z18BX+vAoo34/zbpF0PupO4eTreBJty7D9wCfwCuSYc5riUcTR
 tuL3ng+I1Cq1WMG0OB1maS1GGfrcBlAhyFQ5Y7iSb8c3Iks8YrwSnzfdHdQYFOZaNivx
 AqSUZSGUwFRSBd97XLAN7a1IG2oarFxtFYbPrm2OuWHD9hjVHo2D1H+8dDSIzfT/0B4S
 1UPapvB+cUw2ZA3H8vnIPcR+t0cToJnUeWKjRL2FeRn0YGq+NM8ZZYzQSbS3iK4dV/j1
 eIXdz9IwbO30jUdXw5255XLVrml8q7i0MQkV1WYYVR7X8DF3F2kAChxBq2Z+FB7WO2FI
 w4cQ==
X-Gm-Message-State: AOJu0YyvmU/C9JzQInLb2fUkEGzvPqmMAqi8xmyHGMYxUs4kdmzFBDqT
 6GqCMw/L6LecP9+QUmMpdloRpfnrrHaYZ5GJ3oXWuwe/yNnI8a41CDx1O0CGRyp/LFEthjvHmIg
 jLZ9ExHgQgELobTvJaqA3NLIyCV6LcIex
X-Gm-Gg: ASbGncvwQ3pmjhn1alVz22QWPXCaA2k2x/12IQ0lpzxC7iPgXbgR+agUzRWi/2w9h4g
 ALAvqjLvOb2kRsY9WtjGMVWt5fTax+pOF2c9Urs21ngfQ7gIWARODmxIrh/AlUpFKsm3UbN9dVz
 Dlsr5NOoV87dR0JXl8nCW8DgW2HDY=
X-Google-Smtp-Source: AGHT+IHnXIJFmHaLmAwFpvJkdOedgwKYQcdTxJPKSm6cvQXxtLcSIgn0NZjRBDn8FoBf9/fNAy2EQ92MNMbCyrA6sfU=
X-Received: by 2002:a2e:bc14:0:b0:30b:8e06:86a1 with SMTP id
 38308e7fff4ca-30b932140dbmr42454811fa.7.1741012931345; Mon, 03 Mar 2025
 06:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20250303144047.268530-1-yegorslists@googlemail.com>
In-Reply-To: <20250303144047.268530-1-yegorslists@googlemail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 3 Mar 2025 15:43:31 +0100
X-Gm-Features: AQ5f1JriqLW1cpLhQLoAHONJmtkHrA1u8DNWR0hFLa6FveovfxBGbF2IcgaGNwo
Message-ID: <CAGm1_kt1Gp8ii0HeVo+AA96E3ayYu2USvi=h4ADLgN_-ehcezg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1741012931; x=1741617731; darn=buildroot.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GICGLmcCK2Rp0ZpsI4gcZlM2LlMkHnUuOzLeojF+rAQ=;
 b=R/BjMZfAOMN5dGy0JmeK9hq3ZcknIM9CQq/oQq7WB/yK7rIvgp1cndK8LPg1TNyfvA
 NbmwTmtWn7dIseV1xZnWtDBqz89qiaxPPABNSJnDSQhnKgA0ALq50Ci8kHT5IioOAQ+i
 kX2ki6ROfsPOR2KE4KvnyHan6kAzH0q849f03tdxcdLIKINzaeSnSJKPP8+mqdJc/wZh
 JiTvQ4yw+bReWzgPgwfktYPj2lBmn460nOu1eMTdddkVxWAqFwN2mWsPDPB/wvU/Nmod
 o58tBkb60HGlbn9aKMCwWeNWZyXFcYmz9AuhYXTessTmFGW6TDe2ReL5+9zuoPj5YLIx
 vQUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R/BjMZfA
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix
 incompatible-pointer-types error
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

T24gTW9uLCBNYXIgMywgMjAyNSBhdCAzOjQw4oCvUE0gPHllZ29yc2xpc3RzQGdvb2dsZW1haWwu
Y29tPiB3cm90ZToKPgo+IEZyb206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4KPgo+IFVzZSBvbmx5IHN0YXQsIGZzdGF0LCBhbmQgbHN0YXQgc3RydWN0dXJlcyBm
b3IgdGhlIGNvcnJlc3BvbmRlbnQgY2FsbHMKPiBhbmQgbGV0IHRoZSBDIGxpYnJhcnkgbWFjcm9z
IHRvIHBpY2sgdGhlIHJpZ2h0IHN0cnVjdHVyZSBhbmQgY2FsbAo+IGRlcGVuZGluZyBvbiB0aGUg
c3VwcG9ydGVkIGZpbGUgc2l6ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5
ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9uY2Z0cC8wMDAzLWZp
eC1zdGF0LnBhdGNoIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25j
ZnRwLzAwMDMtZml4LXN0YXQucGF0Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25jZnRwLzAw
MDMtZml4LXN0YXQucGF0Y2ggYi9wYWNrYWdlL25jZnRwLzAwMDMtZml4LXN0YXQucGF0Y2gKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjg1ODFjZjU0NmIKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9uY2Z0cC8wMDAzLWZpeC1zdGF0LnBhdGNoCj4gQEAg
LTAsMCArMSwyNyBAQAo+ICtVc2Ugc3RhdCwgZnN0YXQsIGFuZCBsc3RhdCBzdHJ1Y3R1cmVzIGFu
ZCBsZXQgdGhlIEMgbGlicmFyeSBoYW5kbGUgdGhlCj4gK3JlbGF0ZWQgc3RydWN0dXJlcyBhbmQg
c3lzdGVtIGNhbGxzLgo+ICsKPiArVXBzdHJlYW06IE4vQSwgdW5yZXNwb25zaXZlIGNvbnRhY3Qg
ZW1haWwgYWRkcmVzcy4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdv
cnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiArLS0tIGEvbmNmdHAvc3lzaGRycy5oCj4gKysrKyBi
L25jZnRwL3N5c2hkcnMuaAo+ICtAQCAtMjYwLDE4ICsyNjAsNiBAQAo+ICsgIyAgICAgZGVmaW5l
IFN0YXQgV2luU3RhdDY0Cj4gKyAjICAgICBkZWZpbmUgTHN0YXQgV2luU3RhdDY0Cj4gKyAjICAg
ICBkZWZpbmUgRnN0YXQgV2luRlN0YXQ2NAo+ICstI2VsaWYgKChkZWZpbmVkKEhBVkVfTE9OR19M
T05HKSkgJiYgKGRlZmluZWQoX0xBUkdFRklMRTY0X1NPVVJDRSkpICYmIChkZWZpbmVkKEhBVkVf
U1RBVDY0KSkgJiYgKGRlZmluZWQoSEFWRV9TVFJVQ1RfU1RBVDY0KSkpCj4gKy0jICAgICBkZWZp
bmUgU3RhdCBzdGF0NjQKPiArLSMgICAgIGlmZGVmIEhBVkVfRlNUQVQ2NAo+ICstIyAgICAgICAg
ICAgICBkZWZpbmUgRnN0YXQgZnN0YXQ2NAo+ICstIyAgICAgZWxzZQo+ICstIyAgICAgICAgICAg
ICBkZWZpbmUgRnN0YXQgZnN0YXQKPiArLSMgICAgIGVuZGlmCj4gKy0jICAgICBpZmRlZiBIQVZF
X0xTVEFUNjQKPiArLSMgICAgICAgICAgICAgZGVmaW5lIExzdGF0IGxzdGF0NjQKPiArLSMgICAg
IGVsc2UKPiArLSMgICAgICAgICAgICAgZGVmaW5lIExzdGF0IGxzdGF0Cj4gKy0jICAgICBlbmRp
Zgo+ICsgI2Vsc2UKPiArICMgICAgIGRlZmluZSBTdGF0IHN0YXQKPiArICMgICAgIGRlZmluZSBG
c3RhdCBmc3RhdAo+IC0tCj4gMi4zNC4xCgpGb3Jnb3QgdG8gYWRkIHRoZSBmb2xsb3dpbmcgbGlu
ZToKCkZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTFlMDA4
OWVjOGM2ZDU4ZjhlOTkxNDcxZjYwMWJjMzA0ZDYwZGU2OS8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
