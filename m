Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DABCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E2040101;
	Wed,  3 Apr 2024 20:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0sJcuPG_fWa; Wed,  3 Apr 2024 20:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035FE40295
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 035FE40295;
	Wed,  3 Apr 2024 20:39:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAAFB1BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D814B813B7
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr32-Lx48W4t for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2F8E813D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F8E813D7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2F8E813D7
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 20:39:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F01AA13F86E;
 Wed,  3 Apr 2024 22:39:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 22:39:22 +0200
Date: Wed, 3 Apr 2024 22:39:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <Zg2-ekmD8L4Uzm4K@landeda>
References: <20231115133821.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231115133821.7-1-francois.dugast@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712176767;
 bh=sgIg6+1OuGkYX4iU4tDA4PUnnzgE8C2zBcLS1fXvW0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VzXaDeO+Olj7FfuT1A+VVXrDzyfBv0qv9BF/zoJOrbroatp6OaKTQ0NoNxZQzrrkm
 qEnVdbINqMK6klf2SqGpbjUlSxGKKssp4HiSpzkdZXByaZjlVW846zRt9Rl29Y0TyJ
 4tsLv3x/QK1s7PtPwipK5Smlu/Cahr+iadDrPX8JxPkD+30C/JdRjGTN2mnRyWVJ9M
 RJebHT86hKt/eu/FZamMN6I/TFqFobdAzPMQloVMr0e3MYWC9C2ZQLY1KlDaKs9of0
 u4QzsY6l30GU7AlRrr/cxJeRxCp1e7O4WteiuNq5/wUlimN+BxZY8V8GpBlAmgx6G8
 omeOZgnbEschg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VzXaDeO+
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm/intel: Remove dependency
 to x86
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTExLTE1IDEzOjM4ICswMDAwLCBGcmFuY29pcyBEdWdh
c3Qgc3Bha2UgdGh1c2x5Ogo+IEJSMl9QQUNLQUdFX0xJQkRSTV9JTlRFTCB3YXMgZGVwZW5kZW50
IG9uIEJSMl9pMzg2Cj4gb3IgQlIyX3g4Nl82NCwgd2hpY2ggbWFkZSBzZW5zZSBmb3IgaW50ZWdy
YXRlZCBHUFVzLgo+IFRoaXMgaXMgbm8gbG9uZ2VyIHZhbGlkIHdpdGggZGlzY3JldGUgR1BVcyBz
byByZW1vdmUKPiB0aGlzIGRlcGVuZGVuY3kgdG8gYWxsb3cgYnVpbGRpbmcgb24gb3RoZXIgQ1BV
Cj4gYXJjaGl0ZWN0dXJlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZy
YW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvbGliZHJtL0NvbmZpZy5pbiB8
IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmRybS9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmRybS9Db25maWcuaW4KPiBpbmRl
eCAzY2IwZTAyYTQxLi5mYWI4Mjg5YmU2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZHJtL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGliZHJtL0NvbmZpZy5pbgo+IEBAIC0yMCw3ICsyMCw2
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJEUk1fRU5BQkxFX0FUT01JQwo+ICAKPiAgY29uZmln
IEJSMl9QQUNLQUdFX0xJQkRSTV9JTlRFTAo+ICAJYm9vbCAiaW50ZWwiCj4gLQlkZXBlbmRzIG9u
IEJSMl9pMzg2IHx8IEJSMl94ODZfNjQKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCRFJN
X0hBU19BVE9NSUMKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEUk1fRU5BQkxFX0FUT01JQwo+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlBDSUFDQ0VTUwo+IC0tIAo+IDIuNDIuMQo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
