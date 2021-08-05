Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7AAC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADEEB60F25
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADEEB60F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E8788377F;
	Thu,  5 Aug 2021 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2W3XqTWeXNo; Thu,  5 Aug 2021 19:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE9D8376B;
	Thu,  5 Aug 2021 19:31:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDA8F1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA64140624
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1H7z86U8uhl for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:31:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F96C405E9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:31:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id ec13so10010801edb.0
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tAhUvtlC9wHPEasWYeCT3n0zGQAs8EBmYFFl9Kw17+4=;
 b=g/xdteaXxVFqHDGn1YsvFn9l8vLBtyeDQrs4V96e7hSF39w6QgWI+8GjVdy0MSiQ58
 z0vKXil5xI7NEuR9yyWAKAQ1Z3vHPgyKEWi0cBs21lNAxOXPWLVWSYF9mhzVT2pXbWFL
 m1lTrLomya5PASI6Otdup2wscRUZNLy8g3GP4E/6Odp3ZtPn+nSb7vansv1CuFwCn97k
 4ITFm9pxTb2SsU/kgGDA7jA7bUcjEWOe68jeNWY5ccsuKXwivlKuEMHuyf5EROuCFyyE
 KVjCfOao289B+7E7ex1V+O6OgCT5j5P9anElqVx5vUth3nWbHOT2VoGVQZiV8LMm3nc0
 qf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tAhUvtlC9wHPEasWYeCT3n0zGQAs8EBmYFFl9Kw17+4=;
 b=Qgeq9ITsqC+DztXpVwhylC5qk31reuPk/o1cjjiVWVoLvMkFdJhHxYwYkulz0i6OFu
 Trie/tavgL1A3RpD2rtSsA7riTbFRKVEJlaF+4Ki6hBFJYDBc/YwxztiFTy66OozqOpP
 OQ/BseeE5vyuCYZNg96V9eUbTBSCncwokPDG94nE4vQQCqpTGkEHOYeUR3g9jE/wgvyA
 dMzLPxyC2c1iSHZfww1Dqu1wlZhTmNAmOO410DmmOg+6rnfszmGd8WJOqL4MKU9/nE30
 1sxqrsf04yQp/P6j/XZuTKvqe8qt8RJKMI85t1lEcRILx3rMZ6YBm6gYuUNV5O88et7r
 JQjw==
X-Gm-Message-State: AOAM532NGxjPbPY1M858A+ooeGxxi2ltPSD2J6mQhtz7e70EdoLZU8N3
 J/c/GtMexKTxO6UUZEK9RpsN8g==
X-Google-Smtp-Source: ABdhPJxRWJuwImAO1PHk+736CGAe049MY7ls639/YQVf3vEX7eWCByZ9YqH3T9QU5YM93dVKJgpV7g==
X-Received: by 2002:a05:6402:7d3:: with SMTP id
 u19mr8843826edy.188.1628191865569; 
 Thu, 05 Aug 2021 12:31:05 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c13sm2670427edv.93.2021.08.05.12.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:31:05 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <d9f6c6d8-566f-0d84-f935-58130ab7fde8@mind.be>
 <B9F86A76-6A01-44DB-8445-0A92A3BC7EEB@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <17588d63-1931-5543-890f-cc27e3179d36@mind.be>
