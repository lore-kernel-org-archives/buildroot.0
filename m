Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E53CCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 22:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469074076C;
	Thu, 14 Aug 2025 22:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SEsnEM38QuZ; Thu, 14 Aug 2025 22:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FCB440768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FCB440768;
	Thu, 14 Aug 2025 22:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 450C6271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3749940768
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFGqvz9J0Ybf for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 22:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 058FD405B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058FD405B7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 058FD405B7
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:08:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1A0FE5FFB4;
 Fri, 15 Aug 2025 00:08:51 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 Aug 2025 00:08:51 +0200
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 00:08:51 +0200
To: Breno Lima <brenomatheus@gmail.com>
Cc: breno.lima@nxp.com, festevam@gmail.com, buildroot@buildroot.org
In-Reply-To: <20250814135042.3472923-1-brenomatheus@gmail.com>
References: <20250814135042.3472923-1-brenomatheus@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <84f9bfcc31103daad67185881e521af2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755209334;
 bh=0EAraX2zPJDFYleHCbWspB4ECQyftmY0pBrffaTETh0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oBrRmGiN3mx1DE3QInh/bdACtKbvqiNBh5jdc/l6KNXr76rm+nyvihnyl0nM7RlB+
 dD4gAaFaISnzHfQvyc5/KA9q4XKA/LhQBMDY3U1bSH5MLYL2WvC8uvr3A3u1KkxrO6
 +kfjpbHZNP2P36OpG3LRu9hLgYgo1h1knzId7vodQ3S2UX0yBCW7ZoMJKPByYIfFXl
 9lK5O1mp9AIrkyqpJVqFyYbqEJcVcpJWMitYTZYS33NI8ryjdcz1ykHxLxdkLut1v+
 IcsG+BFsuAHaK5+HEotDbWxG1/oaWKzgLbPNSitSrPEYVX9eIY/dK+yYduZMX4eBEg
 Om0PxK1o6mGcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oBrRmGiN
Subject: Re: [Buildroot] [PATCH v2] configs/freescale_imx93evk_defconfig:
 Add OP-TEE OS support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTQvMDgvMjAyNSAxNTo1MCwgQnJlbm8gTGltYSB3cm90ZToKPiBGcm9tOiBCcmVubyBMaW1h
IDxicmVuby5saW1hQG54cC5jb20+Cj4gCj4gQWRkIE9QLVRFRSBPUyBTdXBwb3J0LiBOWFAgQlNQ
IGxmLTYuMTIuMy0xLjAuMCB2ZXJzaW9uLgo+IAo+IFRoZSBpLk1YOTMgQm9vdCBDb250YWluZXIg
cmVxdWlyZXMgYSByYXcgVEVFIGJpbmFyeSB3aXRob3V0IGEgVEVFIAo+IGhlYWRlci4KPiBVcGRh
dGUgdGhlIGlteDktYm9vdGxvYWRlci1wcmVwYXJlLnNoIHNjcmlwdCBhbmQgQ29uZmlnLmluIGFj
Y29yZGluZ2x5Cj4gdG8gZW5zdXJlIGNvbXBhdGliaWxpdHkgd2l0aCB0aGlzIHJlcXVpcmVtZW50
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBCcmVubyBMaW1hIDxicmVuby5saW1hQG54cC5jb20+CgpBcHBsaWVk
IHRvIG5leHQsIHRoYW5rcy4KCkZvciBpbmZvLCBJIGNhcnJpZWQgb3ZlciB0aGUgIlJldmlld2Vk
LWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSAKPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPiIKZnJvbSB0aGUgdjEsIHNpbmNlIHRoZXJlIGlzIG5vIG90aGVyIGNoYW5nZXMgYXBhcnQg
dGhlIGhhc2ggZmlsZS4KCkkgYWxzbyBmaXhlZCBhIGNoZWNrLXBhY2thZ2UgZXJyb3IgYnkgcmVt
b3ZpbmcgdGhlIGVtcHR5IG5ldyBsaW5lIGluIHRoZSAKaGFzaCBmaWxlLgoKU2VlOgpodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvYzQ1NzM1OTg4ZWYx
OWFhNzA4NWJjODlhNWU5ZTIzMjcyNDhhYjNlNQoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
