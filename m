Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6B1CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 10:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBFC2815DD;
	Fri, 19 Sep 2025 10:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK4CzyU-yrWl; Fri, 19 Sep 2025 10:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB30A81CEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB30A81CEF;
	Fri, 19 Sep 2025 10:26:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5D0273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 10:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D8BE40A43
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 10:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3ymxPZKWjlg for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 10:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A247409ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A247409ED
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A247409ED
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 10:26:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3e9c5faa858so1736844f8f.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758277601; x=1758882401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlT29MlmxdcohagQ9nBidRC9AnqfyPt/Gx6Ioj7B3g0=;
 b=uGH8ALgItjdpX+ZFWEGhBjZeWlg6cwv09adYDHtYySF5iNjHKVjLIBwESq79IN9JeR
 WqmE+h+twRkdwFZ75MmuzFrfO4ByF9p0g1i07x20hVDbxj3K4mu31xEOH0YRLD1KGDQE
 I+OGSjuM5f3+7bDuXWwfK/yAbriJl+1UTKoOlB0fdb+ifyqJKxT3keseUaveD98ECo3z
 nmOCZyhakr+CB1YGT05+b9Mh76rZOrA5Pv0m9k+onv70GOfNPlYBcC4W2gIQUL7XKBe+
 P/zdj4QnE+6wLu/XTsJdUf09miWn0bDN14Ah72fyhiSf4IGJ6kUvj6yBiX/WKJ9aPa10
 kNNA==
X-Gm-Message-State: AOJu0YyMaYp8N4VZcoLQrf3mNkZH9qu1T1NaJs8gp2eGuS8NE/2lB+mG
 27V0DBdJDJHvQs900+ldu+ATCK+tMsVw6RgV6T07e5HdzSu+CZpkcGx+f8Ee7L0jgEo=
X-Gm-Gg: ASbGncvBG6fiZI+yAJCU+AmsAUfqw3kX3FSlmcOo56//yZPr1t+RWUQkqKoy+VkPnnq
 SGseoOBxex6lQhhOT8bcnkQEv9Uw8nKTCLfXbfnmxylLea0UEaA4s3JqfkoF5tbQHqpZx+7aRtB
 53LGXEBT0EeZcQCMhMi8zhWKMytm2PFnie7RyrkA86mVghzUOW8w85+qlzz4scva2cQa8qQIw1o
 l7YZ4A+o2u7vTqOKyaA8Suwmjk514lmH13KIQklG0Y2VJ03UPpdquOcZ0W77VUmP/S3HjzjJfG/
 7syQm+g9dcwYNMt2cg+fyR7uCYwJTWRj3nflTXignYJ7KdCLpZpKcxnXBhN8oG+NvKczKCyAcbY
 j0tFUH9hNK+SXzUT1poIhtN5ICawGG4pXErlVelx65yoDhJq0SQDPLhFW1VzenAPXNwW6gAFx/K
 /QORqfiCX+UoC1zhxkqXfOJcaoX9XixbroWRA0kC1Njj6ETHY8RYjkXPUUWYvGfw==
X-Google-Smtp-Source: AGHT+IGqQKOHlQ0rhG2P0RPk0JXaGHj1wc8HVw18CfNfagfVFeTZ8Lj+vBiB7vVk/Gpckz7k9KrWFQ==
X-Received: by 2002:a05:6000:2f83:b0:3e4:d981:e312 with SMTP id
 ffacd0b85a97d-3ee86d6cf67mr2082157f8f.62.1758277600878; 
 Fri, 19 Sep 2025 03:26:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-467fc818e00sm30128065e9.0.2025.09.19.03.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 03:26:40 -0700 (PDT)
Message-ID: <09c571e1-25b9-4dd0-8388-b5c8b4f53cf6@smile.fr>
Date: Fri, 19 Sep 2025 12:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls
 <bernd@kuhls.net>, Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20250909161325.59760-1-bernd@kuhls.net>
 <CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1758277601; x=1758882401; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GlT29MlmxdcohagQ9nBidRC9AnqfyPt/Gx6Ioj7B3g0=;
 b=oudw2QDrD6tEAsabZIil4rHk955PdJWyvWGhwuEhR8lmUZJ/T11yZilYp8NrSUDegH
 bqf5QRf0RrtAref56UmUYreURZBLYOi3AwkidNosEJ51in0iBZIvA0EwLMOytVOOlYuR
 45RgKMKTwdADR8fLMih3wSaePxRUdDDSTu+hc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oudw2QDr
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.2
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

