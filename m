Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307ECD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B4240C9E;
	Tue,  5 May 2026 21:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-FLH0dwX51w; Tue,  5 May 2026 21:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A3340C94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778018305;
	bh=Fb9yqpY1sLZg8TeHFVyltzGh7hFNckVDLK9vC2BleOI=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/9W1TXo6OC3UeNkdUE5pMCwLSfdimQqA5bjedKP5XPwigZ+U9U/kUvZMNoxhEDB/
	 uNGmjv09MpFgi4aTZ2PjAuVe5xyU8c08AIAiUcx/iEMUnenmtRCEC0zOEHaniRDHg0
	 UOlpiPpkxSqe8IP+mqbWKpA9Yw4jtOYW60LZS4wsDKDGX1OopxFT/VusJhMoTvrUyX
	 TvI9SYzj1VAvtwYAsLdWlyEnoQKQdC26uhDdx8vwYdDKpaZjhDoSUEsbElC9wa0s64
	 BBQ385PwmzvI67nHSORn9tTjhJcmfiseXd+ksw1OTe43nJXkX1NisbeomFAN2He9DT
	 1De8F2znq3s4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A3340C94;
	Tue,  5 May 2026 21:58:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D3C9315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6318640C8E
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaRvaPBKaWCi for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:58:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73FF540C94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FF540C94
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73FF540C94
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:58:21 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id KNmUwh6zRZCONKNmUwlfly; Tue, 05 May 2026 23:58:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 5 May 2026 23:58:18 +0200
Message-Id: <DE1B3473-45A8-4BB0-8C2B-FEC6A5226146@benettiengineering.com>
References: <2cacc081-e363-4085-a6c1-6abea5a9bc6d@bubu1.eu>
Cc: buildroot@buildroot.org,
 =?utf-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
In-Reply-To: <2cacc081-e363-4085-a6c1-6abea5a9bc6d@bubu1.eu>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailer: iPhone Mail (23E261)
X-CMAE-Envelope: MS4xfHHBnJ7SrENUyMkLU41GsK/qJPMCCYTqOiFOZeuPazJzzvRGOxiiRMBpjA7JvIBfpsddNyPFb4cUQOgTY7fa4Y3H0IxI3RB8EI6scnSPaUT3GdWfYFSA
 NVdDoNGOrPazm7wNpffjan6TWST+xdeOrPxUQJrekMzjKAbTBVvhtiX6hFmhuDgvcW12C6mbNWCN61ku1rP5m9DH5rgkLI7jORhPhgvS22YmVOSYGSx73uqq
 saLL5MRqvbo3OgPVjFMoH6Bzzf4FRMYmC0UuOVDVhU8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778018298; bh=BJ6iYD4sRretm1ID1Es6Bd//jtUVDPa9tGvPallvu4s=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=BGaSKlkON11o4Ba1sZJZbSdRAm6T7oBp7mrkfOKYWAp1kYapIo7su2cpCRwti+C9F
 XSAPXiEt0V6KvcKAkOjGt6DA+C3XDsrTVHG2UVmnJ1IfYZhpM7OSbNgJKuyTvhcjZG
 rpVZ0ftO2VPIXnRguZ2eiNj4oXkMSeuhKTMeP3p5OQiHGuvoZ6302JTcpDkfdx0aZ8
 Hr4S3m8JU143sFNEgqOvpzktvXhNOUDWTEqPfcDvF/Z6JiMnl8AWi0hWLKfXqYxw+F
 +pBk9ufjVALgKgn87P+EGe4ZG0ShBZarh5gDEhceMcdSQN351DJaIM7pXkaW09huFD
 L74amVAyoUvrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BGaSKlkO
Subject: Re: [Buildroot] [PATCH] package/p7zip: bump to version v17.06
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

Cj4gSWwgZ2lvcm5vIDUgbWFnIDIwMjYsIGFsbGUgb3JlIDIyOjMwLCBNYXJjdXMgSG9mZm1hbm4g
PGJ1aWxkcm9vdEBidWJ1MS5ldT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiA1LzUvMjYgMjE6MTYs
IEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBXaGF0J3MgQ2hhbmdlZDoKPj4gICAtIEZpeCBDVkUt
MjAyMS0zNTIwIGFmZmVjdGVkIGNvbXBvbmVudHMgTHo0IDEuOS4zIGluIHA3emlwMTcgKCMyMzkp
Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPiBIaSBHaXVsaW8sCj4gdGhpcyBzaG91bGQgaGF2ZSBi
ZWVuIG1hcmtlZCBhcyBhIHNlY3VyaXR5IGJ1bXAuIEFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhh
dCBjaGFuZ2VkLCB0aGFua3MhCgpPaCwgSeKAmXZlIG1pc3NlZCB0aGF0LCB0aGFuayB5b3UgdmVy
eSBtdWNoCgpHaXVsaW8KCj4gCj4gTWFyY3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
