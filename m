Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D142C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 09:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 052DD40518;
	Thu,  6 Feb 2025 09:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgCMkkOgcTXJ; Thu,  6 Feb 2025 09:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F1140521
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F1140521;
	Thu,  6 Feb 2025 09:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D6A1B4
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 09:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1334054D
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 09:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBtWJTxIhCYz for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 09:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FFDC40521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FFDC40521
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FFDC40521
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 09:19:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso6530505e9.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 01:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738833588; x=1739438388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DVQWhqcEN/DWVzW/UkR/0RD3X0Y7fWDM+Yb4GJofo/4=;
 b=lqlzjUMuWgcOjQcl29lXdS02xZlQ7V0dfmDMOz17wD3CdUjQpVwC4QBBZnjeJyzUH9
 yaP/z7aDRH7MZAjYbPoVmG3BFqy8Z784BBG4utTdz9Kax3qqEjpJ3Z+01VWt30Tg2UJl
 JwTjCzJRJgAHYrI22ShLZe3aHulISzq+MJAeWb8HRLBmnYFV5ei6Dbtafg2P4TD3j9is
 F92hLPhEchfhK6e471QLQ6ozVKS6TFSaRoSGPTEVvCLe0Qm6npNV6Andu57QCFrVApBr
 5nwb1T/0ogHe+SnO9BTADtt+RG0Xu61p2w9wHwDoVq/DV0BTVDPkrSIo89mFT0n+nt/7
 G45Q==
X-Gm-Message-State: AOJu0YwZQIyhUVbvKjTp2ucIDRBt6Q9rn8g3ISBqqUeebnDDysOaGOWk
 oAuGqZzRgjWaj7mpOOzWLTYTqM28xmVMLDQaGIr3Tk6Z8XmrZlFE0Yn6r1upBhuQT7iHWUzwUky
 ptVs=
X-Gm-Gg: ASbGncuwaD7dI4ITE0hcqJ8ZpDbBxLnCfk/yDXz8NqxR30KAGjtZO+u32YsOFyhyS6A
 fQ46402SyNf19IBT/98INiQJVbbL1IJOLOmR/SaIztCyLzzigBjCl9QzEEb4Z7zIUVQUIwxFmpD
 nwDogkDF9mL/t5rGVEgA3vGxwfOsQwO9+c18itRDdaNpso20eeY6S4rxsK0O2en0ikRqxNWm8cd
 8tLQg+6BSbL447dGK2aUkdR1YK/+IzFVI3i2yq+JBqLVEIgF5mc3RtKplO4Gkeyuex/vj+FvSud
 LJFv1eJrUPiR9j3gmw3MWJ3bPq3uSnLFZnIxMGcvMsXu577jL+Y7LdWg53alBAfZlbwEfk93qWQ
 N13hko2py0c39ODyDPLAXZOsZWf+c2MNZ1efiO7YJ47IJ01uhC9I=
X-Google-Smtp-Source: AGHT+IFnJnSgI3qmHP0b1T03lo2T1t5d5Sgzv63Nxwys/l6Trc/vAxJ3wjgL2R/8ADcEO/dQfPHbiw==
X-Received: by 2002:a5d:4ac4:0:b0:385:f16d:48b4 with SMTP id
 ffacd0b85a97d-38db492af1dmr3899683f8f.40.1738833588396; 
 Thu, 06 Feb 2025 01:19:48 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc09fc2d9sm640452f8f.6.2025.02.06.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:19:48 -0800 (PST)
Message-ID: <a8708234-3072-4d64-a5d0-ede868cde110@smile.fr>
Date: Thu, 6 Feb 2025 10:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20250206072321.677851-1-peter@korsgaard.com>
 <20250206072321.677851-4-peter@korsgaard.com>
 <e7c06d15-5581-4a26-abfa-5a826e181108@smile.fr>
 <87o6zfigx8.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87o6zfigx8.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738833588; x=1739438388; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DVQWhqcEN/DWVzW/UkR/0RD3X0Y7fWDM+Yb4GJofo/4=;
 b=JC928f/uvdGaGMSpiWTT6+cnxfWsrAF2MUl8EvmUfV5ssb1SAFDl3jyo8uqDXntVCc
 htbQ1+MxwvL4tVIg8Gli/jSu/ucOrS40jHegbaW/YHhfC/AHukdP2GklZ14WjbQMpIRP
 kZgKaIXWaXTz72UJuHkSu7sL2828aucZy9UVg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=JC928f/u
Subject: Re: [Buildroot] [PATCH 4/4] .gitlab-ci.yml: use Debian 12-based
 container image with curl / tar 1.35
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

TGUgMDYvMDIvMjAyNSDDoCAxMDowMywgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6Cj4+Pj4+
PiAiUm9tYWluIiA9PSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JpdGVz
Ogo+IAo+IEhpLAo+IAo+ICA+PiArKysgYi8uZ2l0bGFiLWNpLnltbAo+ICA+PiBAQCAtMSw3ICsx
LDcgQEAKPiAgPj4gIyBDb25maWd1cmF0aW9uIGZvciBHaXRsYWItQ0kuCj4gID4+ICMgQnVpbGRz
IGFwcGVhciBvbiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvcGlw
ZWxpbmVzCj4gID4+IAo+ICA+PiAtaW1hZ2U6ICRDSV9SRUdJU1RSWS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC9iYXNlOjIwMjMwMjA3LjExMjMKPiAgPj4gK2ltYWdlOiAkQ0lfUkVHSVNUUlkvYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvYmFzZToyMDI1MDIwNS4xNTE0Cj4gCj4gID4gVGhpcyByZXF1
aXJlcyBzb21lIHRlc3Rpbmcgd2l0aCB0aGUgQnVpbGRyb290IHRlc3RzdWl0ZS4gU29tZSB0ZXN0
cyBtYXkgcmVxdWlyZXMKPiAgPiBhbiB1cGRhdGUgZHVlIHRvIHFlbXUgdmVyc2lvbiBjaGFuZ2Uu
Cj4gCj4gID4gU2VlIHRoaXMgY29tbWl0IGFzIGV4YW1wbGU6Cj4gCj4gID4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2Q4NDQ3YzM4ZjUzZjk4ZTFk
ZjRhMjA5ZTlmNzBlNTRmOGI2MGYzNmUKPiAKPiBTdXJlLCBob3cgZG8gd2UgdHJpZ2dlciBhIHRl
c3QgcnVuIGJlZm9yZSBtZXJnaW5nIHRvIG1hc3Rlcj8KPiAKCkxhc3QgdGltZSBJIHVzZWQgbXkg
cGVyc29uYWwgZ2l0bGFiIGZvcmsgdG8gdHJpZ2dlciBhIG5ldyBwaXBlbGluZSBhbmQgbG9jYWwK
YnVpbGRzIHdoZW4gZ2l0bGFiLWNpIG1pbnV0ZXMgd2FzIGV4aGF1c3RlZC4uLiBidXQgaXQgdGFr
ZXMgYSBsb3Qgb2YgdGltZS4KCkkgZ3Vlc3MgeW91IG5lZWRzIHNvbWUgdm9sdW50ZWVycyB0byB0
ZXN0cyB0aGlzIHVwZGF0ZS4KCklzIGl0IG9rIHRvIHB1c2ggYSB0ZXN0aW5nIGJyYW5jaCB0byB0
cmlnZ2VyIGEgcGlwZWxpbmUgZm9yIHRoZSBydW50aW1lIHRlc3RzPwoKQmVzdCByZWdhcmRzLApS
b21haW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
