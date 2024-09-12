Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC7EE6451
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 06:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C7394028C;
	Thu, 12 Sep 2024 06:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsriQbmNrOM8; Thu, 12 Sep 2024 06:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC87C4052A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC87C4052A;
	Thu, 12 Sep 2024 06:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57B721BF2CF
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 06:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B874052A
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 06:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIFBk42-QnKL for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 06:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.12;
 helo=sender4-op-o12.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7DFF4024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7DFF4024F
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7DFF4024F
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 06:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726123793; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P9A621ocuE5sj7rvFzK/MCOjYe/7WdHzob7jqFF5fi6ekyagp9Ch8G3WLT27VgtBXoMeJiYpIwyAXgsmL5ySmeYjhNxMrFiuD8PH4cqJysTKxxrGYuYMl3IZfZ2+0wGxoGS2/ra7uCV8gOfcfdndrHli8qLo3rZieoUt+hPgmr0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726123793;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0rcO0jIvJfanznYBZK6O61nxcNckmBiwXOp9fySteMw=; 
 b=lzjY6DGj9uJtS8RqLnth5negysGXDkv2ZbyejT2k7I4+j5ZKNIMesTnU53IZBCHBqkCoyNjOJWXPu3+OsxHk71Uu0GyPO9g8wGDGqVUHOxnuyG6uwZ5BKCRIgWDUU61qd+q1EyBF3D0t+ux0osKFPMnIuyJ+2BNKBKoFEZevWJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1726123792573455.1073282797905;
 Wed, 11 Sep 2024 23:49:52 -0700 (PDT)
Date: Thu, 12 Sep 2024 09:49:52 +0300
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: "Arnout Vandecappelle" <arnout@mind.be>
Message-ID: <191e4fed89f.b77315421793100.2904219522635557454@collabora.com>
In-Reply-To: <3ce45583-973c-4504-bbaa-01953daf27a0@mind.be>
References: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
 <3ce45583-973c-4504-bbaa-01953daf27a0@mind.be>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1726123793; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0rcO0jIvJfanznYBZK6O61nxcNckmBiwXOp9fySteMw=;
 b=D790n+/KIpTnxvMkHGGmBED+qKqBq/g4I1ZDll8i+Q1A1fG+Q/a1uPuyY4SKW/Pl
 VIcaPUK+8Cpwo5Jo/07y+Ql/dEQK92PVwtIrqqJw9GYJ0n5dwWfoN2n9WQeKSRqPVl9
 zCh4uTKyicJ4ifgzUUKDoHgH07kbdYpAMrxe09jo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=collabora.com header.i=george.kiagiadakis@collabora.com
 header.a=rsa-sha256 header.s=zohomail header.b=D790n+/K
Subject: Re: [Buildroot] [PATCH v2 1/4] package/pipewire: bump version to
 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKIC0tLS0gT24gV2VkLCAxMSBTZXAgMjAyNCAyMjoyODozMCArMDMwMCAgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCAgd3JvdGUgLS0tIAogPiAgIEhpIEdlb3Jn
