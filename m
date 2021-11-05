Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A880AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D240611C1
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D240611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E08826E7;
	Fri,  5 Nov 2021 13:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FByhca9sZlhn; Fri,  5 Nov 2021 13:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F472826FB;
	Fri,  5 Nov 2021 13:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8E491BF304
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9820B40099
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqSo9zBs_e0x for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 13:52:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3503D400C7
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 13:52:51 +0000 (UTC)
Received: from smtpclient.apple ([151.36.1.27])
 by Aruba Outgoing Smtp  with ESMTPA
 id izeCmVO1YFf01izeDmZWTm; Fri, 05 Nov 2021 14:52:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636120369; bh=bhJkm/SA1xyoyaQQxVO7tP8OzZ11Rl6sHZCVoYF8nhU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=LwrOlG2AB25iGI4XawGdLoCJWW9EmNTvpD2vK5HqLqfBp1RXykvR00XDk0Pybf4iU
 zm+tbszOsqTWDlW5QZxFV/43ojdYRfbxC6XOYi3CDefwvaoGZKIiSwJNON5edErnPV
 XqLOnqSIGupz+1nZBPL2wzy4gz9lIawZon8Cr/aTxhxWyJOw7OvzUiXgqLrTRARByj
 c+zDiJao3UZ51sSEEs/Ddw5RqugF+fHOfAsAzJP9aLiw3lT4UDQGSA9xxJY2InJaR9
 DkucwARqnyxzh6SGPME68zXTkO1EdpEOqw13iW76H0GVaBH7Giuq3LGp34CaObAhaB
 uWS/UBSSVwyhA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 5 Nov 2021 14:52:47 +0100
Message-Id: <AE14FCC4-756C-4549-A05A-9969D06243F5@benettiengineering.com>
References: <87lf22iv3c.fsf@dell.be.48ers.dk>
In-Reply-To: <87lf22iv3c.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfCZdD7t5AHmxAQ2lqrtpUqSIHTrjzA4qmiYa1mbkdFGlfXlxcjoGj3/8TK8riAkM+4eql/GFyU7cK7s6EDSqMi5IeylCFcBSYM7xXOFx3TVwQlYVjhP1
 kmEoVgnbP2twA+NGAqm6Ie4beQgvr5xgCXZLPzxWP+9ao+KVwJNoMvZG3H7b+FDco9kyK6ikgv1lC9Y22j9WrJgIBUIZzJ8qMrGE5eMGFWxJ9DplFfsIsOBi
 JkbGq5C43eZrjy2c7eDDaA==
Subject: Re: [Buildroot] [PATCH 2/2] configs/nezha_defconfig: new defconfig
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
Cc: buildroot@buildroot.org, samuel@sholland.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgo+IElsIGdpb3JubyA1IG5vdiAyMDIxLCBhbGxlIG9yZSAxNDozNSwgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7vwo+PiAK
Pj4+Pj4+ICJHaXVsaW8iID09IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPiB3cml0ZXM6Cj4gCj4gSGksCj4gCj4+PiAraW1hZ2Ugc2RjYXJkLmlt
ZyB7Cj4+PiArICAgIGhkaW1hZ2Ugewo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIHBhcnRpdGlv
biBib290MC0xIHsKPj4+ICsgICAgICAgIGluLXBhcnRpdGlvbi10YWJsZSA9ICJubyIKPj4+ICsg
ICAgICAgIGltYWdlID0gImJvb3QwX3NkY2FyZF9zdW4yMGl3MXAxLmJpbiIKPj4+ICsgICAgICAg
IG9mZnNldCA9IDgxOTIKPiAKPj4gQ2FuIHlvdSBwbGVhc2UgdXNlIDhLIGhlcmUgXl5eCj4gCj4+
PiArICAgIH0KPj4+ICsKPj4+ICsgICAgcGFydGl0aW9uIGJvb3QwLTIgewo+Pj4gKyAgICAgICAg
aW4tcGFydGl0aW9uLXRhYmxlID0gIm5vIgo+Pj4gKyAgICAgICAgaW1hZ2UgPSAiYm9vdDBfc2Rj
YXJkX3N1bjIwaXcxcDEuYmluIgo+Pj4gKyAgICAgICAgb2Zmc2V0ID0gMTMxMDcyCj4gCj4+IDEy
OEsgaGVyZSBldGMuCj4gCj4+IEkgZmluZCBpdCB0byBiZSBlYXNpZXIgdG8gcmVhZC4KPiAKPiBP
ay4gVGhlICJkb2N1bWVudGF0aW9uIiBhY3R1YWxseSBsaXN0cyB0aGlzIGluIDUxMmIgc2VjdG9y
cywgYnV0IEkgZG9uJ3QKPiB0aGluayBnZW5pbWFnZSBoYXMgc29tZXRoaW5nIG5pY2UgdG8gaGFu
ZGxlIHRoaXM6CgpJIGRvbuKAmXQgdGhpbmsgaXQgc2hvdWxkIG1hdHRlciB0aGUgYmxvY2sgc2l6
ZSBiZWNhdXNlIHdl4oCZcmUgZGVzY3JpYmluZyBpbiBieXRlcywgbm90IGluIGJsb2NrIHNpemUs
IGlmIHdlIHNheSA4SyBpdOKAmXMgOEtCLCAxMjhLQiBpcyAxMjhLQiBhbmQgc28gb24uIENvcnJl
Y3Q/CgpJZiB3ZSBoYXZlIGEgdmVyeSBwYXJ0aWN1bGFyIHZhbHVlIEkgY2FuIHRyeSBpZiBnZW5p
bWFnZSBoYW5kbGVzIGEgc3VtIGxpa2UgMTI4SyArIDUxMkIuCgpJIGxldCB5b3Uga25vdyBpZiB0
aGlzIGlzIG5lZWRlZCBmb3IgYWxsIC5jZmcgZmlsZXMgYW5kIGlmIGl0IHdvcmtzIG90aGVyd2lz
ZSBvbiB0aG9zZSBzcGVjaWZpYyBjYXNlcyB3ZSBjYW4gc3BlY2lmeSBwZXIgYnl0ZS4gSSBmaW5k
IGl0IG1vcmUgY2xlYXIuCgpJcyBvaz8KCkdpdWxpbwoKPiAKPiBodHRwczovL2xpbnV4LXN1bnhp
Lm9yZy9BbGx3aW5uZXJfTmV6aGEKPiAKPiAKPj4gSSB3b3VsZCBnbyBmb3IgY2hhbmdpbmcgZXZl
cnkgLmNmZyBmaWxlIGluIEJ1aWxkcm9vdCBhbmQgc3VibWl0IGEKPj4gcGF0Y2hzZXQgZm9yIHRo
aXMgdG8gaW1wcm92ZSByZWFkaWJpbGl0eS4gV2hhdCBkbyB5b3UgYWxsIHRoaW5rIGFib3V0Cj4+
IHRoaXM/Cj4gCj4gRmluZSBieSBtZS4KPiAKPiAtLSAKPiBCeWUsIFBldGVyIEtvcnNnYWFyZAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
