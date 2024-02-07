Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C1AC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4347940A48;
	Wed,  7 Feb 2024 10:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGJ1psVnoyuP; Wed,  7 Feb 2024 10:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05CC402E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D05CC402E6;
	Wed,  7 Feb 2024 10:17:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5E71BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99BD96073E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OV3oyRUMjSEO for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7074F613CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7074F613CD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7074F613CD
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:17:41 +0000 (UTC)
Received: from [10.0.0.63] (unknown [109.133.241.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 892892C83776;
 Wed,  7 Feb 2024 11:17:39 +0100 (CET)
Message-ID: <8bc41c70-4156-4c8d-8c8f-ed75df205c12@bubu1.eu>
Date: Wed, 7 Feb 2024 11:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
 <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
In-Reply-To: <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707301059; bh=AtIuch5TXQXMYQwVVk+qaHcnqsFUs1H8P/uXdJRYO8w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=G2Uli4ViYGkN74L3S9w4N/ChgP7PRPuLitElnxBVzTamMY88CiVFqkqE0pbRCGS7h
 Ur2KhUhw+z/2ohQ5SB0cVGggngsfbyYJR5Y/MahV8R2NtSXFaTmw9IL7AIaEG3rqUR
 m7Fbneifsf0ouMcCS2iWO27DE5tFG8GmiQpfOeUcPqeLKOH5ohY4Gc4TyE/wNLfIWy
 YESD1k0q+RVGgB6yRIS7PWigPnxuWey6xZyvW/DYUafcoQ6NFMlp17Qv+oDNHNh9W7
 fErTssO2Wk4SmuKL2PNYr4Y+NxkzcV/4M8l//vIR0uWP+jd5a1z/3BVXWEoRDRpxJ6
 69grBthonvLXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=G2Uli4Vi
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yZ290IHRoZSByZWZlcmVuY2UgbGluay4uLgoKT24gMDcuMDIuMjQgMTE6MTYsIE1hcmN1cyBI
b2ZmbWFubiB2aWEgYnVpbGRyb290IHdyb3RlOgo+IEhpIEphbWVzLAo+IAo+IE9uIDI2LjExLjIz
IDE5OjA4LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gV2UgbmVlZCBob3N0LXB5dGhvbi1jeXRo
b24gZm9yIHB5dGhvbi1tc2dwYWNrIHRvIGJ1aWxkIGNvcnJlY3RseS4KPj4gVGhpcyBpcyBhIGhh
cmQgZXJyb3Igd2hlbiB1c2luZyBhIHBlcDUxNyBmcm9udGVuZC4KPj4KPj4gRml4ZXM6Cj4+ICog
R2V0dGluZyBidWlsZCBkZXBlbmRlbmNpZXMgZm9yIHdoZWVsLi4uCj4+IHJ1bm5pbmcgZWdnX2lu
Zm8KPj4gd3JpdGluZyBtc2dwYWNrLmVnZy1pbmZvL1BLRy1JTkZPCj4+IHdyaXRpbmcgZGVwZW5k
ZW5jeV9saW5rcyB0byBtc2dwYWNrLmVnZy1pbmZvL2RlcGVuZGVuY3lfbGlua3MudHh0Cj4+IHdy
aXRpbmcgdG9wLWxldmVsIG5hbWVzIHRvIG1zZ3BhY2suZWdnLWluZm8vdG9wX2xldmVsLnR4dAo+
PiByZWFkaW5nIG1hbmlmZXN0IGZpbGUgJ21zZ3BhY2suZWdnLWluZm8vU09VUkNFUy50eHQnCj4+
IHJlYWRpbmcgbWFuaWZlc3QgdGVtcGxhdGUgJ01BTklGRVNULmluJwo+PiB3YXJuaW5nOiBubyBm
aWxlcyBmb3VuZCBtYXRjaGluZyAnKi5jJyB1bmRlciBkaXJlY3RvcnkgJ21zZ3BhY2snCj4+IGFk
ZGluZyBsaWNlbnNlIGZpbGUgJ0NPUFlJTkcnCj4+IHdyaXRpbmcgbWFuaWZlc3QgZmlsZSAnbXNn
cGFjay5lZ2ctaW5mby9TT1VSQ0VTLnR4dCcKPj4KPj4gRVJST1IgTWlzc2luZyBkZXBlbmRlbmNp
ZXM6Cj4+IMKgwqDCoMKgQ3l0aG9ufj0wLjI5LjMwCj4+Cj4gCj4gVW5mb3J0dW5hdGVseSBtc2dw
YWNrIDEuMC43IHdoaWNoIGJ1aWxkcm9vdCBoYXMgbm93IHJlcXVpcmVzIGN5dGhvbiB+My4wIAo+
IFsxXSwgd2hpY2ggd2UgZG9uJ3QgaGF2ZSB5ZXQuIGN5dGhvbiAzLjAgYW5kIGN5dGhvbiAwLjI5
LnggKHdoaWNoIHV2bG9vcCAKPiBzdGlsbCB1c2VzKSBhbHNvIHNlZW0gdG8gYmUgc3RpbGwgZGV2
ZWxvcGVkIGluIHBhcmFsbGVsLiBTbyBtYXliZSB3ZSAKPiBuZWVkIGJvdGggYXMgYnVpbGQgaG9z
dCBwYWNrYWdlcz8gT3IgZG8geW91IHNlZSBhbm90aGVyIHNvbHV0aW9uPwo+IAo+IE1hcmN1cwoK
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9tc2dwYWNrL21zZ3BhY2stcHl0aG9uL2Jsb2IvdjEuMC43
L3B5cHJvamVjdC50b21sI0w1Cgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLW1z
Z3BhY2svcHl0aG9uLW1zZ3BhY2subWsgfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1tc2dwYWNrL3B5dGhv
bi1tc2dwYWNrLm1rIAo+PiBiL3BhY2thZ2UvcHl0aG9uLW1zZ3BhY2svcHl0aG9uLW1zZ3BhY2su
bWsKPj4gaW5kZXggMDYxZmY1YTc2MS4uYzkxNWIyM2JmNCAxMDA2NDQKPj4gLS0tIGEvcGFja2Fn
ZS9weXRob24tbXNncGFjay9weXRob24tbXNncGFjay5tawo+PiArKysgYi9wYWNrYWdlL3B5dGhv
bi1tc2dwYWNrL3B5dGhvbi1tc2dwYWNrLm1rCj4+IEBAIC0xMCw1ICsxMCw2IEBAIFBZVEhPTl9N
U0dQQUNLX1NJVEUgPSAKPj4gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2Vz
L2MyL2Q1LzU2NjIwMzJkYjE1Nwo+PiDCoCBQWVRIT05fTVNHUEFDS19MSUNFTlNFID0gQXBhY2hl
LTIuMAo+PiDCoCBQWVRIT05fTVNHUEFDS19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+PiDCoCBQ
WVRIT05fTVNHUEFDS19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+PiArUFlUSE9OX01TR1BBQ0tf
REVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY3l0aG9uCj4+IMKgICQoZXZhbCAkKHB5dGhvbi1w
YWNrYWdlKSkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
