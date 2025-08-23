Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9F6CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31FC74153E;
	Sat, 23 Aug 2025 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QdfU3a5NuFO; Sat, 23 Aug 2025 20:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59F494155B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59F494155B;
	Sat, 23 Aug 2025 20:06:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54E2EE4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DAA4133E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSV-msW4lXul for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 20:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C111412E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C111412E1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C111412E1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:06:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b577eb4dbso6568095e9.2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 13:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755979604; x=1756584404;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IIjJmRoSq0XGtawFEuzLUkC3Jlr1s6gWJfvMKw57Ppo=;
 b=gW/bE4Jv6wc1S9rjVLA7eDg5i69AVCoHFdriBUz6sV7MhuXbkKNJ/6NH4xXKzYBshH
 OkXWX5ptFK9mJVYOJI4+qy3gTqE551wMDISPlEDjyx/g/6/Lg1ZUPFX0YXP93AUlt9kK
 KYlBEczkmsrc09SLi5ymszLik543v+ResjUzeHBaYD9cpH4PzROR9zNuLkx+M2NEHlaZ
 WugxiglaNzB2SYk0dgq5eY3/fN+4Ok0J6bKoj2rq0vVRbmZzMniA3Oa3PzSq/AV4unR9
 D27ALq7j8LIPEN8BQ95OoW7p0Kv6u2bEqfAlmdbMcclbGb4Knftya/UavzSVgF9s9xEF
 OvkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR5ThuFqbSQZxhrMhzqxSflTVNSSog/ll/DCRSvxyUw9Ue5HPmyCtI52B2pH/44S0yLIXsNtNsRdM=@buildroot.org
X-Gm-Message-State: AOJu0YyiDEDZ970mjUAQjGdwA4jvT1ZPG3eUUwhtwpgTrWmXHkaLvCxH
 vzepp9lYGyqI9tFw62KSVzZS/0UixSUBE+AcumtSSU+U+RK2P0oiqr8ZKTzWTX/L88FJhAQ7+9d
 D31JQ
X-Gm-Gg: ASbGncuWmpaMAVsoZNIm6dSnCVwybByjMclU9hqvyYaCYkGI2/wvYDpbru+L99+gGrI
 ijBO/cIvH7h6u0TFMYx6cZXBMCs3DUmvo9staT7SnEwpKi7674mGKAsdPeyAsPkpFwZD3d3Pubq
 jzX3uIbC7JUmZIKWfVE69W1Vg6lvDIuPwxU869/Jhp6D5AwlrCSDu7IVLKgPcOSztUPP6HG8a0h
 ahbRtSbYWiiqodI8d/hDpIeYeWgOter4b7MDqLcS2xISOPyt8GpBmytoeplvuagx7O5sdJwWX54
 WKoHu4bwWZMboI4HcYLVtNUrdNzdsOYigaXJHIgTYrCZLS59+nWxWqN5esSMBMf9OYpc7M+aGy/
 d3Q/ZalGjl3/9Zv2k82GwXOi9AtXNyvtir65Rk6IQ+Xg6eeOjBWqD8I4twcRw/s+3ANSQaQY10L
 RyWEvWMiKKM9yocqqNmQnFzx96mRrs3zyXxb/UQiUvo/Yg5csGU7GwdunqdeP3
X-Google-Smtp-Source: AGHT+IH5mmPI2AFllxglAXIxKCeiu4MKGts8fJEInLAuhb9zc1oKuQGoy4wSUtB3LwjpNIc0J8LeWg==
X-Received: by 2002:a05:600c:1c98:b0:456:214f:f78d with SMTP id
 5b1f17b1804b1-45b53cfa151mr49756415e9.22.1755979604162; 
 Sat, 23 Aug 2025 13:06:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4efdd30fsm58751925e9.9.2025.08.23.13.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 13:06:43 -0700 (PDT)