SGVsbG8gSmFtZXMsIEFsbCwKCkxlIDE5LzA5LzIwMjUgw6AgMDU6MTcsIEphbWVzIEhpbGxpYXJk
IGEgw6ljcml0wqA6Cj4gT24gVHVlLCBTZXAgOSwgMjAyNSBhdCAxMDoyMuKAr0FNIEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOgo+Pgo+PiBSZWJhc2VkIHBhdGNoIDAwMDEuCj4+
Cj4+IFJlbW92ZWQgR2FsbGl1bSB4YSBzdGF0ZSB0cmFja2VyOgo+PiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzNiZTJjNDdkYjIzMThlYmU5MjIyYzgw
YmY5ODEwMzhkZjQzNzRiMmQKPj4KPj4gTGVnYWN5IGhhbmRsaW5nIGZvciBibGluZCBvcHRpb24g
QlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX1hBIGlzIG5vdAo+PiBuZWNlc3NhcnkuCj4+Cj4+IFJl
bGVhc2Ugbm90ZXM6Cj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21l
c2EtYW5ub3VuY2UvMjAyNS1BdWd1c3QvMDAwODE1Lmh0bWwKPj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5jZS8yMDI1LUF1Z3VzdC8wMDA4MTguaHRt
bAo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNl
LzIwMjUtU2VwdGVtYmVyLzAwMDgyMC5odG1sCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4+IC0tLQo+PiAgcGFja2FnZS9tZXNhM2QtaGVhZGVycy9t
ZXNhM2QtaGVhZGVycy5tayAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gIC4uLi1tZXNvbi1vcHRp
b24tdG8tZGlzYWJsZS1vcHRpb25hbC1uZW9uLXN1cHBvci5wYXRjaCB8ICA2ICsrKy0tLQo+PiAg
cGFja2FnZS9tZXNhM2QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDkgLS0tLS0tLS0tCj4+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArKystLS0KPj4gIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrLS0tLS0tLS0KPj4gIDUgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsgYi9wYWNrYWdlL21l
c2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4+IGluZGV4IDVjZDA1Y2M5ZmYuLjU5MzJk
NzNmMmMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRl
cnMubWsKPj4gKysrIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tawo+
PiBAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgo+Pgo+PiAgIyBOb3QgcG9zc2libGUgdG8gZGlyZWN0
bHkgcmVmZXIgdG8gbWVzYTNkIHZhcmlhYmxlcywgYmVjYXVzZSBvZgo+PiAgIyBmaXJzdC9zZWNv
bmQgZXhwYW5zaW9uIHRyaWNrZXJ5Li4uCj4+IC1NRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjUu
MS44Cj4+ICtNRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjUuMi4yCj4gCj4gSXQgbG9va3MgbGlr
ZSB0aGlzIGludHJvZHVjZWQgYSByZWdyZXNzaW9uIGZvciBjb2codGhpcyBwYXRjaCB3YXMgZmxh
Z2dlZAo+IHdoZW4gSSBiaXNlY3RlZCB0aGlzIGNvZyBjcmFzaCk6Cj4gU2VwIDE3IDIxOjM0OjEx
IGJ1aWxkcm9vdCBjb2dbMTAzNzhdOiBSZW5kZXJlciBwcm9jZXNzIHRlcm1pbmF0ZWQgYW5kCj4g
ZmFpbGVkIHRvIHJlY292ZXIgd2l0aGluIDEwMDBtcwo+IFNlcCAxNyAyMTozNDoxMSBidWlsZHJv
b3QgY29nWzEwMzc4XTogPD4gQ3Jhc2ghOiBUaGUgcmVuZGVyZXIgcHJvY2Vzcwo+IGNyYXNoZWQu
IFJlbG9hZGluZyB0aGUgcGFnZSBtYXkgZml4IGludGVybWl0dGVudCBmYWlsdXJlcy4KPiBTZXAg
MTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJuaW5nOiBmYWlsZWQg
dG8gZ2V0Cj4gZHJpdmVyIG5hbWUgZm9yIGZkIC0xCj4gU2VwIDE3IDIxOjM0OjExIGJ1aWxkcm9v
dCBjb2dbMTE1NThdOiBsaWJFR0wgd2FybmluZzogTUVTQS1MT0FERVI6Cj4gZmFpbGVkIHRvIHJl
dHJpZXZlIGRldmljZSBpbmZvcm1hdGlvbgo+IFNlcCAxNyAyMTozNDoxMSBidWlsZHJvb3QgY29n
WzExNTU4XTogbGliRUdMIHdhcm5pbmc6IGZhaWxlZCB0byBnZXQKPiBkcml2ZXIgbmFtZSBmb3Ig
ZmQgLTEKPiBTZXAgMTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJu
aW5nOiBlZ2w6IGZhaWxlZCB0bwo+IGNyZWF0ZSBkcmkyIHNjcmVlbgo+IFNlcCAxNyAyMTozNDox
MSBidWlsZHJvb3QgY29nWzExNTU4XTogbGliRUdMIHdhcm5pbmc6IGVnbDogZmFpbGVkIHRvCj4g
Y3JlYXRlIGRyaTIgc2NyZWVuCj4gU2VwIDE3IDIxOjM0OjExIGJ1aWxkcm9vdCBjb2dbMTE1NThd
OiBDb3VsZCBub3QgY3JlYXRlIFdQRSBFR0wKPiBkaXNwbGF5OiBFR0xfTk9UX0lOSVRJQUxJWkVE
LiBBYm9ydGluZy4uLgoKVGhhbmtzIGZvciB0aGUgcmVwb3J0LgoKV2UgZG9uJ3QgaGF2ZSBhbnkg
dGVzdCBjYXNlIGZvciBDT0cgcGFja2FnZSwgY2FuIHlvdSBzaGFyZSB5b3VyIGNvbmZpZ3VyYXRp
b24gaW4Kb3JkZXIgdG8gdHJ5IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWU/CgpBZHJpYW4sIGRvIHlv
dSBoYXZlIGEgY2x1ZT8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
