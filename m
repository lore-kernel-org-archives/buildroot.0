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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973C0C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163CE60E97
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 163CE60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9BC240106;
	Sat, 28 Aug 2021 16:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONiLHKNEegA3; Sat, 28 Aug 2021 16:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E7E64016B;
	Sat, 28 Aug 2021 16:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95EF01BF48C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3774037C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5RvNl2ZhoIX for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 16:38:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9C5040318
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 16:38:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4E3247802BE;
 Sat, 28 Aug 2021 18:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630168718;
 bh=HjR9W5Rwlq9qbEJg3Dq+rCnv5zaP6JDuxD1dnvXt0CM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lRn+C6XXARDXuUa1tegDFEBU19OTmCskUo6ee2I4V0hRFksylKnOQtx46OddjAGE7
 Q09yOTbAc/GvaSdMmJ0XVo374+ALb4T5KzD8WUw3fpR31OUV3f8iQTbLJ+hdX646Sl
 Abjb5GHPjiNU0dGiIvKzjbSCpu2XiyMid7GdFvNvdd3yzGLgBUNs/mlS68oFrVotYs
 ph20A4Zazj/HihW+TkxTW5CPVXTaOOM/EZY6vNMSNICtcS4W0vBD/3fpJ7R1mXTjqj
 nnFQ0YbSiQMq+Y1Tr3r4SuZ+adtp8Vs0Sz11ORt9shKWCXafOJ2yRUko00UaY+r9WH
 /3RP117U8C9yA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 18:38:24 +0200
Date: Sat, 28 Aug 2021 18:38:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210828163824.GO2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-6-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-6-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 05/16] qt5: Fix sporadic build failure
 during top-level parallel build
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
Cc: Andreas Naumann <anaumann@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTA4LTE3IDEwOjM5ICswMjAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IEZyb206IEFuZHJlYXMgTmF1bWFubiA8YW5hdW1hbm5AdWx0cmF0cm9uaWsu
ZGU+Cj4gCj4gV2hlbiB1c2luZyB0b3AgbGV2ZWwgcGFyYWxsZWwgYnVpbGQsIGluZGVwZW5kZW50
IHF0NSBwYWNrYWdlcyBtYXkgYmUKPiBidWlsdCBpbiBwYXJhbGxlbC4gQmVjYXVzZSBvZiB0aGVp
ciBzdGFnaW5nIGRpcnMgYmVpbmcgaGFyZGxpbmtlZCwgdGhleQo+IGFsbCB1c2UgdGhlIHNhbWUg
cXQuY29uZiBmaWxlIHRvIG1hbmlwdWxhdGUgZHVyaW5nIGNvbmZpZ3VyZSwgd2hpbGUKPiBhbm90
aGVyIHF0NSBwYWNrYWdlIG1pZ2h0IGFscmVhZHkgdXNlIGl0LiBUaGlzIGxlYWRzIHRvIHdlaXJk
IGJ1aWxkIGZhaWx1cmVzCj4gYmVjYXVzZSB0aGUgZm9sZGVycyBxbWFrZSBpcyB1c2luZyBhcmUg
ZGl2ZXJ0ZWQgaW4gZXJyYXRpYyB3YXlzLgo+IEZpeCB0aGlzIGJ5IGFjdHVhbGx5IHJlY3JlYXRp
bmcgYSBub24tc2hhcmVkIHF0LmNvbmYgZmlsZSBmb3IgZXZlcnkgcGFja2FnZS4KCkJ1dCB3aXRo
IHBhdGNoIDEwIChNYWtlZmlsZTogYnJlYWtzIGhhcmRsaW5rcyBpbiBnbG9iYWwge1RBUkdFVCwK
SE9TVH1fRElSIG9uIHBlci1wYWNrYWdlIGJ1aWxkKSwgaXMgdGhpcyBwYXRjaCA1IHN0aWxsIG5l
ZWRlZD8KCklJVUMsIHBhdGNoIDEwIG1ha2VzIHRoZSBwZXItcGFja2FnZSBkaXJlY3RvcmllcyBh
Y3R1YWwgY29waWVzIHJhdGhlcgp0aGFuIGhhcmRsaW5rcywgc28gdGhlIHBlci1wYWNrYWdlIGhv
c3QgZGlyZWN0b3J5IGlzIGEgY29tcGxldGUgY29weSwKdGh1cyB0aGlzIHF0LmNvbmYgaXMgbm8g
bG9uZ2VyIGEgaGFyZGxpbmsuLi4KCkRpZCBJIG1pc3Mgc29tZXRoaW5nPwoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBOYXVtYW5uIDxhbmF1bWFubkB1
bHRyYXRyb25pay5kZT4KPiBSZXZpZXdlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFA
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gTmV3IHBhdGNoIGluIHRoaXMgdjMgc2VyaWVzCj4gCj4gVGhp
cyBwYXRjaCB3YXMgcHJldmlvdXNseSBzZW5kIGJ5IEFuZHJlYXMgTmF1bWFubi4KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMTA2MjMwODM5MjcuODI3OC0xLWFuYXVtYW5u
QHVsdHJhdHJvbmlrLmRlLwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9iMWQw
YzVhNS1mNzZmLWUzOGUtMDI1Ny0xMzAwZjZhMzBlYWJAYW5kaW4uZGUvCj4gQXMgdGhpcyBwYXRj
aCBtYWtlcyBzZW5zZSBpbiB0aGlzIHNlcmllcywgaXQgd2FzIGludGVncmF0ZWQgaW4gdGhpcyB2
MyB2ZXJzaW9uLgo+IAo+ICBwYWNrYWdlL3F0NS9xdDUubWsgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NS5tayBi
L3BhY2thZ2UvcXQ1L3F0NS5tawo+IGluZGV4IGRiNmNjZDJiNDIuLjNmZmI3YjAwNjMgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9xdDUvcXQ1Lm1rCj4gKysrIGIvcGFja2FnZS9xdDUvcXQ1Lm1rCj4g
QEAgLTE1LDYgKzE1LDcgQEAgaW5jbHVkZSAkKHNvcnQgJCh3aWxkY2FyZCBwYWNrYWdlL3F0NS8q
LyoubWspKQo+ICAjIGNvbXBpbGVkIGludG8gdGhlIFF0IGxpYnJhcnkuIFdlIG5lZWQgaXQgdG8g
bWFrZSAicW1ha2UiIHJlbG9jYXRhYmxlIGFuZAo+ICAjIHR3ZWFrIHRoZSBwZXItcGFja2FnZSBp
bnN0YWxsIHBhdGhlcwo+ICBkZWZpbmUgUVQ1X0lOU1RBTExfUVRfQ09ORgo+ICsJcm0gLWYgJChI
T1NUX0RJUikvYmluL3F0LmNvbmYKPiAgCXNlZCAtZSAic3xAQEhPU1RfRElSQEB8JChIT1NUX0RJ
Uil8IiAtZSAic3xAQFNUQUdJTkdfRElSQEB8JChTVEFHSU5HX0RJUil8IiBcCj4gIAkJJChRVDVC
QVNFX1BLR0RJUikvcXQuY29uZi5pbiA+ICQoSE9TVF9ESVIpL2Jpbi9xdC5jb25mCj4gIGVuZGVm
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
