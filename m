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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C41C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA0D60EB3
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FA0D60EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F1E7400EB;
	Sat, 28 Aug 2021 20:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99GsJIsRUXp2; Sat, 28 Aug 2021 20:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E1FD40258;
	Sat, 28 Aug 2021 20:19:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6605B1BF3E5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6243282CD4
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ3ukHVLPtkU for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 20:19:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7319980E92
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 20:19:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6C3AC7802C5;
 Sat, 28 Aug 2021 22:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630181956;
 bh=hBcjFZs7IMGstB7R3PNDoLPx1+n8KiN9rrU6DJwHXCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LA/u9vOYX+kZYHDIme6nZvFAX+4fS1Wql3ZNTCkWuY5j4aWuENT8x5v1BJlETnGMZ
 +l42o7RXYtlXqWBT1voDP2QaoBiGrt9aN6zU9PtKJv6EeBhkaEgV8NDCssrHHGKZ8I
 rLSAy+U2JiZRcEolngBk2TuLXiYihcODqy36R3jFsKJmGe4ath8AWUv+9NwT4p1cka
 4dn71BXaWfQi/K3+AselBUROxCFBYskTFVQtzwar/rWbG29sGAJOjO5nOCG67DZzQC
 jJDhniDC/U+hvUIprLgMJahGsCfUF9Ciza+7bWYexqKRiznkWHmOTJhG6nrsHLm55n
 AIPInb/GRnxkQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 22:19:01 +0200
Date: Sat, 28 Aug 2021 22:19:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210828201901.GQ2661@scaer>
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

SGVydsOpLCBBbmRyZWFzLCBBbGwsCgpPbiAyMDIxLTA4LTE3IDEwOjM5ICswMjAwLCBIZXJ2ZSBD
b2RpbmEgc3Bha2UgdGh1c2x5Ogo+IEZyb206IEFuZHJlYXMgTmF1bWFubiA8YW5hdW1hbm5AdWx0
cmF0cm9uaWsuZGU+Cj4gCj4gV2hlbiB1c2luZyB0b3AgbGV2ZWwgcGFyYWxsZWwgYnVpbGQsIGlu
ZGVwZW5kZW50IHF0NSBwYWNrYWdlcyBtYXkgYmUKPiBidWlsdCBpbiBwYXJhbGxlbC4gQmVjYXVz
ZSBvZiB0aGVpciBzdGFnaW5nIGRpcnMgYmVpbmcgaGFyZGxpbmtlZCwgdGhleQo+IGFsbCB1c2Ug
dGhlIHNhbWUgcXQuY29uZiBmaWxlIHRvIG1hbmlwdWxhdGUgZHVyaW5nIGNvbmZpZ3VyZSwgd2hp
bGUKPiBhbm90aGVyIHF0NSBwYWNrYWdlIG1pZ2h0IGFscmVhZHkgdXNlIGl0LiBUaGlzIGxlYWRz
IHRvIHdlaXJkIGJ1aWxkIGZhaWx1cmVzCj4gYmVjYXVzZSB0aGUgZm9sZGVycyBxbWFrZSBpcyB1
c2luZyBhcmUgZGl2ZXJ0ZWQgaW4gZXJyYXRpYyB3YXlzLgo+IEZpeCB0aGlzIGJ5IGFjdHVhbGx5
IHJlY3JlYXRpbmcgYSBub24tc2hhcmVkIHF0LmNvbmYgZmlsZSBmb3IgZXZlcnkgcGFja2FnZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE5hdW1hbm4gPGFuYXVtYW5uQHVsdHJhdHJvbmlr
LmRlPgo+IFJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNv
bT4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzISA6LSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
Cgo+IC0tLQo+IE5ldyBwYXRjaCBpbiB0aGlzIHYzIHNlcmllcwo+IAo+IFRoaXMgcGF0Y2ggd2Fz
IHByZXZpb3VzbHkgc2VuZCBieSBBbmRyZWFzIE5hdW1hbm4uCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYnVpbGRyb290LzIwMjEwNjIzMDgzOTI3LjgyNzgtMS1hbmF1bWFubkB1bHRyYXRyb25p
ay5kZS8KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvYjFkMGM1YTUtZjc2Zi1l
MzhlLTAyNTctMTMwMGY2YTMwZWFiQGFuZGluLmRlLwo+IEFzIHRoaXMgcGF0Y2ggbWFrZXMgc2Vu
c2UgaW4gdGhpcyBzZXJpZXMsIGl0IHdhcyBpbnRlZ3JhdGVkIGluIHRoaXMgdjMgdmVyc2lvbi4K
PiAKPiAgcGFja2FnZS9xdDUvcXQ1Lm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDUubWsgYi9wYWNrYWdlL3F0
NS9xdDUubWsKPiBpbmRleCBkYjZjY2QyYjQyLi4zZmZiN2IwMDYzIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcXQ1L3F0NS5tawo+ICsrKyBiL3BhY2thZ2UvcXQ1L3F0NS5tawo+IEBAIC0xNSw2ICsx
NSw3IEBAIGluY2x1ZGUgJChzb3J0ICQod2lsZGNhcmQgcGFja2FnZS9xdDUvKi8qLm1rKSkKPiAg
IyBjb21waWxlZCBpbnRvIHRoZSBRdCBsaWJyYXJ5LiBXZSBuZWVkIGl0IHRvIG1ha2UgInFtYWtl
IiByZWxvY2F0YWJsZSBhbmQKPiAgIyB0d2VhayB0aGUgcGVyLXBhY2thZ2UgaW5zdGFsbCBwYXRo
ZXMKPiAgZGVmaW5lIFFUNV9JTlNUQUxMX1FUX0NPTkYKPiArCXJtIC1mICQoSE9TVF9ESVIpL2Jp
bi9xdC5jb25mCj4gIAlzZWQgLWUgInN8QEBIT1NUX0RJUkBAfCQoSE9TVF9ESVIpfCIgLWUgInN8
QEBTVEFHSU5HX0RJUkBAfCQoU1RBR0lOR19ESVIpfCIgXAo+ICAJCSQoUVQ1QkFTRV9QS0dESVIp
L3F0LmNvbmYuaW4gPiAkKEhPU1RfRElSKS9iaW4vcXQuY29uZgo+ICBlbmRlZgo+IC0tIAo+IDIu
MzEuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0dHA6
Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gu
bmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
