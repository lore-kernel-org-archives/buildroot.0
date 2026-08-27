Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A159C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43926407FE;
	Thu, 27 Aug 2026 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXNFapS1jwW2; Thu, 27 Aug 2026 20:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787863434;
	bh=4AUByk4D3j3MKxdDWGRo+PB6/ctm0qWhTP1eoZ1FzQ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n/AqsHC+aZ14foeMCffgEzdEEZ3pL/6o5k8nTWAhpbV0Vt4BMDy+/KvAZfyakqASl
	 AADvk6CXrL4arAz01NveluvmrNfVCB6pxVCqesfGB5KTIsNcB02WBgD0R0qnYMPI7C
	 cIcB+B63pvb0gAsPuJCoB/UcHjXsS2DNn2oWE4B6AkcYK45cAZzWScgzL15Jj3+zP+
	 aoNNKfgGsNSKsR2QdAmBG2Swe7Oym6ik9/nyDQ3ZFE+U2r2B6QZHnjLqFqQBIShigd
	 IwyhOnOXyiPc8IunRY7LR3CLaBH18e21Z/HCKHVmFTXIXDFCpNFzn4GI+YiCzV+kZy
	 X7OIbVAe3xMMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE3040641;
	Thu, 27 Aug 2026 20:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DDB9466
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B33C80EEA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXvucmp5nAUD for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B23E880CF8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:43:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BF14FB0054E;
 Thu, 27 Aug 2026 22:43:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 22:43:44 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:43:44 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260826141337.4035888-1-thomas.petazzoni@bootlin.com>
References: <20260826141337.4035888-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <dcdd783ea4c1670ae760b0e08b235ce3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix build issue with gcc <
 13
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

T24gMjYvMDgvMjAyNiAxNjoxMywgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFNpbmNlIHVwc3RyZWFtIGNvbW1pdAo+IGU0MmUzMTkzMTM3ZDFiMjFlODRiNDk5MzM2ZTdh
ODg4N2I4YTg2ODkgKCJpbnRlbDogYWRkIEpheSIpLCBhIEMyMwo+IGNvbnN0cnVjdCBpcyB1c2Vk
IGluIHRoZSBpbnRlbCBkcml2ZXIgY29kZToKPiAKPiBlbnVtIGpheV9wcmVkaWNhdGlvbiA6IHVp
bnQ4X3QKPiAKPiBUaGlzIGNhdXNlcyBhIGJ1aWxkIGlzc3VlIHdpdGggR0NDIDwgMTM6Cj4gCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9pbnRlbC9jb21waWxlci9qYXkvamF5X2J1aWxk
ZXIuaDoxMiwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vc3JjL2ludGVsL2NvbXBpbGVyL2ph
eS9qYXlfZnJvbV9uaXIuYzoyMzoKPiAuLi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5o
OjU4MjoyMjogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgCj4gb3Ig4oCYKOKAmSBiZWZvcmUg
4oCYOuKAmSB0b2tlbgo+ICAgNTgyIHwgZW51bSBqYXlfcHJlZGljYXRpb24gOiB1aW50OF90IHsK
PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF4KPiAuLi9zcmMvaW50ZWwvY29tcGlsZXIv
amF5L2pheV9pci5oOjYzNzoyNTogZXJyb3I6IGZpZWxkIOKAmHByZWRpY2F0aW9u4oCZIAo+IGhh
cyBpbmNvbXBsZXRlIHR5cGUKPiAgIDYzNyB8ICAgIGVudW0gamF5X3ByZWRpY2F0aW9uIHByZWRp
Y2F0aW9uOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KPiAK
PiBXZSBmaXggdGhhdCBieSBpbnRlZ3JhdGluZyBhIHBhdGNoIGFscmVhZHkgYXZhaWxhYmxlIGlu
Cj4gT3BlbkVtYmVkZGVkLiBJdCBjaGFuZ2VzIHRoZSBjb2RlIHRvIG5vdCB1c2UgdGhlIEMyMyBj
b25zdHJ1Y3QuCj4gCj4gVGhpcyBidWlsZCBpc3N1ZSB3YXMgZW5jb3VudGVyZWQgb24gaG9zdC1t
ZXNhM2Qgd2hpbGUgYnVpbGRpbmcgYW4KPiBhbGx5ZXNwYWNrYWdlY29uZmlnIGNvbmZpZ3VyYXRp
b24gaW5zaWRlIG91ciBzdGFuZGFyZCBEb2NrZXIKPiBjb250YWluZXIuCj4gCj4gQnVpbGRyb290
IGNvbW1pdAo+IGMwNzNjOTc2MTc5MDIxYzg0ZTBjODRmNmYyM2U5MzhiNDM3ODNlNzUgKCJwYWNr
YWdlL3ttZXNhM2QsCj4gbWVzYTNkLWhlYWRlcnN9OiBidW1wIHZlcnNpb24gdG8gMjYuMS4wIikg
dGhhdCBzd2l0Y2hlZCB0byBtZXNhM2QKPiAyNi4xLjAsIHdoaWNoIGNvbnRhaW5zIHRoZSBwcm9i
bGVtYXRpYyBjb21taXQuIFRoZXJlZm9yZSAyMDI2LjA1IGlzCj4gYWZmZWN0ZWQsIGJ1dCBub3Qg
ZWFybGllciBCdWlsZHJvb3QgdmVyc2lvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
