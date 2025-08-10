Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3A8C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBDD7822CC;
	Sun, 10 Aug 2025 15:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiCzgy6EZxN5; Sun, 10 Aug 2025 15:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC063822E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC063822E1;
	Sun, 10 Aug 2025 15:32:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA3CE31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC1F260F35
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNcPbdKx9Jvz for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBC6360F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC6360F2F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBC6360F2F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:32:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-459e7ea3ebeso13195895e9.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 08:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754839948; x=1755444748;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAveFK5xWWaJg4FDLuRZyKqQE10zIvFNSnOG3YS8UEE=;
 b=hok7yu/oYVDjfS7uGu6fCnxoeiQU6p+mc+nTFhcBWtpCLFD0QiGpL+dq75X5fbpzw3
 VWKA3vA8HbY5xmHGSZLLo0AwK+PRzO9WSC9QKVFWpFxkwsSqlDRaRWLaa2NnOjGKNoHm
 6h280xtndc5KdsK0UXcK67K7rLt6mDJDa7Xv35DnEFrA1D3jVQYh0P65xQ86fkDNHkkX
 08aDo6hS6JAQ6jwblN1OX17QdDtx4B82UJL7ij6EL5E/kAkmzbFkcmQJFmvVQL0j/dev
 DjS+8nOLuAqu3TNCxj0sStcFVeZncWg4OCMDs9jWba18q4CaTMPyRM8veqzB22gqD/cg
 JtRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtXvuNhXIXLH/p7tj3g7Evd3f+DI/mEh8qJdEL1tdZ4+nRXf0i+1kfWzzPbZYrSHsPiCokyyIFwvY=@buildroot.org
X-Gm-Message-State: AOJu0YxowlQOZ36x3cZSN+xXYRx+RaMAtq0nc1C+/SpAO/if3RueYcsa
 SfC/7pYTG+ajKvuq4YNJACZ5DyJwsQOCQgCr42PJXuGVf2+ELoiybO+wBot9usQ7xPQ=
X-Gm-Gg: ASbGncveE4T66Bfy6Br2VSA+BqQ0aOgWrdbg4yfwy9/EZQph2jHrbk4FRqx70w7x2/+
 /qiTyFupSYb9gpBCe6My3b2iwPWOp/UJt8odwR7wevoi/3KD6BKCsVCC7mRtIFqU/kLhUMQ3kdX
 RvpYWqK9RjAgPpB58y/AuXiyWaGP79/B5GqN0EMk9xNkXw2mkNy8qcIJ8sCC7YxOx2NSi8qQ7yK
 gDHIadFnEtAcKayMH6z0K1dor2eDHRP7045pEtPkcqITbDc7m6O7kZFRIc6yUmZpALrE8cw/5TH
 XOOdwPn9VXKI1hqQoLFHgTqYivfARKi0vU0HTOSqMvj/Xohp/RMfmHzFosnPEIG5UjILp4sQbxk
 qTK24e4XtA/4RwzPvGiMOb8+5X/W6oWYTt1gaunGH+td+jcYWPVjcbf3vfxoOMQhoiQWIsEhG5G
 Fnk2Qd13g25NSGYxQDPjLtHa+NL9gtfHdcmMwnon86G4tFeJc2eRsZxKU3bhLTrB4STB0lIoQ=
X-Google-Smtp-Source: AGHT+IFwVjAbS0iSvEgIHqYFCv44aZIackj8IoEpmCR5uoEZEve4McPLbZqzhEqzezIl9jJibxVnSw==
X-Received: by 2002:a05:600c:4fcb:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-459f4f3e883mr72343555e9.13.1754839947837; 
 Sun, 10 Aug 2025 08:32:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eaeeesm499697365e9.25.2025.08.10.08.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 08:32:27 -0700 (PDT)
