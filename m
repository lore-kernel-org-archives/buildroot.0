Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA757C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA5340246;
	Sun,  8 May 2022 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBvRTeczz7C8; Sun,  8 May 2022 21:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551364021D;
	Sun,  8 May 2022 21:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 208DF1BF38B
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 21:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1CC60AFC
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 21:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oxiq3oaSVF5c for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 21:38:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 898AF60AEB
 for <buildroot@buildroot.org>; Sun,  8 May 2022 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652045903;
 bh=Nu3wyWO8tHwpj/EeTF0ac8W9t1QpaSkcJRgxJ0SIJeU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=E+ahZndJsFQxYERj2fPmIxAs89AldipQxzInKqWTLrHZMrLuFe8v4yzzzkQzLIbX/
 bwYkJmJNpUuDmWAHdrJnE5+P2bXYiHEazqFac0I3DVkmmHRRUy5TTfsI3EF6J8Ligv
 S9iibVFZlmgYwfh/1xarBruJdNiiKomAy0/ik1Lo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26vL-1nlsnO2Tm5-002aaw; Sun, 08
 May 2022 23:38:23 +0200
Date: Sun, 8 May 2022 23:38:09 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Message-ID: <20220508233809.61d5d2a2@gmx.net>
In-Reply-To: <379b85295cffd8c19ca02051849d946a24a915de.camel@iki.fi>
References: <379b85295cffd8c19ca02051849d946a24a915de.camel@iki.fi>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:3kvNTrq0x5ojDo7jTBqv6ULPzLSTUNKsfscSScJ7xJMG03LiYWc
 9uIuQr9YqPGAZfcOBufSeMawl9VdV9GFzmQs7le7mpi0GWQFp1Ifi9OtF85Ju7EPWiIDuEF
 6dZa2117ulQ/jWzXFS/OAdMuNKIG8x5mMahyY85kXnmIapPJhy+GQa7G7FFdQhrOzpd9rs3
 LGzued3824xlELDCPoBbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UGr24PizriI=:YbPo37j4Oj1n3F+S6Jd+zR
 XL1z2nDaCmyWy26qxCufaBZv4Q0ExOO/XFDpNT/xWFWvK6h0OFl7CdsGn4tnYMkTX5duvvPNv
 zArcfTe+8JtwD7WmvHuoECmInNsG9A1t7LI2g/I/vzV9wff7QVqW/AVPV4Ra4c924YPcAlLUj
 uRgBdoYBrq0lBiErGPMo5ZE3crXqdVYdAO8QqJNBQns3fAkm0sUBWW5oUHzngQIxvaX+XbeXU
 ccTTvgnQS5SFM6Obsth8Y7D5twOr7GMgzyUA3SxncFIA8j3OSheAl8E/9xg/V+1w2iLWqixz3
 HAG85qZkN1xa89NVokV+WylslVk/1slJ7cj57ua0uTDr2MNf8j8BEjkx/uEpg0iJ+3/LaEVRW
 PhkZ/uW/Og9gqCNZXpFjfB65Ionx0i7DBpFoG5J4GiJ9zAuZ72Be07ZLf8IGFWJDRT3cLnmtM
 OvTLl4AYJSy8KB9k6OcX7mEXwHDtTy1L9oQwTNjEas1caTaHYqEkxLkiK8TYaTqPWdWubNr+c
 H9/Xt5UIKZ0Pk04lXYbcTiqxFxDzpvYCfFXadD4u6WQx/CDPXKfsZ2bFFMtLuNcRkLuUQ+4Es
 WPT8L8wC1P7OeR5usiDB8B+gWDTPNlNbUo8ex1ba5Lk18BSKsOgWRL/xvFPqxMJv32q945ehh
 VAus18as3wIcjgoAfF2ODTL1ep5weXsMviFxm+oHkKDLMDClrdB5zXVvyEH6cyOOb6KEfq681
 i3h/UY4OfwEaRiBMwX1cbd1+Q5CXyNy5G5Fu5EEsVCZ7FeNHjnKODQt0giSY/atV9SdDBF0vT
 oWk1UdQvxWdeC8eoBOFLvwCR5RcYk0trR/O8pRUnTsWf/PToCm/HymgoKe0nQ1aRGSTQPd93L
 n1ZTHa/9Zu9LuCTALi1vhDQeFj4Bx4Nhf3p5lKSL6+gKJv+90BrKXAjvCLEwBX6ggpkUD6oO5
 WzOXYG32J1USJz6hpw10xsKZ1h71q4wwmoGI4MtRTdUch8ppnuKclzaj4NVD133vnA9mpXkMD
 pRkYIJPF4CFvnOdV7JGYqhBtRNcGd0QMIo3q0OfIJ2UBWbuRODA8w9e+XwtypcRp90P8qNsAc
 r3IUMLziHTy6KU=
