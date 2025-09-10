Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D78ECA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05361418A3;
	Wed, 10 Sep 2025 21:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWIZOMoSOBXJ; Wed, 10 Sep 2025 21:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22824418BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22824418BF;
	Wed, 10 Sep 2025 21:38:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E91DF2BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA7DD4080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOqlakuRM8X5 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9693240103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9693240103
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9693240103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso360215e9.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757540295; x=1758145095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7vXcdWORfIijAHWjoQAMKg1iqbeCAGCOBq5r6yZxdM=;
 b=F/qm+YqcEp4cK4G3cGAPnc/VGvZLwiz4YU/OpaNQ7guaIBNpiaXbqjyM9tK8xEMUyl
 oHNKcLaJZ3py9S4s4n959JgpIN3rymw3xd4nIqb9VjhbJnymFZTnZTkvdpj0jG5pOqVW
 WPmHBQHrKsX2c6WZWn8CqAKhZPT2niCXzuKtgGx9TR6uiQF2X7ISt/389algDh9or+1/
 bGbYbCVzAYhMFM/Fe06rpVJlDhRMDk9ItAiw7XeA6DmXQO+EVdcye5lAAhdZ93cEork5
 oykPN+IGUQmspE74Y4Q95GzVrYFU+tqVZUzeKS+d23QS08/XeeJc3wRfHyzgUx9HFpzE
 AAgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVINB9fx7t0JKhZSIAxTc8GnIea+teXIkAk7HltVZc/h1rCydQLPTqwxk1o3MH6wLBlKeFZ3MWF8QE=@buildroot.org
X-Gm-Message-State: AOJu0YzA5XUIKUG5WJ+1FGKoLxpthkdrnUVT+SGVaUeZPPPeveT3lsnc
 5Fvq1cadciLGtNBV00xqKECbFSf9Zq0ccs+WFaQCngNTLPuTZqo+Kili78dhsMEGM+w=
X-Gm-Gg: ASbGncuENi2ugfNkQic06spV2cy56LyutYHTddrexZEeix0B5SW7OaSdby5LcPoJQRu
 AqZLciXuyXTVVtD9YWfhYpTnebDxs57wQDQuh2WTWymImkOOKhRWyNM4e5lAg+34hz0BR0E7UEV
 fSEPE9taJb/mELcMmSOjZpq8TqF4YzZkrvXfVpjtiOJ6gFYSbSYKXeSWQeX2ikB6h2ry7sYS5fi
 anlnRQjtwRb9LlRtX5tSiuKlb36r33sHH1IerVRFCtBL+oBL90Vl4nWyt11iBGaffOsNZSYS621
 yzYOiq7zl/pooX9CVl/bsCSMayJhzDrLehtqAxFDAZnCOlFc2sO+TDxDdas4flbNcEP/YCuieu7
 c5eYpYw/wqtLH9oT5KpMtoXPz+ZoKagCsx27mqQmqAkvGyMbBHlge5IKlW0emQrnhSVi33PTjeS
 N20sw2A2QX0jVVxhka7kG9qa1acf6rv+z1p9imr2UCF8+HVJKbEc+MwIjxwaDsu/FtmCkwuoU=
X-Google-Smtp-Source: AGHT+IF/BZ1FKvcOfTbY4oWpTBEZ3mlrkuluVp037/sFHu98rfpvqx8ZTY9uy74WQyc/JoMj/LuVvg==
X-Received: by 2002:a05:600c:3b8b:b0:45d:d356:c358 with SMTP id
 5b1f17b1804b1-45dddec3b92mr197170705e9.16.1757540295487; 
 Wed, 10 Sep 2025 14:38:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e019a404asm1405325e9.15.2025.09.10.14.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 14:38:15 -0700 (PDT)
Message-ID: <8a8a6db1-4575-4853-a491-781dc2e1079d@smile.fr>
Date: Wed, 10 Sep 2025 23:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Victor Krawiec <victor.krawiec@arturia.com>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>
References: <20250812092846.24342-1-victor.krawiec@arturia.com>
 <20250901082210.17331-1-victor.krawiec@arturia.com>
Content-Language: fr
In-Reply-To: <20250901082210.17331-1-victor.krawiec@arturia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757540295; x=1758145095; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K7vXcdWORfIijAHWjoQAMKg1iqbeCAGCOBq5r6yZxdM=;
 b=h1iWP8v8gVf3cRwJdcKFVwUbLngvi5+gPX0N1jJzY7c1s2Eb6u/SENuYTwp5kOZ8R3
 8eGDmD3XvHJED99T+YhEkYkhSJNfcuNfmykbqCGm9ateVBDssQWeKUkyjU81GnaJ1OG6
 kQujK5wWO6/xdKWJEjgHkXUbomSSsEVUuvo90=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=h1iWP8v8
