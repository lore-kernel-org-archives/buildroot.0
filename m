Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADA1CD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 07:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9986942B75;
	Mon, 18 May 2026 07:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKyOYIjU6738; Mon, 18 May 2026 07:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A1342B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779089252;
	bh=ak2oqIfUEJPkA1pRImwuN+MglY0XJM+qtCzVUjkh2Z0=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYUdDvmVDiM42SYWCStYOjwhAX6VuhWfam9+twqki8RV+LEzRqjJRAzDyQQ48yqTm
	 lC5vSSL8qxLypzjZlIiBrLhqYlkc6ZIlovcqsybklrp8p6JmRgzDe5TQPG3Vi1mSix
	 gS07pz60NAkJSnQrzVzaIUpOTk88FKyb07BZB4eVOUhSSoNz9yWJ/SOui/2ERc5V80
	 qeJ3Z8/tK/nhc7pYESDSM9D6KljXljvKlukIl5xplFV0O2kqpiq/AEU3Vt7xVRSa5V
	 WUWUAq568VhqJfA15q/jL0jzUIpGmJhObJUXE2Ss1bcAZrYpdlUnbwzEtviYxVH3k5
	 NNxW7AoRIgO0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A1342B7E;
	Mon, 18 May 2026 07:27:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2870A265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1942042B7E
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KI3r80oDQN_s for <buildroot@buildroot.org>;
 Mon, 18 May 2026 07:27:30 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 May 2026 07:27:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DF1A42B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF1A42B75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.74;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF1A42B75
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:27:28 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [212.227.15.153]) with ESMTPSA (Nemesis) id 1N7yz7-1xSTVt0tnv-00sjBX for
 <buildroot@buildroot.org>; Mon, 18 May 2026 09:22:22 +0200
Message-ID: <e90a9b79-9f95-4a2a-b2f5-d37b8c3ebac2@green-communications.fr>
Date: Mon, 18 May 2026 09:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <6a0a857a.ac75277f.2ba7f3.42f2@mx.google.com>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <6a0a857a.ac75277f.2ba7f3.42f2@mx.google.com>
X-Provags-ID: V03:K1:c/IYKSdVpW3M85yy+BcrDL5T6BN8ILeKOLfAQYklNYROAjLGF41
 D+NCJ1se0lkW/x+ehcy3hJ2/IJulQgdtEGGcinewNgaFqHfd7Rc0bR6Hr13pzlMP3ZBXxLA
 fsBYiJ/0VxkmH0KP4o+bn99ZcYr85FoKND+S4w1ruxGJffq/k5Lnjk0PtdIYIpdisCEAyGd
 Ji5+LFXm+/nmsO0mG+57g==
UI-OutboundReport: notjunk:1;M01:P0:j0vKxSlfDpA=;hix2EmunKZl6CwqBNIEkQFx9fVU
 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
 =
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-05-17
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTgvMDUvMjAyNiDDoCAwNToyMCwgQnVpbGRyb290IE5vdGlmaWNhdGlvbnMgYSDDqWNyaXTC
oDoKPiBQYWNrYWdlcyBoYXZpbmcgYSBuZXdlciB2ZXJzaW9uCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQoKVGhpcyBwYXJ0IG5lZWQgdG8gdGFyZ2V0IHRoZSBuZXh0IGJyYW5jaCBu
b3cuICBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgdGhpcyAKbXVzdCBiZSBkb25lIG1hbnVhbGx5
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
