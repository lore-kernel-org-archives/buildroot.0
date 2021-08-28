Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2C3C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B3460EB3
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4B3460EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD3840228;
	Sat, 28 Aug 2021 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Qyn8wggeimr; Sat, 28 Aug 2021 20:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7319940264;
	Sat, 28 Aug 2021 20:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2DF21BF3E5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E815402A8
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkob6s12qXdX for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 20:19:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1536540295
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 20:19:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D936F780316;
 Sat, 28 Aug 2021 22:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630181976;
 bh=Gtk/dIPBGV645IwWvuJS6d882RrWRSGc3XXYr/8ZWFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sW9L9KNZCorzYILqzi3kclFJUIrsJpwEmsGnK8dnSvqNCLlF1cf9B3qTjlubzBGx2
 tWWPPWc8QF1aYXLY5OXd+GvNjnFvrBVRHb/1Ty5R5DuIKNwdWVB6zyB40ypwrG9Bm1
 tYQXuSvWXS8wGuiOAtJEKhArkKKgqBMPy5Pe6WU8Z7suQPURDPxEGsBDwLIZ7sjnx7
 5DH/9orhJU1MBlD9PF7L366IINI+wGeJkMzWbdszSYq9uo0nfWpEfZRNJKVvMnh+bT
 sOt3OzIjh2TZNTOU+iIDCL6nJ3FE6POPbIOKLpt4ztRH0z+OkfxFlD0MJh3u6hrUKz
 lXceM03Nlnzbw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 22:19:21 +0200
Date: Sat, 28 Aug 2021 22:19:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210828201921.GR2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-7-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 06/16] package/pkg-qmake.mk: Move
 QT5_QT_CONF_FIXUP to post-prepare hook
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTA4LTE3IDEwOjM5ICswMjAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IFFUNV9RVF9DT05GX0ZJWFVQIHR3ZWFrcyBmaWxlcyBmb3IgcGVyLXBhY2th
Z2UgZGlyZWN0b3J5IGJ1aWxkLgo+IFRoaXMgaXMgdHlwaWNhbGx5IHRoZSBraW5kIG9mIG9wZXJh
dGlvbiBleHBlY3RlZCB0byBiZSBpbgo+IHBvc3QtcHJlcGFyZSBob29rLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0
byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiBOZXcgcGF0
Y2ggaW4gdGhpcyB2MyBzZXJpZXMuCj4gQXMgc2FpZCBwcmV2aW91c2x5IGluCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2IxZDBjNWE1LWY3NmYtZTM4ZS0wMjU3LTEzMDBmNmEz
MGVhYkBhbmRpbi5kZS8KPiBUaGlzIHBhdGNoIG1vdmVzIFF0NSBmaXh1cCB0byA8UEtHPl9QT1NU
X1BSRVBBUkVfSE9PS1MgKG9sZCA8UEtHPl9QRVJfUEFDS0FHRV9UV0VBS19IT09LUwo+IG1lbnRp
b25lZCBpbiBkaXNjdXNzaW9uKS4KPiAKPiAgcGFja2FnZS9wa2ctcW1ha2UubWsgfCAzICsrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXFtYWtlLm1rIGIvcGFja2FnZS9wa2ctcW1ha2UubWsKPiBp
bmRleCBhNzcyODZmZTNhLi5kZWIwMzNjMWQ2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGtnLXFt
YWtlLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctcW1ha2UubWsKPiBAQCAtNTYsMTMgKzU2LDE0IEBA
ICQoMilfREVQRU5ERU5DSUVTIAkJKz0gaG9zdC1wZXJsCj4gICQoMilfUFJFX0NPTkZJR1VSRV9I
T09LUyAgICAgICAgKz0gUVRfSEVBREVSU19TWU5DX0hPT0sKPiAgZW5kaWYKPiAgCj4gKyQoMilf
UE9TVF9QUkVQQVJFX0hPT0tTICs9IFFUNV9RVF9DT05GX0ZJWFVQCj4gKwo+ICAjCj4gICMgQ29u
ZmlndXJlIHN0ZXAuIE9ubHkgZGVmaW5lIGl0IGlmIG5vdCBhbHJlYWR5IGRlZmluZWQgYnkgdGhl
IHBhY2thZ2UKPiAgIyAubWsgZmlsZS4KPiAgIwo+ICBpZm5kZWYgJCgyKV9DT05GSUdVUkVfQ01E
Uwo+ICBkZWZpbmUgJCgyKV9DT05GSUdVUkVfQ01EUwo+IC0JJCQoUVQ1X1FUX0NPTkZfRklYVVAp
Cj4gIAljZCAkJCgkKDIpX0JVSUxERElSKSAmJiBcCj4gIAkkJChUQVJHRVRfTUFLRV9FTlYpICQk
KCQoMilfQ09ORl9FTlYpICQkKFFUNV9RTUFLRSkgJCQoJCgyKV9DT05GX09QVFMpCj4gIGVuZGVm
Cj4gLS0gCj4gMi4zMS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1c3lib3gu
bmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
