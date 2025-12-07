Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A50D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A98C40679;
	Sun,  7 Dec 2025 16:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsVxty2liq8Y; Sun,  7 Dec 2025 16:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C614053C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126645;
	bh=okU5TsLoMfb5PSZ3nTaMLvLC6sQ1oF1OnlO8fMZWdI8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PrMsPtRFgdOENm69TCDFVl+v/FTTQjAL1EbR8uN5zh3ASe5iHKgZ3NFpolxsK2raZ
	 nw+MwzJ+4Cm1zI0ty/gJY+H4aoh5VWjzDCE5pPDtRneTns3T/NntpSLtmnPZDFATeQ
	 0fsHFPMODj0uBg/Lm4KhsZISXFuRiThs6uXaE2GYZi4eoyNqDBEC48EeO9jyy45Fvk
	 cGG1QY7BbS0ny8Sk6zCvSB8MidUW6MWhZBBrbKTWtojJA1Fklr4REbkaxtul7VKiwO
	 3QitA8XE8M3D7Z/KglP37l5+vgYmlmWqsvdjHeLgr8MsapReyRNSH1EzKascJzmR9K
	 NVjkDiOyfPKMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C614053C;
	Sun,  7 Dec 2025 16:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F122CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 029E181412
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pPp-GLSMQ2D for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 194F081397
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194F081397
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 194F081397
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:57:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A47A4C17B74
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:56:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E9B4606D3;
 Sun,  7 Dec 2025 16:57:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 462A5102F247E; Sun,  7 Dec 2025 17:57:18 +0100 (CET)
Date: Sun, 7 Dec 2025 17:57:18 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20251207175718.12f46be9@windsurf>
In-Reply-To: <5b26839a-11ff-4649-a96b-b90c2c535d8f@gmail.com>
References: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
 <20251207153517.1a3388bf@windsurf>
 <5b26839a-11ff-4649-a96b-b90c2c535d8f@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765126639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vcD/tjyC26cZvjYCVjag/tFh+zU/d7tK9I4y6HNK2+M=;
 b=H+Rc+mImf/YhOnapfveiBFXE7smaNfqqxKkTStXopqL2GeS8ZhFkOlMV8NHMhoaqfZjkJs
 8QPhN2Tr3SVQ5mAo20bo/mQBBAgJruGLG49PjpnP81AX8vQCZh/ba2lWfN/MuGKxeS6W8Q
 BxLo9Ce0DIunWBPUAHQ7o69xGNYBMhW2bnIa5N46KVnTwqkdkvsj2OxCP8oqEWlZ3WI7G4
 Z1OeoOWuBP74YOU2YckVI07Qy99RqnQLSaqsPGrZz7cHzApPHt4utP4D4qxUyD84O6kJeS
 TMcIoK2ykSnxwmwd8LzFhkXeQkl4mAST6pee9dD8NQ0Po51uVslR95wvhsc7Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=H+Rc+mIm
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wayland: make libdrm and
 xlib_libxshemfence optional
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

SGVsbG8gUmFwaGFlbCwKCltQbGVhc2Uga2VlcCB0aGUgbGlzdCBpbiBDYyB3aGVuIHJlcGx5aW5n
LiBUaGFua3MhXQoKT24gU3VuLCA3IERlYyAyMDI1IDE3OjUzOjQzICswMTAwClJhcGhhZWwgUGF2
bGlkaXMgPHJhcGhhZWwucGF2bGlkaXNAZ21haWwuY29tPiB3cm90ZToKCj4gPiBZb3Ugc2VudCBh
IG5ldyBpdGVyYXRpb24gb2YgUEFUQ0ggMi8yIGluIHRoaXMgc2VyaWVzICJwYWNrYWdlL3h3YXls
YW5kOgo+ID4gYWRkIG5ldHRsZSBhbmQgbGlibWQgYXMgc2hhMSBsaWJyYXJpZXMiLCBidXQgeW91
IGRpZCBub3QgcmVzZW50IHRoaXMKPiA+IFBBVENIIDEvMiwgd2hpY2ggaXMgcmF0aGVyIGNvbmZ1
c2luZy4gIAo+IAo+IEkgdGhvdWdodCBJIGhhZCBhbHJlYWR5IG1hcmtlZCB0aGUgb2xkIHBhdGNo
IHNlcmllcyBhcyBvYnNvbGV0ZS4KCkl0IHdhcyBzdGlsbCBpbiB0aGUgIk5ldyIgc3RhdGUgaW4g
cGF0Y2h3b3JrLCB3aGljaCBpcyBob3cgSSBub3RpY2VkLgoKPiBJ4oCZdmUgYWxzbyByZWFsaXpl
ZCB0aGF0IGl0IGRvZXNu4oCZdCB3b3JrIHRvIG1ha2UgdGhlbSBvcHRpb25hbDsgZXZlbiAKPiB0
aG91Z2ggdGhleSBhcmUgZGVjbGFyZWQgYXMgb3B0aW9uYWwgZGVwZW5kZW5jaWVzIGluIHRoZSBt
ZXNvbiBmaWxlcywgCj4gdGhlIHNvdXJjZSBjb2RlIHN0aWxsIGluY2x1ZGVzIHRob3NlIGxpYnJh
cmllcyB1bmNvbmRpdGlvbmFsbHksIGV2ZW4gCj4gd2hlbiB0aGV5IGFyZW7igJl0IHVzZWQgKGF0
IGxlYXN0IG9uIHRoZSBsYXRlc3QgdmVyc2lvbikuCgpPSyEgVGhlbiwgdGhlcmUgaXMgYW4gdXBz
dHJlYW0gYnVnOiBlaXRoZXIgbWVzb24gZmlsZSBpcyBpbmNvcnJlY3QsIG9yCnRoZSBjb2RlIGlz
IGluY29ycmVjdC4gRGlkIHlvdSByZXBvcnQgdGhlIGlzc3VlIHVwc3RyZWFtPwoKVGhhbmtzIQoK
VGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
