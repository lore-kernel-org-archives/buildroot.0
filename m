Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B411DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD1D6121F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FD1D6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB78C402A8;
	Thu, 21 Oct 2021 17:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vz7Gf3alE562; Thu, 21 Oct 2021 17:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8C540272;
	Thu, 21 Oct 2021 17:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC2401BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E3580DFE
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxeSTAwkiMoi for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 17:59:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F3D82404
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 17:59:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8e5:5688:10fe:8b80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DE672780316;
 Thu, 21 Oct 2021 19:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634839150;
 bh=B8FL8rS4zgrfde7b+YT689PwPeB9LS87eOqwFH48Egw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4Gdg/V3BB5knrhR4u3Ujdt/uXz2aLXBySZP2zuMVMvrk/ITGoirk/B+kwIqlLFpn
 kPp1myXwzW+OJxM6Ir1R1rDwBKB6JvsslBmPMAI3JRFjw0tEQPAiiPsHzzxy1o3Uih
 8z9tTNjP1SinaBKFPQo3OGRTPf1tUHBQWLspeMyqxvEu20cmC56g5lmKk7GrmZKqhD
 DVOUa5fp8nVsofPRoZXLfXqkbaWxww7zv2Jqqg8ptRvuvgINndCHfasdGRIZ33Ph6b
 nORHabqMQwfG/QIu6Fu7q1RPkiuxoiwWVFuxdQXN3RayuSHSOUtFGsMz9wIT7AuGjX
 ZwiBKUp5hwJ5g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 19:59:01 +0200
Date: Thu, 21 Oct 2021 19:59:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211021175901.GE2400@scaer>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211019002255.165e5e00@gmx.net>
 <AM0P194MB0706FB2963323BD5D657815EB7BD9@AM0P194MB0706.EURP194.PROD.OUTLOOK.COM>
 <20211019230252.324bbb61@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019230252.324bbb61@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, "Walter,
 Stefan" <stefan.walter@iml.fraunhofer.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIFN0ZWZhbiwgQWxsLAoKK0vDtnJ5IHdobyBkaWQgc29tZSBoZWF2eSB3b3JrcyBvbiBn
cnViMiByZWNlbnRseS4uLgoKT24gMjAyMS0xMC0xOSAyMzowMiArMDIwMCwgUGV0ZXIgU2VpZGVy
ZXIgc3Bha2UgdGh1c2x5Ogo+IE9uIFR1ZSwgMTkgT2N0IDIwMjEgMTU6MTc6MjMgKzAwMDAsICJX
YWx0ZXIsIFN0ZWZhbiIgPHN0ZWZhbi53YWx0ZXJAaW1sLmZyYXVuaG9mZXIuZGU+IHdyb3RlOgo+
IFRoZSBob3N0LWdydWIyIG1vZHVsZXMgYnVpbGQgY2FuIGJlIGZpeGVkIGJ5IHRoZSBmb2xsb3dp
bmcgcGF0Y2g6Cj4gCj4gLS0tIGEvYm9vdC9ncnViMi9ncnViMi5tawo+ICsrKyBiL2Jvb3QvZ3J1
YjIvZ3J1YjIubWsKPiBAQCAtMTI1LDcgKzEyNSw5IEBAIEdSVUIyX1RVUExFUy0kKEJSMl9UQVJH
RVRfR1JVQjJfQVJNNjRfRUZJKSArPSBhcm02NC1lZmkKPiAgIyB1c2UgdGhlIGNyb3NzIGNvbXBp
bGUgdmFyaWFudCB0byBlbnN1cmUgZ3J1YjIgYnVpbGRzCj4gCj4gIEhPU1RfR1JVQjJfQ09ORl9F
TlYgPSBcCj4gLSAgICAgICBDUFA9IiQoSE9TVENDKSAtRSIKPiArICAgICAgIENQUD0iJChIT1NU
Q0MpIC1FIiBcCj4gKyAgICAgICBDRkxBR1M9IiQoSE9TVF9DRkxBR1MpIC1PcyIgXAo+ICsgICAg
ICAgQ1BQRkxBR1M9IiQoSE9TVF9DUFBGTEFHUykgLU9zIgoKU3VyZSwgYnV0IHdoeSBkbyB3ZSBl
dmVuIG5lZWQgdG8gYnVpbGQgdGhlIG1vZHVsZXMgaW4gdGhlIGhvc3QgdmVyc2lvbgp0byBiZWdp
biB3aXRoPwoKV2Ugc2hvdWxkIHByb2JhYmx5IGJ1aWxkIHRoZSBob3N0IHZlcnNpb24gd2l0aCAt
LXdpdGgtcGxhdGZvcm09bm9uZSBJCnRoaW5rLgoKWWVzLCB3ZSBkbyBjdXJyZW50bHkgdXNlIGNk
Ym9vdC5pbWcgZnJvbSB0aGUgaG9zdCwgYnV0IHRoYXQgaXMgcHJvYmFibHkKYSBtaXN0YWtlIGFu
ZCBhIHJlbW5hbnQgZm9yIGxvbmcgYWdvLi4uIEluc3RlYWQsIEkgdGhpbmsgd2Ugc2hvdWxkIG9u
bHkKdXNlZCBtb2R1bGVzIGZyb20gdGhlIHRhcmdldCBidWlsZC4KClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgo+ICBHUlVCMl9DT05GX0VOViA9IFwKPiAgICAgICAgIENQUD0iJChUQVJHRVRfQ0Mp
IC1FIiBcCj4gCj4gUmVnYXJkcywKPiBQZXRlcgo+IAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgeW91
ciBoZWxwIHNvIGZhciEgSSdsbCByZWZlcmVuY2UgdGhpcyBpbiB0aGUgaXNzdWUgYXQgaHR0cHM6
Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDI4MS4KPiA+Cj4gPiBCZXN0IHJl
Z2FyZHMsCj4gPiBTdGVmYW4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
