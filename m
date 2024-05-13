Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA904C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9FD407B7;
	Mon, 13 May 2024 21:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBMIJ6Uxsj_v; Mon, 13 May 2024 21:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B9334086D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B9334086D;
	Mon, 13 May 2024 21:18:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26FBF1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13FF0404B4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5v4SaW-X0Cbw for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5886B40B19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5886B40B19
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5886B40B19
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:18:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87D891BF204;
 Mon, 13 May 2024 21:18:11 +0000 (UTC)
Date: Mon, 13 May 2024 23:18:10 +0200
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Message-ID: <20240513231810.4c4b1655@windsurf>
In-Reply-To: <20240327150616.39345-1-cleger@rivosinc.com>
References: <20240327150616.39345-1-cleger@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715635091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ng46rS8R8Z3Wd451ISzSLAqxYWCJTglFERrrhaHzLBc=;
 b=TyxAvbPxMCebDRJQV/P9nunbc0hxkYwO6k/JTKz/AW3EbYxIX53MaaDPCjmuXD5/RYDa+H
 XLjyZMrQ1Gp39E+WQNDTwbLKDt8oDKtMY5IuE6NMGV3t6qtB3G9eSvC0VkKQVCp6eA4m0e
 6HXG+bsK7VlOdvOVEaZjrAVc4R4rVUt1B9s2f+wjb8HDCmya+o5GRWkH7l9QNyZ/DenYSj
 spOZvKkcbSDIX/gdbrV2sI+4YaF3aTM76vzWnKAGuJq0JhCJU+lIOM69nR1Xx7gRhrf5OB
 HFxFGEsYM7O12H21/EOwKtlIz6Ox7k/jvz6A/fTruczMXXy1eeoTDI+ju9lamw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TyxAvbPx
Subject: Re: [Buildroot] [PATCH 0/2] Update kvmtool and add support for riscv
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
Cc: Anup Patel <apatel@ventanamicro.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbiBXZWQsIDI3IE1hciAyMDI0IDE2OjA2OjExICswMTAwCkNsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cgo+IEJ1bXAga3ZtdG9vbCB0
byBhIHJlY2VudCB2ZXJzaW9uIChjdXJyZW50IG9uZSBkYXRlcyBiYWNrIHRvIDIwMTcpIGFuZAo+
IGVuYWJsZSByaXNjdiBzdXBwb3J0Lgo+IAo+IENsw6ltZW50IEzDqWdlciAoMik6Cj4gICBwYWNr
YWdlL2t2bXRvb2w6IGJ1bXAgcGFja2FnZSB2ZXJzaW9uIHRvIDRkMmMwMTdmNDEKPiAgIHBhY2th
Z2Uva3ZtdG9vbDogZW5hYmxlIGJ1aWxkIGZvciByaXNjdgoKVGhhbmtzLCBzZXJpZXMgYXBwbGll
ZCwgYWZ0ZXIgdHdlYWtpbmcgdGhlIGZpcnN0IHBhdGNoIGR1ZSB0byByZWNlbnQKY2hhbmdlcyBp
biB0aGUgZG93bmxvYWQgaW5mcmFzdHJ1Y3R1cmUgZm9yIGdpdC1mZXRjaGVkIHBhY2thZ2VzLgoK
VGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
