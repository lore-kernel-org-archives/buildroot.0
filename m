Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED25CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 800D642779;
	Fri, 29 May 2026 21:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrQUinMnAfSt; Fri, 29 May 2026 21:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C95B42771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780088715;
	bh=5ufP2frV+I38Did3x72d0QbzST5ioindOQHZxiMaeXo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=erD7nJuwsIUEBDeRXzzvrLJRngiCbtTtXbmOrjtNjLuhBGW+8ZfyGFDEIsnOsru0g
	 kSAzpoGxODdAVau245nqepsK83svCKIYQXlVq0/mnLmTXZ7buOcFrCPFaPnYw+Q4UG
	 8g9BZmXBsq8E3ybBUEOOA5nrCcDj+nfZWYoarHLq6Xm9ku/+nSrHVziihFkkv71sVt
	 T4EcogpDGsIRDJOKR0jbUkw0BhS+MReWRSrFVjRWAhyYvGJYlI0Y11pLzcWq+/kSDx
	 CZG/xyLLlNqhIdZYJpqlcIfa8bbFi5tHfkfJ3WX1OfAKXCAFc8Zvrsmgmz6ey7MjM4
	 tOj3yC8GXoomQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C95B42771;
	Fri, 29 May 2026 21:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0777EF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC80742324
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJVCf94pxDUr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E844842320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E844842320
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E844842320
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE334B97C675; Fri, 29 May 2026 23:05:09 +0200 (CEST)
Message-ID: <95526945-d16f-481e-b1cc-af6f28df2e08@rnout.be>
Date: Fri, 29 May 2026 23:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Ziegler <br025@umbiko.net>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org,
 john.ernberg@actia.se
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-5-j@j-ernberg.se>
 <d02d0c67-54ce-4522-8396-f96758df80e7@rnout.be>
 <5ba706407cfcc5b0bc20ef5a70a42761@umbiko.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <5ba706407cfcc5b0bc20ef5a70a42761@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780088710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=V96YrpJpsiplMdnqPzEMRolj6skjGYforPp43DhC+m0=;
 b=D2RTSu/2i7Z7Z51/VFF+zp6vgjMm1bDEAZkmcWqUpgG0xRZfv6Xus6re/3JhOmPlAuEgLu
 VaFgHRCbw3GtReq7UquQR2FfTgwfnAxaF7TFS46DkrDnwb0NNezsbXZBRq9Srn4GYesI6I
 7y7AsnWrlBQZqTCZa8v0GQmr8Jobo/A2/+l08pdlUjrMRU8cNUFUMq7nDnOa4JkgrvNI0Y
 kPB0gg+f2KUgL4YA19v7Qhg9lwuc2DjnhDQzvH8ttr7i724iRUyiukLnLrdbn7Smz6Nuy/
 cyy8C/2fJUSyoZdk5u48wFc6utOxdRxz2uuQii4mXRaL1kh3fSpjluNo9yQ4Rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=D2RTSu/2
Subject: Re: [Buildroot] [RESEND PATCH 4/8] package/mpd: Disable sidplay
 support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wNS8yMDI2IDA4OjU0LCBBbmRyZWFzIFppZWdsZXIgd3JvdGU6Cj4gSGkgQXJub3V0
LCBFdmVyeW9uZQo+IAo+IE9uIDIwMjYtMDUtMTggMTk6MjYsIEFybm91dCBWYW5kZWNhcHBlbGxl
IHdyb3RlOgo+PiBPbiAxMC8wNS8yMDI2IDIxOjM4LCBKb2huIEVybmJlcmcgd3JvdGU6Cj4+PiBD
b21taXQgMjVhZjVhM2IzYWEzICgicGFja2FnZS9tcGQ6IHVwZGF0ZSB2ZXJzaW9uIHRvIDAuMjQi
KSBmcm9tIE1hcmNoIDIwMjUKPj4+IGJ1bXBlZCBtcGQgdG8gYSB2ZXJzaW9uIHRoYXQgZHJvcHBl
ZCBzdXBwb3J0IGZvciB0aGUgbGlic2lkcGxheTIgbGlicmFyeSBpbgo+Pj4gZmF2b3Igb2YgbGli
c2lkcGxheWZwLiBbMV0KPj4+Cj4+PiBTaW5jZSBsaWJzaWRwbGF5ZnAgaXMgbm90IHByb3ZpZGVk
IGJ5IGJ1aWxkcm9vdCBhbmQgbm8gb25lIGhhcyBjb21wbGFpbmVkCj4+PiB5ZXQgdGhlIHNpZHBs
YXkgZmVhdHVyZSBpcyBsaWtlbHkgdW51c2VkLCBhcyBlbmFibGluZyBpdCBicmVha3MgdGhlIGJ1
aWxkLgo+Pj4KPj4+IERyb3Agc3VwcG9ydC4gSWYgc29tZW9uZSBuZWVkcyBpdCBpdCBjYW4gYmUg
cmUtYWRkZWQgYWxvbmcgd2l0aCB0aGUKPj4+IGRlcGVuZGVuY3kuCj4+Pgo+Pj4gTGluazogaHR0
cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL011c2ljUGxheWVyRGFlbW9uL01QRC92MC4y
NC9ORVdTIFsxXQo+Pj4gQ2M6IEFuZHJlYXMgWmllZ2xlciA8YnIwMjVAdW1iaWtvLm5ldD4KPj4+
IFNpZ25lZC1vZmYtYnk6IEpvaG4gRXJuYmVyZyA8akBqLWVybmJlcmcuc2U+Cj4+Cj4+IMKgQXBw
bGllZCB0byBuZXh0LCB0aGFua3MhCj4gCj4gVGhpcyBhY3R1YWxseSBtaWdodCBiZSBhIGNhbmRp
ZGF0ZSBmb3IgY3VycmVudCBtYXN0ZXI7IHRoZXJlIGlzIGEgcmVjZW50IAo+IGF1dG9idWlsZCBl
cnJvcjogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLyAKPiBjNzJkMTE1
MzU4NTdhNDQ3YWNhZTgwNjM5N2M0NTFiMTY3ZTAwYjEzCgogIENoZXJyeS1waWNrZWQgdG8gbWFz
dGVyIGFzIHlvdSBzdWdnZXN0ZWQuIEkndmUgYWxzbyBhZGRlZCB0aGUgYXV0b2J1aWxkZXIgbGlu
ayAKb24gbWFzdGVyLgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
