Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1440C982CD
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32B280A68;
	Thu, 17 Sep 2026 07:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QJhw0WaRrwU; Thu, 17 Sep 2026 07:22:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8377280E17
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789629775;
	b=jdHfE9/g4DBPceomzB3shSa/C56NLSiHVj88oJ11l/jFHMST2caN+XzDQC2CCJiPDjaj
	 mBc/TUw9TB3M08tgkQMDh95ugcs8eY9/EVAWjHMLRrGHJg4sdNiigR0wyQPrvEJNDcrD9
	 /Dh0wcM7bWlJ7YZ47UABOL469p2DXY0b4b9OVlJ4iH9Guv9SGnjko/pmy7ZCov3ejTBtI
	 U6dmeRXnH6cAcxMnCv7LS+vQIswd5dmTbU0AGq50yZCpq9xo+h7x7fwpJHwOT19Nz68Rv
	 /NdnWnoxNheiXGSRuqneWNd9OBlRPsm8GXWW85IETw4EVGLxy0dXYA3UdFnksymbKkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789629775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ovsy6CHEj6wswuZKc7hyx4eSglDoauyUq97vhoY5Afw=;
	b=BuTftZJwyWP480c1C0EPWBdw2Ft3Nq5vvFgyIhZ1aJiQLVR5GzZGRB8UbrCP2Z9A+5Xp
	 dqqsGXnzlbbzbegLAWtZZy5jy0a3PEz01vFqz7NTQZG1MGGJCmuHKICUDzRj1bspEoHzt
	 J57IFzkIywPkk4k3jYKyemzE3M1gp88AS4J1h09KicGBimxKuknc6XpWZCUGgpcUgs/Y2
	 0Oy4rMZoAPJybQdxF1TylM7+SSfEyejPAnm6zEoo0YV5iqZzHU6gcmcPKAr3Wk5uNGxEP
	 DF7mP6Dqr2uLTcn51vB0+syf+7cxIrZ92kSgA+BFkDDTz2I5348lp6LSFf30VQV23mA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789629775;
	bh=Ovsy6CHEj6wswuZKc7hyx4eSglDoauyUq97vhoY5Afw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GIlNmFHxOqChjNbOvpNCUKCGTBAhDQ9fj5tp2sOHq2yAcLaBeLTwYmh4WpbbG/GZM
	 Ws++bTU9pn6X8D+4/swXD6S+QtFWPLKXIzYEgAQQsly/0zPpHMJYQA43P2czY1Ieqc
	 /MEFF6aNj8K7dAOtRcNivEFmHoZ4xU47WIvMxphpnSUejRwPLg5jhLBRP7J7mwAudw
	 n38GCCILMNnzJoZ2Fjrilx4X9/lKJNiIZ4vSWi8Iux0hj7JjoKP7yWFVLK5xUZbwCf
	 aw/NylbwcWRl4B4vpVfeVez3mckiBf2eN3FZIDjRdPsxqGBU2E9nvqxQehAehS59ow
	 +zJTO24DUANdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8377280E17;
	Thu, 17 Sep 2026 07:22:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 685E02EB
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A1C94072C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwxhP3z8-xTa for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DC010404F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789629772;
 b=HfB+Vi1vUM9eFgaXw31txfcDzP6LPsra54Xa8HENQq7B1b9acLM+dA1iB6TMWgmpgpF/
 Z0BHUXUjADHIpsfkBrmmx//zh6Rj7uiAocXabcEDtKIZ4q75xK5/YGBx5VKYSV1xy+i7P
 BJbXKp03elEbzrZHPdFQ3VWTm/jceH5j+uMC+Hanm+HlExeLFKt4xYvWK8iPAp8BPXBcK
 Vmy9uiTaE/JATdynmqaEUSGu1DiLy48dlB5Wa4VSJe97VibpohMB6Wnoa+9rcer7WXtZ3
 ffLlw4Z1sup2dKH9tOvdhk3JT3IzjdQBrhL0azcNfw33PVlUDn+2IZtXTLr1+naJeXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789629772;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=tN+KDZPpGl2Inwq1CxkMVwywSRZs9RDyhghegCSweN0=;
 b=ccnk/DApye8IjvvE/hV6f1omAvKXB0UPG415pgZIlcI4Sk1AbMvkX+DsmG2c0pHrm7L3
 qt5r4QK1tDwS27APQIpQNGy+APjk7iA9mgobioZz0FlMr1VVm3VdCEadHonVng8FWoFjg
 A2oNkbckttkIqay8BQM9FyZr7o0cNAkchWbUAV4dVFULQkxyKA0E6RptXHI0Q715Xf9BQ
 skA4aqh555ZxFtqFPHImXzyzP8BKbqBbkxYbL9XVPEzR4btErXqQbDU4k5QQIyuJImwMy
 m0kT+sF61XLEHQEHWCgyU9dcfYkHNwYGSb4HmyTUSsog/cSl+rYfEApjvSwEqipEhgg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hQEV7jP8; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC010404F5
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:22:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EB7B2C5CD6E;
 Thu, 17 Sep 2026 07:23:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C2935FAA3;
 Thu, 17 Sep 2026 07:22:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D8A311C79EF2; 
 Thu, 17 Sep 2026 09:22:45 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:22:45 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>, 
 buildroot@buildroot.org, arnout@rnout.be, romain.naour@smile.fr, 
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>, 
 Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <aquVJ42uPm7qTVNL@windsurf>
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
 <20260820105705.1502630-2-raphael.melotte@mind.be>
 <aqsLoHzcU6UWyYGg@windsurf> <87o6dwmkx3.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o6dwmkx3.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/gumbo-parser: update hash
 following Codeberg changes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMDg6NTA6MDBBTSArMDIwMCwgUGV0ZXIgS29yc2dhYXJk
