Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997A5C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B0F4129F;
	Fri, 12 Jul 2024 15:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1ExqHyRZpWf; Fri, 12 Jul 2024 15:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2666E412A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2666E412A4;
	Fri, 12 Jul 2024 15:09:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECA01BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B43280D21
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doU7GSbmavy0 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0451D80D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0451D80D03
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0451D80D03
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:09:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so3069425e87.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720796945; x=1721401745;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+bQCwGvDwnfT/iPVMDN8wrFtRX/8+r0gsta7LzvvJ9w=;
 b=rxkRdQctcXJZdwCDHetTpawbp4lWcpot5ygwJBHUTuYaXA0mKTb41ef/TDk2z8dZa3
 S3isBACdy2PQZVzVrAHr873Wb5cpInxIhk7aZBhfGrXgMYACC6GncuhOuuyhDuUjSDRt
 GsApoJ1c/PxxR8Uv/YrK84mhFSyVbSh5QM1WB/PLz+w4AH1zJwZKs3P7NKRo0vgStDsQ
 c+xMJ9uG9nefAsyz+3aG0oVN1kkV3C7PXMF0pYsrxQaIakvawGxZTqdxirnb23lS2H+c
 U0rLiyzOgTKGr/cbCclM89TcY/5ciYadNx6tO175AGugk6DZrdCOYyRySSkf+HEdFRfS
 F35A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVis27t7ZC/OxHk+lO45HXPeSxcJBcjefjhHXcQJPxUAvA0oyC6ImAnEhzM9p7GKRbeQQki8Drk0jwQwD1XJukL4xFCqiCFOA==
X-Gm-Message-State: AOJu0YyN8rfHPS0b0W5xohIs2iD4v7GMay6nePBYCrMUadlvY9vQEDFK
 PufmixcDnY3hAEPGniDmQ2UlZ37BcGFcxzu44ygrztCS7Q5nzns7xOkRakBztezJarWdqb64atW
 W
X-Google-Smtp-Source: AGHT+IFii3GgU1oI1Az23GNGWLjsdvbwJSCKxegD9Hf3C9CgDHlrq3M3xc2eCMwjtmC2snCexrZc/g==
X-Received: by 2002:a05:6512:128a:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-52eb99d58eamr10011342e87.56.1720796944421; 
 Fri, 12 Jul 2024 08:09:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2c1640sm26123915e9.43.2024.07.12.08.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 08:09:04 -0700 (PDT)
Message-ID: <937192bf-d334-4bab-8cf3-95f91551984b@smile.fr>
Date: Fri, 12 Jul 2024 17:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Artur Rojek <contact@artur-rojek.eu>, buildroot@buildroot.org
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
Content-Language: fr, en-US
In-Reply-To: <20240504195407.1409466-1-contact@artur-rojek.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720796945; x=1721401745; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+bQCwGvDwnfT/iPVMDN8wrFtRX/8+r0gsta7LzvvJ9w=;
 b=Tba+YZwu+R9EPQFwceDgCAUVdYJyNj7Pu0gguab3/mIVeMbd8/oJuoNtkxthy0XsCi
 h/s+Q/J+gNYhbgMNyttZetBwt1vV77cBFKmj2SHCwgBhTICCCmaVVlfsfXZb3L0S0oRI
 nKFlVw9GolPgs+uxzrTqo36bfDAcLY4osBYtk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Tba+YZwu
