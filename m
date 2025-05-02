Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C5C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CE3811C4;
	Fri,  2 May 2025 10:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdyhZCql7piA; Fri,  2 May 2025 10:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC1783A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC1783A70;
	Fri,  2 May 2025 10:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42F62229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 285B340E01
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAtqPMAHpRKd for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E66541521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E66541521
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E66541521
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34DA31C1113; Fri,  2 May 2025 12:29:13 +0200 (CEST)
Message-ID: <9797dcff-f6f1-4d7e-af8d-0605b0b2179b@rnout.be>
Date: Fri, 2 May 2025 12:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Julien Olivain <ju.o@free.fr>
References: <20250422085947.687912-1-vincent.stehle@arm.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422085947.687912-1-vincent.stehle@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WnqOzoUDp1LIrVSpLb1+DMq11MR06gzsrp4i5sT+n94=;
 b=VAmXdbez/XXASLTNVaONjXhLdhmnUIYrGRAVxmmv33O1OAx5PTaIH/+JQjJDKvuZqEbA4P
 FbKJTH2Q5qsO25+dtYmtHALLA0Pa8d0aUu7fGXh5fu5xq1bbV/f90biAStxwAME8VK7K63
 iRtTn6l9C7PcJGYBGG7PX7us8U2Bo8vLZg0nIhlsmzCagSqabzf0DXMX0ISj0lZ6oEkJHZ
 +PllCl9HSG3ioiOFobZ9yAUzWlXRZAg1JG+573eXig4M+PPbkyzU5NHLKuKqU0PPfFoLaX
 zfMFHHWXawRnuW+UsEv3RAmxduOwhTYnUZsBAkYuxXSxac7Xde81RIdQmALVXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VAmXdbez
Subject: Re: [Buildroot] [PATCH] support/testing: test_edk2: add
 macchiatobin build test
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

CgpPbiAyMi8wNC8yMDI1IDEwOjU5LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gQWRkIGFuIEVE
SyBJSSBidWlsZCB0ZXN0IGZvciB0aGUgTUFDQ0hJQVRPYmluIHBsYXRmb3JtLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzog
RGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgo+IENjOiBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPgoKICBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAtLS0KPiAKPiBIaSwKPiAKPiBOb3cgaXMgYSBnb29kIHRpbWUgdG8gYWRkIHRoaXMg
YnVpbGQgdGVzdCwgYWZ0ZXIgY29tbWl0IFsxXSBhbmQgdG8gYSBsZXNzZXIKPiBleHRlbmQgY29t
bWl0IFsyXSwgd2hpY2ggaGF2ZSBmaXhlZCB0aGUgYnVpbGQgZm9yIHRoaXMgY29uZmlndXJhdGlv
bi4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gVmluY2VudC4KPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2ZkMDJhZGQyMWI0ZDc5ZjFkYzdh
YzAzYzZhODA0ODU4ZGUxNTc3NGIKPiBbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vY29tbWl0LzczNjFhMTU1ZWY0MjBhNThlYmUxZjhmMzYwYjE0MWE5MjZi
NmQ4YjIKPiAKPiAKPiAgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZWRrMi5weSB8
IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsy
LnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5Cj4gaW5kZXggNGUw
OTQyYjNhNC4uMTljNmQ5YzQ4MiAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
Ym9vdC90ZXN0X2VkazIucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0
X2VkazIucHkKPiBAQCAtMTQ5LDMgKzE0OSwyMSBAQCBjbGFzcyBUZXN0RWRrMkJ1aWxkUWVtdVNi
c2EoVGVzdEVkazJCdWlsZEJhc2UpOgo+ICAgCj4gICAgICAgZGVmIHRlc3RfcnVuKHNlbGYpIC0+
IE5vbmU6Cj4gICAgICAgICAgIHNlbGYuYXNzZXJ0QmluYXJpZXNFeGlzdCgiU0JTQV9GTEFTSDAu
ZmQiLCAiU0JTQV9GTEFTSDEuZmQiLCAiZmlwLmJpbiIpCj4gKwo+ICsKPiArY2xhc3MgVGVzdEVk
azJCdWlsZFNvbGlkcnVuQXJtYWRhODB4MG1jYmluKFRlc3RFZGsyQnVpbGRCYXNlKToKPiArICAg
IGNvbmZpZyA9IFRlc3RFZGsyQnVpbGRCYXNlLmJhc2VfY29uZmlnICsgXAo+ICsgICAgICAgICIi
Igo+ICsgICAgICAgIEJSMl9hYXJjaDY0PXkKPiArICAgICAgICBCUjJfY29ydGV4X2E3Mj15Cj4g
KyAgICAgICAgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX1NPTElEUlVOX0FSTUFEQTgwWDBNQ0JJ
Tj15Cj4gKyAgICAgICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4gKyAgICAg
ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iYTgweDBfbWNiaW4i
Cj4gKyAgICAgICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9FREsyX0FTX0JMMzM9
eQo+ICsgICAgICAgIEJSMl9UQVJHRVRfQklOQVJJRVNfTUFSVkVMTD15Cj4gKyAgICAgICAgQlIy
X1RBUkdFVF9NVl9ERFJfTUFSVkVMTD15Cj4gKyAgICAgICAgIiIiCj4gKwo+ICsgICAgZGVmIHRl
c3RfcnVuKHNlbGYpIC0+IE5vbmU6Cj4gKyAgICAgICAgc2VsZi5hc3NlcnRCaW5hcmllc0V4aXN0
KCJBUk1BREFfRUZJLmZkIiwgImZpcC5iaW4iLCAiYmxlLmJpbiIsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJzY3AtZncuYmluIikKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
