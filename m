Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8318DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 19:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0B461004
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 19:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E0B461004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D285E40487;
	Fri, 20 Aug 2021 19:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4uXqLvPCf4X; Fri, 20 Aug 2021 19:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCFBA4048C;
	Fri, 20 Aug 2021 19:17:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 328E01BF84C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C55140139
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N91sj6ol57U2 for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 19:17:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FF2A400AF
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 19:17:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fd65:b012:ebca:84c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 612E05FF20;
 Fri, 20 Aug 2021 21:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629487024;
 bh=LaFM4d4zm0KQrP9Pc9hpgMT4ez1b/wzsD+6KuSFl4+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7AbFGBypohMZH+jDXFdwR7+OXlBMpUljMhFOkcEp+tdPbAbBsdDIFqWBJ8bT+1FF
 aqtcVZnknzF2+MEOU2JcP7wuU6cwe4r0vLgd3vvREG4B81JNaqOmC6SLYb6ExitPjf
 4BO2AzPLb0uVWXJZEsp6shfG2Fjnah9MsSU8SxLiDPeSKT3QFeyWzy/P7WGhDfwh1W
 gmGQOLyn1ZNX3jSgjHm1JPWCqH39gP3+sXrSTmPXEjdr2UbwqI0XebUCmFPi7d+gUu
 gn75Qru5NEidxFIv3z73/jtstXxlZsqd2neOJ5Pb31breDJI/zjk6oDa23DYVdsrBy
 Au22PllUpSP7A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 21:16:56 +0200
