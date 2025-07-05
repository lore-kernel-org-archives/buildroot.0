Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A594C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 20:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DE0261305;
	Sat,  5 Jul 2025 20:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyRh4pI-00HD; Sat,  5 Jul 2025 20:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52021610E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52021610E2;
	Sat,  5 Jul 2025 20:51:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 871E312E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 793B740954
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn2A2KnB2iO1 for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 20:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9032A40912
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9032A40912
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9032A40912
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:51:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so14658095e9.0
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 13:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751748661; x=1752353461;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DgMqo0o/WXKuPZ1Cgve601EfoVDtx9DZjLlXD8c1Seo=;
 b=wXN/rCpMYdiI1jbZxaVIkd344fOodaVwOc8xPhOe8aMqRR6QT4L/Cf86W+w5F8q1Lb
 gwF+05flxG5eArEA22Q7gsFVXbmjTDqOU3vUlpU4qZfgvPX/XUgyHrva2jQyCNlFBdwr
 orTOGaJfjnVqPR2J2k2VKE8gTuWAdw/J/09zWttijzdkzarg8raU0uAbZcyF14hZpbt5
 4T/V4+i9cTO5koMKF1jFuyfumfJPNkIO83eN4qr1QfNlqfQIin03xHQYaxHyfyvE+u/k
 EFBZ3bklAgZchRLegOmuQ9firMvGFeAsklCOeOA3RsZJ/KHV1jxx2BV3GS1Te7UXfYG6
 ogwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5X0Dvj1cayr16O+MBPCPukugExAbWtLLdgyrn4mLS/6F6SeE1EhrlT0jis7ys3JBlG+8DnCN1LZE=@buildroot.org
X-Gm-Message-State: AOJu0Yyz6rO8XrXwSBPJFFiO8qXuaBwOYK2vsXQQB7EzUIIokEsGHWwq
 NGS+WLO0I64VjQHYb2uFa5qrPXM5fsh5XMsAkqzIcAgoPsqSP4BNDBgJ1IychrDxxeE=
X-Gm-Gg: ASbGncs/ZDe35HjaAyVVFiv5M8LAwgxGzxhoKdvEJNk/q/+AMO/+OusGC+PkjAi3gDT
 Q+Owt8QiRnSls8XtTj0JogrpNucid5mfgQllDYK0aqEvrR/U5z65mSkSialrUaz1BI5SxKhlDkf
 mXNqDhTyaFOtRLs+G4wdKvjSIcmGwC8Uy/TPpR8Gzh7NnveqzBQDjY+t1s8jweNkhgLpg1aduUp
 GCi4cdQCLb425nWxheyqAamTla2af7Nck3BF1EZfs7OGon8nWLS38OUVUKIIQU4USYtnfKxqj5f
 L6Lasne0poYrxnu05dEcvsO9hvJetv62DlvYyXo3Ja9Ne8O2rq5+ijmKmaxC009ZpJm8QpjijiK
 lS+mZ4fCJ+Dllui3Pe5fCsE9X08tcRu4jf+CVA/EQrdk8p2YcJAGnPHTyn2hjsP+6j9cgucVlBF
 2Hy//oiWI1xGtA1X1Rv0lMFy55
X-Google-Smtp-Source: AGHT+IFTkdYrlzvA+Nbl6dWIjHkpdZECuZ2CYFRUwt/px6Ml0gldAFPzuy511K+s3xyC2ccwsVqiLA==
X-Received: by 2002:a05:600c:8885:b0:453:608:a18b with SMTP id
 5b1f17b1804b1-454bc01b5bdmr21999125e9.9.1751748661308; 
 Sat, 05 Jul 2025 13:51:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1890626sm65024785e9.40.2025.07.05.13.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 13:51:00 -0700 (PDT)
