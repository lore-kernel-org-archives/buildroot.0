Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F67C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4105D40279;
	Mon,  8 Jul 2024 21:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TH-45SG0nYcB; Mon,  8 Jul 2024 21:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CD54026C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33CD54026C;
	Mon,  8 Jul 2024 21:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E926A1BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E16338114B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QB7jMkzTkfnG for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B185180E53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B185180E53
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B185180E53
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:13:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3D1D20003;
 Mon,  8 Jul 2024 21:13:44 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:13:44 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240708231344.0cb2c06e@windsurf>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720473225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZtSt685vPFeInsfQBVI/Z8qpAu6acFktHWVKzNb2hc=;
 b=Jpy4H/iZdxSJ8Sc3DJd5btqmLRrC0RzkdCG4/A3v/swPPwq0gGandz0ILQtS19fo2TSAR9
 9S+jtgbux8RxsX53pY3MO9XX9Yb4B6TZ0/T2ws0/Hs5wwZRBHPU0gfaA12JhCis8pWh/pV
 1chMaryd1okESEJ5CFcS5AI5btn1W7DsaBTNieev2erRvCzkKJzYghGy6TH/4FcfFO7hYk
 I7DAoNTY9AvqdN4wxxb3nITDT2JTXYtDDWxcjEHKLRMhR63PJu01rmEY6V/nOIMe2FK8TH
 EzqAf3SLISYKCLgoni9yQiO0tlza144ANicd6g+/WlylV8jMN0vKMzjrPyRz5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jpy4H/iZ
Subject: Re: [Buildroot] [PATCH 0/8] Various skarnet.org updates and new
 tipidee package
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
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDA0IEp1bCAyMDI0IDIxOjQwOjI2ICswMjAwCkouIE5ldXNjaMOkZmVy
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gU2lnbmVk
LW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KPiAtLS0KPiBK
LiBOZXVzY2jDpGZlciAoOCk6Cj4gICAgICAgc2thbGliczogYnVtcCB0byB2ZXJzaW9uIDIuMTQu
Mi4wCj4gICAgICAgczY6IGJ1bXAgdG8gdmVyc2lvbiAyLjEzLjAuMQo+ICAgICAgIGV4ZWNsaW5l
OiBidW1wIHRvIHZlcnNpb24gMi45LjYuMAo+ICAgICAgIHM2LW5ldHdvcmtpbmc6IGJ1bXAgdG8g
dmVyc2lvbiAyLjcuMC4zCj4gICAgICAgczYtcmM6IGJ1bXAgdG8gdmVyc2lvbiAwLjUuNC4zCj4g
ICAgICAgbWRldmQ6IGJ1bXAgdG8gdmVyc2lvbiAwLjEuNi40Cj4gICAgICAgczYtZG5zOiBidW1w
IHRvIHZlcnNpb24gMi4zLjcuMgo+ICAgICAgIHRpcGlkZWU6IG5ldyBwYWNrYWdlCgpUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ggc2VyaWVzLiBVbmZvcnR1bmF0ZWx5IG5vbmUgb2YgdGhlIHBhdGNoZXMs
IGV4Y2VwdAoxLzggYW5kIDgvOCBoYXZlIHlvdXIgU2lnbmVkLW9mZi1ieSBsaW5lLiBDb3VsZCB5
b3UgcmVzZW5kIHdpdGggeW91cgpTaWduZWQtb2ZmLWJ5IGxpbmUgYWRkZWQ/CgpUaGFua3MgYSBs
b3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
