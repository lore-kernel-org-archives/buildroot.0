Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 13:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80653813F0;
	Mon, 17 Jan 2022 13:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNf0zn4MEiED; Mon, 17 Jan 2022 13:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB11C813F7;
	Mon, 17 Jan 2022 13:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43041BF3EE
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 13:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D463404AA
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 13:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="rWnow7wz";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="J1ziD5X9"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNHLt1-2SvyE for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 13:04:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F92040190
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 13:04:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EB5AC5C0C42;
 Mon, 17 Jan 2022 08:04:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 17 Jan 2022 08:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
 hTQbLSos6XdU6ZD75dydSE+vkdim0zyLe0Hj18oQ/E=; b=rWnow7wzWHm1wPfw6
 tfYgJwNMUA20D+rsE4ubhia8drk19+STx4lCOIx1l79vGtbvdKWzt8JJG4c7Mk5T
 SY3uk5A1blg0TmElfV1bxfGaQkQNtbhLBf+7JIF+L7AdKnXVZlYAHuPxP1utBL6K
 iQeWEqdW2yXAK2XqNNNVQ1QP3tHmmd1QknruoOkBO4ew9TVIyUPM+HdaHmlilN4k
 ojMua3F3e3pE5U+T90yjN8cGBU6JQKS3JYRIpC+4hkR3qwo3pdw9bErEdlg9ZUvq
 45psBqlJV50EhGBbWQqZU5lHuCHfk8uAq0EfB78WJLHMMgl3SY4Sxdo/zPTYDSTm
 FYjiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=phTQbLSos6XdU6ZD75dydSE+vkdim0zyLe0Hj18oQ
 /E=; b=J1ziD5X9dPtfYky52/FtF8GAnlDbYDhTsdLK5Aj1KeIfdE10RrnsCBubl
 ZQ/FzZrDZL05RmuPXybKYLcxWFPrs2Z8+lX03s0azdPV9KXHC0x69aUaJ2Rt3qU1
 BCnZ9zvHjzWrsBVgtFdtHmaU/dXrwkHo2RWJ9fSKPCag7gENUO40LtdV29jImEI2
 3bDPiy2VRRceWpNUK36fn9tcbNTN1S1JarbI6LZLqWlORq5+sAKa3t4xb8wfkbpe
 F/HihqxOlEyF8a4iE9vVH4vhuwzvB7feGmSZ8sK0ugSXGTkTBbzUHmNR3Vf0B8g4
 5Cfx4GsTUTFhWD7Y5PoZHRmXj55kw==
X-ME-Sender: <xms:QGnlYeJsERJ6yEJu0-XOiBfxouXyn-9mnQsKlLdYMweAij5bsXWzjQ>
 <xme:QGnlYWKEjP2m9Sf4Z24X3OCTbO9X5Pjje5uGQB5i6452SdjYwes6BuB_dDnhoi5aY
 p1a_A2NgUxFoNuX>
X-ME-Received: <xmr:QGnlYevBfDG6h4lElXpis9Mz42A9BvelK_bPhzFFlc_yqHC3uLWWw6qseQDATof-QRqjX8iphGT57exoV2GDJF0O8vsXRwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuhffvfhgjtgfgsehtkeertddtfeejnecuhfhrohhmpeffrghnihhl
 ohcuuegrrhhgvghnuceomhgrihhlsegusghrghhnrdgthheqnecuggftrfgrthhtvghrnh
 epleevteefgfffhfeiieeltdefvedvlefgtdekvdegvdeffeetueelteejuddujeeunecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:QGnlYTYf3_t2AVPQzAmZT4AoZlaVX3zBraXXV0c3epIB4vYcEGh9vw>
 <xmx:QGnlYVaSFoqb01eUQ3R7eXW-Es-u6-9NWA5Rvfr6ozTynyj6_nMeiw>
 <xmx:QGnlYfAuRA8WOvC5jiqztfH3u9ZQozUa5zqIYB0p00-oKlXZXOs4Sg>
 <xmx:QGnlYUlUBR-m9QcyEFUOvRf17JGK_wGSLEd4I4tI9fQDq1JBICkNXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jan 2022 08:03:59 -0500 (EST)
Message-ID: <417e5e0b-0944-05ee-1d80-c5b57d64e6b2@dbrgn.ch>
Date: Mon, 17 Jan 2022 14:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Danilo Bargen <mail@dbrgn.ch>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220117105017.28d6aacc@c3po> <20220117102450.GC2313964@scaer>
 <03d2153b-9a56-98d7-75d4-d447b3a8e303@dbrgn.ch>
In-Reply-To: <03d2153b-9a56-98d7-75d4-d447b3a8e303@dbrgn.ch>
Subject: Re: [Buildroot] DMARC on this mailing list
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBTdHJhbmdlLCB3aGVuIEkgdmlldyB5b3VyIGUtbWFpbCAoY29taW5nIGZyb20gdGhlIE1MLCBj
b250YWluaW5nIHRoZSAKPiAiYnVpbGRyb290IG1haWxpbmcgbGlzdCIgZm9vdGVyKSByYXcgZGF0
YSwgSSBzdGlsbCBzZWUgeW91ciBhZGRyZXNzIGluIAo+IHRoZSAiRnJvbSItSGVhZGVyLCBhbmQg
bm90IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOgo+IAo+ICDCoCBGcm9tOiAiWWFubiBFLiBNT1JJ
TiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgoKVGhlIGxvcmUua2VybmVsLm9yZyBhcmNoaXZl
IHNlZW1zIHRvIGNvbmZpcm0gdGhpcywgIkZyb20iLWhlYWRlciBpcyBub3QgCnJld3JpdHRlbjoK
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIyMDExNzEwMjQ1MC5HQzIzMTM5
NjRAc2NhZXIvCgpIb3dldmVyLCBmb3IgdGhlIGFyY2hpdmUgZW50cnkgeW91IHNlbnQsIGl0IGRv
ZXMgbG9vayBjb3JyZWN0LCB3aXRoIGEgCnJld3JpdHRlbiAiRnJvbSItaGVhZGVyOgoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjIwMTE1MTAxNDE1Ljk4NjEyM0Y0MUVAZXhp
dDEtdXMubXNnc2FmZS5pby8KCkknbSBub3Qgc3VyZSB3aGF0IHRoZSByZWFzb24gZm9yIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlc2UgdHdvIAplLW1haWxzIGlzLgoKRGFuaWxvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
