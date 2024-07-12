Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC75C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5763401A1;
	Fri, 12 Jul 2024 14:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOvxELzr3DJK; Fri, 12 Jul 2024 14:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE08415EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE08415EA;
	Fri, 12 Jul 2024 14:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08ED21BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB90B84696
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9Blv8azxRIk for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAE3E84692
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAE3E84692
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAE3E84692
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:43:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2E441C0002;
 Fri, 12 Jul 2024 14:43:11 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:43:10 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20240712164310.3f6e58bc@windsurf>
In-Reply-To: <20240607071359.767329-2-gael.portay@rtone.fr>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-2-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpR2Z4vMoYhvlTECwE02xE1zJ+VTZZ21hrDYp3LKFlw=;
 b=KwAZtBv1t5FoqRiWU8TMC7LMzoeutTAiaoEe6jg1o9kjEvCvxuZMO2U+HtjOMjy/W+5KFE
 qZUc6O0gdH02kI999Bf2HUOraK0wcxrqiAwJV8O3gCoMmeiqXt04pfUFO+2D/3ztSw6fhl
 cW0tjt8b0YeN9oT+AR5fzBl3NWSqHDuVJlDBt2nG2e4niYKs7SEWppwonbzsDO4iKpehxj
 d0R36ALeuQ/CfCmKpU0GOeXb2931s32x9+VJyRP+0gnGn0ymqBIIgTHQryEtwR05sg64Lm
 SeF+4QOCPp4pS1aA98REqxTDEMNAchZ27a5ouROlkfXKeAhSrabcfvBIBqQzHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KwAZtBv1
Subject: Re: [Buildroot] [next v2 1/2] configs/raspberrypi*: bump kernel
 version to 17f135b (6.6.28)
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgNyBKdW4gMjAyNCAwOToxMzo1OCArMDIwMApHYcOrbCBQT1JUQVkgPGdhZWwucG9y
dGF5QHJ0b25lLmZyPiB3cm90ZToKCj4gTm93IGJhc2VkIG9uIDYuNi4yOCAoZnJvbSA2LjEuNjEp
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+
Cj4gLS0tCj4gIGNvbmZpZ3MvcmFzcGJlcnJ5cGkwX2RlZmNvbmZpZyAgICAgICAgfCA4ICsrKyst
LS0tCj4gIGNvbmZpZ3MvcmFzcGJlcnJ5cGkwd19kZWZjb25maWcgICAgICAgfCA4ICsrKystLS0t
Cj4gIGNvbmZpZ3MvcmFzcGJlcnJ5cGkyX2RlZmNvbmZpZyAgICAgICAgfCA4ICsrKystLS0tCj4g
IGNvbmZpZ3MvcmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZyAgICAgfCA2ICsrKy0tLQo+ICBjb25m
aWdzL3Jhc3BiZXJyeXBpM19kZWZjb25maWcgICAgICAgIHwgOCArKysrLS0tLQo+ICBjb25maWdz
L3Jhc3BiZXJyeXBpM19xdDV3ZV9kZWZjb25maWcgIHwgNiArKystLS0KPiAgY29uZmlncy9yYXNw
YmVycnlwaTRfNjRfZGVmY29uZmlnICAgICB8IDYgKysrLS0tCj4gIGNvbmZpZ3MvcmFzcGJlcnJ5
cGk0X2RlZmNvbmZpZyAgICAgICAgfCA4ICsrKystLS0tCj4gIGNvbmZpZ3MvcmFzcGJlcnJ5cGk1
X2RlZmNvbmZpZyAgICAgICAgfCA2ICsrKy0tLQo+ICBjb25maWdzL3Jhc3BiZXJyeXBpX2RlZmNv
bmZpZyAgICAgICAgIHwgOCArKysrLS0tLQo+ICBjb25maWdzL3Jhc3BiZXJyeXBpY200aW9fNjRf
ZGVmY29uZmlnIHwgNiArKystLS0KPiAgY29uZmlncy9yYXNwYmVycnlwaWNtNGlvX2RlZmNvbmZp
ZyAgICB8IDggKysrKy0tLS0KPiAgY29uZmlncy9yYXNwYmVycnlwaXplcm8yd19kZWZjb25maWcg
ICB8IDggKysrKy0tLS0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDcg
ZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciBhZnRlciBmaXhpbmcgdGhlIGxpbnV4Lmhh
c2ggYXMgcG9pbnRlZCBieSBCcmFuZG9uLAp0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
