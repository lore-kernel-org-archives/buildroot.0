Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525B5CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044CB400DC;
	Mon,  1 Apr 2024 14:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2scdSfAxT1V; Mon,  1 Apr 2024 14:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1AE401E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E1AE401E1;
	Mon,  1 Apr 2024 14:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6A1D1BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93BDA81E68
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV-QgIIwZO51 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C7E481DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C7E481DD8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C7E481DD8
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 14:01:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E85113F846;
 Mon,  1 Apr 2024 16:01:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 16:01:16 +0200
Date: Mon, 1 Apr 2024 16:01:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <Zgq-LKeMzoMjfd4t@landeda>
References: <20240401131242.511203-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401131242.511203-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711980078;
 bh=KOO2TuQ/goM4XQzRvoWggrklqNj3DgU8nGKOUlCejkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WdAkPbo83CtDn54ozhnmBtNj+SAZpgId6Vb4oPhV2zclVxDK5gdw/f95Y0D14jGgb
 tLlq4yfdX+3OCMVzRfKmZ8qaQ6X0WbSLr1PqHul5kVNd5Uet2gegM02epbAxQn1NlK
 wWwBWdPn6LxC8+2pyBJBc69P6hW4pYpOItFnSsDMz8UpHqX2yjY2Zyti/HUx9n64yV
 XCawaeilF2zPvIYi0yH3u08GuI9un7b2oy/joayt0O5DbkSGx+UaPVULIUlvsj230P
 D5AOWASkin0vSn8Yb7DWS7/XiyJU0KbcDd6nFDSbKXYzCtMkVADKOG/42sLrC1ac1H
 wZbrDjyEdzexQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WdAkPbo8
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.34
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA0LTAxIDE1OjEyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKSSBkaWQgbm90IGFwcGx5LCBpbiBmYWN0OiBhdXRob3IgaWRl
bnRpdHkgYW5kIHNvYiBtdXN0IG1hdGNoLCBidXQgaGVyZQp0aGV5IGRvIG5vdDoKCiAgICBGcm9t
OiBGcmFuY29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiAKdnM6CiAgICBTaWduZWQtb2Zm
LWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KCkNhbiB5b3Ug
cmVzcGluIHlvdXIgcmVjZW50IHBhdGNoZXMgc28gdGhhdCBpdCBkb2VzIG1hdGNoLCBwbGVhc2U/
CgogICAgWzUvNV0gcGFja2FnZS9saWJncGctZXJyb3I6IGJ1bXAgdG8gdmVyc2lvbiAxLjQ4CiAg
ICBbNC81XSBwYWNrYWdlL2xpYm5wdGg6IGJ1bXAgdG8gdmVyc2lvbiAxLjcKICAgIFszLzVdIHBh
Y2thZ2UvbGlia3NiYTogYnVtcCB0byB2ZXJzaW9uIDEuNi42CiAgICBbMi81XSBwYWNrYWdlL2xp
YmFzc3VhbjogYnVtcCB0byB2ZXJzaW9uIDIuNS43CiAgICBbMS81XSBwYWNrYWdlL2dudXBnMjog
YnVtcCB0byB2ZXJzaW9uIDIuNC41CiAgICBwYWNrYWdlL3BhbmdvOiBidW1wIHRvIHZlcnNpb24g
MS41Mi4yICAgcGFja2FnZS9wYW5nbzogYnVtcCB0byB2ZXJzaW9uCiAgICBwYWNrYWdlL2Zha2Vy
b290OiBidW1wIHRvIHZlcnNpb24gMS4zNCAgcGFja2FnZS9mYWtlcm9vdDogYnVtcCB0byB2ZXJz
aW9uIDEuMzQgCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9mYWtl
cm9vdC9mYWtlcm9vdC5oYXNoIHwgNSArKystLQo+ICBwYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290
Lm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QuaGFz
aCBiL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QuaGFzaAo+IGluZGV4IDVlN2I2YWY5NC4uYTE0
OGRlNjc2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QuaGFzaAo+ICsr
KyBiL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QuaGFzaAo+IEBAIC0xLDQgKzEsNSBAQAo+IC0j
IEZyb20gaHR0cHM6Ly9kZWIuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2YvZmFrZXJvb3Qv
ZmFrZXJvb3RfMS4zMi4xLTEuZHNjCj4gLXNoYTI1NiAgYzA3MmIwZjY1YmFmYzRjYzViNjExMmY3
YzYxMTg1ZjUxNzBjZTRjYjBjNDEwZDE2ODFjMWFmNGExODNlOTRlNiAgZmFrZXJvb3RfMS4zMi4x
Lm9yaWcudGFyLmd6Cj4gKyMgRnJvbSBodHRwczovL2RlYi5kZWJpYW4ub3JnL2RlYmlhbi9wb29s
L21haW4vZi9mYWtlcm9vdC9mYWtlcm9vdF8xLjM0LTEuZHNjCj4gK3NoYTEgIGFhYTZiZjAxNThk
ODg2ZTAwOTNlZmZjMGU5NDIyNzE3ZDVjNjBlZWUgIGZha2Vyb290XzEuMzQub3JpZy50YXIuZ3oK
PiArc2hhMjU2ICA1NzI3ZjE2ZDg5MDM3OTI1ODhlZmE3YTlmOGVmOGNlNzFmODc1NmU3NDZiNjJl
NDUxNjJlNzczNTY2MmU1NmJiICBmYWtlcm9vdF8xLjM0Lm9yaWcudGFyLmd6Cj4gICMgTGljZW5z
ZSBmaWxlcywgbG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgZmM4MmNhOGI2ZmRiMThkNGUz
ZTg1Y2ZkOGFiNThkMWJjZDNmMWIyOWFiZTc4Mjg5NWFiZDkxZDY0NzYzZjhlNyAgQ09QWUlORwo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lm1rIGIvcGFja2FnZS9mYWtl
cm9vdC9mYWtlcm9vdC5tawo+IGluZGV4IDFhMGFkNzBjMS4uMWEwOTk2Y2ExIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QubWsKPiArKysgYi9wYWNrYWdlL2Zha2Vyb290
L2Zha2Vyb290Lm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAgCj4gLUZBS0VST09UX1ZFUlNJT04gPSAxLjMyLjEKPiArRkFLRVJPT1RfVkVSU0lP
TiA9IDEuMzQKPiAgRkFLRVJPT1RfU09VUkNFID0gZmFrZXJvb3RfJChGQUtFUk9PVF9WRVJTSU9O
KS5vcmlnLnRhci5nego+IC1GQUtFUk9PVF9TSVRFID0gaHR0cHM6Ly9zbmFwc2hvdC5kZWJpYW4u
b3JnL2FyY2hpdmUvZGViaWFuLzIwMjMwNzI0VDE2MDQyOVovcG9vbC9tYWluL2YvZmFrZXJvb3QK
PiArRkFLRVJPT1RfU0lURSA9IGh0dHBzOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2Rl
Ymlhbi8yMDI0MDQwMVQwODQ0MzhaL3Bvb2wvbWFpbi9mL2Zha2Vyb290Cj4gIAo+ICBIT1NUX0ZB
S0VST09UX0RFUEVOREVOQ0lFUyA9IGhvc3QtYWNsCj4gICMgRm9yY2UgY2FwYWJpbGl0aWVzIGRl
dGVjdGlvbiBvZmYKPiAtLSAKPiAyLjQwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
