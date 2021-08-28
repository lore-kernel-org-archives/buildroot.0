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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C15C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 17:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B8F160C3E
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 17:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B8F160C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7CB82B1B;
	Sat, 28 Aug 2021 17:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWOnfLfq0mk1; Sat, 28 Aug 2021 17:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8318282AF8;
	Sat, 28 Aug 2021 17:40:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29E541BF3A9
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 17:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18C8D40172
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 17:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdwTcAvLdJYM for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 17:40:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FA3C400EB
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 17:40:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B0EF3780331;
 Sat, 28 Aug 2021 19:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630172406;
 bh=vnTyCdD9uZrp7A04bUnwcjRpGp8ItgJt5P7lVHo9+VY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCbptqcywBMP++oGrRGQ+RPVlcNy1dOf7SIyVB91RktdrItA6VdVWYar4W/SzEV/j
 a0R/+utS/vnl5Fgn1FK8FO66HzzqxkEop0kIoJpqnZg0FVQVf00nkDSuQWZd6csKfL
 Wpi0bRq4CIQYOjhfPIQ9t7apqYGv2lVVQxfMXV3RWq5lJbhtUCZYUNshzFquLhGWwl
 /NjL4aaG1X4P8jKtyW2ugN2Z6i07LqfAv3mFgkahLEI6vh7wl7zcrUCkMmN5pkN56E
 ANv+N1NgO6JnEhzlj6/bHI+p46tPhYjGFaHlVYtQQ8Ie2AU3/9W78FzepLw8ZGC4hS
 B5g7vun4j7tZg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 19:39:51 +0200
Date: Sat, 28 Aug 2021 19:39:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210828173951.GP2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-6-herve.codina@bootlin.com>
 <20210828163824.GO2661@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828163824.GO2661@scaer>
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