Date: Thu, 5 Aug 2021 21:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <B9F86A76-6A01-44DB-8445-0A92A3BC7EEB@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/2] package/pixman: fix build failure due
 to gcc bug 101737
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAwNS8wOC8yMDIxIDA4OjU4LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBBcm5vdXQs
IFRob21hcywKPiAKPj4gSWwgZ2lvcm5vIDQgYWdvIDIwMjEsIGFsbGUgb3JlIDIyOjI4LCBBcm5v
dXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IGhhIHNjcml0dG86Cj4+Cj4+IO+7vyBI
aSBHaXVsaW8sCj4+Cj4+PiBPbiAwMy8wOC8yMDIxIDEwOjQyLCBHaXVsaW8gQmVuZXR0aSB3cm90
ZToKPj4+IFRoZSBwaXhtYW4gcGFja2FnZSBleGhpYml0cyBnY2MgYnVnIDEwMTczNyB3aGVuIGJ1
aWx0IGZvciB0aGUgU0g0Cj4+PiBhcmNoaXRlY3R1cmUgd2l0aCBvcHRpbWl6YXRpb24gZW5hYmxl
ZCwgd2hpY2ggY2F1c2VzIGEgYnVpbGQgZmFpbHVyZS4KPj4+Cj4+PiBBcyBkb25lIGZvciBvdGhl
ciBwYWNrYWdlcyBpbiBCdWlsZHJvb3Qgd29yayBhcm91bmQgdGhpcyBnY2MgYnVnIGJ5Cj4+PiBz
ZXR0aW5nIG9wdGltaXphdGlvbiB0byAtTzAgaWYgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18x
MDE3Mzc9eS4KPj4+IEFsc28gbGV0J3MgYWRkIFBJWE1BTl9DRkxBR1MgYW5kIHBhc3MgdGhlIENv
ZGVzb3VyY2VyeSB3b3JrIGFyb3VuZCBDRkxBR1MKPj4+IHRvIGl0IGZvciBjb25zaXN0ZW5jeSBs
aWtlIHdlIGRvIGZvciB0aGUgcmVzdCBvZiB0aGUgcGFja2FnZXMuCj4+Pgo+Pj4gRml4ZXM6Cj4+
PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9iMjAvYjIwODY5YmJiNDhl
ZGIxZjBhODQ3ZWE5ZTJlMWEwNDYyZDYzNTBiZS8KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4+IC0t
LQo+Pj4gcGFja2FnZS9waXhtYW4vcGl4bWFuLm1rIHwgMTAgKysrKysrKysrLQo+Pj4gMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsK
Pj4+IGluZGV4IGQ5OTAwNWVjYjcuLjZmYWI1Mzk1OTMgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdl
L3BpeG1hbi9waXhtYW4ubWsKPj4+ICsrKyBiL3BhY2thZ2UvcGl4bWFuL3BpeG1hbi5tawo+Pj4g
QEAgLTQ0LDEyICs0NCwyMCBAQCBpZm5lcSAoJChCUjJfaXdtbXh0KSx5KQo+Pj4gUElYTUFOX0NP
TkZfT1BUUyArPSAtLWRpc2FibGUtYXJtLWl3bW14dAo+Pj4gZW5kaWYKPj4+Cj4+PiArUElYTUFO
X0NGTEFHUyA9ICQoVEFSR0VUX0NGTEFHUykKPj4+ICsKPj4+ICMgdG9vbGNoYWluIGdldHMgY29u
ZnVzZWQgYWJvdXQgVExTIGFjY2VzcyB0aHJvdWdoIEdPVCAoUElDKSwgc28gZGlzYWJsZSBUTFMK
Pj4+ICMgbW92aGkgICAgcjQsICVnb3RfaGlhZGooJXRsc19sZG8oZmFzdF9wYXRoX2NhY2hlKSkK
Pj4+ICMge3N0YW5kYXJkIGlucHV0fToxNzI6IEVycm9yOiBiYWQgZXhwcmVzc2lvbgo+Pj4gaWZl
cSAoJChCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0NPREVTT1VSQ0VSWV9OSU9TSUkpLHkpCj4+PiAt
UElYTUFOX0NPTkZfRU5WICs9IENGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtRFBJWE1BTl9OT19U
TFMiCj4+PiArUElYTUFOX0NGTEFHUyArPSAtRFBJWE1BTl9OT19UTFMKPj4+ICtlbmRpZgo+Pj4g
Kwo+Pj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18xMDE3MzcpLHkpCj4+Cj4+
IEkgYmVsaWV2ZSBUaG9tYXMncyBleHBlcmltZW50cyBzaG93ZWQgdGhhdCBpdCBvbmx5IG9jY3Vy
cyB1bmRlciAtT3MuIFNvIEkgdGhpbmsKPj4gd2Ugc2hvdWxkIGRvIHRoaXMgY29uZGl0aW9uYWxs
eSB1bmRlciBCUjJfT1BUSU1JWkVfUywgYW5kIHVzZSAtTzIgcmF0aGVyIHRoYW4gLU8wLgo+IAo+
IFllcywgeW914oCZcmUgcmlnaHQsIGJ1dCBhdCBhIGNlcnRhaW4gcG9pbnQsIGlmIEkgcmVtZW1i
ZXIgY29ycmVjdGx5LCB3ZeKAmXZlIGRlY2lkZWQgdG8gdW5pZm9ybSB0aGlzIGtpbmQgd29yay1h
cm91bmRzIHVzaW5nIC1PMCwKPiAgaW5kZWVkIHNvbWUgb3RoZXIgZ2NjIGJ1ZyBjb3VsZCBiZSBz
b2x2ZWQgZGlmZmVyZW50bHkgYnV0IHdlIGtlcHQgLU8wIHdheSB0byBoYXZlIGEg4oCcc3RhbmRh
cmTigJ0gc29sdXRpb24uCgogRmFpciBlbm91Z2guIEJvdGggYXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KCiBSZWdhcmRzLAogQXJub3V0Cgo+IAo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0
Pwo+IAo+IE90aGVyd2lzZSBJIGRvIGFzIHlvdeKAmXZlIGRlc2NyaWJlZCBhYm92ZSwgbm8gcHJv
YmxlbS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8gQmVuZXR0aQo+IAo+Pgo+Pgo+PiBSZWdh
cmRzLAo+PiBBcm5vdXQKPj4KPj4+ICtQSVhNQU5fQ0ZMQUdTICs9IC1PMAo+Pj4gZW5kaWYKPj4+
Cj4+PiArUElYTUFOX0NPTkZfT1BUUyArPSBDRkxBR1M9IiQoUElYTUFOX0NGTEFHUykiCj4+PiAr
Cj4+PiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCj4+PiAkKGV2YWwgJChob3N0LWF1dG90
b29scy1wYWNrYWdlKSkKPj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