IHdyb3RlOgoKPiB3Z2V0IGh0dHBzOi8vc291cmNlcy5idWlsZHJvb3Qub3JnL2d1bWJvLXBhcnNl
ci8wLjEzLjIudGFyLmd6Cj4gLS0yMDI2LTA5LTE3IDA4OjQ4OjMwLS0gIGh0dHBzOi8vc291cmNl
cy5idWlsZHJvb3Qub3JnL2d1bWJvLXBhcnNlci8wLjEzLjIudGFyLmd6Cj4gUmVzb2x2aW5nIHNv
dXJjZXMuYnVpbGRyb290Lm9yZyAoc291cmNlcy5idWlsZHJvb3Qub3JnKS4uLiAxMzguMjAxLjIw
NS42MSwgMmEwMTo0Zjg6MTczOjE1MjY6OjIKPiBDb25uZWN0aW5nIHRvIHNvdXJjZXMuYnVpbGRy
b290Lm9yZyAoc291cmNlcy5idWlsZHJvb3Qub3JnKXwxMzguMjAxLjIwNS42MXw6NDQzLi4uIGNv
bm5lY3RlZC4KPiBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9L
Cj4gTGVuZ3RoOiAyMTQ1NDAzICgyLjBNKSBbYXBwbGljYXRpb24veC1ndGFyLWNvbXByZXNzZWRd
Cj4gU2F2aW5nIHRvOiDigJgwLjEzLjIudGFyLmd64oCZCj4gCj4gMC4xMy4yLnRhci5neiAgICAg
ICAgICAgMTAwJVs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0+XSAgIDIuMDVNICA3LjQ1
TUIvcyAgICBpbiAwLjNzCj4gCj4gMjAyNi0wOS0xNyAwODo0ODozMSAoNy40NSBNQi9zKSAtIOKA
mDAuMTMuMi50YXIuZ3rigJkgc2F2ZWQgWzIxNDU0MDMvMjE0NTQwM10KPiAKPiBzaGEyNTZzdW0g
MC4xMy4yLnRhci5nego+IGRiZGMxNTlkYzhlNWM2ZjNmMjU0ZTUwYmNlNjg5ZGQ5ZTQzOTA2NGZm
MDZjMTY1ZDU2NTM0MTBhNTcxNGFiNjYgIDAuMTMuMi50YXIuZ3oKPiAKPiAKPiBEaWQgd2UgcmVw
b3J0IHRoaXMgaXNzdWUgdG8gY29kZWJlcmcgYWxyZWFkeT8KCldlbGwsIHNlZSB0aGUgb3JpZ2lu
YWwgcGF0Y2gsIHdoaWNoIHBvaW50cyB0bwpodHRwczovL2NvZGViZXJnLm9yZy9Db2RlYmVyZy9D
b21tdW5pdHkvaXNzdWVzLzI4NjEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
