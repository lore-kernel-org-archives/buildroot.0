Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CDCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DBF61B47;
	Sat, 30 May 2026 13:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk9phMURdFz1; Sat, 30 May 2026 13:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 600F961B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780148757;
	bh=DxcFdoMQU6hrHFcrfozNi0NhSF7HCPS6vAKpkKNux+g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fGQwaaDLRRZLUNgKi0KHaGsnMCJuqyWGZlN8sWWsBuZ53j1snRv0oGP1wQVQMyODx
	 1pEGCvXTFOoMni47TM46bUMW6+P/Rr9vMtwNri3SsdzzhevpvRT7ZWH7pUW2pGyzwY
	 K0Kll8mc7kWvb1tyKnr4YW1GWFy2eqs3UCiJOh++55mMzMEDPWFQjWfnEwR71uDBr7
	 rwvkMxIrEV0SWkt752PfGs2yG49v4SOFqP9YG0j6vRWOrk2tKZ2pbzwI34cUx+KUPl
	 jrnk+lodc/NVxvRdxeGT2fmmkqzZpb1g2tXZeZ2sjlTf48ouWXwmLdmJAK8n4iMJLP
	 SWaLubpG8GLfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 600F961B4B;
	Sat, 30 May 2026 13:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F2712F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E945261B4B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2ZBSdsO7b-y for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31E2161B47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E2161B47
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31E2161B47
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:45:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E793DB97C67A; Sat, 30 May 2026 15:45:52 +0200 (CEST)
Message-ID: <9f3526fa-f8b6-401c-b32e-114da2e73dfd@rnout.be>
Date: Sat, 30 May 2026 15:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
Cc: Martin Willi <martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
 <20260409081401.2060709-4-martin@strongswan.org>
 <c46e2788-ebcd-4bd7-a989-c12383c7189a@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <c46e2788-ebcd-4bd7-a989-c12383c7189a@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780148753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=fhTaiuWRciP+FLPwY0PUuHPqSNH619q6/A22pDiheHY=;
 b=LrmtakADFdwr0t/ezDTyvVzYOfi3Kev9ct/YlcZtPIa3fRf/g2KTRo17V96Rr6t+pYCeKR
 9WRKQ9D3MqdyWd35605MYO+wUBoxyBoJ3jvxQQTpbjFKi64IEA9lo4FMBsLlMQP8xOSxsM
 D6Rx/+WsyzMYuD0qVWU9MEPtnM3HK/JDUzVIm8dmw7FZW7T/BTRGaRoXcQiJ2aI34OKrrh
 T6NjRQnTDtcQSnsBfSZvJsc7tO9AGRV8Mu8YFByXCeNgsl2z4rlYmMpJZRPJvQKMqujMNK
 I9L0tAXXqvxJipciQNlQ+qNcH5d398OC/tJfiJbZ1vdTpPGT8Mczd8W5kPJ/sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LrmtakAD
Subject: Re: [Buildroot] [PATCH v4 3/6] utils/generate-cyclonedx: generate
 externalReferences with source-distribution
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

CgpPbiAzMC8wNS8yMDI2IDE1OjM3LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAg
wqBBbHNvLCB3ZSBsb29zZSB0aGUgaW5mb3JtYXRpb24gaGVyZSB3aGV0aGVyIGl0IGNvbWVzIGZy
b20gYSB0YXJiYWxsIGRvd25sb2FkIAo+IG9yIGZyb20gZ2l0LiBJIGRvbid0IGtub3cgaWYgdGhl
cmUncyBhbiBvZmZpY2lhbCB3YXkgdG8gcmVwcmVzZW50IGdpdCBVUkxzPwoKICBPSywgdGhpcyBp
cyBoYW5kbGVkIGluIDYvNiwgc29ycnkgZm9yIHRoZSBub2lzZS4KCiAgUmVnYXJkcywKICBBcm5v
dXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