Subject: Re: [Buildroot] [PATCH 0/4] Reintroduce SH3 support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Paul Cercueil <paul@crapouillou.net>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJ0dXIsIEFsbCwKCkxlIDA0LzA1LzIwMjQgw6AgMjE6NTQsIEFydHVyIFJvamVrIGEg
w6ljcml0wqA6Cj4gW1Jlc2VuZGluZyB0aGlzLCBhcyB0aGUgc2VyaWVzIGdvdCBib3VuY2VkIGR1
ZSB0byBub3QgYmVpbmcgc3Vic2NyaWJlZF0KPiAKPiBIaSBhbGwsCj4gCj4gdGhpcyBzZXJpZXMg
cmVzdG9yZXMgc3VwcG9ydCBmb3IgdGhlIFNIMyB2YXJpYW50IG9mIHRoZSBTdXBlckggSVNBLAo+
IG9yaWdpbmFsbHkgcmVtb3ZlZCBpbiBlNTQzZjVhMTA0ODguIAoKSXQgd2FzIHJlbW92ZWQgMTAg
eWVhcnMgYWdvLgoKPiAKPiBUaGlzIHBhdGNoIHNldCBoYXMgYmVlbiB0ZXN0ZWQgb24gSFAgSm9y
bmFkYSA2ODAsIGFzIHBhcnQgb2YgYSBsYXJnZXIKPiBlZmZvcnQgdG8gZml4IGFuZCBpbXByb3Zl
IHN1cHBvcnQgZm9yIHRoZSBTSDMgYXJjaGl0ZWN0dXJlIGluIHRoZSBMaW51eAo+IGtlcm5lbC4K
CklzIHRoZXJlIGFueSBhbm5vdW5jZSBhYm91dCB0aGlzIGVmZm9ydD8gSG93IG1hbnkgY29udHJp
YnV0aW9uIHdhcyBkb25lIHJlY2VudGx5Cm9uIHNoMz8KCldlIGFyZSBub3Qgc3VyZSBpdCB3b3J0
aCB0aGUgZWZmb3J0LgoKPiAKPiBGb3IgdGhlIGludGVyZXN0ZWQsIGJvdGggbXVzbCBhbmQgdUNs
aWJjLW5nIGhhcyBiZWVuIHRlc3RlZCwgYXMgd2VsbCBhcwo+IGdjYyBpbiB2ZXJzaW9ucyAxMS54
LCAxMi54LCBhbmQgMTMueCwgd2l0aCBhIHJhbmdlIG9mIGNvbW1hbmQgbGluZQo+IHRvb2xzLCBj
b25zdGl0dXRpbmcgYSBiYXNpYywgeWV0IHF1aXRlIGZ1bmN0aW9uYWwgcm9vdGZzLgoKQXQgbGVh
c3QgeW91IHNob3VsZCBhZGQgeW91IGluIHRoZSBERVZFTE9QRVJTIGZpbGUgZm9yIFNIMyBhbmQg
cHJvdmlkZSBhCmRlZmNvbmZpZyB0byBidWlsZCBhIHJvb3RmcyB1c2luZyB0aGlzIGFyY2hpdGVj
dHVyZS4gKGEgcWVtdSBydW50aW1lIHRlc3RpbmcKd291bGQgYmUgZXZlbiBiZXR0ZXIpLgoKUGF0
Y2ggcmVqZWN0ZWQgaW4gUGF0Y2h3b3JrLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEFy
dHVyIFJvamVrICg0KToKPiAgIGFyY2g6IHJlaW50cm9kdWNlIHNoMyBzdXBwb3J0Cj4gICBwYWNr
YWdlL2djYzogcmVpbnRyb2R1Y2Ugc2gzIHN1cHBvcnQKPiAgIHBhY2thZ2UvdWNsaWJjOiByZWlu
dHJvZHVjZSBzaDMgc3VwcG9ydAo+ICAgcGFja2FnZS9rZXhlYzogcmVpbnRyb2R1Y2Ugc2gzIHN1
cHBvcnQKPiAKPiAgYXJjaC9Db25maWcuaW4uc2ggICAgICAgICAgICAgICAgICB8IDYgKysrKyst
Cj4gIHBhY2thZ2UvZ2NjL2djYy1maW5hbC9nY2MtZmluYWwubWsgfCAyICsrCj4gIHBhY2thZ2Uv
a2V4ZWMvQ29uZmlnLmluICAgICAgICAgICAgfCAzICsrLQo+ICBwYWNrYWdlL3VjbGliYy9Db25m
aWcuaW4gICAgICAgICAgIHwgMiArKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
