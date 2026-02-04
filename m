Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F060E9D407
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0C960DBF;
	Wed,  4 Feb 2026 16:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOeapUdteRZu; Wed,  4 Feb 2026 16:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC7960AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770221081;
	bh=RTGmg3NGtzo9u8WTh6CLbchh4oR2VbdtymgFt5eh6g8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TgV4WaLpFk/aOcDNSpAaYVKf5LsUqqrqJYTUb9gAQO719v58lQwEF61nrcUj/aQ3p
	 rShgslr6j5VrKzeXb2ZxGNSoiYSIeVviEROPsW0Nfymk3Mh+pC7Krc2J2cWrP62ifS
	 khM7peJenl8QDYF6KsbqKA8qipiCJWkvt1j3Vq1UlyafKwvWwzl6azGSnvhZEiNHmd
	 yzo+ixWpuDd5v2XHkffReXQr7497/W4H9OnkxNLKLAyMX7aoXtTzWk8yuAxBEf4bwg
	 FINXfgN0I+wA2V+p7ivflr+5G7Itkf7oc2I3hK4MvWcXGQiYWTzfxPnsFDTGhMDaua
	 cXNmk0Qlbpzgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC7960AB2;
	Wed,  4 Feb 2026 16:04:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD2417A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FF5D60AB2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AaBrMfu41Gj for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 813DA608C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813DA608C2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 813DA608C2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:04:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9675F4E423E2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:04:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5F69260705;
 Wed,  4 Feb 2026 16:04:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4F0B119A88EE; Wed,  4 Feb 2026 17:04:33 +0100 (CET)
Date: Wed, 4 Feb 2026 17:04:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYNthEJZHq94ut9k@windsurf>
References: <20260101113616.1893585-1-bernd@kuhls.net>
 <20260101113616.1893585-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260101113616.1893585-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770221074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lYChxpLiY2t4s2hyW5g7FSK6ti54qpVfv5izu7ySC3I=;
 b=Kt8E7LsQOn3cWB3kqeKvEMCBBIm5ZvG73gsF+4xyKNs47avCMtO0c8qKHf8s73C3tXHtxi
 iGn1dRW4r4vxzR25ki1d7eyirBjLsVrclE/SpwKGOdV4JF6f7m2Pi6dMg4DTTeoW2bOmLW
 f9ych9lIbKOCdGB0n7uEC+gzSrHmbyqiJNEsb+gqKOTBVpgywtJf+yhW792vclLXR7d1iU
 JLTGbeM/GjKMfzFegLa4xH5jZREPHAdeLDA45HnEJn010v85x05NKSmYqVl3Z5jXB5A1Pq
 ZmgmAc51+2wPG99nLqimkODEPs3mpkMEQLZTH49FJW1xF1B/kHZJ87E1CLEdzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Kt8E7LsQ