Message-ID: <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
Date: Sat, 5 Jul 2025 22:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
Content-Language: fr, en-US
In-Reply-To: <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751748661; x=1752353461; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DgMqo0o/WXKuPZ1Cgve601EfoVDtx9DZjLlXD8c1Seo=;
 b=fPGuMoXjkoRCHeHyWFvv2odb2Ms8Gp94db242kHFHh8koIBLxi609kIP3sVqJVI5+R
 spg1OMkUolimo+vY/wCoo0IalLYIe/BmOmow3GRWzvKU0hPgKS/O00x8F9235PRuRnBS
 yB8H6QweFV7wxx0qhZflih8EmN5AfovAA+YNE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fPGuMoXj
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDEvMDcvMjAyNSDDoCAxNTo0NSwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gQ3VycmVudGx5LCB3aGVuIGEgZ29sYW5nIHBhY2thZ2UgZGVmaW5lcyBt
dWx0aXBsZSBfQlVJTERfVEFSR0VUUywgaXQgaGFzCj4gdG8gYmFzaWNhbGx5IHJlcGVhdCB0aGUg
c2FtZSBsaXN0IGluIGl0cyBfSU5TVEFMTF9CSU5TLgo+IAo+IFdoZW4gYSBnb2xhbmcgcGFja2Fn
ZSBkZWZpbmVzIG11bHRpcGxlIF9CVUlMRF9UQVJHRVRTLCB0aGUgcGtnLWdvbGFuZwo+IGluZnJh
IHdpbGwgZm9yY2libHkgdXNlIHRoZSBiYXNlbmFtZSAodGhlIG5vdGRpcikgb2YgZWFjaCB0YXJn
ZXQgYXMgdGhlCj4gbmFtZSBvZiB0aGUgZ2VuZXJhdGVkIGJpbmFyeTsgdGhlcmUgaXMgbm8gb3B0
aW9uIHRvIHNldCBhIHBlci10YXJnZXQKPiBiaW5hcnkgbmFtZS4KPiAKPiBIb3dldmVyLCB0aGUg
cGtnLWdvbGFuZyBpbmZyYSBieSBkZWZhdWx0IHRyaWVzIHRvIGluc3RhbGwgYSBiaW5hcnkgbmFt
ZWQKPiBhZnRlciB0aGUgcGFja2FnZSByYXduYW1lLiBUaGlzIGZvcmNlcyBwYWNrYWdlcyB0byBi
YXNpY2FsbHkgcmVwZWF0IHRoZQo+IHNhbWUgbGlzdCBhcyB0aGVpciBfQlVJTERfVEFSR0VUUyB0
byBvdmVycmlkZSBfSU5TVEFMTF9CSU5TLCB3aGVuIHRoZQo+IGxpc3Qgb2YgZ2VuZXJhdGVkIGJp
bmFyaWVzIGlzIGFscmVhZHkga25vd24gdG8gdGhlIGluZnJhLgo+IAo+IFdlIGNoYW5nZSB0aGUg
cGtnLWdvbGFuZyBpbmZyYSB0byBiZXR0ZXIgY292ZXIgc3VjaCBhIGNhc2U6Cj4gCj4gICAtIGlm
IF9CVUlMRF9UQVJHRVQgaXMgJy4nICh0aGUgZGVmYXVsdCksIGtlZXAgdGhlIGN1cnJlbnQgc2No
ZW1lOgo+ICAgICBpbnN0YWxsIGEgc2luZ2xlIGJpbmFyeSBuYW1lZCBhZnRlciB0aGUgcGFja2Fn
ZSByd2FuYW1lOwo+IAo+ICAgLSBpZiBfQlVJTERfVEFSR0VUIGlzIG5vdCAnLicsIGFuZCBjb250
YWlucyBhIHNpbmdsZSB3b3JkLCB1c2UgdGhlCj4gICAgIG5vdGRpciBvZiB0aGUgYnVpbHQgdGFy
Z2V0LCBidXQgYWxsb3cgdGhlIHVzZXIgdG8gb3ZlcnJpZGUgaXQgd2l0aAo+ICAgICBfQklOX05B
TUUgKHRoZSBjdXJyZW50IGJlaGF2aW91cik7Cj4gCj4gICAtIG90aGVyd2lzZSAoX0JVSUxEX1RB
UkdFVFMgaXMgc2V0IHRvIG1vcmUgdGhhbiBvbmUgd29yZCksIGRvIG5vdAo+ICAgICBhbGxvdyB0
aGUgdXNlciB0byBzZXQgX0JJTl9OQU1FIChpdCBkb2VzIG5vdCBtYWtlIHNlbnNlKSwgYnV0IHNl
dAo+ICAgICBfSU5TVEFMTF9CSU5TIGJ5IGRlZmF1bHQgdG8gdGhlIG5vdGRpciBvZiBfQlVJTERf
VEFSR0VUUy4KPiAKPiBXZSBzdGlsbCBhbGxvdyB0aGUgdXNlciB0byBzZXQgX0lOU1RBTExfQklO
UyBpbiB0aGUgbGFzdCBjYXNlLCB0byBjb3Zlcgo+IHRoZSBjYXNlIGZvciBleGlzdGluZyBwYWNr
YWdlczsgdGhvc2UgYXJlIGdvaW5nIHRvIGJlICJmaXhlZCIgaW4gdGhlCj4gZm9sbG93aW5nIGNv
bW1pdHMuCj4gCj4gV2Ugbm93IGNvbnNpZGVyIHRoYXQgX0lOU1RBTExfQklOUyBpcyBhbiBpbnRl
cm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzCj4gdGhhdCBzaG91bGQgbm8gbG9uZ2VyIGJlIGV4
cG9zZWQgdG8gdGhlIHVzZXJzLCBzbyB3ZSBkcm9wIGl0IGZyb20gdGhlCj4gZG9jdW1lbnRhdGlv
bjsgd2UgcmVwaHJhc2UgdGhlIGNvcnJlc3BvbmRpbmcgcGFydCBmb3IgX0JVSUxEX1RBUkdFVFMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29t
Pgo+IENjOiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgoKUmV2aWV3
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKU2luY2UgaXQncyBh
Ym91dCBhIHBhY2thZ2UgaW5mcmFzdHVjdHVyZSBjaGFuZ2UsIEkgcHJlZmVyIHdhaXQgZm9yIGEg
c2Vjb25kIHJldmlldy4KCj4gLS0tCj4gIGRvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1nb2xh
bmcuYWRvYyB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9wa2ctZ29s
YW5nLm1rICAgICAgICAgICAgICAgICAgIHwgMTEgKysrKysrKysrLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWdvbGFuZy5hZG9jIGIvZG9jcy9tYW51YWwvYWRk
aW5nLXBhY2thZ2VzLWdvbGFuZy5hZG9jCj4gaW5kZXggNmRlMDkxNmE4My4uMjFiNmExMjJhOSAx
MDA2NDQKPiAtLS0gYS9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ29sYW5nLmFkb2MKPiAr
KysgYi9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ29sYW5nLmFkb2MKPiBAQCAtOTQsMjAg
Kzk0LDIwIEBAIHRoZXJlZm9yZSBvbmx5IHVzZSBhIGZldyBvZiB0aGVtLCBvciBub25lLgo+ICAg
IGRlZmF1bHRzIHRvICsuKy4gV2UgdGhlbiBoYXZlIHR3byBjYXNlczoKPiAgCj4gICoqICtGT09f
QlVJTERfVEFSR0VUUysgaXMgKy4rLiBJbiB0aGlzIGNhc2UsIHdlIGFzc3VtZSBvbmx5IG9uZSBi
aW5hcnkKPiAtICAgd2lsbCBiZSBwcm9kdWNlZCwgYW5kIHRoYXQgYnkgZGVmYXVsdCB3ZSBuYW1l
IGl0IGFmdGVyIHRoZSBwYWNrYWdlCj4gLSAgIG5hbWUuIElmIHRoYXQgaXMgbm90IGFwcHJvcHJp
YXRlLCB0aGUgbmFtZSBvZiB0aGUgcHJvZHVjZWQgYmluYXJ5Cj4gLSAgIGNhbiBiZSBvdmVycmlk
ZGVuIHVzaW5nICtGT09fQklOX05BTUUrLgo+ICsgICB3aWxsIGJlIGJ1aWx0IGFuZCBpbnN0YWxs
ZWQsIGFuZCBieSBkZWZhdWx0IHdlIG5hbWUgaXQgYWZ0ZXIgdGhlCj4gKyAgIHBhY2thZ2UgbmFt
ZTsgaWYgdGhhdCBpcyBub3QgYXBwcm9wcmlhdGUsIHRoZSBuYW1lIG9mIHRoZSBiaW5hcnkgY2Fu
Cj4gKyAgIGJlIG92ZXJyaWRkZW4gdXNpbmcgK0ZPT19CSU5fTkFNRSsuCj4gIAo+IC0qKiArRk9P
X0JVSUxEX1RBUkdFVFMrIGlzIG5vdCArLisuIEluIHRoaXMgY2FzZSwgd2UgaXRlcmF0ZSBvdmVy
IHRoZQo+IC0gICB2YWx1ZXMgdG8gYnVpbGQgZWFjaCB0YXJnZXQsIGFuZCBmb3IgZWFjaCBwcm9k
dWNlZCBhIGJpbmFyeSB0aGF0IGlzCj4gLSAgIHRoZSBub24tZGlyZWN0b3J5IGNvbXBvbmVudCBv
ZiB0aGUgdGFyZ2V0LiBGb3IgZXhhbXBsZSBpZgo+IC0gICArRk9PX0JVSUxEX1RBUkdFVFMgPSBj
bWQvZG9ja2VyIGNtZC9kb2NrZXJkKyB0aGUgYmluYXJpZXMgcHJvZHVjZWQKPiAtICAgYXJlICtk
b2NrZXIrIGFuZCArZG9ja2VyZCsuCj4gLQo+IC0qICtGT09fSU5TVEFMTF9CSU5TKyBjYW4gYmUg
dXNlZCB0byBwYXNzIHRoZSBsaXN0IG9mIGJpbmFyaWVzIHRoYXQKPiAtICBzaG91bGQgYmUgaW5z
dGFsbGVkIGluICsvdXNyL2Jpbisgb24gdGhlIHRhcmdldC4gSWYKPiAtICArRk9PX0lOU1RBTExf
QklOUysgaXMgbm90IHNwZWNpZmllZCwgaXQgZGVmYXVsdHMgdG8gdGhlIGxvd2VyLWNhc2UKPiAt
ICBuYW1lIG9mIHBhY2thZ2UuCj4gKyoqICtGT09fQlVJTERfVEFSR0VUUysgaXMgbm90ICsuKy4g
SW4gdGhpcyBjYXNlLCBpdCBpcyBpbnRlcnByZXRlZCBhcyBhCj4gKyAgIHNwYWNlLXNlcGFyYXRl
ZCBsaXN0LCBhbmQgd2UgaXRlcmF0ZSBvdmVyIHRoZSB0YXJnZXRzIHRvIGJ1aWxkIGFuZAo+ICsg
ICBpbnN0YWxsIGEgYmluYXJ5IG5hbWVkIGFmdGVyIHRoZSBub24tZGlyZWN0b3J5IGNvbXBvbmVu
dCBvZiB0aGUKPiArICAgdGFyZ2V0LiBGb3IgZXhhbXBsZSBpZiArRk9PX0JVSUxEX1RBUkdFVFMg
PSBjbWQvZG9ja2VyIGNtZC9kb2NrZXJkKywKPiArICAgdGhlIGJpbmFyaWVzIGJ1aWx0IGFuZCBp
bnN0YWxsZWQgYXJlICtkb2NrZXIrIGFuZCArZG9ja2VyZCsuIElmCj4gKyAgICtGT09fQlVJTERf
VEFSR0VUUysgY29udGFpbnMgb25seSBvbmUgdGFyZ2V0LCB0aGVuIGl0IGlzIHBvc3NpYmxlIHRv
Cj4gKyAgIG92ZXJyaWRlIHRoZSBidWlsdCBhbmQgaW5zdGFsbGVkIGJpbmFyeSBieSBzZXR0aW5n
ICtGT09fQklOX05BTUUrLAo+ICsgICBhcyBhYm92ZTsgaWYgK0ZPT19CVUlMRF9UQVJHRVRTKyBj
b250YWlucyB0d28gb3IgbW9yZSB0YXJnZXRzLCB0aGVuCj4gKyAgIGl0IGlzIG5vdCBwb3NzaWJs
ZSB0byBvdmVycmlkZSB0aGUgbmFtZXMgb2YgdGhlIGluc3RhbGxlZCBiaW5hcmllcwo+ICsgICAo
dXNlIGEgcG9zdC1pbnN0YWxsIGhvb2sgZm9yIHRoYXQpLgo+ICAKPiAgV2l0aCB0aGUgR28gaW5m
cmFzdHJ1Y3R1cmUsIGFsbCB0aGUgc3RlcHMgcmVxdWlyZWQgdG8gYnVpbGQgYW5kCj4gIGluc3Rh
bGwgdGhlIHBhY2thZ2VzIGFyZSBhbHJlYWR5IGRlZmluZWQsIGFuZCB0aGV5IGdlbmVyYWxseSB3
b3JrIHdlbGwKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rIGIvcGFja2FnZS9w
a2ctZ29sYW5nLm1rCj4gaW5kZXggYTRlOGJkMzBjYy4uZmY4ZDI4YWE3ZSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiArKysgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiBA
QCAtNjEsOSArNjEsMTYgQEAgJCgyKV9CVUlMRF9UQVJHRVRTID89IC4KPiAgIyBhZnRlciBlYWNo
IGJ1aWxkIHRhcmdldCBidWlsZGluZyB0aGVtIChiZWxvdyBpbiA8cGtnPl9CVUlMRF9DTURTKS4K
PiAgaWZlcSAoJCQoJCgyKV9CVUlMRF9UQVJHRVRTKSwuKQo+ICAkKDIpX0JJTl9OQU1FID89ICQk
KCQoMilfUkFXTkFNRSkKPiArJCgyKV9JTlNUQUxMX0JJTlMgPz0gJCQoJCgyKV9CSU5fTkFNRSkK
PiArZWxzZSBpZmVxICgkJCh3b3JkcyAkJCgkKDIpX0JVSUxEX1RBUkdFVFMpKSwxKQo+ICskKDIp
X0JJTl9OQU1FID89ICQkKG5vdGRpciAkJCgkKDIpX0JVSUxEX1RBUkdFVFMpKQo+ICskKDIpX0lO
U1RBTExfQklOUyA/PSAkJCgkKDIpX0JJTl9OQU1FKQo+ICtlbHNlCj4gK2lmbmVxICgkJCgkKDIp
X0JJTl9OQU1FKSwpCj4gKyQkKGVycm9yICQoMSkgc2V0cyAkKDIpX0JJTl9OQU1FIHdoaWxlIHRo
ZXJlIGFyZSBtdWx0aXBsZSB0YXJnZXRzIGluICQoMilfQlVJTERfVEFSR0VUUykKPiArZW5kaWYK
PiArJCgyKV9JTlNUQUxMX0JJTlMgPz0gJCQobm90ZGlyICQkKCQoMilfQlVJTERfVEFSR0VUUykp
Cj4gIGVuZGlmCgpJcyBvdXIgdGVzdHN1aXRlIGlzIHRlc3RpbmcgZWFjaCB1c2UgY2FzZT8KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgo+IC0KPiAtJCgyKV9JTlNUQUxMX0JJTlMgPz0gJCQoJCgyKV9S
QVdOQU1FKQo+ICAKPiAgIyBTb3VyY2UgZmlsZXMgaW4gR28gdXN1YWxseSB1c2UgYW4gaW1wb3J0
IHBhdGggcmVzb2x2ZWQgYXJvdW5kCj4gICMgZG9tYWluL3ZlbmRvci9zb2Z0d2FyZS4gV2UgaW5m
ZXIgZG9tYWluL3ZlbmRvci9zb2Z0d2FyZSBmcm9tIHRoZSB1cHN0cmVhbSBVUkwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
