Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7750CDB482
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A7982339;
	Wed, 18 Oct 2023 15:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A7982339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dj2_7U0RTGmt; Wed, 18 Oct 2023 15:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4FC782435;
	Wed, 18 Oct 2023 15:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FC782435
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE2411BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3F9260BCF
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3F9260BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXViO2VDzCT5 for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:20:54 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3732960AE9
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3732960AE9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb7f:2f7a:afad:92ed])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0928913FA39;
 Wed, 18 Oct 2023 17:20:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Oct 2023 17:20:47 +0200
Date: Wed, 18 Oct 2023 17:20:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20231018152047.GA2607@scaer>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
 <20231018105301.495c5899@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018105301.495c5899@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697642451;
 bh=R0xrzkJu8fwSrOCR+D/5ois+j6QxKMwvc4SdYdztsYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sXze3ffO93Cc07CKSD/QE330X3+nFAPj4p/TINKInzzUefjXhCj7o1raJfets59rB
 4NEj/vsecMb4nx1+WvZdVO+a0zKBRtSkvqgKyFNF+qbRXwy1xg4z/iFOIxGBC0MhwC
 SYFcpErwAPzcZ9lvQqXtd12TsGyqW/7SQ43WW+AVsq0rvDDqowdlZeK/ZHDszLslRm
 c8p6XfEs6vKM02iHutvlH+Dh9CseFeKU/qhcBhbCXUHmBWwztN11dLbGwkr9wElGGs
 EQXpNSDEcJyIwsdl6pLZhV87OhOfkyGZpRVzfMWpc1hOeCVX/a2IAWfySstTSKPLFm
 XDL40lVehGnSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sXze3ffO
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-utils: teach
 per-package-rsync to copy or hardlink dest
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVydsOpLCBBbGwKCk9uIDIwMjMtMTAtMTggMTA6NTMgKzAyMDAsIEhlcnZlIENvZGluYSB2aWEg
YnVpbGRyb290IHNwYWtlIHRodXNseToKPiBPbiBUdWUsIDE3IE9jdCAyMDIzIDIzOjAxOjIwICsw
MjAwCj4gIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Clst
LVNOSVAtLV0KClR5cG9lcyBmaXhlZCBpbiBib3RoIGNvbW1pdHMsIHRoYW5rcy4KCj4gPiAtLS0g
YS9wYWNrYWdlL3BrZy11dGlscy5tawo+ID4gKysrIGIvcGFja2FnZS9wa2ctdXRpbHMubWsKPiA+
IEBAIC0yMTQsMTAgKzIxNCwxOSBAQCBpZmVxICgkKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklF
UykseSkKPiA+ICAjICQxOiBzcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBwYWNrYWdlcyB0byByc3lu
YyBmcm9tCj4gPiAgIyAkMjogJ2hvc3QnIG9yICd0YXJnZXQnCj4gPiAgIyAkMzogZGVzdGluYXRp
b24gZGlyZWN0b3J5Cj4gPiArIyAkNDogbGl0ZXJhbCAiY29weSIgb3IgImhhcmRsaW5rIiB0byBj
b3B5IG9yIGhhcmRsaW5rIGZpbGVzIGZyb20gc3JjIHRvIGRlc3QKPiA+ICBkZWZpbmUgcGVyLXBh
Y2thZ2UtcnN5bmMKPiA+ICAJbWtkaXIgLXAgJCgzKQo+ID4gIAkkKGZvcmVhY2ggcGtnLCQoMSks
XAo+ID4gLQkJcnN5bmMgLWEgLS1saW5rLWRlc3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8k
KDIpLyBcCj4gPiArCQlyc3luYyAtYSBcCj4gPiArCQkJLS1oYXJkLWxpbmtzIFwKPiBZb3UgcHJl
c2VydmUgaGFyZCBsaW5rcyAoLS1oYXJkLWxpbmtzKSBpbiBhbGwgY2FzZXMgKGNvcHkgYW5kIGhh
cmRsaW5rKS4KPiBJbiBjYXNlIG9mIGNvcHksIGlzIGl0IGNvcnJlY3QgdG8gcHJlc2VydmUgaGFy
ZCBsaW5rcyA/CgpZZXMsIC0taGFyZC1saW5rcyBpczoKCiAgICBUaGlzIHRlbGxzIHJzeW5jIHRv
IGxvb2sgZm9yIGhhcmQtbGlua2VkIGZpbGVzIGluIHRoZSBzb3VyY2UgYW5kCiAgICBsaW5rIHRv
Z2V0aGVyIHRoZSBjb3JyZXNwb25kaW5nIGZpbGVzIG9uIHRoZSBkZXN0aW5hdGlvbi4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+ID4gKwkJCSQoaWYgJChmaWx0ZXIgaGFyZGxpbmssJCg0KSks
IFwKPiA+ICsJCQkJLS1saW5rLWRlc3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLywg
XAo+ID4gKwkJCQkkKGlmICQoZmlsdGVyIGNvcHksJCg0KSksIFwKPiA+ICsJCQkJCSQoZW1wdHkp
LCBcCj4gPiArCQkJCQkkKGVycm9yIHBlci1wYWNrYWdlLXJzeW5jIGNhbiBvbmx5ICJjb3B5IiBv
ciAiaGFyZGxpbmsiLCBub3QgIiQoNCkiKSBcCj4gPiArCQkJCSkgXAo+ID4gKwkJCSkgXAo+ID4g
IAkJCSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXAo+ID4gIAkJCSQoMykkKHNlcCkp
Cj4gPiAgZW5kZWYKPiAKPiBbLi4uXQo+IAo+IEJlc3QgcmVnYXJkcywKPiBIZXJ2w6kKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