Subject: Re: [Buildroot] [PATCH 2/2] package/cegui: bump version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpPbiBUaHUsIEphbiAwMSwgMjAyNiBhdCAxMjozNjoxNlBNICswMTAwLCBC
ZXJuZCBLdWhscyB3cm90ZToKPiBSZW1vdmVkIHBhdGNoZXMgd2hpY2ggYXJlIGluY2x1ZGVkIGlu
IHRoaXMgcmVsZWFzZS4KPiAKPiBVcGRhdGVkIGRlcGVuZGVuY2llcyBhbmQgY29uZmlndXJlIG9w
dGlvbnMgZHVlIHRvIHVwc3RyZWFtIGNvbW1pdHM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2NlZ3Vp
L2NlZ3VpL2NvbW1pdC8zNmMwZWFmNjI5YjQ2YmRhYTM0NDhkMjBkNDYyOTRjYjBkYmM2ZGI1Cj4g
aHR0cHM6Ly9naXRodWIuY29tL2NlZ3VpL2NlZ3VpL2NvbW1pdC9jOWFkYWEwM2Q2N2UyYmE2NTBl
MDYzZGM3YjYwYzYzMTEzYmE2Y2YwCj4gaHR0cHM6Ly9naXRodWIuY29tL2NlZ3VpL2NlZ3VpL2Nv
bW1pdC8yMGY1YWM2NjU4Y2UxNTFlNzM3NzI5MDZjZGI5YmU5MzYwM2M1MDY0Cj4gCj4gU2lnbmVk
LW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KClRoZSBidWlsZCBicmVha3Mg
Zm9yIG1lLiBJIGhhdmUgbm8gaWRlYSBpZiBpdCB3YXMgd29ya2luZyBiZWZvcmUgb3IKbm90LCBz
aW5jZSBJIHdhcyBlbmNvdW50ZXJpbmcgdGhlIENNYWtlIDQgY29tcGF0aWJpbGl0eSBpc3N1ZS4K
CkJ1dCB0aGUgYnVpbGQgYnJlYWtzIHdpdGg6CgovaG9tZS90aG9tYXMvYnVpbGRyb290L2JyL291
dHB1dC1hbGwvYnVpbGQvY2VndWktZTdhMDNhZmM3MGM2MTgyYTA5MWZmMzFhY2NiOWQ3N2M2YmRm
NmY2MC9jZWd1aS9zcmMvU2NyaXB0TW9kdWxlcy9QeXRob24vYmluZGluZ3MvZ2VuZXJhdG9ycy9p
bmNsdWRlCi9weXRob25fQ0VHVUkuaDoxMDU6MTI6IGVycm9yOiDigJhWZXJ0aWNhbEZvcm1hdHRp
bmfigJkgZG9lcyBub3QgbmFtZSBhIHR5cGU7IGRpZCB5b3UgbWVhbiDigJhWZXJ0aWNhbFRleHRG
b3JtYXR0aW5n4oCZPwogIDEwNSB8ICAgICBzdGF0aWMgVmVydGljYWxGb3JtYXR0aW5nIHN0cmlu
Z1RvVmVydGljYWxGb3JtYXR0aW5nKGNvbnN0IFN0cmluZyYgc3RyKQoKYW5kIG90aGVyIGVycm9y
cyBsaWtlOgoKL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9ici9vdXRwdXQtYWxsL2J1aWxkL2NlZ3Vp
LWU3YTAzYWZjNzBjNjE4MmEwOTFmZjMxYWNjYjlkNzdjNmJkZjZmNjAvY2VndWkvc3JjL1Njcmlw
dE1vZHVsZXMvUHl0aG9uL2JpbmRpbmdzL2dlbmVyYXRvcnMvaW5jbHVkZQovcHl0aG9uX0NFR1VJ
Lmg6MTQ2OjQxOiBlcnJvcjog4oCYVmVjdG9yMmbigJkgZG9lcyBub3QgbmFtZSBhIHR5cGU7IGRp
ZCB5b3UgbWVhbiDigJhVVmVjdG9yMuKAmT8KICAxNDYgfCAgICAgc3RhdGljIFN0cmluZyB2ZWN0
b3IyVG9TdHJpbmcoY29uc3QgVmVjdG9yMmYmIHZhbCkKCkkgY2FuJ3QgZWFzaWx5IHByb3ZpZGUg
YSBtaW5pbWFsIGNvbmZpZ3VyYXRpb24gZm9yIHRoaXMsIGJlY2F1c2UgSSdtCmVuY291bnRlcmlu
ZyB0aGlzIHdoaWxlIGRvaW5nIGEgZnVsbCBidWlsZCBvZiBhbGwgcGFja2FnZXMuCgpBbHNvLCBu
b3RlIHRoYXQgdGhlcmUgYXJlIG51bWVyb3VzIGNlZ3VpIGJ1aWxkIGZhaWx1cmVzIGluIHRoZQph
dXRvYnVpbGRlcnM6CgogIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvP3JlYXNvbj1j
ZWd1aSUKCkFyZSB5b3Ugd2lsbGluZyB0byBmaXggdGhlbT8gT3Igc2hvdWxkIHdlIHJlbW92ZSBj
ZWd1aT8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