Subject: Re: [Buildroot] selftests/sgx
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

SGVsbG8gSmFya2tvLAoKT24gU2F0LCAwNyBNYXkgMjAyMiAyMzowMzo1NyArMDMwMCwgSmFya2tv
IFNha2tpbmVuIDxqYXJra28uc2Fra2luZW5AaWtpLmZpPiB3cm90ZToKCj4gSGksCj4gCj4gV2hl
biBzcGVjaWZ5aW5nICJCUjJfUEFDS0FHRV9MSU5VWF9UT09MU19TRUxGVEVTVFM9eSIsIGZvciBz
b21lIHJlYXNvbgo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3NneC8gYnVpbGQgcmVzdWx0cywg
aS5lLiAic2d4OnRlc3Rfc2d4IiwgZG9lcwo+IG5vdCBnZXQgaW5jbHVkZWQgdG8gdGhlIHJvb3Rm
cyBpbWFnZSwgbm9yIGlzIGl0IGxpc3RlZCBpbsKgCj4ga3NlbGZ0ZXN0LWxpc3QudHh0Lgo+IAo+
IElmIEkgbWFudWFsbHkgY29tcGlsZSBhbmQgaW5zdGFsbCBzZWxmdGVzdHMsIGl0IGRvZXMgZ2V0
IGluY2x1ZGVkLiBBbnkKPiBpZGVhcyB3aGF0IGNvdWxkIGJlIHdyb25nPwoKRm9yIHdoaWNoIGFy
Y2hpdGVjdHVyZSBkbyB5b3UgKGNyb3NzKSBjb21waWxlICh3aGF0IGlzIHlvdXIgdGFyZ2V0IGFy
Y2hpdGVjdHVyZSk/CgpBY2NvcmRpbmcgdG8gZS5nLiBbMV06CgpbLi4uXQogIDcgQ0FOX0JVSUxE
X1g4Nl82NCA6PSAkKHNoZWxsIC4uL3g4Ni9jaGVja19jYy5zaCAkKENDKSBcCiAgOCAgIApbLi4u
XQogMTkgVEVTVF9DVVNUT01fUFJPR1MgOj0gJChPVVRQVVQpL3Rlc3Rfc2d4CiAyMCAKIDIxIGlm
ZXEgKCQoQ0FOX0JVSUxEX1g4Nl82NCksIDEpCiAyMiBhbGw6ICQoVEVTVF9DVVNUT01fUFJPR1Mp
ICQoT1VUUFVUKS90ZXN0X2VuY2wuZWxmCiAyMyBlbmRpZgpbLi4uXQoKdGVzdF9zZ3ggaXMgb25s
eSBjb21waWxlZCBmb3IgeDg2XzY0IChhbmQvb3IgQ0FOX0JVSUxEX1g4Nl82NCBpcyB0cnVlKS4u
LgoKUmVnYXJkcywKUGV0ZXIKClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L3RyZWUvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvc2d4L01ha2VmaWxlP2g9djUuMTcuNQoKCj4gCj4gQlIsIEphcmtrbwo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
