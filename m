Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308D3C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 09:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AFE40942;
	Tue, 24 Jun 2025 09:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqPIoEEPY0CQ; Tue, 24 Jun 2025 09:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38450409AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38450409AC;
	Tue, 24 Jun 2025 09:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80ACA154
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724DD82EA1
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXu2nfBFW2Xd for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 09:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C72848184F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C72848184F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C72848184F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B4D61C0094; Tue, 24 Jun 2025 11:10:56 +0200 (CEST)
Message-ID: <398692b0-afdc-4031-9be3-5d0b4b2a92b1@rnout.be>
Date: Tue, 24 Jun 2025 11:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
References: <1f81ede7-bb56-4e84-b873-edfbaa8d010e@rnout.be>
 <940dc13c-453c-488b-a272-5c588074ed74@armadeus.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <940dc13c-453c-488b-a272-5c588074ed74@armadeus.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750756256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AtQk7GCLfkFlq06VBHYmZGT68gAd/cxCZ26oGoFMmdM=;
 b=JyfWKYV35BvmjHjciXD/LEQQVFQXxRufMV9KRuEkWwhIwK9youuwQgHxCWAPgjL4kLO2vc
 nLVgjED1m2ZNTkENdQJUEWxXJnjbdJAVlvXGZ/2jweTPhJEMXiHZZrXeKGCzx2SmwELM/H
 0F1f7eOvqc9FuirHHBuwgd+v40uGLF8yH2nXlXlZmAUOt0t/54g9VbvTQLkhJWlcRmYv6k
 rtu8h5JXAHq2oGAEEz2UtJYvGmoQgJSK8vMSiQu25jRVA/nanWizHdv0V0/mNfCMcfckti
 59Q1Rqo4Ym1sR35NJHbL30nXMGKp7MXwLPPqgQ+kOiZrGU418vuEFXYaHqUlXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JyfWKYV3
Subject: Re: [Buildroot] armabuilder failures on host-tar
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNi8yMDI1IDIxOjQzLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBIaSBB
cm5vdXQsCj4gCj4gT24gNi8yMy8yNSA2OjI0IFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKPj4gwqDCoEhpIFNlzIFiYXN0aWVuLAo+Pgo+PiDCoMKgU2luY2UgYSBjb3VwbGUgb2YgZGF5
cyAocHJvYmFibHkgc2luY2UgMjAyNS0wNi0yMiAyMzo0MzozOSksIHRoZSBhcm1hYnVpbGRlciAK
Pj4gYXV0b2J1aWxkZXIgaXMgZmFpbGluZyBjb250aW51b3VzbHkgWzFdIG9uIGhvc3QtdGFyIChv
ciBvdGhlciBob3N0IHBhY2thZ2VzKSAKPj4gd2l0aCB0aGlzIGVycm9yOgo+IAo+IDovCj4gCj4+
Cj4+IG1ha2VbM106IC9iaW4vc2g6IE9wZXJhdGlvbiBub3QgcGVybWl0dGVkCj4+Cj4+IMKgwqBD
b3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgd2hhdCBpcyBnb2luZyBvbj8KPiAKPiBTdXJlLCBpdCBz
aG91bGQgYmUgZml4ZWQgbm93LgoKICBXaGF0IHdhcyB0aGUgaXNzdWU/IChpbiBjYXNlIGFueWJv
ZHkgZWxzZSBldmVyIHJ1bnMgaW50byB0aGlzIHR5cGUgb2YgdGhpbmcpCgogIFJlZ2FyZHMsCiAg
QXJub3V0CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
