Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54FAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9854141753;
	Thu, 17 Feb 2022 15:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mj_DX-0sdgoK; Thu, 17 Feb 2022 15:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B924173B;
	Thu, 17 Feb 2022 15:32:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0E591BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88D2741E4A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id He7I7oSjPAyW for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:32:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id C66BE41E39
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:32:45 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Kilvnst6jvHpTKilvnzajH; Thu, 17 Feb 2022 16:32:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645111963; bh=ljdBYS73e30tI70aiyzUBfjCVAPyBc+2c+BpmxBxuOc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=O6GnkIspsQ54iyDyTXIV6FSgdlljXQP2xNZOwg/DPpx8+H2E4ZOeTi6KrkwHdQ208
 bUQoWFxwC11dVH6y7DhbgtDm1Y6JTOPscJqJhrTlj/zJwyqbo2oqJE90eF61s9Dsus
 HQ9mtYhdCGGKnxIqgxW+NpSBSSEdBi62/d9tw5wummk6OsoRjCUrlwv0//VIxj6uN1
 8xoBPBCwzbVrf5MIYCLEj5mZIola97awTGx6vdCB7G3XB8crE6LcD+9XKEfK4LWwuX
 +RNoyZJxD1lwcly5X7bfjcWtklDzwW3nvUR1Y53usnfL3fpwl5aRLo34x1MyMZkLbL
 wsCVaF75a7fEA==
Message-ID: <71ed8019-6b60-7365-6405-b65286a98ad0@benettiengineering.com>
Date: Thu, 17 Feb 2022 16:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20220217151054.865073-2-marcus.hoffmann@othermo.de>
 <2B25121E-F5E4-4E61-BEA4-627E5689E813@benettiengineering.com>
 <6a7a1291-9bdd-74f6-e836-ff2426965762@othermo.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <6a7a1291-9bdd-74f6-e836-ff2426965762@othermo.de>
X-CMAE-Envelope: MS4wfInZRtIFcGMVC0U6Jf3xrEI55b8gm+U630jjpxKfWKZsuAO7Ye95VBr90p5srQmW+hM2thoigRPMgd8mu4j0zeDSBxtPXHH1FY6ZVyjqPglYZtbCTzLY
 WDK+Gmf7KKOHfffQG2ZrcLw/KPhr1PlZtaswG7ETuj5GWyUe4KBPZLgtuIsVz6BPHDmQbuioV8Y3ztSGuxPquXQiqH75wzEr33vkD139TSeYJ7JVazbo4H0L
 xiC1ZRrKe35LtsN8g/MIYTmxp0aAC8X0puwfLZw9/mQ=
Subject: Re: [Buildroot] [PATCH 1/2]
 configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTcvMDIvMjIgMTY6MjIsIE1hcmN1cyBIb2ZmbWFubiB3cm90ZToKPiBIaSBHdWxpbywKPiAK
PiBPbiAxNy4wMi4yMiAxNjoyMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEhpIE1hcmN1cywK
Pj4KPj4+IElsIGdpb3JubyAxNyBmZWIgMjAyMiwgYWxsZSBvcmUgMTY6MTEsIE1hcmN1cyBIb2Zm
bWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVybW8uZGU+IGhhIHNjcml0dG86Cj4+Pgo+Pj4g77u/
Rml4ZXMgdGhlIGZvbGxvd2luZyBjb21waWxlIGVycm9yOgo+Pj4KPj4+IEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBpbmNsdWRlL2Jvb3RtLmg6MTAsCj4+PiAgICAgICAgICAgICAgICAgICBmcm9tIHRv
b2xzL2ltYWdlLWhvc3QuYzoxMjoKPj4+IGluY2x1ZGUvaW1hZ2UuaDoxMTc4OjEyOiBmYXRhbCBl
cnJvcjogb3BlbnNzbC9ldnAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pj4gMTE3OCB8
ICMgIGluY2x1ZGUgPG9wZW5zc2wvZXZwLmg+Cj4+PiAgICAgICAgfCAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fgo+Pj4gY29tcGlsYXRpb24gdGVybWluYXRlZC4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBNYXJjdXMgSG9mZm1hbm4gPG1hcmN1cy5ob2ZmbWFubkBvdGhlcm1vLmRlPgo+Pj4gLS0t
Cj4+PiBjb25maWdzL2ZyaWVuZGx5YXJtX25hbm9waV9yMnNfZGVmY29uZmlnIHwgMSArCj4+PiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9mcmllbmRseWFybV9uYW5vcGlfcjJzX2RlZmNvbmZpZyBiL2NvbmZpZ3MvZnJpZW5kbHlhcm1f
bmFub3BpX3Iyc19kZWZjb25maWcKPj4+IGluZGV4IDgxOGM4NDdmNGIuLmNlMjUyYTVkNzYgMTAw
NjQ0Cj4+PiAtLS0gYS9jb25maWdzL2ZyaWVuZGx5YXJtX25hbm9waV9yMnNfZGVmY29uZmlnCj4+
PiArKysgYi9jb25maWdzL2ZyaWVuZGx5YXJtX25hbm9waV9yMnNfZGVmY29uZmlnCj4+PiBAQCAt
MzAsNiArMzAsNyBAQCBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIx
LjEwIgo+Pj4gQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9Im5hbm9waS1yMnMtcmsz
MzI4Igo+Pj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+Pj4gQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19QWUxJQkZEVD15Cj4+PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkK
Pj4+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+Pj4gQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19BVEZfQkwzMV9FTEY9eQo+Pj4gQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9N
PXkKPj4KPj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsIGhhdmUgeW91IHZlcmlmaWVkIGl04oCZ
cyBlbm91Z2ggYnkgYnVpbGRpbmcgaXQgdXNpbmcgdXRpbHMvZG9ja2VyLXJ1bj8KPiAKPiBZZXMs
IHRoaXMgZml4ZXMgdGhlIGJ1aWxkIHdpdGggZG9ja2VyLXJ1bi4gKHNhbWUgZm9yIHRoZSBvdGhl
ciBkZWZjb25maWcpCgpQZXJmZWN0LCBjYW4geW91IHJlLXNlbmQgYm90aCBwYXRjaGVzIHdpdGg6
CiJGaXhlczoiIGluIGNvbW1pdCBsb2c/CnRhZz8KClRoYW5rIHlvdSEKCkJlc3QgcmVnYXJkcwot
LSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gTWFyY3VzCj4gCj4+
Cj4+IEJlc3QgcmVnYXJkcwo+PiBHaXVsaW8KPj4KPj4+IC0tIAo+Pj4gMi4yNS4xCj4+Pgo+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+PiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