Message-ID: <96a97068-9ecb-4668-8b7d-72f236e66d0a@smile.fr>
Date: Sat, 23 Aug 2025 22:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250823143843.50035-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250823143843.50035-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755979604; x=1756584404; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IIjJmRoSq0XGtawFEuzLUkC3Jlr1s6gWJfvMKw57Ppo=;
 b=25M1sLNYAOxTT0SE6BO5Alek0+noORJkAKUevJeYNoPPJ4/P9X7+zkL1urey+uXNOe
 miEyJVHT6hLKf5Q4+b02mKdl09odnc9LCkuXcVEJeJzxXRuJreojIuEgtYUCLbBAsjCG
 xj6era+x1iIi6qGkUCQiwKkDUr2is0VgCXAuM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=25M1sLNY
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: handle CVEs with
 'configurations' but no 'nodes' inside
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyMy8wOC8yMDI1IMOgIDE2OjM4LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGUgZWFjaF9jcGUoKSBtZXRob2QgaXMg
Y2FyZWZ1bCB0aGF0IHNvbWUgQ1ZFcyBoYXZlIG5vCj4gImNvbmZpZ3VyYXRpb25zIiwgYnV0IHNv
bWUgQ1ZFcyBzdWNoIGFzCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIw
MjUtMzI5MTUgYXBwYXJlbnRseSBoYXZlIGEKPiAiY29uZmlndXJhdGlvbnMiIG5vZGUsIGJ1dCBu
byAibm9kZXMiIGluc2lkZSB0aGUgImNvbmZpZ3VyYXRpb25zIiwKPiBjYXVzaW5nIGFuIGV4Y2Vw
dGlvbjoKPiAKPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gICBGaWxlICIv
aG9tZS9idWlsZHJvb3QvYnVpbGRyb290LXN0YXRzLy4vc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0
cyIsIGxpbmUgMTM4MiwgaW4gPG1vZHVsZT4KPiAgICAgX19tYWluX18oKQo+ICAgRmlsZSAiL2hv
bWUvYnVpbGRyb290L2J1aWxkcm9vdC1zdGF0cy8uL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMi
LCBsaW5lIDEzNzEsIGluIF9fbWFpbl9fCj4gICAgIGNoZWNrX3BhY2thZ2VfY3ZlcyhhcmdzLm52
ZF9wYXRoLCBwYWNrYWdlcykKPiAgIEZpbGUgIi9ob21lL2J1aWxkcm9vdC9idWlsZHJvb3Qtc3Rh
dHMvLi9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzIiwgbGluZSA2NzksIGluIGNoZWNrX3BhY2th
Z2VfY3Zlcwo+ICAgICBjaGVja19wYWNrYWdlX2N2ZV9hZmZlY3RzKGN2ZSwgY3BlX3Byb2R1Y3Rf
cGtncykKPiAgIEZpbGUgIi9ob21lL2J1aWxkcm9vdC9idWlsZHJvb3Qtc3RhdHMvLi9zdXBwb3J0
L3NjcmlwdHMvcGtnLXN0YXRzIiwgbGluZSA2MzgsIGluIGNoZWNrX3BhY2thZ2VfY3ZlX2FmZmVj
dHMKPiAgICAgZm9yIHByb2R1Y3QgaW4gY3ZlLmFmZmVjdGVkX3Byb2R1Y3RzOgo+ICAgICAgICAg
ICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiAgIEZpbGUgIi9ob21lL2J1aWxkcm9v
dC9idWlsZHJvb3Qtc3RhdHMvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weSIsIGxpbmUgMTg1LCBpbiBh
ZmZlY3RlZF9wcm9kdWN0cwo+ICAgICByZXR1cm4gc2V0KGNwZV9wcm9kdWN0KHBbJ2lkJ10pIGZv
ciBwIGluIHNlbGYuZWFjaF9jcGUoKSkKPiAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4gICBGaWxlICIvaG9tZS9idWlsZHJvb3Qv
YnVpbGRyb290LXN0YXRzL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkiLCBsaW5lIDE4NSwgaW4gPGdl
bmV4cHI+Cj4gICAgIHJldHVybiBzZXQoY3BlX3Byb2R1Y3QocFsnaWQnXSkgZm9yIHAgaW4gc2Vs
Zi5lYWNoX2NwZSgpKQo+ICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl4KPiAgIEZpbGUgIi9ob21lL2J1aWxkcm9vdC9idWlsZHJvb3Qt
c3RhdHMvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weSIsIGxpbmUgMTczLCBpbiBlYWNoX2NwZQo+ICAg
ICBmb3Igbm9kZSBpbiBub2Rlc1snbm9kZXMnXToKPiAgICAgICAgICAgICAgICAgfn5+fn5eXl5e
Xl5eXl4KPiBLZXlFcnJvcjogJ25vZGVzJwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRh
enpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gVGhpcyBzaG91bGQg
YmUgYXBwbGllZCB0byBhbGwgbWFpbnRhaW5lZCBicmFuY2hlczogbmV4dCwgbWFzdGVyLAo+IDIw
MjUuMDIgYW5kIDIwMjUuMDUgYXMgd2UgcnVuIHBrZy1zdGF0cyBkYWlseSBvbiBhbGwgdGhvc2Ug
YnJhbmNoZXMuCgpBcHBsaWVkIHRvIDIwMjUuMDUgYW5kIDIwMjUuMDIsIHRoYW5rcy4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgc3VwcG9ydC9zY3JpcHRzL2N2ZS5weSB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkgYi9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5
Cj4gaW5kZXggMWNiZTI0YzAyZC4uYmE0MTc2MmZhMCAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L3Nj
cmlwdHMvY3ZlLnB5Cj4gKysrIGIvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weQo+IEBAIC0xNzAsNyAr
MTcwLDcgQEAgY2xhc3MgQ1ZFOgo+ICAKPiAgICAgIGRlZiBlYWNoX2NwZShzZWxmKToKPiAgICAg
ICAgICBmb3Igbm9kZXMgaW4gc2VsZi5udmRfY3ZlLmdldCgnY29uZmlndXJhdGlvbnMnLCBbXSk6
Cj4gLSAgICAgICAgICAgIGZvciBub2RlIGluIG5vZGVzWydub2RlcyddOgo+ICsgICAgICAgICAg
ICBmb3Igbm9kZSBpbiBub2Rlcy5nZXQoJ25vZGVzJywgW10pOgo+ICAgICAgICAgICAgICAgICAg
Zm9yIGNwZSBpbiBzZWxmLnBhcnNlX25vZGUobm9kZSk6Cj4gICAgICAgICAgICAgICAgICAgICAg
eWllbGQgY3BlCj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