Subject: Re: [Buildroot] [PATCH v3] package/llvm-project/lld: fix broken
 symlink in SDK
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

SGVsbG8gVmljdG9yLCBBbGwsCgpMZSAwMS8wOS8yMDI1IMOgIDEwOjIyLCBWaWN0b3IgS3Jhd2ll
YyBhIMOpY3JpdMKgOgo+IFRoZSBzeW1saW5rIGJpbi9sbGQgLT4gJChHTlVfVEFSR0VUX05BTUUp
L2Jpbi9sbGQgaXMgYnJva2VuIGluc2lkZSBhIFNESyBjb250YWluaW5nIGhvc3QtbGxkIHBhY2th
Z2UKPiBUaGUgc3ltbGluayBzdGlsbCBwb2ludHMgdG8gdGhlIGxvY2F0aW9uIG9mIGxsZCBpbnNp
ZGUgdGhlIGJ1aWxkJ3MgaG9zdCBmb2xkZXIgaW5zdGVhZCBvZiB0aGUgbG9jYXRpb24gb2YgbGxk
IGluc2lkZSB0aGUgU0RLCj4gSW4gY29uc2VxdWVuY2UgR0NDIGlzIG5vdCBhYmxlIHRvIGZpbmQg
bGxkIGxpbmtlcgo+IENoYW5naW5nIHRoZSBzeW1saW5rIHRvIGJlIHJlbGF0aXZlIGR1cmluZyBo
b3N0LWxsZCBpbnN0YWxsYXRpb24gZml4ZXMgdGhlIHByb2JsZW0KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBWaWN0b3IgS3Jhd2llYyA8dmljdG9yLmtyYXdpZWNAYXJ0dXJpYS5jb20+CgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gLS0tCj4gQ2hhbmdl
cyB2MiAtPiB2MzoKPiAgIC0gQ2hhbmdlIGNvbW1pdCBBdXRob3IgdG8gbWF0Y2ggU29CIGxpbmUK
PiAKPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBDaGFuZ2UgU29CIGxpbmUgdG8gdXNlIGZ1bGwg
bmFtZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpY3RvciBLcmF3aWVjIDx2aWN0b3Iua3Jhd2llY0Bh
cnR1cmlhLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9sbHZtLXByb2plY3QvbGxkL2xsZC5tayB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbGQvbGxkLm1rIGIvcGFja2Fn
ZS9sbHZtLXByb2plY3QvbGxkL2xsZC5tawo+IGluZGV4IGM5YTJkMzc5NmIuLmU3MjMzZTc0YWUg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvbGxkL2xsZC5tawo+ICsrKyBiL3Bh
Y2thZ2UvbGx2bS1wcm9qZWN0L2xsZC9sbGQubWsKPiBAQCAtMjAsOCArMjAsOCBAQCBIT1NUX0xM
RF9DT05GX09QVFMgKz0gLURMTFZNX0NPTU1PTl9DTUFLRV9VVElMUz0kKEhPU1RfRElSKS9saWIv
Y21ha2UvbGx2bQo+ICAjIEdDQyBsb29rcyBmb3IgdG9vbHMgaW4gYSBkaWZmZXJlbnQgcGF0aCBm
cm9tIExMRCdzIGRlZmF1bHQgaW5zdGFsbGF0aW9uIHBhdGgKPiAgZGVmaW5lIEhPU1RfTExEX0NS
RUFURV9TWU1MSU5LUwo+ICAJbWtkaXIgLXAgJChIT1NUX0RJUikvJChHTlVfVEFSR0VUX05BTUUp
L2Jpbgo+IC0JbG4gLXNmICQoSE9TVF9ESVIpL2Jpbi9sbGQgJChIT1NUX0RJUikvJChHTlVfVEFS
R0VUX05BTUUpL2Jpbi9sbGQKPiAtCWxuIC1zZiAkKEhPU1RfRElSKS9iaW4vbGxkICQoSE9TVF9E
SVIpLyQoR05VX1RBUkdFVF9OQU1FKS9iaW4vbGQubGxkCj4gKwlsbiAtc2ZyICQoSE9TVF9ESVIp
L2Jpbi9sbGQgJChIT1NUX0RJUikvJChHTlVfVEFSR0VUX05BTUUpL2Jpbi9sbGQKPiArCWxuIC1z
ZnIgJChIT1NUX0RJUikvYmluL2xsZCAkKEhPU1RfRElSKS8kKEdOVV9UQVJHRVRfTkFNRSkvYmlu
L2xkLmxsZAo+ICBlbmRlZgo+ICAKPiAgSE9TVF9MTERfUE9TVF9JTlNUQUxMX0hPT0tTICs9IEhP
U1RfTExEX0NSRUFURV9TWU1MSU5LUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
