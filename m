Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34E8C5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B5CB608F8;
	Tue, 11 Aug 2026 19:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE-4Ph6NNpZC; Tue, 11 Aug 2026 19:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F367560819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475371;
	bh=mw2HPYd+xlkldr38/htVkRPX2XQuf8mEMgYYoXpKz9c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JMpWu1B0i/Fk9FeUXMEwLXG4SVc8SumrBLWTMQ8T5KzQF+LPigVlXFOhuBI15mzcR
	 WH9hyZSjtWvHWD8zENcAM2coDt2W1wUhxlzMg7CgnNn3r5TxJe48Oco00IubzTvhuU
	 ie23tT+XxRcpmDnHBUiiOuFqSF/Ic5hyKejKvfjXZKPBN1m4ssVSP9o1ul8mTZUA8p
	 x4TLF1qN51iMOfAecvtQUDh6rjtV0KcIYuTANY79RAYVVqnKmxRGq7hn7qNmuwflBf
	 GUDhB9ZMdfpcu3qQZRW2iFwuOsfiTu9jhsbumjl8Yjq6D0BRC6hAtGbYzzdEBI/RQG
	 qLNCImuwrfQUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F367560819;
	Tue, 11 Aug 2026 19:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC22E3A4
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDFF540426
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AROrers28pXW for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:09:29 +0000 (UTC)
X-Greylist: delayed 600 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 11 Aug 2026 19:09:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0518940483
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0518940483
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.10;
 helo=smtpfb2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0518940483
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:09:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 0853E4C3D3
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:52:36 +0200 (CEST)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 789AA13F879;
 Tue, 11 Aug 2026 20:52:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Aug 2026 20:52:31 +0200
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 20:52:31 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260811-add_missing_tests_in_developpers-v1-1-4ee158838089@bootlin.com>
References: <20260811-add_missing_tests_in_developpers-v1-1-4ee158838089@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <9ce515ccb3cb8c18ebdd792b51b91e5b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786474353;
 bh=cl1Z6bXgAArN7+FDOCS8uT3YOx7qSXG+CgJnqUyREOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qYm+G5ZFMOA129Y7nkQVUCCqdvRDBn0Hw+q/ohZGSz3ASMIlBoCD9vc2+kCG6y+GK
 vSv8M+mYZ6ous8vfo4gCwMq6Aoqy9T3LYDHNrdNVGV4lCgm/r/yalADjWcE7rV88p4
 C9ReyYWIRY8W2D32EUR4DhNCuNjyJHtqUq4Q+ME29ThX2IJDGK6Kw6bUNw8VQsdD/G
 YKgvecYH56UcTtCYl4J0yPQdt+6DX59EqgQdXzw1bFHDZHZoJyNK3YHL5hPXdT9xPL
 inBEYV9E2ufJBAazwVSJTxOUtTlC93hu6AJPDWd+pz/hTtATBbJQyUhAh/oa2UGPAS
 1iISPohMy74Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qYm+G5ZF
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_add_Alexis_Lotho?=
 =?utf-8?q?r=C3=A9_for_libldns_and_python=5Fscp_tests?=
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

T24gMTEvMDgvMjAyNiAxNjo0MCwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gV2hlbiBhZGRpbmcgdGhlIGxpYmxkbnMgYW5kIHB5dGhvbl9zY3AsIHRoZSBjb3JyZXNwb25k
aW5nIHRlc3RzIHdlcmUgCj4gbm90Cj4gYWRkZWQgdG8gREVWRUxPUEVSUywgcHJldmVudGluZyBj
b3JyZWN0IG5vdGlmaWNhdGlvbnMgaW4gY2FzZSBvZiB0ZXN0cwo+IGZhaWx1cmVzLgo+IAo+IEFk
ZCB0aGUgbWlzc2luZyBlbnRyaWVzIHRvIGVuYWJsZSBwcm9wZXIgYXV0aG9yIG5vdGlmaWNhdGlv
bnMgaW4gY2FzZSAKPiBvZgo+IGZhaWxpbmcgdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxl
eGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