ZSwKID4gCiA+IE9uIDE2LzA4LzIwMjQgMTE6MDYsIEdlb3JnZSBLaWFnaWFkYWtpcyB3cm90ZToK
ID4gPiBEaXNhYmxlZCByb2MgJiBzbmFwIGRlcGVuZGVuY2llcywgd2hpY2ggZG9uJ3QgZXhpc3Qg
aW4gYnVpbGRyb290LgogPiA+IEFkZGVkIGxpYnNlbGludXggZGVwZW5kZW5jeSBvcHRpb24uCiA+
ID4gQWRkZWQgbWlzc2luZyBsaWJnbGliMiBkZXBlbmRlbmN5IHB1bGxlZCBieSB0aGUgYmx1ZXog
cGx1Z2luLgogPiA+IAogPiA+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBLaWFnaWFkYWtpcyBnZW9y
Z2Uua2lhZ2lhZGFraXNAY29sbGFib3JhLmNvbT4KID4gPiAtLS0KID4gPiBDaGFuZ2VzIHNpbmNl
IHYxOgogPiA+ICAgIC0gTm9uZQogPiA+IAogPiA+ICAgcGFja2FnZS9waXBld2lyZS9waXBld2ly
ZS5oYXNoIHwgIDIgKy0KID4gPiAgIHBhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsgICB8IDE3
ICsrKysrKysrKysrKystLS0tCiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCiA+ID4gCiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGlwZXdp
cmUvcGlwZXdpcmUuaGFzaCBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaAogPiA+IGlu
ZGV4IDMzNzBkODY2NDEuLjhlYTM4OTA2NzUgMTAwNjQ0CiA+ID4gLS0tIGEvcGFja2FnZS9waXBl
d2lyZS9waXBld2lyZS5oYXNoCiA+ID4gKysrIGIvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5o
YXNoCiA+ID4gQEAgLTEsNCArMSw0IEBACiA+ID4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAogPiA+
IC1zaGEyNTYgIDJiNmUwYzRkMmU1NDRmNTAzMGZhN2Y0ZWNmMWVkZDllNWVlZDE1ZGRhMWM5NzEz
NWU4YTFmZGVkOWYzNDI1ZmUgIHBpcGV3aXJlLTAuMy44MS50YXIuYnoyCiA+ID4gK3NoYTI1NiAg
YjM4MTdmN2I5YWJmMTRhNmRiY2I2ZWExOGIxODZiYTg3NzFmNzAzY2IzOTVlNGEzODM2NmI0ZTA1
MWM0MDA1NCAgcGlwZXdpcmUtMS4yLjIudGFyLmJ6MgogPiA+ICAgc2hhMjU2ICA4OTA5YzMxOWE3
ZTI3ZGJiMzNhMTViOTAzNWY4OWFiM2I3YjJmNmExMmY4YmNkZGM3NTUyMDZhOGRiMWFkYTQ0ICBD
T1BZSU5HCiA+ID4gICBzaGEyNTYgIGJlNGJlNWQ3NzQyNDgzM2VkZjMxZjUzZmMxZjFjZWNiNjk5
NmI5ZTJkNzQ3ZDllNmZiOGY4NzgzNjJlYmM5MmIgIExJQ0VOU0UKID4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9waXBld2lyZS9waXBld2lyZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUu
bWsKID4gPiBpbmRleCBmMGYzY2Q4NDdjLi44ZGYyZDAzNzU4IDEwMDY0NAogPiA+IC0tLSBhL3Bh
Y2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsKID4gPiArKysgYi9wYWNrYWdlL3BpcGV3aXJlL3Bp
cGV3aXJlLm1rCiA+ID4gQEAgLTQsNyArNCw3IEBACiA+ID4gICAjCiA+ID4gICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogPiA+ICAgCiA+ID4gLVBJUEVXSVJFX1ZFUlNJT04gPSAwLjMuODEKID4g
PiArUElQRVdJUkVfVkVSU0lPTiA9IDEuMi4yCiA+ID4gICBQSVBFV0lSRV9TT1VSQ0UgPSBwaXBl
d2lyZS0kKFBJUEVXSVJFX1ZFUlNJT04pLnRhci5iejIKID4gPiAgIFBJUEVXSVJFX1NJVEUgPSBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUvcGlwZXdpcmUvLS9hcmNoaXZl
LyQoUElQRVdJUkVfVkVSU0lPTikKID4gPiAgIFBJUEVXSVJFX0xJQ0VOU0UgPSBNSVQsIExHUEwt
Mi4xKyAobGlic3BhLWFsc2EpLCBHUEwtMi4wIChsaWJqYWNrc2VydmVyKQogPiA+IEBAIC0zNCwx
MCArMzQsMTIgQEAgUElQRVdJUkVfQ09ORl9PUFRTICs9IFwKID4gPiAgIMKgwqDCoMKgLURzZXNz
aW9uLW1hbmFnZXJzPVtdIFwKID4gPiAgIMKgwqDCoMKgLURsZWdhY3ktcnRraXQ9ZmFsc2UgXAog
PiA+ICAgwqDCoMKgwqAtRGF2Yj1kaXNhYmxlZCBcCiA+ID4gK8KgwqDCoMKgLURyb2M9ZGlzYWJs
ZWQgXAogPiA+ICAgwqDCoMKgwqAtRGxpYmNhbmJlcnJhPWRpc2FibGVkIFwKID4gPiAgIMKgwqDC
oMKgLURsaWJteXNvZmE9ZGlzYWJsZWQgXAogPiA+ICAgwqDCoMKgwqAtRGxpYmZmYWRvPWRpc2Fi
bGVkIFwKID4gPiAtwqDCoMKgwqAtRGZsYXRwYWs9ZGlzYWJsZWQKID4gPiArwqDCoMKgwqAtRGZs
YXRwYWs9ZGlzYWJsZWQgXAogPiA+ICvCoMKgwqDCoC1Ec25hcD1kaXNhYmxlZAogPiA+ICAgCiA+
ID4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0RCVVMpLHkpCiA+ID4gICBQSVBFV0lSRV9DT05GX09Q
VFMgKz0gLURkYnVzPWVuYWJsZWQKID4gPiBAQCAtMTA1LDkgKzEwNyw5IEBAIGVsc2UKID4gPiAg
IFBJUEVXSVJFX0NPTkZfT1BUUyArPSAtRHBpcGV3aXJlLWphY2s9ZGlzYWJsZWQgLURqYWNrPWRp
c2FibGVkCiA+ID4gICBlbmRpZgogPiA+ICAgCiA+ID4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfQkxV
RVo1X1VUSUxTKSQoQlIyX1BBQ0tBR0VfU0JDKSx5eSkKID4gPiAraWZlcSAoJChCUjJfUEFDS0FH
RV9CTFVFWjVfVVRJTFMpJChCUjJfUEFDS0FHRV9TQkMpJChCUjJfUEFDS0FHRV9MSUJHTElCMiks
eXl5KQogPiA+ICAgUElQRVdJUkVfQ09ORl9PUFRTICs9IC1EYmx1ZXo1PWVuYWJsZWQKID4gPiAt
UElQRVdJUkVfREVQRU5ERU5DSUVTICs9IGJsdWV6NV91dGlscyBzYmMKID4gPiArUElQRVdJUkVf
REVQRU5ERU5DSUVTICs9IGJsdWV6NV91dGlscyBzYmMgbGliZ2xpYjIKID4gCiA+ICAgSSBkb24n
dCB1bmRlcnN0YW5kIHRoaXMgYml0LiBsaWJnbGliMiBpcyBhbHJlYWR5IGEgZGVwZW5kZW5jeSBv
ZiBibHVlejVfdXRpbHMsIAogPiBzbyBpdCB3aWxsIGFsd2F5cyBiZSBzZWxlY3RlZCB3aGVuIGJs
dWV6NV91dGlscyBpcyBzZWxlY3RlZCwgYW5kIGl0IHdpbGwgYWx3YXlzIAogPiBiZSBidWlsdCBi
ZWZvcmUgYXMgd2VsbC4gU28gd2h5IGlzIHRoaXMgZGVwZW5kZW5jeSBzdWRkZW5seSBuZWVkZWQ/
CiA+IAoKQWgsIEkgc2VlLiBJIHdhcyBub3QgYXdhcmUgdGhhdCBibHVlejVfdXRpbHMgYWxyZWFk
eSBkZXBlbmRzIG9uIGxpYmdsaWIyLiBUaGUgcmVhc29uIEkgYWRkZWQgdGhpcyBoZXJlIGlzIGJl
Y2F1c2UgdGhlIGJ1aWxkLXRpbWUgZ2xpYjIgZGVwZW5kZW5jeSBpbiB0aGUgYmx1ZXo1IHBsdWdp
biBpcyBuZXcsIHNvIGl0IHNlZW1lZCBhcHByb3ByaWF0ZSB0byBleHByZXNzIGl0LiBJIGNhbiBy
ZW1vdmUgaXQuCgpSZWdhcmRzLApHZW9yZ2UKCiA+IAogPiA+ICAgaWZlcSAoJChCUjJfUEFDS0FH
RV9NT0RFTV9NQU5BR0VSKSx5KQogPiA+ICAgUElQRVdJUkVfQ09ORl9PUFRTICs9IC1EYmx1ZXo1
LWJhY2tlbmQtbmF0aXZlLW1tPWVuYWJsZWQKID4gPiAgIFBJUEVXSVJFX0RFUEVOREVOQ0lFUyAr
PSBtb2RlbS1tYW5hZ2VyCiA+ID4gQEAgLTIzOSw2ICsyNDEsMTMgQEAgZWxzZQogPiA+ICAgUElQ
RVdJUkVfQ09ORl9PUFRTICs9IC1EcmFvcD1kaXNhYmxlZAogPiA+ICAgZW5kaWYKID4gPiAgIAog
PiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlNFTElOVVgpLHkpCiA+ID4gK1BJUEVXSVJFX0NP
TkZfT1BUUyArPSAtRHNlbGludXg9ZW5hYmxlZAogPiA+ICtQSVBFV0lSRV9ERVBFTkRFTkNJRVMg
Kz0gbGlic2VsaW51eAogPiA+ICtlbHNlCiA+ID4gK1BJUEVXSVJFX0NPTkZfT1BUUyArPSAtRHNl
bGludXg9ZGlzYWJsZWQKID4gPiArZW5kaWYKID4gPiArCiA+ID4gICBkZWZpbmUgUElQRVdJUkVf
VVNFUlMKID4gPiAgIMKgwqDCoMKgcGlwZXdpcmUgLTEgcGlwZXdpcmUgLTEgKiAtIC0gYXVkaW8s
dmlkZW8gUGlwZVdpcmUgU3lzdGVtIERhZW1vbgogPiA+ICAgZW5kZWYKID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KID4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAogPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwogPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKID4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
