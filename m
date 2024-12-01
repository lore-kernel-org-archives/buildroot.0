Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D0CD49780
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 18:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB04570A1C;
	Sun,  1 Dec 2024 18:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqY2rugpGQca; Sun,  1 Dec 2024 18:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0216670A22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0216670A22;
	Sun,  1 Dec 2024 18:04:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE3C6C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 18:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D10C143FA3
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 18:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdBt8OJyvbJO for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 18:04:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F03043F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F03043F11
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F03043F11
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 18:04:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 87FF32003D3;
 Sun,  1 Dec 2024 19:04:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47610])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Dec 2024 19:04:08 +0100
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 19:04:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Derzsi_D=C3=A1niel?= <daniel@tohka.us>
Cc: buildroot@buildroot.org
In-Reply-To: <20241201164949.21267-1-daniel@tohka.us>
References: <20241201164949.21267-1-daniel@tohka.us>
User-Agent: Webmail Free/1.6.9
Message-ID: <c8ce7a413c5bd5e35634f4b72dfa7edb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733076249;
 bh=NxW+MZOLD4hnob/sXoYnw1mlSd3XsYYu3P2oNf8COJg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t6tV2/zeR3CTTNZ2cyrrcLnDeW7SFZXZWLJYTk2bqLxBqmsJ5FIQ7olKzoY7fckU+
 dMSqEMGvBoFPR1wVhuJm0WUDVgBmkON8Z+bfzZfpC7FcsF0Y/Jp3J8/CyzlQr53Mkv
 9YKaPGWUKWU1ggnovUHkdImofPj211BtB2nueAUL8j9oSia6kJOph7QatvCms4lSAe
 G/jPM6nTwJKwjrNP9lJAUFFMTXBb4ySdXAR/r4l4DgmbUXDvaIUqCLDRviBJTWJw4n
 lT9whHLGEByVgttYe1vWCHY9M9hIaFH0Q1aaiyAp2T/VQC5abc4lv/x6Sbg19AhTWd
 9BlZowW63m/Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t6tV2/ze
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.12
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

T24gMDEvMTIvMjAyNCAxNzo0OSwgRGVyenNpIETDoW5pZWwgd3JvdGU6Cj4gQ2hhbmdlbG9nIC0g
aHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcmVsZWFzZXMvdGFnL3Y2LjEyCj4gCj4g
U2lnbmVkLW9mZi1ieTogRGVyenNpIETDoW5pZWwgPGRhbmllbEB0b2hrYS51cz4KCkFwcGxpZWQg
dG8gbmV4dCwgdGhhbmtzLgoKPiAtLS0KPiAgcGFja2FnZS9zdHJhY2Uvc3RyYWNlLmhhc2ggfCA0
ICsrLS0KPiAgcGFja2FnZS9zdHJhY2Uvc3RyYWNlLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3N0cmFjZS9zdHJhY2UuaGFzaCBiL3BhY2thZ2Uvc3RyYWNlL3N0cmFjZS5oYXNoCj4g
aW5kZXggZTE2N2Y5ZDIuLmI1YTUzYzYyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3RyYWNlL3N0
cmFjZS5oYXNoCj4gKysrIGIvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLmhhc2gKPiBAQCAtMSw1ICsx
LDUgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgc2lnbmF0dXJlIHdp
dGggUlNBIGtleSAKPiAweEE4MDQxRkE4MzlFMTZFMzYKPiAtIyBodHRwczovL3N0cmFjZS5pby9m
aWxlcy82LjExL3N0cmFjZS02LjExLnRhci54ei5hc2MKPiAtc2hhMjU2ICAKPiA4MzI2MjU4M2Ez
NTI5ZjAyYzM1MDFhYThiOGFjNzcyYjRjYmMwM2RjOTM0ZTk4YmFiNmU0ODgzNjI2ZTI4M2E1ICAK
PiBzdHJhY2UtNi4xMS50YXIueHoKPiArIyBodHRwczovL3N0cmFjZS5pby9maWxlcy82LjEyL3N0
cmFjZS02LjEyLnRhci54ei5hc2MKPiArc2hhMjU2ICAKPiBjNDdkYTkzYmU0NWI2MDU1ZjRkYzc0
MWQ3ZjIwZWZhZjUwY2ExMDE2MGE1YjEwMGMxMDliMjk0ZmQ5YzBiZGZlICAKPiBzdHJhY2UtNi4x
Mi50YXIueHoKPiAgc2hhMjU2ICAKPiAxOTg4ZDBlMWFhMTAxZDY4ODU1ZThjNGY5NDBhYWNmMjUz
MTA1MWI4MmY2YjYwOGViMDI2YzVmYWQxZjMzZGYxICAKPiBDT1BZSU5HCj4gIHNoYTI1NiAgCj4g
N2MzNzk0MzY0MzZhNTYyODM0YWE3ZDJmNWRjYWUxZjgwYTI1MjMwZmE3NDIwMTA0NmNhMWZiYTQz
NjdkMzlhYSAgCj4gTEdQTC0yLjEtb3ItbGF0ZXIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zdHJh
Y2Uvc3RyYWNlLm1rIGIvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLm1rCj4gaW5kZXggMzY3YTQ0ZGEu
LjVhZGExOGM2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3RyYWNlL3N0cmFjZS5tawo+ICsrKyBi
L3BhY2thZ2Uvc3RyYWNlL3N0cmFjZS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gIAo+ICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4gLVNUUkFDRV9WRVJTSU9OID0gNi4xMQo+ICtTVFJB
Q0VfVkVSU0lPTiA9IDYuMTIKPiAgU1RSQUNFX1NPVVJDRSA9IHN0cmFjZS0kKFNUUkFDRV9WRVJT
SU9OKS50YXIueHoKPiAgU1RSQUNFX1NJVEUgPSAKPiBodHRwczovL2dpdGh1Yi5jb20vc3RyYWNl
L3N0cmFjZS9yZWxlYXNlcy9kb3dubG9hZC92JChTVFJBQ0VfVkVSU0lPTikKPiAgU1RSQUNFX0xJ
Q0VOU0UgPSBMR1BMLTIuMSsKPiAtLQo+IDIuNDcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