Date: Fri, 20 Aug 2021 21:16:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210820191656.GS27036@scaer>
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
 <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/libselinux: Add autorelabel for
 first boot
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
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sm9zw6ksIEFsbCwKCitNYXR0aGV3ICtBZGFtLCBvdXIgcmVzaWRlbnQgU0VMaW51eCBleHBlcnRz
OiBxdWVzdGlvbnMgZm9yIHlvdSB0b3dhcmQKdGhlIGVuZC4uLgoKKHJlc2VuZCBhcyBJIGFjdXRh
bGx5IGZvcmdvdCB0byBhZGQgdGhlbSkKCk9uIDIwMjEtMDgtMjAgMTU6MTkgKzAzMDAsIEpvc8Op
IFBla2thcmluZW4gc3Bha2UgdGh1c2x5Ogo+IE9uIEZyaSwgQXVnIDIwLCAyMDIxIGF0IDEyOjA1
IEFNIFlhbm4gRS4gTU9SSU4gPCBbMV15YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4g
PiBPbiAyMDIxLTA4LTE5IDEyOjI5ICswMzAwLCBKb3PDqSBQZWtrYXJpbmVuIHNwYWtlIHRodXNs
eToKPiA+ID4gQ3VycmVudGx5IGJ1aWxkcm9vdCBzaGlwIGxpYnNlbGludXggd2l0aG91dCB0cmln
Z2VyaW5nCj4gPiA+IHRoaXMgb3B0aW9uLCB3aGljaCBvZnRlbiBzaG93cyBpbmNvbnNpc3RlbmNp
ZXMgYmV0d2Vlbgo+ID4gPiB3aGF0IHRoZSByZWZwb2xpY3kgZGVmaW5lcyBhcyBhIGxhYmVsIGZv
ciBhIGZpbGUgYW5kCj4gPiA+IHdoYXQgdGhlIGFjdHVhbCBmaWxlIGhhcy4gVHJpZ2dlcmluZyBh
biBpbml0aWFsIHJlbGFiZWwKPiA+ID4gd291bGQgaGVscCBhY3RpdmF0aW5nIGVuZm9yY2luZyBz
dGF0ZSByaWdodCBhd2F5IHdpdGhvdXQKPiA+ID4gcmVxdWlyaW5nIHRvIGVudGVyIGl0IG9uY2Ug
aW4gcGVybWlzc2l2ZSBhbmQgdHdlYWsgdGhlCj4gPiA+IGxhYmVscy4KWy0tU05JUC0tXQo+ID4g
SXNuJ3QgdGhpcyBnb2luZyB0byBmYWlsIG9uIHJlYWQtb25seSBmaWxlc3lzdGVtcz8gUmVsYWJl
bGxpbmcgc3Vwb3NlZGx5Cj4gPiByZXF1aXJlcyB0aGF0IGV4dGVuZGVkIGF0dHJpYnV0ZXMgYmUg
YWRkZWQvdXBkYXRlZC9yZW1vdmVkLCBhbmQgdGhhdAo+ID4gcmVxdWlyZXMgYSByZWFkLXdyaXRl
IGZpbGVzeXN0ZW0uLi4KPiA+IENhbid0IHdlIGRvIHRoZSByZS1sYWJlbGxpbmcgYXQgdGhlIHRp
bWUgd2UgY3JlYXRlIHRoZSBmaWxlc3lzdGVtLCBpLmUuCj4gPiBpbiBmcy9jb21tb24ubWs/Cj4g
PiBBbmQgaXQgc2VlbXMgd2UgYWxyZWFkeSBoYXZlIHRoYXQ6ClstLVNOSVAtLV0KPiA+IFNvIHdo
eSBpcyB0aGUgbGFiZWxsaW5nIHdyb25nPyBDYW4ndCB3ZSBmaXggaXQgcmlnaHQgdGhlcmUgcmF0
aGVyIHRoYW4KPiA+IGF0IHJ1bnRpbWU/Cj4gSXQncyBpcyBub3Qgd3JvbmcsIGl0IHdhcyBqdXN0
IHVubm90aWNlZCBieSBteSBleWViYWxscywKCjotKQoKPiBob3dldmVyLCB0aGVyZSBpcyBhIGNh
c2UgdGhpcyBpcyBub3QgY292ZXJpbmcgcHJvcGVybHkgYW5kIHByZXZlbnRpbmcKPiB0aGUgdXNl
cnNwYWNlIHRvIHJ1biByaWdodCBhd2F5IGluIGVuZm9yY2luZyBtb2RlLCBiZWNhdXNlIGF0Cj4g
dGhpcyB0aW1lIG5vdCBhbGwgZmlsZXMgaW4gL2RldiBhcmUgcG9wdWxhdGVkLCBhbmQgcnVubmlu
ZyBpdCBpbgo+IHBlcm1pc3NpdmUgbW9kZSBtdWx0aXBsZSBjb21wbGFpbnMgZnJvbSBzZWxpbnV4
IHRvIHRoZSBzZXJpYWwKPiBkZXZpY2VzIHR1cm4gdXAuIElmIHlvdSBoYXZlIHNvbWUgc3VnZ2Vz
dGlvbnMgaG93IHdlIGNhbgo+IGltcHJvdmUgdGhpcyBjYXNlLCBJJ20gaGFwcHkgdG8gYnJpbmcg
bW9yZSBjaGFuZ2VzLgoKV2hhdCBJIHVuZGVyc3RhbmQgZnJvbSB5b3VyIGV4cGxhbmF0aW9ucywg
YWJvdmUsIGlzIHRoYXQgd2UgaGF2ZSB0byBoYXZlCnNvbWUgbGFiZWxzIChpLmUuIGV4dGVuZGVk
IGF0dHJpYnV0ZXMpIHNldCBvbiBmaWxlcyBpbiAvZGV2LCBvciB0aGUKcG9saWN5IG1heSByZWZl
cmVuY2Ugb2JqZWN0cyB0aGF0IGFyZSBub3QgcHJvcGVybHkgbGFiZWxlZC4KCk9LLCBzbyB0aGlz
IGhpdCB0aGUgdGhpY2sgd2FsbCBjaXJjbGluZyBhcm91bmQgbXkgdmVyeSBsaW1pdGVkIGtub3ds
ZWRnZQpvZiBob3cgU0VMaW51eCB3b3Jrcy4KCk1hdHRoZXcsIEFkYW0sIGFueSBoZWxwL2V4cGxh
bmF0aW9ucy9kZXRhaWxzL3JldmlldyB3b3VsZCBiZSBtdWNoIHdlbGNvbWUuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
