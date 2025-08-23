Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C3CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB626062F;
	Sat, 23 Aug 2025 18:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6Jg06oibP6f; Sat, 23 Aug 2025 18:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60DF9610BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60DF9610BA;
	Sat, 23 Aug 2025 18:17:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 927FDE4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78F7F409F9
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptkxyLZS684Y for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 576B4409D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576B4409D0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 576B4409D0
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:17:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3c79f0a5b8bso480845f8f.1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755973021; x=1756577821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JbDWyitDl04YXbox+vUXl4itRSnYhFC6sCAoCMF6QGc=;
 b=emjPPxHzSBNbmgMVdxd0oZL8dsOGgdqXlVe9mUc+wE1pSyNB5apLvLclSLpp5mGeSv
 nAkmYkAQ0q43jPNdMa0h8XmeaJ8rVsgoCJNRkoCSPBCd10SRqk8KMLajesu7KD2UCeR/
 fpeCWeFbMnN+YjUZCiU22hp4hCOf/PfRz0tU8UfsjJyHKMEZoc4JlQbv618ZxLLCBsqx
 fqoH3qxcSOvTN/NZPj8x5YMDrdDpcSUB7RFtKav5OC1UaWiXK0rGVRYUDyhyBiYFkfh+
 GfsbdjANfF9C/qzEGqq1H/QzHXKGdQ4NXvW0GfqXPs1F7C1ez3gYrr2wfHzjyZvEvPF5
 9DQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUklPAJ0GDsrKc3pS2kCn7XtAP59/qvvxqZHXP28RzYo1PEMdfGYX1EmJDjl2w79mqVii3qWNdyAqk=@buildroot.org
X-Gm-Message-State: AOJu0Yxey38n/sviKzVEO7lKCjL0S2eB9GbLAQJnObchpG4JsjbgFwqr
 KxL3m9q72azlKpir7x04L5JIAewvaho5IKkADcpqP5PJ/8hbXW1hqJzSDgLt5iZN76kM4lMWb11
 1FpGs
X-Gm-Gg: ASbGncv3DJjD6NDbIvpP0bGuaBtX0A5/EEffLBdHr5YdMTHNUyzsq528gyYQloMyfOy
 zrbxRlP30CuimMwOObTnMaDxCE7Hrf7ji4zLE65M+Rz2gV9bWa3Z+SoOKistfXckYc8Y5tIOiEx
 8wccKH70IjiXwExn8mXkfpJ9MDsdtTN5I/B6UX3YexI97yfTeVoL9XlIhHj2sqom4IrssHSwG3f
 IGayaRQXc3f8I5w+OR3fracu4U0xqOYwiSkbWjRi93ZdsEZ0OdsWLZny5LXlpTdNqL47L1BFEmi
 a/C9HaTU9bdXzrB75Anvs/nySi2TDfO9J+OmQdKqDa+VYTZlHgyU4+pfXlyVx711fD4TJIAZ71A
 xruI3SAuinMCEXnU0fbv/UiTbrJrY8bb9UdxqfMvXgYkKf4tapfE3D7b2Sym3s6xeL5Rv1VoRoo
 Nk6WXygJDWFWXx4cTO3c5CA/s8Q7Dz4NHV1Pk8hxZCa8x0pybo0t9h4cAQ446f
X-Google-Smtp-Source: AGHT+IG//uBQSc2jKaPQq41x2mNNE3apg8qiURvEAQEzL6zHPXtqhJAkt5yIr/o5WFYdyaYV6QSF9w==
X-Received: by 2002:a05:6000:40dd:b0:3b9:10ed:e6eb with SMTP id
 ffacd0b85a97d-3c5dac17469mr4839187f8f.8.1755973021144; 
 Sat, 23 Aug 2025 11:17:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e4ba1eesm4709405f8f.2.2025.08.23.11.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 11:17:00 -0700 (PDT)
Message-ID: <f22663ad-7c83-49af-9be2-da56f622abac@smile.fr>
Date: Sat, 23 Aug 2025 20:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250823143843.50035-1-thomas.petazzoni@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250823143843.50035-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755973021; x=1756577821; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JbDWyitDl04YXbox+vUXl4itRSnYhFC6sCAoCMF6QGc=;
 b=0gjkU7PdT8vtlNe8u1FTaxpiCquGTSIi1gDiK6EbJu2n7p574KaymXji45yiflaGCS
 YJqulYB4n4koQWU+z4S+KuZOnQ8zHGDPrtk97Bo4taZbgVxBmLRSwEi/fcdV57H1ehei
 7exWgno5JipwQePjb9qAIeioUjut0bRjXx96k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0gjkU7Pd
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
YnJhbmNoZXMuCgpBcHBsaWVkIHRvIG5leHQgYW5kIGJhY2twb3J0ZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCgpJJ2xsIGxldCBzdGFibGUgbWFpbnRhaW5lcnMgYmFja3BvcnRpbmcgdGhpcyBjb21taXQg
dG8gMjAyNS4wMiBhbmQgMjAyNS4wNS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAg
c3VwcG9ydC9zY3JpcHRzL2N2ZS5weSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9j
dmUucHkgYi9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5Cj4gaW5kZXggMWNiZTI0YzAyZC4uYmE0MTc2
MmZhMCAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5Cj4gKysrIGIvc3VwcG9y
dC9zY3JpcHRzL2N2ZS5weQo+IEBAIC0xNzAsNyArMTcwLDcgQEAgY2xhc3MgQ1ZFOgo+ICAKPiAg
ICAgIGRlZiBlYWNoX2NwZShzZWxmKToKPiAgICAgICAgICBmb3Igbm9kZXMgaW4gc2VsZi5udmRf
Y3ZlLmdldCgnY29uZmlndXJhdGlvbnMnLCBbXSk6Cj4gLSAgICAgICAgICAgIGZvciBub2RlIGlu
IG5vZGVzWydub2RlcyddOgo+ICsgICAgICAgICAgICBmb3Igbm9kZSBpbiBub2Rlcy5nZXQoJ25v
ZGVzJywgW10pOgo+ICAgICAgICAgICAgICAgICAgZm9yIGNwZSBpbiBzZWxmLnBhcnNlX25vZGUo
bm9kZSk6Cj4gICAgICAgICAgICAgICAgICAgICAgeWllbGQgY3BlCj4gIAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
