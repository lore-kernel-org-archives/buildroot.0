Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8193CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 10:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42FE760779;
	Tue, 29 Sep 2026 10:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBsKflhb1vh6; Tue, 29 Sep 2026 10:13:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7A40B60767
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790676836;
	b=XkbZsBM4yzYjeHOo3TwR6aTl33oGiNZP29+1I4tIQEeu9iCu9c3FaPSa0CxF/DZvpI6j
	 QipPCtt+eVCeqOPRIv5zYUJuN5jK1rRmF1FzPAA9YWC/+TUM3VveLG7ukKAvtbLOb/LE7
	 sVZCPEVDW6U/pIusI78M+rfrsLr9hLS8a1sT7FY9fybpVMWum6+W+HoKrADLBggq2qfJL
	 CUZ6Kqo151CiPlvvpACFZD3PXItl2dk1482MiPvvd/LyAHuI8jtAxWN2+WceaWDq7xRvQ
	 i0SUkor+twYjLsAqZs1iqgk6Gx0Ds3TbVqA7ckEkPNP5u9yw0e5UyePJ6q+ea1XU+6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790676836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:Mime-Version:Date:Message-Id:References:Cc:
	 In-Reply-To:To:X-Mailer:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dM/iiqryt6uxLat/DMSvXsXMkxT+yOMtE9cEWHmrvNk=;
	b=UIIuTc6AL6/Gyzps4i8klE32kz3qPjI0Z9R/LYFWaIimclXPdvn0HrAu1sCLWG/L1cu4
	 dvOTz6MZc/crJBeO6a/jg3e2FwRmDuWqvlGJiDLvgWFgSxbyLPoP8QJ9WyoKa6GN4LO2J
	 zvY3u9p7ZMn0kmnup8IzfTx73Y+AFzHvASSc6UlGw5eAO8DfDyD/0ZBDZStmmbV6vB2be
	 cXco/TYREef4Y3J+kNlcD/gbBqzoifMPYl60YO3tIKlxsHOHh+R8MQawInQVeYpOwKbdZ
	 VfPl8x8rWlLq0iZRiicWiw8UzYYOwS0UIi0PfA8sLltiHM188vTamU+a27HfdUY8rJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Ef2Bs+Oh;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790676836;
	bh=dM/iiqryt6uxLat/DMSvXsXMkxT+yOMtE9cEWHmrvNk=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMaz4z+D0d9tBHj+zg8d+gdV66WYAaO4/PvyTt3MRK8M+zclwXd2A7JpHcZ1s7IuZ
	 vAZ8PRGJYus6qfVNf+uKdoYhRYtkqczS7Pm/LLDKbSxCdXjJGP6x6CfKcE56/0QKAJ
	 qiSXr+trkvhRpO3eCdQvZTESsGwEUfL25gc5E93fFaItfSd7dVHtITpOAvvgs9v5kq
	 q/Vj/d/p6PZM8lKO/NQObX01eG1PM3Umw9iqHS+fKp8kHU08kdjPcK0WNnNX4wngpT
	 UKgrQssijxqkj4Ko7+MT0NMLIPQvdz8hQq7OlAQuTbcKkR0VeC8ukL6uGN6JqydNhW
	 2QUPde/r23VXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A40B60767;
	Tue, 29 Sep 2026 10:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 363A43D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 10:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3331060767
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 10:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aWYXvA6yYYQ for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 10:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8FF636074E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.146
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790676833;
 b=JoulBdARZmY2YvW2hzGUNyScv83KairpzZFHkyfIw3ftbtxJDELvcO5c3o0Ory5bC3yd
 UDsNbaUAdC5SJjvi9niShIQOB4oEIZZBWTq2hRyHAqjH7WCEsUc+E6/M+KNxDNou666Gn
 CS+MsBrYPLtO3csDEh4GgLbP1njNuZFgOVF7UMCfAqaJXlSBeFaiQNVIZWWeVGSYezajV
 87GlTgaIdqFQKtsuefdY18gkOjKuYVRF6yg0aq4+kajuHhvdgcJm7M4vXXQnM6Fo+YR3g
 qWn14kQKNCBJdHBYOY2r9Fff16V9Yo3kHMwwUDoxFXKr/evlyVqK0pA9Ojkw8ehFHTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790676833;
 h=Received-SPF:Received:DKIM-Signature:Content-Type:
 Content-Transfer-Encoding:From:Mime-Version:Subject:Date:Message-Id:
 References:Cc:In-Reply-To:To:X-Mailer:X-CMAE-Envelope;
 bh=9CWFfcktboXLaiKKPGFQREyRGthkq9pfcUS8nyohB80=;
 b=Xd/6xTvRhaEI0Ifv+A5D9NCsMcoRrqiRLHSXnnk+hO7ts5GiDPVawitSCOAiv2qUiVF/
 oc4ANFzcR45j7Rhu6j/rVt+Qg9Fi00US4y/wZ7L4ZMaDuEhe82IwOLPnYcqn8yXXBk+dp
 ukaJiwtepv5Su8lQktcB3xsYjq9HzSBkGQCHfidTHWV1aCDmzzCOuVy+GLVRJvDupIpEx
 cPjbNNGdrq1m7s4IE+xFgxbZQp09kmAcUnC3xTJSElNtbERHOP5DWmzNjPTedm21CRKTI
 W+Uw9/vdr8u59wgDFTfYwI40ylGdjk+0oj8ngk9I0e6yUJ2VYjHa/aHNu9PSNuYkyOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=Ef2Bs+Oh; 
 arc=none smtp.remote-ip=62.149.158.146
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ef2Bs+Oh
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FF636074E
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 10:13:51 +0000 (UTC)
Received: from smtpclient.apple ([79.7.167.199]) by Aruba SMTP with ESMTPSA
 id BUqJxKrxNvPyqBUqKxOwdr; Tue, 29 Sep 2026 12:13:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790676828; bh=I2wlzzwAIRFORUw0TPA8IS6HM8fuazmqgZmOH0l8n9I=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Ef2Bs+Oh5AeAy/Zu0ytMju/QoXBJ3OPa7X+VC69dUG5apdc9TnXaG4a13QG/uraez
 CzwlGxBMoRHhTcj5c/qHUWG213fgL1vUQCCnYkgSR6BQnx44V1C8rqnczXa/BUg67s
 J/DOReqD6HNvYEYPY4N33AZ91b79CTDJ4eI58PW5Um//4ZWfjdypFUEsLHD2wKO57g
 aK6dFMOXmWXQNixRBCevtoDJvnKXga+MoRVl9hURZdUNKd/XHxaPGot5cmkrBNR9m6
 mI4Nf1JmkoOxbm5Yo0wfndVNf9hlxp1uR9pm3heLlgncaxlA4ogQg1g2q8Ll5EHxJS
 z5vl6DzxBf07g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 29 Sep 2026 12:13:47 +0200
