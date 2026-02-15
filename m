Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0384E63F1C
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2F460A58;
	Sun, 15 Feb 2026 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZrnQ7POzWkz; Sun, 15 Feb 2026 22:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F696070D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193563;
	bh=zrhbdmFaKTTdzQMeYchtnaK0G25XCElzO+rWSOyoAVA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaab2wqj2VyS7AEgg1iEL3U51SH4pBLAjRchSIHglnQhP55qhUTYaCeqcvFmpA0fb
	 v/6R+aJcq+1UdMx+n4LHh6bFUsri18LR4LG+VxTOlDHJq8g4qbNhr1P9A5gfcDJQyv
	 Nx+6la3dKuxmaRiKnlpzYz9LPfTcsmjw6d9gDtPlM79jZr3/U+K/l59Ff2WbMbwlXU
	 Enlk1QPZTBcLDE+4T74xoDdj/FS276zb3l0L6XCJOIT2GRHZyM9ZtOuN+Iwky4wj0X
	 bimBv1mJgxEUpzYijcU+0UjRr8ODXupB26XNm5ucZPr/ZGN/2usvRD8grNvx/1qwXH
	 Nkpvpy+X/U+3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F696070D;
	Sun, 15 Feb 2026 22:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF523270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC5BD40601
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PW1J3DDSGGzp for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB0C44035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB0C44035C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB0C44035C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:12:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1591611871; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:12:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkM2-00000009dfj-0u03;
 Sun, 15 Feb 2026 23:12:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet via buildroot <buildroot@buildroot.org>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,  Biagio Montaruli
 <biagio.hkr@gmail.com>
In-Reply-To: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr> (Edgar
 Bonet via buildroot's message of "Sun, 8 Feb 2026 22:11:23 +0100")
References: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr>
Date: Sun, 15 Feb 2026 23:12:38 +0100
Message-ID: <87tsvhodux.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Nen1yZoQrW2EmlbQlj46Q79RZXtZYbvwzcV6kC4dRo3d42oYbNpCKX/KhQoGLuJgjSkvwJtWbnyTsUIkbAe2UhW/LixjSepeYFI+d5GecbyhOek8SNDP4b9F8nSPdWqWhgYXaRFFPXvKJF3tpyZQlAU6ruGMiu00ZMylgMJPDNde7s+sz5C/P0x0SJ6uYnBnsCwKHu3OqdC4NLMm09URymDpvVwfiIiRhODzcaM3+QQmmcJAkY0GXks05rgGKrsHhk09zhLssbTtL6ZoSB85c9po3ig/pxAsZZzqEDwxo/pGJZB8IJV5oZoXmY4h1vpP1LzOHoV02Bw4OJBvIl9vVg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Ryfat8yTURwSX2FVoYbAd/7vV0QBZkpLVgQBHFM4QfA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Nen1yZoQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: remove
 at91bootstrap3 licence
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkVkZ2FyIiA9PSBFZGdhciBCb25ldCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4gd3JpdGVzOgoKID4gV2hlbiB1c2luZyBhIHNwZWNpZmljIGdpdCByZXBvIGFu
ZCB2ZXJzaW9uIGZvciBhdDkxYm9vdHN0cmFwMywKID4gQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQ
M19MSUNFTlNFX0ZJTEVTIGRlZmF1bHRzIHRvICJMSUNFTlNFUy9NSVQudHh0Ii4KID4gSG93ZXZl
ciB0aGUgZ2l0IHZlcnNpb24gd2UgdXNlIChuYW1lbHkgdjMuMTAuMykgZG9lcyBub3QgcHJvdmlk
ZSB0aGlzCiA+IGZpbGUuIEFjdHVhbGx5LCBpdCBkb2VzIG5vdCBwcm92aWRlIGEgbGljZW5jZSBm
aWxlIGF0IGFsbC4gVGhpcyBjYXVzZXMKID4g4oCYbWFrZSBsZWdhbC1pbmZv4oCZIHRvIGZhaWwg
d2l0aDoKCiA+Pj4+IGF0OTFib290c3RyYXAzIHYzLjEwLjMgQ29sbGVjdGluZyBsZWdhbCBpbmZv
CiA+IHNoYTI1NnN1bTogL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvYXQ5MWJvb3RzdHJhcDMtdjMuMTAuMy9MSUNFTlNFUy9NSVQudHh0OiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5CiA+IEVSUk9SOiB3aGlsZSBjaGVja2luZyBoYXNoZXMgZnJvbSBib290L2F0
OTFib290c3RyYXAzL2F0OTFib290c3RyYXAzLmhhc2gKID4gRVJST1I6IExJQ0VOU0VTL01JVC50
eHQgaGFzIHdyb25nIHNoYTI1NiBoYXNoOgogPiBFUlJPUjogZXhwZWN0ZWQ6IDVhMzgwOWIxYzJi
YTEzYjcyNDI1NzIzMjI5NTEzMTFjNTg0NDE5ZjFmODUxNmY2NjVkNmMwNmYwNjY4ZDc4ZGUKID4g
RVJST1I6IGdvdCAgICAgOgogPiBFUlJPUjogSW5jb21wbGV0ZSBkb3dubG9hZCwgb3IgbWFuLWlu
LXRoZS1taWRkbGUgKE1JVE0pIGF0dGFjawoKID4gTGV0J3MgYmUgZXhwbGljaXQgdGhhdCB0aGVy
ZSBpcyBubyBsaWNlbmNlIGZpbGUgdG8gY2hlY2suCgogPiBGaXhlczoKID4gIC0gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjk5MjgxNTM4NgogPiAg
LSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEyOTky
ODE1MzkwCgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