Message-ID: <d84a5c0a-2cc5-462b-9b28-bb5ad63c6adb@smile.fr>
Date: Sun, 10 Aug 2025 17:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
References: <20250810150509.13653-1-fl@n621.de>
Content-Language: fr, en-US
In-Reply-To: <20250810150509.13653-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754839948; x=1755444748; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cAveFK5xWWaJg4FDLuRZyKqQE10zIvFNSnOG3YS8UEE=;
 b=c6ppZ6zLTIymOe1PJGWEhbRkOTfiw2TWtVBRoJE1lGAZMjhlNdoKTocxs5+0Hhs12X
 XiXDA7X+xOo0ihKqa2kb/V6IFA21JS1+kPI0FsFccrGUBFWkB9muIdSCXNZ4BndHKigO
 AXy6LCmb0XWBMiYFZLYp0Zclhw7MM3A7xDNPQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=c6ppZ6zL
Subject: Re: [Buildroot] [PATCH 1/1] package/nanocom: fix build with GCC 15
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

SGVsbG8gRmxvcmlhbiwgQWxsLAoKTGUgMTAvMDgvMjAyNSDDoCAxNzowNCwgRmxvcmlhbiBMYXJ5
c2NoIGEgw6ljcml0wqA6Cj4gR0NDIDE0IG1hZGUgaW1wbGljaXQgZnVuY3Rpb24gZGVmaW5pdGlv
bnMgYW4gZXJyb3IgYW5kIEdDQyAxNSBzd2l0Y2hlZAo+IHRvIEMyMyBieSBkZWZhdWx0LCB3aGlj
aCBtYWRlICJ2b2lkIGZvbygpIiBlcXVpdmFsZW50IHRvICJ2b2lkCj4gZm9vKHZvaWQpIi4KPiAK
PiBCb3RoIG9mIHRoZXNlIGNoYW5nZXMgY2F1c2UgYnVpbGQgZXJyb3JzIGJlY2F1c2UgaW5pdF9j
b21tKCkgZG9lc24ndAo+IGFjdHVhbGx5IHRha2UgYW55IGFyZ3VtZW50cyBhbmQgdGhlIGZvcndh
cmQgZGVjbGFyYXRpb24gZm9yCj4gZGlzcGxheV9zdGF0ZSgpIHdhcyB1c2luZyB0aGUgd3Jvbmcg
bmFtZS4gRml4IGJvdGguCj4gCj4gRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy9lYmYvZWJmNTAwYzQ4YWFhMzU3YWFhYzNhODhkODdlZjhmNWMwN2NkNzhiNgoK
SSdtIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSB3aXRoIGdjYyAxNCAobm90ZSB0aGUgY29u
ZmlnIHVzZWQgYnkgdGhlCmF1dG9idWlsZGVyIGFsc28gdXNlcyBCUjJfR0NDX1ZFUlNJT05fMTRf
WD15KS4KU28gdGhpcyBpc3N1ZSBpcyBub3QgZ2NjIDE1IHNwZWNpZmljLCBjYW4geW91IHVwZGF0
ZSB0aGUgY29tbWl0IGxvZy90aXRsZT8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBGbG9yaWFuIExhcnlzY2ggPGZsQG42MjEuZGU+Cj4gLS0tCj4gIC4uLi9uYW5v
Y29tLzAwMDItZml4LWJ1aWxkLXdpdGgtZ2NjLTE1LnBhdGNoICB8IDM1ICsrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbmFub2NvbS8wMDAyLWZpeC1idWlsZC13aXRoLWdjYy0xNS5wYXRjaAo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25hbm9jb20vMDAwMi1maXgtYnVpbGQtd2l0aC1nY2Mt
MTUucGF0Y2ggYi9wYWNrYWdlL25hbm9jb20vMDAwMi1maXgtYnVpbGQtd2l0aC1nY2MtMTUucGF0
Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjcyOGM1NmEzZDAK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9uYW5vY29tLzAwMDItZml4LWJ1aWxkLXdp
dGgtZ2NjLTE1LnBhdGNoCj4gQEAgLTAsMCArMSwzNSBAQAo+ICtHQ0MgMTQgbWFkZSBpbXBsaWNp
dCBmdW5jdGlvbiBkZWZpbml0aW9ucyBhbiBlcnJvciBhbmQgR0NDIDE1IHN3aXRjaGVkCj4gK3Rv
IEMyMyBieSBkZWZhdWx0LCB3aGljaCBtYWRlICJ2b2lkIGZvbygpIiBlcXVpdmFsZW50IHRvICJ2
b2lkCj4gK2Zvbyh2b2lkKSIuCj4gKwo+ICtCb3RoIG9mIHRoZXNlIGNoYW5nZXMgY2F1c2UgYnVp
bGQgZXJyb3JzIGJlY2F1c2UgaW5pdF9jb21tKCkgZG9lc24ndAo+ICthY3R1YWxseSB0YWtlIGFu
eSBhcmd1bWVudHMgYW5kIHRoZSBmb3J3YXJkIGRlY2xhcmF0aW9uIGZvcgo+ICtkaXNwbGF5X3N0
YXRlKCkgd2FzIHVzaW5nIHRoZSB3cm9uZyBuYW1lLiBGaXggYm90aC4KPiArCj4gK1Vwc3RyZWFt
OiBTdWJtaXR0ZWQgdG8gYXV0aG9yIHZpYSBlbWFpbAo+ICtTaWduZWQtb2ZmLWJ5OiBGbG9yaWFu
IExhcnlzY2ggPGZsQG42MjEuZGU+Cj4gKwo+ICtkaWZmIC1wdXJOIG9sZC9uYW5vY29tLmMgbmV3
L25hbm9jb20uYwo+ICstLS0gb2xkL25hbm9jb20uYwkyMDI1LTA4LTEwIDAxOjM0OjEyLjAwMDI4
NDAwMyArMDIwMAo+ICsrKysgbmV3L25hbm9jb20uYwkyMDI1LTA4LTEwIDAxOjMxOjA1LjYzOTA1
MDYzMCArMDIwMAo+ICtAQCAtMzI5LDcgKzMyOSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pIHsKPiArICAgICBtZW1jcHkoJnBvdHMsICZwdHMsIHNpemVvZihwb3RzKSk7Cj4g
KyAgICAgCj4gKyAgICAgLypzZXR1cCBzZXJpYWwgcG9ydCB3aXRoIG5ldyBzZXR0aW5ncyovCj4g
Ky0gICAgaW5pdF9jb21tKCZwdHMpOwo+ICsrICAgIGluaXRfY29tbSgpOwo+ICsgICAgICAgICAK
PiArICAgICBmcHJpbnRmKHN0ZGVyciwiUHJlc3MgQ1RSTCtUIGZvciBtZW51IG9wdGlvbnMiKTsg
ICAKPiArICAgICBkaXNwbGF5X3N0YXRlKCk7Cj4gK2RpZmYgLXB1ck4gb2xkL25hbm9jb20uaCBu
ZXcvbmFub2NvbS5oCj4gKy0tLSBvbGQvbmFub2NvbS5oCTIwMjUtMDgtMTAgMDE6MzQ6MTIuMDAw
Mjg0MDAzICswMjAwCj4gKysrKyBuZXcvbmFub2NvbS5oCTIwMjUtMDgtMTAgMDE6Mjc6NTkuNTQ1
ODIxOTA5ICswMjAwCj4gK0BAIC01Niw3ICs1Niw3IEBAIHZvaWQgY2xlYW51cF90ZXJtaW9zKGlu
dCBzaWduYWwpOwo+ICsgdm9pZCBpbml0X3N0ZGluKHN0cnVjdCB0ZXJtaW9zICpzdHMpOwo+ICsg
dm9pZCBpbml0X2NvbW0oKTsKPiArIHZvaWQgdXNhZ2UoIGNoYXIgKnN0cik7Cj4gKy12b2lkIGRp
c3BsYXlfc3RhdHVzKCk7Cj4gKyt2b2lkIGRpc3BsYXlfc3RhdGUoKTsKPiArIAo+ICsgCj4gKyAv
KnR5cGVkZWYgdG8gcmVwcmVzZW50IHRoZSBjdXJyZW50IGxpbmUgc3RhdGUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
