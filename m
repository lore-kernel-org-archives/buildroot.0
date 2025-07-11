Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE834C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 12:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941AF40DB1;
	Fri, 11 Jul 2025 12:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7Te_O_rm7pk; Fri, 11 Jul 2025 12:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B866840894
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B866840894;
	Fri, 11 Jul 2025 12:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B82EC114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E78880EC7
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpdxXxlvNhEl for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 12:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E67D80EB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E67D80EB3
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E67D80EB3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:03:26 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 98419C2546
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 14:03:22 +0200 (CEST)
Message-ID: <ff96a71b-edeb-4ca9-ab0b-23f1807d0a65@grenoble.cnrs.fr>
Date: Fri, 11 Jul 2025 14:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <25376ee6-fd6a-4b7c-9aef-905b6f71b316@grenoble.cnrs.fr>
 <20250711104446.823713-1-thomas.perale@mind.be> <87frf3ouji.fsf@tarshish>
Content-Language: en-US, fr
In-Reply-To: <87frf3ouji.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752235402;
 bh=vRsXXf5y9tkePiSx/reJuqbViVnOnNEbP1mZgbyH1U0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=PSs8+dzr2KpAXFEthtNlFYZl5igU//ZcVt5iI+o+ToOXIDYCSG12faJ6CSCFksS4F
 cp68WMaWm4IjKYVmj02iZRASaBJjfBwgwyvpkdadAVAL2Ixqvy9gvd9SSJeOQrBDlR
 XsNhLJbrlOEJEmFNGIMgIDeMegf0d5KnmJBkyaqGoDKkpbkBHN/O61CEw7n3Ns54B4
 KKl8ic2XjVczxHRNgoqIPRKYcGhjwqPWBWqE/D2TK0MuCpDpsC/rQJwXm7qBUznXhP
 Z+LLLjbunpqao3RTM0dG7pL4NcYMRi13DmIWL0anXvGzIGjJuQUYYLAm+u5rRGqW/Q
 ktdWPXwVEuz1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=PSs8+dzr
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix build with
 host GCC 15
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gZXZlcnlib2R5IQoKT24gMTEvMDcvMjAyNSAxMzowNywgQmFydWNoIFNpYWNoIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gSGkgVG9tYXMsCj4gCj4gT24gRnJpLCBKdWwgMTEgMjAyNSwgVGhv
bWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBJbiByZXBseSBvZjoKPj4+IEJ1aWxk
aW5nIGF0OTFib290c3RyYXAzIHdpdGggR0NDMTUgZmFpbHMgd2l0aDoKPj4+Cj4+PiAgICAgaW5j
bHVkZS90eXBlcy5oOjIzOjIzOiBlcnJvcjog4oCYYm9vbOKAmSBjYW5ub3QgYmUgZGVmaW5lZCB2
aWEg4oCYdHlwZWRlZuKAmQo+Pj4gICAgICAgIDIzIHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJv
b2w7Cj4+PiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgo+Pj4gICAgIGlu
Y2x1ZGUvdHlwZXMuaDoyMzoyMzogbm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdvcmQgd2l0aCDi
gJgtc3RkPWMyM+KAmSBvbndhcmRzCj4+Pgo+Pj4gVGhpcyBpcyBkdWUgdG8gR0NDIDE1IGRlZmF1
bHRpbmcgdG8gdGhlIEMyMyBsYW5ndWFnZSBkaWFsZWN0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+Pgo+PiBBcHBsaWVkIHRvIDIw
MjUuMDIueCAmIDIwMjUuMDUueC4gVGhhbmtzCj4gCj4gTm90IGluIDIwMjUuMDIueCBhcyBvZiBj
b21taXQgOTQ2YjdmZjIyODBhYQo+ICgic3VwcG9ydC9kZXBlbmRlbmNpZXMvY2hlY2staG9zdC1j
bWFrZS5tazogc2V0IGhvc3QtY21ha2UgbWF4Cj4gdmVyc2lvbiIpLgoKSW5kZWVkLCBidXQgMjAy
NS4wMi54IGRvZXMgbm90IHN1cHBvcnQgR0NDIDE1IGFueXdheS4KClJlZ2FyZHMsCgpFZGdhci4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
