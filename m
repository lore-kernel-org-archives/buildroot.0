Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A31C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B378C80D5A;
	Sun,  6 Jul 2025 14:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6l3Q_UqzQHO5; Sun,  6 Jul 2025 14:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DECBD80D0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECBD80D0F;
	Sun,  6 Jul 2025 14:17:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFFD612E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0FB8608F1
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTT0T77_JsfO for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E47E608EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E47E608EC
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E47E608EC
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:17:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso170741f8f.3
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 07:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751811472; x=1752416272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i6BdlBh6mJeCndRXCX21Po5YZk+89OYZxFZpIDsT04o=;
 b=lCiO2C92SP8p4ZJrxdowgVjF2C+EiBCUYstmV1BfFUXDuaENhZYlbnsQ643RsYwKpy
 seGHxbcg2bIiL2cTQv8jVuraw4ECLScoxFjjiEPBWuguGwlc0V3L2GXjdB4qwjrrj/87
 IcRNu/ILtRbDnowy4ema2FjsjmEoIfYnvpHcmhmxALFZpbZ4+64fm0EFgsPwZ9YWwHq6
 5qB6T178WaolbOXBO1fDImLp7Y6DctptWwbkvAWKl03eplqc+zMCIKDalvvAigAFy9I0
 FMM1/N1QKoRRj0Lf/fi9/CAnxywlRtI9xVEJfgzBNiyJU9ZJXrC5V9E016hVP61+uLBZ
 moxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbsewPUjLQBw1AeXK8k+R5ENrqQT4rzmLGz3qrm1+0A3Scv03T//pVykXbLeeh/bd2TRjOyPyzvqk=@buildroot.org
X-Gm-Message-State: AOJu0YwHdOj844K3x2dhlqSew0iv5tUufiKRjRCf27dPDWY1+eNsNLfE
 qhRt1L9H4PseKfTnwtn2lH5PdyVd8p5dSc5iv1/CJ+c/kgVBTKyOzZ6P/9ePJaRfdag=
X-Gm-Gg: ASbGncunUKR3CHuCuEkXMggpl/8MRgqgUwQSwmCxt3aqj/mnA1eP2ax7ZCigXOZNZuL
 c2KjMVIqEt0SbgA6f3N9COwTg4y8FVerGiaB8udQOa9B3fgAkpSskfTS9tryZe7EBotHcwEdPGn
 ejiRpdzWGVDx+lfwC8lWwNrNPecfRayvg7RbwnqqdIPAzkadx7PWyb9FMU7tVprvphkZiBA6CtQ
 hxb1ecmzWacAhYH6uxqWG73v6Rv731m8kF0ZBun+ki19oOWWFQHWJoRp8DgjiS3ekJiVPVVWAIC
 +hYrIjzkAAVI0sU/L+fCZ3ML2Dej7q9w9WBzu3nh+lpH4DmW58FfGPxv+CFWXhRBHr7VHA2lBbu
 WPsWqd+KE9LKSGPcH5Uu4MBpFmXitjYhvtEWkdrOLzLItZed07TF0OiRPh6UJ3Frf01ExJXo+uj
 5Ym3OsrqY4LmFaJI3vAXZWJpLEv3jTHqqUnOg=
X-Google-Smtp-Source: AGHT+IFo2ZG2lssBnpq4bQcHj6pqH6KNRytc7iI4AVVqqTfdHf8a132q+fIz8CcRimKHW36ormyZ/g==
X-Received: by 2002:a05:6000:1a88:b0:3a1:f5c4:b81b with SMTP id
 ffacd0b85a97d-3b49aa724d4mr3773153f8f.23.1751811472389; 
 Sun, 06 Jul 2025 07:17:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b472259842sm7609661f8f.72.2025.07.06.07.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 07:17:52 -0700 (PDT)
Message-ID: <e146d666-659c-448f-b981-0d34f3266553@smile.fr>
Date: Sun, 6 Jul 2025 16:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250704171541.1068130-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250704171541.1068130-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751811472; x=1752416272; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i6BdlBh6mJeCndRXCX21Po5YZk+89OYZxFZpIDsT04o=;
 b=0DM1Y5/Ie1+VTtZmLwTcbOzv+hcpTNb7vAHxVyIETRxEHvVJzD5wB7d4UOrji8Vw7v
 tZGGwTDUHvSs6Z3jxql6EgHdFomjbAjGuxk07aBXovNCK8Du52Po0ngU3cF79N4/lw60
 4MKicdOPlT0DkSlqFq1NEXK8Brm9obCBvQtPs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=0DM1Y5/I
