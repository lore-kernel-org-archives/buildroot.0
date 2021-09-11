Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F91C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:30:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BFA461213
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BFA461213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A72AC4025E;
	Sat, 11 Sep 2021 15:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqI_tm8uTq3V; Sat, 11 Sep 2021 15:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7546400FC;
	Sat, 11 Sep 2021 15:30:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0823C1BF35A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05008400FC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYIbVQ-avEmi for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:30:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4179400E8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:30:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 21704B0055A;
 Sat, 11 Sep 2021 17:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631374213;
 bh=YuNCnKD7dr8+revPCcVsgguX+XXiP3AcZJVZqSI9u7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7fBFe9BWy4H9RahG/raTmb0CveEvlBXsWT4OzEsdTfPsMzF9Lrg4RGMOUqPDgPrM
 sMMEmYhouhawkmlLDEObcOGh3h6rIykv1TbCYy7pZjCRpO/IXESCuKvzvqEoWf/Cjc
 41DfmyLO32b26qjxwIu79K2d8maJPhJutKPDgeaF8llSDlwK7784HVJcot4+5dntJ0
 EnM5SrM0XKp0CeMNrbw4LWFh/2+ZGYRLa/xUkn636az3vpz3c5Kg1aOYy4rxQ29Otf
 3uCqsp3KNdsTg6fS8QHnYJ3Uh5DMmNrN8Ps7FETZ/H9EbT014fU3voJC295/dE2RsZ
 WWUfQbxQRJkxA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 17:30:08 +0200
Date: Sat, 11 Sep 2021 17:30:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210911153008.GQ1053080@scaer>
References: <20210908215740.1569088-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908215740.1569088-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: work around arc gcc10 bug
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

R2l1bGlvLCBBbGwsCgpPbiAyMDIxLTA5LTA4IDIzOjU3ICswMjAwLCBHaXVsaW8gQmVuZXR0aSBz
cGFrZSB0aHVzbHk6Cj4gV2l0aCBCUjJfR0NDX1ZFUlNJT05fQVJDPXkoYXJjIGdjYzEwKSBoYXJm
YnV6eiBwYWNrYWdlIGV4aGliaXRzIGEgZ2NjIGJ1Zwo+IHRoYXQgbWFrZXMgYnVpbGQgdG8gZmFp
bC4gVGhpcyBidWcgaXMgZm91bmQgb25seSBpbiBvZmZpY2lhbCBhcmMgZ2NjMTAKPiBwcm92aWRl
ZCBieSBTeW5vcHNpcywgc28gd2UgY2FuJ3QgdXNlIHRoZSBCUjJfVE9PTENIQUlOX0hBU19HQ0Nf
QlVHXwo+IGFwcHJvYWNoIHNpbmNlIGJ1ZyBjYW4ndCBiZSBldmVuIGZpbGVkIGluIGdjYyBidWd6
aWxsYS4KPiBUbyB3b3JrIGFyb3VuZCB0aGlzLCBpZiBCUjJfR0NDX1ZFUlNJT05fQVJDPXkgd2Ug
Zm9yY2UgdXNpbmcgLU8wLgoKR29vZCBlbm91Z2ggZm9yIG1lISDwn5GNCgo+IEZpeGVzOgo+IGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2U0ZC9lNGRhOWJhNDBjOGY0NTY3
NjAxZDQwNGUyMGRkNmEwYjMyMjIxMGMyLwo+IAo+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdl
L2hhcmZidXp6L2hhcmZidXp6Lm1rIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tayBi
L3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsKPiBpbmRleCBjY2IwZDk0MGQxLi5iY2Y1YmZi
NWFmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsKPiArKysgYi9w
YWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lm1rCj4gQEAgLTk0LDUgKzk0LDkgQEAgaWZlcSAoJChC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTKSwpCj4gIEhBUkZCVVpaX0NYWEZMQUdTICs9ICQoVEFS
R0VUX0NYWEZMQUdTKSAtREhCX05PX01UCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9HQ0Nf
VkVSU0lPTl9BUkMpLHkpCj4gK0hBUkZCVVpaX0NYWEZMQUdTICs9IC1PMAo+ICtlbmRpZgo+ICsK
PiAgJChldmFsICQobWVzb24tcGFja2FnZSkpCj4gICQoZXZhbCAkKGhvc3QtbWVzb24tcGFja2Fn
ZSkpCj4gLS0gCj4gMi4yNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGxpc3Rz
LmJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
