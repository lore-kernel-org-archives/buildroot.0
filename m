Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D0AC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE54C42076;
	Thu,  9 May 2024 21:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORth5R7mDNFD; Thu,  9 May 2024 21:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F4E41E4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F4E41E4F;
	Thu,  9 May 2024 21:28:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE4FD1BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B478284040
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6Nwx0KckxRO for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CBF08402F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CBF08402F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CBF08402F
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:28:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B323A20005;
 Thu,  9 May 2024 21:28:07 +0000 (UTC)
Date: Thu, 9 May 2024 23:28:06 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240509232806.47c742fc@windsurf>
In-Reply-To: <Zj09gYTp31l7aTeQ@landeda>
References: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
 <20240408230806.5ca01f62@windsurf>
 <CAPi7W825bRBjsWKYt3c5oL4QyoEc1umm7rcmVE5Ce99XLiugbQ@mail.gmail.com>
 <Zj09gYTp31l7aTeQ@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715290088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTKRXF6o+bj/BbYEZuxLEclWTbdnBxX7tMz4nfL70wA=;
 b=H7DbnFrMRq2pQQBwLXop1msNpbQGv6tIyB91JOLi9dYIKkZaM0Cw/W7I6MP5KOfWfKs1NU
 FCm2QoTkY3AnAoTM19SbFoTF+37jthkVxCpe538RNiaYaK/CkZwjV7Dhpal8YIoWG5MHZi
 7Pue0JuwKW8I+tWxYTYy+rDGrP50p1walF9Mc/j3YkFHVZLWAfuTCTyJ/+O7anW7CzIbvZ
 V/jruX/KdRHwOcIt1ri97SIUzLROkplXiPU0/xWLoq5voACVCSc4xHXj+SwomCKMJtxwLR
 CGtfrSwpLaXAFybs8kEOT2hUc2xroXcj5Dfcnuj9mc+PXLZujIp4tc1uhGqCzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H7DbnFrM
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCA5IE1heSAyMDI0IDIzOjE3OjUzICswMjAwCiJZYW5uIEUuIE1PUklOIiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiA+IFRoaXMgb25seSBoYXBwZW5zIHdpdGggYXJt
YWJ1aWxkZXIgZnJvbSBTw6liYXN0aWVuIFN6eW1hbnNraSBhbmQgSQo+ID4gYXNzdW1lIHRoYXQg
dGhlIGJ1aWxkcm9vdCBidWlsZCBvbiB0aGlzIGF1dG9idWlsZGVyIHJlYWxseSBydW5zIGFzCj4g
PiByb290LiAgCj4gCj4gSW5kZWVkLCBTw6liYXRpZW4gd2FzIHJ1bm5pbmcgdGhlaXIgYXVvdGJ1
aWxkZXIgYXMgcm9vdCBpbiBhIGNvbnRhaW5lci4KPiBUaGV5J3ZlIG5vdyBzd2l0Y2hlZCB0byBy
dW5uaW5nIGFzIGEgbm9uLXJvb3QgdXNlci4KCkkgaGF2ZSBuZXZlcnRoZWxlc3MgYXBwbGllZCB0
aGUgcGF0Y2guIEl0IHdhcyBhIGZhaXJseSB0cml2aWFsIHRoaW5nLgpXZSBjYW4gYWx3YXlzIGRy
b3AgaXQgaWYgd2UgdGhpbmsgdGhpcyB1c2UtY2FzZSBvZiBidWlsZGluZyBhcyByb290IGlzCnRv
byBib2d1cy4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24gdGhpcy4KClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