SGVydsOpLCBBbGwsIAoKT24gMjAyMS0wOC0yOCAxODozOCArMDIwMCwgWWFubiBFLiBNT1JJTiBz
cGFrZSB0aHVzbHk6Cj4gT24gMjAyMS0wOC0xNyAxMDozOSArMDIwMCwgSGVydmUgQ29kaW5hIHNw
YWtlIHRodXNseToKPiA+IEZyb206IEFuZHJlYXMgTmF1bWFubiA8YW5hdW1hbm5AdWx0cmF0cm9u
aWsuZGU+Cj4gPiAKPiA+IFdoZW4gdXNpbmcgdG9wIGxldmVsIHBhcmFsbGVsIGJ1aWxkLCBpbmRl
cGVuZGVudCBxdDUgcGFja2FnZXMgbWF5IGJlCj4gPiBidWlsdCBpbiBwYXJhbGxlbC4gQmVjYXVz
ZSBvZiB0aGVpciBzdGFnaW5nIGRpcnMgYmVpbmcgaGFyZGxpbmtlZCwgdGhleQo+ID4gYWxsIHVz
ZSB0aGUgc2FtZSBxdC5jb25mIGZpbGUgdG8gbWFuaXB1bGF0ZSBkdXJpbmcgY29uZmlndXJlLCB3
aGlsZQo+ID4gYW5vdGhlciBxdDUgcGFja2FnZSBtaWdodCBhbHJlYWR5IHVzZSBpdC4gVGhpcyBs
ZWFkcyB0byB3ZWlyZCBidWlsZCBmYWlsdXJlcwo+ID4gYmVjYXVzZSB0aGUgZm9sZGVycyBxbWFr
ZSBpcyB1c2luZyBhcmUgZGl2ZXJ0ZWQgaW4gZXJyYXRpYyB3YXlzLgo+ID4gRml4IHRoaXMgYnkg
YWN0dWFsbHkgcmVjcmVhdGluZyBhIG5vbi1zaGFyZWQgcXQuY29uZiBmaWxlIGZvciBldmVyeSBw
YWNrYWdlLgo+IAo+IEJ1dCB3aXRoIHBhdGNoIDEwIChNYWtlZmlsZTogYnJlYWtzIGhhcmRsaW5r
cyBpbiBnbG9iYWwge1RBUkdFVCwKPiBIT1NUfV9ESVIgb24gcGVyLXBhY2thZ2UgYnVpbGQpLCBp
cyB0aGlzIHBhdGNoIDUgc3RpbGwgbmVlZGVkPwo+IAo+IElJVUMsIHBhdGNoIDEwIG1ha2VzIHRo
ZSBwZXItcGFja2FnZSBkaXJlY3RvcmllcyBhY3R1YWwgY29waWVzIHJhdGhlcgo+IHRoYW4gaGFy
ZGxpbmtzLCBzbyB0aGUgcGVyLXBhY2thZ2UgaG9zdCBkaXJlY3RvcnkgaXMgYSBjb21wbGV0ZSBj
b3B5LAo+IHRodXMgdGhpcyBxdC5jb25mIGlzIG5vIGxvbmdlciBhIGhhcmRsaW5rLi4uCj4gCj4g
RGlkIEkgbWlzcyBzb21ldGhpbmc/CgpZZXMsIEkgbWlzc2VkIHRoYXQgcGF0Y2ggMTAgaXMgbm90
IGFib3V0IGFzc2VtYmxpbmcgdGhlIHBlci1wYWNrYWdlCmRpcmVjdG9yaWVzIGZyb20gdGhlaXIg
ZGVwZW5kZW5jaWVzLCBidXQgdG8gZ2F0aGVyIHRob3NlIHBlci1wYWNrYWdlCmRpcmVjdG9yaWVz
IHRvIGFzc2VtYmxlIHRoZSBmaW5hbCB0YXJnZXQvIGFuZCBob3N0Ly4KClNvLCB5ZXMsIHRoaXMg
cXQ1LmNvbmYgcGF0Y2ggaXMgc3RpbGwgbmVlZGVkLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVh
cyBOYXVtYW5uIDxhbmF1bWFubkB1bHRyYXRyb25pay5kZT4KPiA+IFJldmlld2VkLWJ5OiBIZXJ2
ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gTmV3IHBhdGNo
IGluIHRoaXMgdjMgc2VyaWVzCj4gPiAKPiA+IFRoaXMgcGF0Y2ggd2FzIHByZXZpb3VzbHkgc2Vu
ZCBieSBBbmRyZWFzIE5hdW1hbm4uCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJv
b3QvMjAyMTA2MjMwODM5MjcuODI3OC0xLWFuYXVtYW5uQHVsdHJhdHJvbmlrLmRlLwo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2IxZDBjNWE1LWY3NmYtZTM4ZS0wMjU3LTEz
MDBmNmEzMGVhYkBhbmRpbi5kZS8KPiA+IEFzIHRoaXMgcGF0Y2ggbWFrZXMgc2Vuc2UgaW4gdGhp
cyBzZXJpZXMsIGl0IHdhcyBpbnRlZ3JhdGVkIGluIHRoaXMgdjMgdmVyc2lvbi4KPiA+IAo+ID4g
IHBhY2thZ2UvcXQ1L3F0NS5tayB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1Lm1rIGIvcGFja2FnZS9x
dDUvcXQ1Lm1rCj4gPiBpbmRleCBkYjZjY2QyYjQyLi4zZmZiN2IwMDYzIDEwMDY0NAo+ID4gLS0t
IGEvcGFja2FnZS9xdDUvcXQ1Lm1rCj4gPiArKysgYi9wYWNrYWdlL3F0NS9xdDUubWsKPiA+IEBA
IC0xNSw2ICsxNSw3IEBAIGluY2x1ZGUgJChzb3J0ICQod2lsZGNhcmQgcGFja2FnZS9xdDUvKi8q
Lm1rKSkKPiA+ICAjIGNvbXBpbGVkIGludG8gdGhlIFF0IGxpYnJhcnkuIFdlIG5lZWQgaXQgdG8g
bWFrZSAicW1ha2UiIHJlbG9jYXRhYmxlIGFuZAo+ID4gICMgdHdlYWsgdGhlIHBlci1wYWNrYWdl
IGluc3RhbGwgcGF0aGVzCj4gPiAgZGVmaW5lIFFUNV9JTlNUQUxMX1FUX0NPTkYKPiA+ICsJcm0g
LWYgJChIT1NUX0RJUikvYmluL3F0LmNvbmYKPiA+ICAJc2VkIC1lICJzfEBASE9TVF9ESVJAQHwk
KEhPU1RfRElSKXwiIC1lICJzfEBAU1RBR0lOR19ESVJAQHwkKFNUQUdJTkdfRElSKXwiIFwKPiA+
ICAJCSQoUVQ1QkFTRV9QS0dESVIpL3F0LmNvbmYuaW4gPiAkKEhPU1RfRElSKS9iaW4vcXQuY29u
Zgo+ID4gIGVuZGVmCj4gPiAtLSAKPiA+IDIuMzEuMQo+ID4gCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+ID4gYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
PiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVzeWJv
eC5uZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
