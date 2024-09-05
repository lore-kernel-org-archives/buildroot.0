Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5693CE7A96
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B5E740F7C;
	Thu,  5 Sep 2024 20:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YM6ePriirxTL; Thu,  5 Sep 2024 20:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67FCF40E96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67FCF40E96;
	Thu,  5 Sep 2024 20:17:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2B5C1BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E6281E21
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwvJUXzGGEcI for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E96F81D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E96F81D5C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E96F81D5C
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:17:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3CD5240004;
 Thu,  5 Sep 2024 20:17:39 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:17:39 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20240905221739.3bf6a187@windsurf>
In-Reply-To: <20240905064352.893394-2-salvador.joseluis@gmail.com>
References: <20240905064352.893394-2-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725567460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baw0o7UYqp2TGY6kujHaCv3KKgWTh+cE4MPA8p4zpx8=;
 b=QHCPWOGYBouG0FdVs9D+0y4NPT7ofeXtJRKngRLkQtaOwLB1jgt3por29ErKikD3BGRRUV
 Jvsr3piSeEq/KdLe0Mk6BOeSimg3caBK8EyC9h/DKrVRvYfhqECR930ziVkyW8PAKVDQS7
 SjzSF/jGPO6JM0hs37zO6q4IyjbfDyTeLjThuYl8vZlvn6TbBewW+i2MyOMU4QpMO/iu3E
 7FVF/sx8yattK8m+KJfanod3uFeIVUJ/TpxnmRsrIXLOma2GO8tMoL9ku9onRy9EkVenGb
 cnnUEetsU8lBx4npWVwoGz0YqvFcihD51mI5M91D0fXFkHRvUJrsLza+IBlAeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QHCPWOGY
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.6
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgNSBTZXAgMjAyNCAwODo0Mzo1MyArMDIwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6
IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL3pmcy96ZnMuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS96ZnMvemZzLm1r
ICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
