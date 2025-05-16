Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD78C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D5C60B6B;
	Fri, 16 May 2025 10:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3yKtoNN_imI; Fri, 16 May 2025 10:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5BAB60B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BAB60B6D;
	Fri, 16 May 2025 10:45:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9381AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C2B6103E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe-dR8btoLrT for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F00B60B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F00B60B6B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F00B60B6B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 48EA11C10FE; Fri, 16 May 2025 12:45:28 +0200 (CEST)
Message-ID: <b0e601e6-3373-4adc-8720-65b60b9f13ea@rnout.be>
Date: Fri, 16 May 2025 12:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20250428210120.1501818-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250428210120.1501818-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X+5YVwggbgxs2WYRi7g8H4vgger9jSQ4ylEeIHAnl28=;
 b=QArMdL4YEaoH9PWbsndc/+OrgiRMXDaU9XkAwOKwBRTn8ri77FiAm5DIS1pNvLcIvyaWbV
 316rh2uL6cMBBVGxKiKl2WUAGDvU3zOXAppIxQPmQjMb7G8zh1yar9zYhMu2DZ/Pkmh2yi
 klKw2NTy7W3vkdfeFj7ehBdng0QMw9loHPK98EDdU0dZi/or8vRLJBc92i821jMK3b6KaZ
 TH1NvG2yuxtYP2LYoVYxo8Gs+JnGmVeae+btM6tIRN4G2TxxcSziW48u0mPliq2Boj7+ph
 CnMoFaRw9Vpd9VAGDh8G3X/fUfN/NNkGg7y1CumySyG5EAH2fnsNqyMCjbnvlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QArMdL4Y
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix typo in
 --disable help text
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

CgpPbiAyOC8wNC8yMDI1IDIzOjAxLCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEFubm95aW5nbHksIHVzaW5nICItLWRpc2FibGUgd2FybmluZyIgZG9lcyBub3QgZGlz
YWJsZSB0aGUgd2FybmluZ3MKPiBjaGVja3MuCj4gCj4gSXQgdHVybnMgb3V0IHRoYXQgd2UgbG9v
ayBmb3IgIndhcm5pbmdzIiAoaS5lLiB3aXRoIGFuICdzJykgdG8ga25vdyBpZgo+IHdlIHNob3Vs
ZCBkaXNhYmxlIHRoZSB3YXJuaW5ncyBjaGVjaywgc28gdXBkYXRlIHRoZSBoZWxwIHRleHQKPiBh
Y2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFl
bC5tZWxvdHRlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJl
Z2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzIGIvc3VwcG9ydC9zY3JpcHRz
L3BrZy1zdGF0cwo+IGluZGV4IGMxMzRlMWVjMDYuLjQ2YjEyY2Q5OTIgMTAwNzU1Cj4gLS0tIGEv
c3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cwo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3Rh
dHMKPiBAQCAtMTI3Niw3ICsxMjc2LDcgQEAgZGVmIHBhcnNlX2FyZ3MoKToKPiAgICAgICBwYXJz
ZXIuYWRkX2FyZ3VtZW50KCctLW52ZC1wYXRoJywgZGVzdD0nbnZkX3BhdGgnLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaGVscD0nUGF0aCB0byB0aGUgbG9jYWwgTlZEIGRhdGFiYXNlJywg
dHlwZT1yZXNvbHZlcGF0aCkKPiAgICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctLWRpc2FibGUn
LCB0eXBlPWxpc3Rfc3RyLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICBoZWxwPSdGZWF0dXJl
cyB0byBkaXNhYmxlLCBjb21tYS1zZXBhcmF0ZWQgKGN2ZSwgdXBzdHJlYW0sIHVybCwgd2Fybmlu
ZyknLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBoZWxwPSdGZWF0dXJlcyB0byBkaXNhYmxl
LCBjb21tYS1zZXBhcmF0ZWQgKGN2ZSwgdXBzdHJlYW0sIHVybCwgd2FybmluZ3MpJywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQ9W10pCj4gICAgICAgcGFyc2VyLmFkZF9hcmd1
bWVudCgnLXYnLCAnLS12ZXJib3NlJywgZGVzdD0ndmVyYm9zZScsIGFjdGlvbj0nc3RvcmVfdHJ1
ZScsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBoZWxwPSdJbmNyZWFzZSB2ZXJib3NpdHkn
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
