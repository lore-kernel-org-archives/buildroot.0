Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09509C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A673F40561;
	Mon, 13 May 2024 21:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K4nHax7Ospa; Mon, 13 May 2024 21:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C2C40572
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15C2C40572;
	Mon, 13 May 2024 21:04:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6131E1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C573812B8
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuuesUWtng47 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:04:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25ED581204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25ED581204
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25ED581204
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:04:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0344A1BF203;
 Mon, 13 May 2024 21:04:06 +0000 (UTC)
Date: Mon, 13 May 2024 23:04:05 +0200
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240513230405.5a3efcaf@windsurf>
In-Reply-To: <20240513205902.1096057-1-flavio.tapajos@newtesc.com.br>
References: <20240513205902.1096057-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715634247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP2tnqp/vgkHZbMXS+uLypmnsDahI7W0TQ9TZFdlgso=;
 b=fRBAzc4pFCpaLMX0yAUdQ9fwwzzXIFWWUQYIh4B4GKLDz2aGqqc7r6coBx6nFHcSdpPR4a
 eSVJtPbBdcDpOevWYYb4usg/XxzQI9HHTd3IB9eYGxZ9/oiZo70aVqFZw8mi7KD7fQYaB3
 cxDR/vPIhT1h9boXkBwxNLJfoZSjGr7KMHv8uRxxFn9XL4RR2mwAfHoqGCHMSYjwQnY0F0
 L9o9AozMlnCw5EHeN0ZOfu7ytDVLrzheiC2fQndyX0SL+ROMi7TrYm5vmYr75kcjWs8rry
 stI3bgQkf1MrmrMDRxnimGDbGQIKWj2LMgzIaKyqIvdu0eLMsqWAYGsAnv5PvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fRBAzc4p
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version
 to 2.0.30
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxMyBNYXkgMjAyNCAxNzo1OTowMiAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhv
bi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayAgIHwgNCArKy0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKWW91ciBTaWduZWQt
b2ZmLWJ5IHdhcyBtaXNzaW5nLi4uIGJ1dCBJIHJlYWxpemVkIHJpZ2h0IGFmdGVyIHB1c2hpbmcs
CnNvIHVuZm9ydHVuYXRlbHkgSSBwdXNoZWQgYXMtaXMsIHdpdGhvdXQgeW91ciBTaWduZWQtb2Zm
LWJ5IDotLwoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
