Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ED3105D9AE
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 09:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F64823AA;
	Wed,  8 Apr 2026 09:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzEJOzaZzT_t; Wed,  8 Apr 2026 09:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152318235A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775640870;
	bh=WTuHb3lFqRjdxeOXwbJYgq5qzcM7hBGafij4C/4JzSg=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POxLLXxJJ6RS2VD/xdaOxICPDK/04yPUgaNDFGRZx/++f9pwI/LIAhgMGcX17P+eQ
	 t29Nwpp2b/vHVeyZyg+oRWtMdXvvDi5z8iwCq0AERnFQFwbz65wol4KtcK0E8XfTxL
	 u5gV9yPtUHLdpUaZhlGxwLpb3c4MhM2HtfAKkOIJ/YhsKb7fY8Dgvz4UJVgXYsKwUc
	 06ZcPKwH8/s+5TNl0tJKImDkb0g/3OvMtTmhuA53A/wnrJAn5ZesnayBWV83Rfw17s
	 TzFjLomShpmutx1FC+Cggp3ZKCluhda+yVbvVnuF6OTc30yCdkYMmUL3LfLm6xDN/N
	 Dbd3w7dtAJJUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 152318235A;
	Wed,  8 Apr 2026 09:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C41A1F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5185160D91
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJ3IIAA1bPEQ for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 09:34:27 +0000 (UTC)
X-Greylist: delayed 314 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 08 Apr 2026 09:34:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7D536087B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D536087B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.74;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7D536087B
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:34:25 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [212.227.15.153]) with ESMTPSA (Nemesis) id 1N64FC-1vQQGs1p4y-017eWt; Wed, 08
 Apr 2026 11:29:10 +0200
Message-ID: <9deec371-1edd-4ff0-9678-0caa53aa47f8@green-communications.fr>
Date: Wed, 8 Apr 2026 11:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, Nathan Bloch <nblochn@gmail.com>, 
 buildroot@buildroot.org
References: <20260319104249.22286-1-Nathan.B@solaredge.com>
 <06d6220f-2982-4c79-9b7d-6940088a95e1@rnout.be>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <06d6220f-2982-4c79-9b7d-6940088a95e1@rnout.be>
X-Provags-ID: V03:K1:BINTy5wxihiVckWxbC3JruIzRCO+hXvpcXIt/5Y+tuAG7g9H2y6
 XEIDmYVThLNcJhDeaRKtAnpWkQLwIUDwKfy3M86OvfY1f3+buHLIvi7F+PPPq1p38TE+jkG
 fScf8ZCNG4Xup/PKyUY/UVk/TUauMlQTFnzEKfyrPMj6+P4E5dfQygRhgqk/hHZ6npHjLOW
 5w2o+a5VPDWclhY/TFDlA==
UI-OutboundReport: notjunk:1;M01:P0:vjSGo3BPgKs=;9UJGQ9fiMPORuHQL0n+NLWqPl2T
 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
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH] pkg-generic: suppress SOURCE_DATE_EPOCH
 warning in step_time
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

T24gNC83LzI2IDIwOjQyLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+ICDCoEhpIE5hdGhhbiwKPiAKPiBPbiAxOS8wMy8yMDI2IDExOjQyLCBOYXRoYW4gQmxvY2gg
d3JvdGU6Cj4+IEZyb206IE5hdGhhbiBCbG9jaCA8bmJsb2NobkBnbWFpbC5jb20+Cj4+Cj4+IFRo
ZSBzdGVwX3RpbWUgaG9vayBjYWxscyBkYXRlICslcy4lTiB0byBtZWFzdXJlIGJ1aWxkIHN0ZXAg
ZWxhcHNlZCB0aW1lLgo+PiBXaGVuIFNPVVJDRV9EQVRFX0VQT0NIIGlzIHNldCAoZm9yIHJlcHJv
ZHVjaWJsZSBidWlsZHMpLCBHTlUgY29yZXV0aWxzIAo+PiBkYXRlCj4+IGVtaXRzICJXYXJuaW5n
OiB1c2luZyAkU09VUkNFX0RBVEVfRVBPQ0ggaW5zdGVhZCBvZiB0cnVlIHRpbWUiIGZvciBldmVy
eQo+PiBjYWxsIOKAlCB0d2ljZSBwZXIgc3RlcCwgYWNyb3NzIGFsbCBwYWNrYWdlcywgcmVzdWx0
aW5nIGluIGh1bmRyZWRzIG9mIAo+PiBub2lzeQo+PiBsb2cgbGluZXMuCj4gCj4gIMKgSSB3YXMg
Z29pbmcgdG8gYXBwbHkgYnV0IGp1c3QgdG8gYmUgc3VyZSBJIHRlc3RlZCBteXNlbGYsIGFuZCBt
eSAKPiAoRmVkb3JhIDQzKSBHTlUgY29yZXV0aWxzIGRhdGUgdHVybnMgb3V0IG5vdCB0byBiZWhh
dmUgbGlrZSB0aGF0LiBTbyBJIAo+IHdlbnQgdG8gdGhlIGNvcmV1dGlscyBzb3VyY2UgYW5kIHNl
YXJjaGVkIGZvciBTT1VSQ0VfREFURV9FUE9DSCBhbmQgZm9yIAo+ICJpbnN0ZWFkIG9mIHRydWUg
dGltZSIsIGFuZCBnb3Qgbm8gaGl0cyAoZXhjZXB0IGZvciB0aGUgZXhwZWN0ZWQgb25lcyAKPiBm
b3IgU09VUkNFX0RBVEVfRVBPQ0gpLiBJdCBhY3R1YWxseSBqdXN0IHVzZXMgdHJ1ZSB0aW1lLiBJ
IGFsc28gY2hlY2tlZCAKPiB1dXRpbHMgYW5kIGdsaWJjIGp1c3QgdG8gYmUgc3VyZSwgZm91bmQg
bm90aGluZyB0aGVyZSBlaXRoZXIuCj4gCj4gIMKgU28gaXQgbG9va3MgbGlrZSB5b3UncmUgdXNp
bmcgc29tZSBwYXRjaGVkIHZlcnNpb24gb2YgR05VIGRhdGUuIEknbSAKPiBub3Qgc3VyZSBpZiBp
dCB3b3J0aCBwYXRjaGluZyBCdWlsZHJvb3QgdG8gY2F0ZXIgd2l0aCB0aGF0LCB1bmxlc3MgCj4g
eW91J3JlIG9uIHNvbWUgcHJldHR5IG1haW5zdHJlYW0gZGlzdHJvLgoKWW91IG5lZWQgdG8gZW5h
YmxlIEJSMl9SRVBST0RVQ0lCTEUgdG8gaGF2ZSBwYWNrYWdlL2Zha2VkYXRlL2Zha2VkYXRlIApp
bnN0YWxsZWQgYXMgaG9zdC9iaW4vZGF0ZSB0byBvYmV5IFNPVVJDRV9EQVRFX0VQT0NILgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
