Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A82ECA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 15:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D6D781322;
	Fri,  2 Oct 2026 15:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFbOIzvs2BCr; Fri,  2 Oct 2026 15:54:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 379028131B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790956497;
	b=jl6OKmOUQTIDuTNSYWhi8gMGH8er3xqEEPAEpkJIE8Hy41k8qlso2VDMGg1dUqj4WQ7z
	 NWPguJGcjIRJtGpxQm46995br7jePxBjwNFwEcQR5kvi+98gEk5UYJqz3JM01E+wuymAO
	 RAskUY0iqhCH5MPfaR0/AfFwHT/DARKiAzh+xV3fHRPaH54wxBLjWz4wEJZ1RKBqnK5pp
	 +F3Io1arYXBxPjLXfDDZP/KWprEwlNUI9r7JtgGF7ImVoGhOtQIUmZPfyGtwKm2HHvdo7
	 hcTQibjdUt6xU2z4qsSat7jYgGaOVjwVUpRw2MTVPGAcsl+Udzv2mx2/ih+H8wq3aMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790956497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:From:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Transfer-Encoding:Content-Type:Errors-To:
	 Sender;
	bh=fWHpMmXG8t4fVtg610uzgSWhmmgBW+82Ccwh4vW+NgU=;
	b=s5IlID9posVCVVOjMhY74zwRLftJoAUMbhH6UHdRycl+xshRjiP3lCuxNhs31gchP78X
	 bYVdxlyhyOj4ef7pMVXBMqMqVA14pgoMVXt4MnMjgsNfunypvElLx8eyw4NxTKQAMRfHl
	 rzlNIDi3Dm9xVp9SUCrDWmVmrEL1gOLbIPgIVaLmlS3kzm+9Ble12lz1PXdIm6Rp3jCPA
	 6SUYDnUfcmg4MLI0BS2HdMHVuItRiRmU92piwC/z05Q5qeyySPeiqtBeiZFK7uZq1EZkG
	 s73Hm+RT1f2CHfJZTZImGoKOIrVHkWw/thr83I+/0rXHrng0NucREswyRGGhtIIPfxw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=green-communications.fr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790956497;
	bh=fWHpMmXG8t4fVtg610uzgSWhmmgBW+82Ccwh4vW+NgU=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VwdSNFXtAVx3OfOpfx5+Fhg2QsRft6fty+2AV6ZOw9e2z0mF2jAvTAzwduRsV00+p
	 zWj9jUZh7CEbG3h8eLCbvWNXeLjs8QIK+J8C0Qtn//78uZ6dM6tHgsteAKnHzr4h3y
	 BUlEy7dlpzCH+qCBt8OK1LxCh9I9Nu89JxD8gdteS4mXb8daJ4hUl7DRYtnBHiUgRH
	 z2ZFJaaiZiUO9k31rk1hVYnTUOoM4kAiSH0qXo9VlC9luOvAJN30vaQG0J5NxvOcmc
	 4bBLDgSoiXNpVb9G7Abd/ckdDzW64hHjnSs6TmdUvcMJ1ha/1xi74H6xBKtNjiA2jH
	 jXmjTA5FfhbdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379028131B;
	Fri,  2 Oct 2026 15:54:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA783AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69CA481318
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hy5ZBsFXCu8T for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 15:54:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1A42481317
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=217.72.192.73
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790956494;
 b=G7xBK/g6zcZbXHNHnY1wDCqkEHDrKm5gahXRLJaz3dY3+/BXsOSnML4FkcWcbXZn03yo
 LWGhKKo3Ya33sS4xzbgsW3jaLsg3xbt/dGqGtlYfyNMHBUA6lfojYaBYfue05hbCMGqtR
 25YFseJVN4oJAHDUvf+3aynmbDajae9IlUzaplpg1bW0FHkHFi7bFqSJcEbtR/B92cBaL
 7ir0XTL8p+1HHFjCCzReKZ6AfQYQvrCrG5e2S6Z4rmpkFpO7Bqk8J3hEhAwZseAiuOQYZ
 Bb4b7Mtw8F19A3lQqsLQ4Q/bO3R2UYC3aX22n25CsDwOXVVoQ0RTHRFJR4y4w6g4cxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790956494;
 h=Received-SPF:Received:Message-ID:Date:MIME-Version:User-Agent:
 Subject:To:References:Content-Language:From:Autocrypt:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=RHmJVneHnUZuQVl4t93U/PJRn2HdSyl0AWx48UOLiYA=;
 b=kQo6W7ArKp/9HwZjgofh0J9eSOmdOLC4aVA4/rZZs8+7yo2NCsFUBCj9hEf7uF2SEF43
 taqYWlyC9e2EZ6pE7NhGPhdmKeDTFCmZdAXSv8QUR5o7+7p5OhNWwt3JtTMnTcsLaclmz
 zXfRkxnZvAfwbPhjnqyukSOFqrpc4r50XdPFAT+8ONZDDmIQ3OrCZYHr9tBJZA1B0jCbj
 U7Td00eD4qYZIhBkEbydoyRLUiddgRf5X0KBguUv/i2RRUjgjM7VBQ0/yXtxPR0D5Dryp
 UYEMtccvJt4+81cxI+dEYM+C2bPtqpIKlS8PPZfxFmAEsZIspiPlpeacEDJ/c63W4pQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=green-communications.fr; 
 arc=none smtp.remote-ip=217.72.192.73
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A42481317
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:54:53 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MAxPb-1x1RFa2bZh-008aPa; Fri, 02
 Oct 2026 17:49:39 +0200
