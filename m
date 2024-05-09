Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB3DC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1206141763;
	Thu,  9 May 2024 21:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SU62Z0fQxYqH; Thu,  9 May 2024 21:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A5441FA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A5441FA8;
	Thu,  9 May 2024 21:18:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 934181BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DE9841FA8
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzkLRhtuS-LP for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A3B441763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A3B441763
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A3B441763
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:18:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1659313F86E;
 Thu,  9 May 2024 23:17:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 May 2024 23:17:53 +0200
Date: Thu, 9 May 2024 23:17:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zj09gYTp31l7aTeQ@landeda>
References: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
 <20240408230806.5ca01f62@windsurf>
 <CAPi7W825bRBjsWKYt3c5oL4QyoEc1umm7rcmVE5Ce99XLiugbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W825bRBjsWKYt3c5oL4QyoEc1umm7rcmVE5Ce99XLiugbQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715289478;
 bh=k0IObhRrGIK00Z14atLDB1uq4P5eXP/I3euhQf99lbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I0SUuaDNkkCzC5xyZpPSnlaCgNoXWVSnH41DD5J0h7DswaJROti/jcOLuxOfO9+IQ
 108sGuqql0TpDKhowgQcEnJrtjgIagVJW0ZImTEDdmyRHHqkX8PS9HNxRNkb4mIWLm
 cqSMBrs5Dqpv3kdZ16tdXP9grRgxIblYfe4zuVmEjjIfPWmpPE9+40cDChTL7Ku83+
 4ce5IROFFPdzoVtA82cTUJmFHoCrJYlYY4dyrIzmFnYv/ffbVqm6YLhjPNBQttXT81
 Qcn5+NeJX3Fp6/DHZuVl1l7QheBWPhCG/pHaDcKZ8mnxpQ0ZmqSRO0cOuNe+x3mqgH
 bWs8MgLIFBS+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=I0SUuaDN
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgVGhvbWFzLCBBbGwsCgpPbiAyMDI0LTA0LTA4IDIzOjExICswMjAwLCBGYWJyaWNl
IEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiBMZSBsdW4uIDggYXZyLiAyMDI0IMOgIDIzOjA4LCBU
aG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0
IDoKPiA+IE9uIFRodSwgIDQgQXByIDIwMjQgMjE6NDc6MjMgKzAyMDAKPiA+IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gU2V0IEdST1VQ
X1Qgd2hlbiBpbnN0YWxsaW5nIGNvbmZpZ3VyYXRpb24gZmlsZXMgYXMgcm9vdCB0byBhdm9pZCB0
aGUKPiA+ID4gZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIHNpbmNlIGNvbW1pdAo+ID4g
PiBiNjgxNjAzNGViZGRkNTIyYThmZWY5ZGFhNDU0YzI4ZmExMjMwZGQ2OgpbLS1TTklQLS1dCj4g
PiBJJ20gY29uZnVzZWQgYmVjYXVzZSB0aGUgQnVpbGRyb290IGJ1aWxkIGRvZXMgbm90IHJ1biBh
cyByb290LiBTbyB3aHkKPiA+IGRvZXMgdGhpcyBoYXBwZW4/Cj4gVGhpcyBvbmx5IGhhcHBlbnMg
d2l0aCBhcm1hYnVpbGRlciBmcm9tIFPDqWJhc3RpZW4gU3p5bWFuc2tpIGFuZCBJCj4gYXNzdW1l
IHRoYXQgdGhlIGJ1aWxkcm9vdCBidWlsZCBvbiB0aGlzIGF1dG9idWlsZGVyIHJlYWxseSBydW5z
IGFzCj4gcm9vdC4KCkluZGVlZCwgU8OpYmF0aWVuIHdhcyBydW5uaW5nIHRoZWlyIGF1b3RidWls
ZGVyIGFzIHJvb3QgaW4gYSBjb250YWluZXIuClRoZXkndmUgbm93IHN3aXRjaGVkIHRvIHJ1bm5p
bmcgYXMgYSBub24tcm9vdCB1c2VyLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