Subject: Re: [Buildroot] [PATCH 1/1] package/clinfo: bump to version
 3.0.25.02.14
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwNC8wNy8yMDI1IMOgIDE5OjE1LCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gRm9yIGNoYW5nZSBsaXN0IHNpbmNlIDMuMC4y
MS4wMi4yMSwgc2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9PYmxvbW92L2NsaW5mby9jb21wYXJl
LzMuMC4yMS4wMi4yMS4uLjMuMC4yNS4wMi4xNAo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIHBhY2thZ2UvY2xpbmZvL2NsaW5mby5oYXNo
IHwgMiArLQo+ICBwYWNrYWdlL2NsaW5mby9jbGluZm8ubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvY2xpbmZvL2NsaW5mby5oYXNoIGIvcGFja2FnZS9jbGluZm8vY2xpbmZvLmhhc2gK
PiBpbmRleCBlNDMzYjY3NDBjLi5mNDBhYWVmY2Q0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY2xp
bmZvL2NsaW5mby5oYXNoCj4gKysrIGIvcGFja2FnZS9jbGluZm8vY2xpbmZvLmhhc2gKPiBAQCAt
MSw0ICsxLDQgQEAKPiAgIyBsb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICBlNTJmNWMzNzRh
MTAzNjQ5OTlkNTdhMWJlMzAyMTliNDdmYjBiNGYwOTBlNDE4ZjJjYTE5YTBjMDM3YzFlNjk0ICBj
bGluZm8tMy4wLjIxLjAyLjIxLnRhci5nego+ICtzaGEyNTYgIDQ4Yjc3ZGMzMzMxNWU2Zjc2MDc5
MWEyOTg0Zjk4ZWE0YmZmMjg1MDRmZjM3ZDQ2MGQ4MjkxNTg1ZjQ5ZmNkM2EgIGNsaW5mby0zLjAu
MjUuMDIuMTQudGFyLmd6Cj4gIHNoYTI1NiAgYTIwMTBmMzQzNDg3ZDNmNzYxOGFmZmU1NGY3ODlm
NTQ4NzYwMjMzMWMwYThkMDNmNDllOWE3YzU0N2NmMDQ5OSAgbGVnYWxjb2RlLnR4dAo+ICBzaGEy
NTYgIDJhN2E5MzIxYmUxNjllYTZlZGJjNmIxMDEwZThmN2JiMGY0YzE0ODJhMmY2NWMzNGE0OWU5
NzE5ZjEyOWI3OWEgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbGluZm8vY2xpbmZv
Lm1rIGIvcGFja2FnZS9jbGluZm8vY2xpbmZvLm1rCj4gaW5kZXggZDRjMWRmOTBkNC4uNjIzNWY0
OTc0ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NsaW5mby9jbGluZm8ubWsKPiArKysgYi9wYWNr
YWdlL2NsaW5mby9jbGluZm8ubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ICAKPiAtQ0xJTkZPX1ZFUlNJT04gPSAzLjAuMjEuMDIuMjEKPiArQ0xJ
TkZPX1ZFUlNJT04gPSAzLjAuMjUuMDIuMTQKCkl0IHNlZW1zIHdlIGNvdWxkIGdldCByaWRlIG9m
IENMSU5GT19JTlNUQUxMX1RBUkdFVF9DTURTIHNpbmNlIERFU1RESVIgaXMgbm93CnN1cHBvcnRl
ZCBzaW5jZSAzLjAuMjMuMDEuMjUuCgpodHRwczovL2dpdGh1Yi5jb20vT2Jsb21vdi9jbGluZm8v
Y29tbWl0Lzk1MDUxZDllZDAyNWEyYWQwNGZjMmM5YTIyN2RmOWQ1MDM1Mjg5MjIKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIENMSU5GT19TSVRF
ID0gJChjYWxsIGdpdGh1YixPYmxvbW92LGNsaW5mbywkKENMSU5GT19WRVJTSU9OKSkKPiAgQ0xJ
TkZPX0xJQ0VOU0UgPSBDQzAtMS4wCj4gIENMSU5GT19MSUNFTlNFX0ZJTEVTID0gbGVnYWxjb2Rl
LnR4dCBMSUNFTlNFCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