Message-Id: <2561F68A-ED08-4BDE-BF11-1EB76CFA4ACB@benettiengineering.com>
References: <CAGm1_kvhSa6Vumz+Er6nkjWKHkoRYiBHXdO-CdGxV4rLDsODrw@mail.gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAGm1_kvhSa6Vumz+Er6nkjWKHkoRYiBHXdO-CdGxV4rLDsODrw@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailer: iPhone Mail (24A437)
X-CMAE-Envelope: MS4xfFB82sYTcU4jEHfEyHbjCZNxpLUFZizpstaRu7CBcUf3OLcpdSNoZ9nsf0rJj9BSgcfQYciFMIYbsHPo0wmcmHur1dZIkAJn1xTTpdPsd70Swl3u369o
 mJKY+n0D3JzKMXi5tqniUP2B1znw+RxPfGANsjSRvTLy/pg2I17HruVL+IPhAkZ8e9AUFcOf/odklfFnOY09HJQQtfuYx/hHM5URhfZp91AvUAarWgEJb7ys
 dmHWCVc3sAuWAXMuiQKyfw==
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: fix build failure due
 to wrong libtool/configure paths
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

SGkgWWVnb3IsCgo+IElsIGdpb3JubyAyOCBzZXQgMjAyNiwgYWxsZSBvcmUgMjM6MDQsIFllZ29y
IFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDv
u79IaSBHaXVsaW8sCj4gCj4+IE9uIE1vbiwgU2VwIDI4LCAyMDI2IGF0IDU6MDfigK9QTSBHaXVs
aW8gQmVuZXR0aQo+PiA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3Jv
dGU6Cj4+IAo+PiBBdCB0aGUgbW9tZW50IGNyeXB0c2V0dXAgaXMgYnVpbHQgdXNpbmcgbGlidG9v
bC9jb25maWd1cmUgYXMgdGhleSBhcmUsCj4+IGJ1dCB0aGV5IGRvbid0IHRha2UgaW50byBhY2Nv
dW50IGNvbXBsZXRlbHkgcGF0aCB3ZSdyZSBidWlsZGluZyBmb3IuCj4+IFRoaXMgbGVhZHMgdG8g
YnVpbGQgZmFpbHVyZSB3aGlsZSBsaWJ0b29sIGNoZWNrcyBmb3I6Cj4+IAo+PiAgaTY4Ni1idWls
ZHJvb3QtbGludXgtZ251LWdjYzogRVJST1I6IHVuc2FmZSBoZWFkZXIvbGlicmFyeSBwYXRoIHVz
ZWQKPj4gaW4gY3Jvc3MtY29tcGlsYXRpb246ICctTC91c3IvbGliJwo+PiAKPj4gU28gbGV0J3Mg
Zml4IGl0IGJ5IGVuYWJsaW5nIENSWVBUU0VUVVBfQVVUT1JFQ09ORi4KPj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcu
Y29tPgo+PiAtLS0KPj4gcGFja2FnZS9jcnlwdHNldHVwL2NyeXB0c2V0dXAubWsgfCAxICsKPj4g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9jcnlwdHNldHVwL2NyeXB0c2V0dXAubWsgYi9wYWNrYWdlL2NyeXB0c2V0dXAvY3J5cHRzZXR1
cC5tawo+PiBpbmRleCA2NDNhMmIzZjU5Li5mYmU5MjAwMWZlIDEwMDY0NAo+PiAtLS0gYS9wYWNr
YWdlL2NyeXB0c2V0dXAvY3J5cHRzZXR1cC5tawo+PiArKysgYi9wYWNrYWdlL2NyeXB0c2V0dXAv
Y3J5cHRzZXR1cC5tawo+PiBAQCAtMjEsNiArMjEsNyBAQCBDUllQVFNFVFVQX0xJQ0VOU0VfRklM
RVMgPSBcCj4+ICAgICAgICBkb2NzL2xpY2Vuc2VzL0NPUFlJTkcuTEdQTC0yLjEtb3ItbGF0ZXIt
V0lUSC1jcnlwdHNldHVwLU9wZW5TU0wtZXhjZXB0aW9uCj4+IENSWVBUU0VUVVBfQ1BFX0lEX1ZB
TElEID0gWUVTCj4+IENSWVBUU0VUVVBfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4+ICtDUllQVFNF
VFVQX0FVVE9SRUNPTkYgPSBZRVMKPj4gCj4+IENSWVBUU0VUVVBfQ09ORl9FTlYgKz0gTERGTEFH
Uz0iJChUQVJHRVRfTERGTEFHUykgJChUQVJHRVRfTkxTX0xJQlMpIgo+PiBDUllQVFNFVFVQX0NP
TkZfT1BUUyArPSAtLWVuYWJsZS1ibGtpZCAtLWVuYWJsZS1saWJhcmdvbjIgLS1kaXNhYmxlLWFz
Y2lpZG9jCj4gCj4gSGF2ZSB5b3UgbG9va2VkIGF0IHRoaXMgYXBwcm9hY2ggWzFdPwoKSeKAmXZl
IHRvdGFsbHkgbWlzc2VkIHRoaXMgc29sdXRpb24gYW5kIGl04oCZcyBkZWZpbml0ZWx5IHRoZSB3
YXkgdG8gZ28gc28gbGV04oCZcyBkcm9wIHRoaXMgcGF0Y2ggaW4gZmF2b3Igb2YgeW91cnMgdGhh
dCBmaXggdGhlIHByb2JsZW1zIGZvciBhbnkgbmV3IHBhY2thZ2Vz4oCZIHRhcmJhbGxzLgoKVGhh
bmsgeW91IGFuZApCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IFsxXSBodHRwczovL3BhdGNod29y
ay5idWlsZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjYwOTI0MTM0MTA5LjI0
MTU0OTgtMS15ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbS8KPiAKPiBSZWdhcmRzLAo+IFllZ29y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
