Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3570DC0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0545412FA;
	Tue, 28 Jan 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3WpPaFFklrR; Tue, 28 Jan 2025 18:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF423412FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF423412FC;
	Tue, 28 Jan 2025 18:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C90C20
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BFD340108
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY-KPmEezAVB for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 18:12:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C787404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C787404C2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C787404C2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:12:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 53360780504;
 Tue, 28 Jan 2025 19:12:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34840])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jan 2025 19:12:31 +0100
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 19:12:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250128100151.2132875-1-gael.portay+rtone@gmail.com>
References: <20250128100151.2132875-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1af532cd97b1452cad8d343dfc8d9a2f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738087952;
 bh=sGnWhzxolaxEdT95oMqIRFKNMetAk9fe5AQ9FXyX6OY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rKj9gpo/8Ftk17DKtVaskUptWecWzk7qWrlc9auxN2jbaAuJXpb2yVwgBwW8vYZT/
 0VjH6yZOCGces0n1algYylYbEP+ghkzOGy5+cqpvjeawASRex9PiEfvfAx0QUYUYmm
 9vLwC347rhLKarAe1o5fHggh2QHcYh/dwFNG6Ayizu18RcZaScjSLykhNbnMib2ohI
 aXoll1ayIkmwsPteW6GFPDUyJHMSx2e21xAXXzWQ5I25LHfX2PZq+vPPPRI6qbzons
 Ie0UYm60ZYzZmGb4XGT+eRwtqMupFcyEsEeHx60AAemBphmXwKMXV3v/UtwQSUW1/9
 ubYclvTwNiD8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rKj9gpo/
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/genimage.sh: add shell
 option -e
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

T24gMjgvMDEvMjAyNSAxMTowMSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoZSBjb21taXQgNjg4
OTA1NmYxZSAoc3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoKSBhZGRzIHN1cHBvcnQgZm9yCj4g
Y3JlYXRpbmcgYm1hcCBpbWFnZXMuCj4gCj4gU2luY2UgdGhlbiwgdGhlIHNjcmlwdCBnZW5pbWFn
ZS5zaCBsb29zZXMgdGhlIGVycm9yIHJldHVybmVkIGJ5IHRoZQo+IGdlbmltYWdlIGNvbW1hbmQu
Cj4gCj4gQXMgYSBjb25zZXF1ZW5jZSwgdGhlIHRhcmdldC1maW5hbGl6ZSB0YXJnZXQgbG9vc2Vz
IHRoZSBlcnJvciBhcyB3ZWxsLAo+IGFuZCBzbyBvbiB1cCB0byBtYWtlLgo+IAo+IFRoaXMgYWRk
cyB0aGUgc2hlbGwgb3B0aW9uIC1lIHRvIGV4aXQgaW1tZWRpYXRlbHkgaWYgYSBjb21tYW5kIGVu
ZHMgCj4gd2l0aAo+IGFuIGVycm9yLCBzbyB0aGUgZXJyb3IgaXMgbm90IGlnbm9yZWQuCj4gCj4g
Rml4ZXM6Cj4gCj4gCWdwb3J0YXlAYXJjaGxpbnV4IH4vc3JjL3J0b25lLWJyMi1leHRlcm5hbCAk
IG1ha2UKPiAJKC4uLikKPiAJPj4+ICAgRXhlY3V0aW5nIHBvc3QtaW1hZ2Ugc2NyaXB0IHN1cHBv
cnQvc2NyaXB0cy9nZW5pbWFnZS5zaAo+IAlJTkZPOiBjbWQ6ICJta2RpciAtcCAKPiAiL2hvbWUv
Z3BvcnRheS9zcmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9idWlsZC9nZW5pbWFnZS50bXAi
IiAKPiAoc3RkZXJyKToKPiAJSU5GTzogY21kOiAicm0gLXJmIAo+ICIvaG9tZS9ncG9ydGF5L3Ny
Yy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxkL2dlbmltYWdlLnRtcCIvKiIgCj4gKHN0
ZGVycik6Cj4gCUlORk86IGNtZDogIm1rZGlyIC1wIAo+ICIvaG9tZS9ncG9ydGF5L3NyYy9ydG9u
ZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxkL2dlbmltYWdlLnRtcCIiIAo+IChzdGRlcnIpOgo+
IAlJTkZPOiBjbWQ6ICJjcCAtYSAiL3RtcC90bXAuRWNsS0d3dEE0UiIgCj4gIi9ob21lL2dwb3J0
YXkvc3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvYnVpbGQvZ2VuaW1hZ2UudG1wL3Jvb3Qi
IiAKPiAoc3RkZXJyKToKPiAJSU5GTzogY21kOiAibWtkaXIgLXAgCj4gIi9ob21lL2dwb3J0YXkv
c3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvaW1hZ2VzIiIgKHN0ZGVycik6Cj4gCUlORk86
IHZmYXQoZWZpLXBhcnQudmZhdCk6IGNtZDogIm1rZG9zZnMgICAKPiAnL2hvbWUvZ3BvcnRheS9z
cmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9pbWFnZXMvZWZpLXBhcnQudmZhdCciIAo+IChz
dGRlcnIpOgo+IAlJTkZPOiB2ZmF0KGVmaS1wYXJ0LnZmYXQpOiBhZGRpbmcgZmlsZSAnZWZpLXBh
cnQvRUZJJyBhcyAnRUZJJyAuLi4KPiAJSU5GTzogdmZhdChlZmktcGFydC52ZmF0KTogY21kOiAi
TVRPT0xTX1NLSVBfQ0hFQ0s9MSBtY29weSAtc3AgLWkgCj4gJy9ob21lL2dwb3J0YXkvc3JjL3J0
b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvaW1hZ2VzL2VmaS1wYXJ0LnZmYXQnIAo+ICcvaG9tZS9n
cG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2ltYWdlcy9lZmktcGFydC9FRkkn
IAo+ICc6OkVGSSciIChzdGRlcnIpOgo+IAlEaXNrIGZ1bGwKPiAJSU5GTzogdmZhdChlZmktcGFy
dC52ZmF0KTogY21kOiAicm0gLWYgCj4gIi9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRl
cm5hbC9vdXRwdXQvaW1hZ2VzL2VmaS1wYXJ0LnZmYXQiIiAKPiAoc3RkZXJyKToKPiAJRVJST1I6
IHZmYXQoZWZpLXBhcnQudmZhdCk6IGZhaWxlZCB0byBnZW5lcmF0ZSBlZmktcGFydC52ZmF0Cj4g
CUlORk86IGNtZDogInJtIC1yZiAKPiAiL2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUtYnIyLWV4dGVy
bmFsL291dHB1dC9idWlsZC9nZW5pbWFnZS50bXAvIiIgCj4gKHN0ZGVycik6Cj4gCW1ha2VbMV06
IExlYXZpbmcgZGlyZWN0b3J5IAo+ICcvaG9tZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJu
YWwvYnVpbGRyb290Jwo+IAlncG9ydGF5QGFyY2hsaW51eCB+L3NyYy9ydG9uZS1icjItZXh0ZXJu
YWwgJCBlY2hvICQ/Cj4gCTAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwu
cG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