Message-ID: <d3670794-5862-45c6-bbcf-67fcb0d56775@green-communications.fr>
Date: Fri, 2 Oct 2026 17:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Michael Nosthoff <buildroot@heine.tech>
References: <20261002153654.2415899-2-buildroot@heine.tech>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <20261002153654.2415899-2-buildroot@heine.tech>
X-Provags-ID: V03:K1:UGkhY0gEq9tFXteVepdTh//QmGwYZbHwB+MQrt8sMOwYxdgUjz/
 u4j+q87clXYH7vqXCdqlxJMdxzFslMaK7JnE6ytMet6YWDS0ysxwyzTHLWwkNa66kDS7JsD
 0y2hS9KOB5OfvlhJX3JltPAGiqz87FaU0xI1oTCMIZgpBa57AQjvpk1gDp+AzQCq5BonM8V
 ZoBewoWapHskvCXdrS1Fg==
UI-OutboundReport: notjunk:1;M01:P0:BjZjjmMQPaE=;d9863u4YpHCrEJ8H7g8aDY6ok6n
 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
 maB/sMaxOJ+VFNzb8x47EDJ3M2Nkvc=
Subject: Re: [Buildroot] [PATCH] support/testing: boost: new runtime tests
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDIvMTAvMjAyNiDDoCAxNzozNiwgTWljaGFlbCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IGEg
w6ljcml0wqA6Cj4gSW1wbGVtZW50IGEgc2V0IG9mIHRlc3QgY2FzZXMgZm9yIGJvb3N0Lgo+IEVh
Y2ggc3ltYm9sIGluIGJvb3N0Lm1rIGdldHMgaXRzIG93biB0ZXN0Y2FzZS4KClRoZSBib29zdCBz
b3VyY2UgY29kZSBhbHJlYWR5IGNvbnRhaW5zIHRlc3RjYXNlcy4gWW91IGNhbiBwcm9iYWJseSBw
aWNrIG9uZSBvZiAKdGhlbSBmb3IgZWFjaCBib29zdCBsaWJyYXJ5IGFuZCBjb21waWxlIGl0LCB3
aXRob3V0IGltcG9ydGluZyB0aGUgdGVzdGNhc2UgY29kZSAKaW50byBidWlsZHJvb3QuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
