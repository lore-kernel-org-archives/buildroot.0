Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD30C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 14:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008DA60AF1;
	Sat,  5 Nov 2022 14:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008DA60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80TT4KzjVN94; Sat,  5 Nov 2022 14:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3142960AE9;
	Sat,  5 Nov 2022 14:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3142960AE9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3A4B1BF28A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E87F403A7
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E87F403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJxnbIgM-3By for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 14:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A133340148
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A133340148
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 14:10:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.11.77.72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2C4472003B4;
 Sat,  5 Nov 2022 15:10:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 15:10:19 +0100
Date: Sat, 5 Nov 2022 15:10:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Message-ID: <20221105141019.GG3918838@scaer>
References: <20221004111528.384625-1-nunog@fr24.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004111528.384625-1-nunog@fr24.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667657422;
 bh=0t0wXf9d5YiIgX2WN58tBjqpJORqQb2k+/VgyP64KD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GgLkCWMznEYNUUbmXZjRONXH+wUd/c/ivt7ZsIWjCGHgyPWRbt/s0RTPKSRh3qh2h
 5VMzHnashZ6sQL8W2jUyhVgJUeXwCTq+JHzmotWu+QVWCmgkc5DgWmmGfz9MBlyjF5
 hBcXWKSsd679zwq0QNOHzSLgytHmMNNKvBV5u22sqE8/JI2NeZWCL1I+1I1s7gjPAs
 LrjSPYn74BSfgGwDPO3U2ZHKmnlRqtkpwsMS2XvZ9LVeTzZBE98eJKleuHsegxOPwp
 TL0/RwGliIFObKv17cZtTz53BgjZlTmtxaurS4VMitWsgJus+RNUK4ym9ZIUTkes6o
 HFGCmS73A5xKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GgLkCWMz
Subject: Re: [Buildroot] [PATCH 1/3] package/linux: don't leak host timezone
 into linux version string
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TnVubywgQWxsLAoKT24gMjAyMi0xMC0wNCAxMjoxNSArMDEwMCwgTnVubyBHb27Dp2FsdmVzIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IE51bm8gR29uw6dhbHZl
cyA8bnVub2dAZnIyNC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgbGludXgvbGludXgubWsgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9s
aW51eC9saW51eC5tayBiL2xpbnV4L2xpbnV4Lm1rCj4gaW5kZXggZWZkYzIxZWZmMi4uNmI1NDdh
NjhlZCAxMDA2NDQKPiAtLS0gYS9saW51eC9saW51eC5tawo+ICsrKyBiL2xpbnV4L2xpbnV4Lm1r
Cj4gQEAgLTE2Miw3ICsxNjIsNyBAQCBMSU5VWF9NQUtFX0VOViArPSBcCj4gIAlLQlVJTERfQlVJ
TERfVkVSU0lPTj0xIFwKPiAgCUtCVUlMRF9CVUlMRF9VU0VSPWJ1aWxkcm9vdCBcCj4gIAlLQlVJ
TERfQlVJTERfSE9TVD1idWlsZHJvb3QgXAo+IC0JS0JVSUxEX0JVSUxEX1RJTUVTVEFNUD0iJChz
aGVsbCBMQ19BTEw9QyBkYXRlIC1kIEAkKFNPVVJDRV9EQVRFX0VQT0NIKSkiCj4gKwlLQlVJTERf
QlVJTERfVElNRVNUQU1QPSIkKHNoZWxsIExDX0FMTD1DIFRaPSdVVEMnIGRhdGUgLWQgQCQoU09V
UkNFX0RBVEVfRVBPQ0gpKSIKPiAgZW5kaWYKPiAgCj4gICMgZ2NjLTggc3RhcnRlZCB3YXJuaW5n
IGFib3V0IGZ1bmN0aW9uIGFsaWFzZXMgdGhhdCBoYXZlIGEKPiAtLSAKPiAyLjM3LjMKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
