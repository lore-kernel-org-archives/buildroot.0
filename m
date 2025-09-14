Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE1ECAC582
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 12:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD7AB6F4EB;
	Sun, 14 Sep 2025 12:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaFFijeOudcJ; Sun, 14 Sep 2025 12:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB6B6F494
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB6B6F494;
	Sun, 14 Sep 2025 12:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FC50117
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 12:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DCD40C85
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 12:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTRvgo2nKfUG for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 12:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BDEE40162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BDEE40162
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BDEE40162
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 12:23:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45f29d2357aso4514275e9.2
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 05:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757852596; x=1758457396;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KvV3FkmdsDlcgktyGi2XpTP264yHl5bD9+YG8ta1ndo=;
 b=hKwyg46vmQhzEnENu1La9iSXMKZp9PqN+uHk9WP4Yn1dfqRJRKmTm6MRFP577m/frS
 cvDL91ccUbml00A2w51YGzhX+Nd3W6Yk03wiYr0EDR2QjmeSnMQXiVqACXH5XWyA/iXo
 36jhdKXSUoNr0lu90uQ7A5lIOBTHlmPkk+5FUEYSaOw1wwhSRzPHUmMnNwetTgCMSbPZ
 bLZGGP+rCtnXtU6zN9VfkQqPNRtaeJ0pWjHi+yKKfgh0DXISHuH0C41Ppi4IrYpYkon0
 fvOMq+a2QSKHxwmEwqWzKrzrt1xWcjeiMfDuJSciFdWKLL8+vCneb/Fu++AGYMwRdo3s
 sjPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8nWBtQ/BhQdIELQLvYQudCWALGfmBF9RgJWAszCifP4P8N8MLoMDflwbcNhVfbK/ZIGvsLciDZkg=@buildroot.org
X-Gm-Message-State: AOJu0YzAf0z98zAk/mYXzsT8/pnT+hHGcsqhL7SOPUpp8xmzUhSBSPYP
 kldbRfoHKUv2VmK2xBGnyssiPYWbuGvgjFMUEel0H+zCPxlxfKRXgg1rN79AHmqbG0C0Ka4QHpG
 pW/H2rBxDMg==
X-Gm-Gg: ASbGncvDhFSuS8+qxC//ClluBNMKf/0DY9erPqDm+o1dkcd1gzpy7yUi/ZpNce33YyE
 2yBadv1oD6QJ/QcRjPy/ckFi0uWOjhit3o1/5Q8CsHgQNpvifcgglqKgfqsP5HbuTVNwBJk1z7p
 dqUXMAbEjg0G6Voav9zDjyh2z39QhkFT/l9tcCpj3QIG0+Quwl5BDN13UjGO9JE1VswJ3ET3dwL
 X1TRm0OsuBWMkD2KKBr0s0CJM5pdHg3Qqds8c08NlMFPwvZe0IRE6u7mzqR9bcobHFhe/NZp20/
 G6rmEUf8ZcE6/4bT8DDKApUH5SAEUBh16gw2nTm4DAndq5pi+gD3oqsiuAAzi7zBYd+6gFJNLsv
 yz4l8sZw8tqGScMzD493OnepwhjcUsZU++i/43Hk0Q6BnhTPGz4ZGXP0DQBIh3/UcEsmOmvmWZp
 OugZg5s9GiYhpsWJ9YqijnhVsyLTm3BaeMQUZytPG9O/p+rpS/dlRf3pLzfC2r1i1MzkTYXnM=
X-Google-Smtp-Source: AGHT+IEQVvkVW5l2NA89TmvuQGTN8VRXsHnfd3ZbwzmLf/rY4udJ7m0wuZMs5ZSl9DKX4PikZRyJHA==
X-Received: by 2002:a05:600c:3b0a:b0:45f:28bd:7429 with SMTP id
 5b1f17b1804b1-45f28bd7781mr43573855e9.31.1757852595910; 
 Sun, 14 Sep 2025 05:23:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f290d1512sm48326025e9.16.2025.09.14.05.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 05:23:15 -0700 (PDT)
Message-ID: <55c98b57-f4be-47b7-a87c-06f5130df8fe@smile.fr>
Date: Sun, 14 Sep 2025 14:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
References: <20250914042054.771446-1-salvador.joseluis@gmail.com>
Content-Language: en-US
In-Reply-To: <20250914042054.771446-1-salvador.joseluis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757852596; x=1758457396; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KvV3FkmdsDlcgktyGi2XpTP264yHl5bD9+YG8ta1ndo=;
 b=hohmZ0RyBC6AOwnFn7Qqf2u0xipwWFvIm2FoXOL7+Gtv0kYktV7/I4mJ9EjqxhJ+yt
 tJrBHl97hyyNY4Qku7PBFsfPrqKi0EFUms/u4hAVTjJhhJXThyzEqvYXZ8H6ARvIrzGU
 4ohJqbNzeVB9BVvOF0tkJQ8AcxgI8orYJEiZM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hohmZ0Ry
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: remove arc_summary
 from ZFS tests
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

SGVsbG8gSm9zw6ksIEFsbCwKCkxlIDE0LzA5LzIwMjUgw6AgMDY6MjAsIEpvc8OpIEx1aXMgU2Fs
dmFkb3IgUnVmbyBhIMOpY3JpdMKgOgo+IFRoaXMgcGF0Y2ggcmVwbGFjZSB0aGUgWzFdIHBhdGNo
Lgo+IAo+IFRoZSBQeXRob24gMy4xMyBpbnRlcnByZXRlciBpdHNlbGYgc2VnZmF1bHRzIGF0IHJ1
bnRpbWUgd2hlbiBjb21waWxlZAo+IHdpdGggdUNsaWJjIG9uIHRoZSBhYXJjaDY0IHBsYXRmb3Jt
Lgo+IAo+IFRvIGtlZXAgVGVzdFpmc1VjbGliYywgdGhlIGV4ZWN1dGlvbiBvZiB0aGUgYXJjX3N1
bW1hcnkgY29tbWFuZCBoYXMKPiBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgWkZTIHRlc3RzLiBUaGlz
IGNvbW1hbmQgb25seSBwcmludHMgc29tZSBBUkMKPiBzdGF0cyBhbnl3YXkuCj4gCj4gRml4ZXM6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTI3
MTEyNDg1OSAoVGVzdFpmc1VjbGliYykKPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNS1TZXB0ZW1iZXIvNzg2Mzk2Lmh0bWwKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlz
QGdtYWlsLmNvbT4KPiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96
ZnMucHkgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5Cj4gaW5kZXggMWI5MDdhYzRkZS4u
OWZlYWU0OWU4NiAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3pmcy5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZz
LnB5Cj4gQEAgLTU2LDggKzU2LDYgQEAgY2xhc3MgVGVzdFpmc0Jhc2UoaW5mcmEuYmFzZXRlc3Qu
QlJUZXN0KToKPiAgICAgICAgICAgICAgInpwb29sIHNjcnViIC13IHBvb2wiLAo+ICAgICAgICAg
ICAgICAic2hhMjU2c3VtIC1jIC90bXAvdXJhbmRvbS5zaGEyNTYiLAo+ICAgICAgICAgICAgICAi
enBvb2wgc3RhdHVzIC12IiwKPiAtICAgICAgICAgICAgIyBDaGVjayBQeVpGUwo+IC0gICAgICAg
ICAgICAiYXJjX3N1bW1hcnkiLAoKQWN0dWFsbHkgdGhlIHRlc3QgaXMgbm90IGFib3V0IEFSQyBz
dGF0cyByZXBvcnRlZCBieSBhcmNfc3VtbWFyeSBzY3JpcHQgYnV0IGEKY2hlY2sgaWYgUHlaRlMg
ZG9lc24ndCB0cmlnZ2VyIHNvbWUgUHl0aG9uIGV4Y2VwdGlvbiBkdWUgdG8gbWlzc2luZyBweXRo
b24KcnVudGltZSBkZXBlbmRlbmN5IChpZiBQeVpGUyBpcyB3b3JraW5nIGFzIGV4cGVjdGVkIHdo
ZW4gcHl0aG9uMyBpcyBlbmFibGVkKS4KClRoaXMgYWxzbyByZW1vdmUgdGhlIFB5WkZTIHRlc3Qg
Zm9yIG11c2wgYW5kIEdsaWJjIHRoYXQgYXJlIHdvcmtpbmcgd2VsbC4KCklmIGFyY19zdW1tYXJ5
IGlzIHJlbW92ZWQgZnJvbSB0aGUgdGVzdCwgdGhlbiB3ZSBzaG91bGQgYWxzbyByZW1vdmUKQlIy
X1BBQ0tBR0VfUFlUSE9OMz15IGZyb20gVGVzdFpmc0Jhc2UuCgpUaGUgVGVzdFpmc0Jhc2UgaXMg
ZmluZSBhcyBpcywgd2Ugc2hvdWxkIG5vdCB0cnkgdG8gcmVtb3ZlIFB5WkZTIHRlc3QgZm9yIHRo
ZQpzYWtlIG9mIHVDbGliYy1uZy4KCkFjdHVhbGx5LCBJJ20gd29ycmllZCBhYm91dCB0aGUgYWFy
Y2g2NCBwb3J0IG9uIHVDbGliYy1uZy4gSXQncyBwb3NzaWJsZSB0aGF0CnRoZSBpc3N1ZSB3ZSBk
aXNjb3ZlciBvbiBweXRob24zIHBhY2thZ2UgY2FuIGhhcHBlbiBhdCBydW50aW1lIG9uIG90aGVy
IHBhY2thZ2VzLgoKSWYgeW91IHJlYWxseSB3YW50IHRvIGtlZXAgVGVzdFpmc1VjbGliYywgdGhl
IFB5WkZTIHRlc3Qgc2hvdWxkIGJlIG9ubHkgZXhlY3V0ZWQKYnkgVGVzdFpmc0dsaWJjIGFuZCBU
ZXN0WmZzTXVzbC4gSSdtIG5vdCBzdXJlIGl0IHdvcnRoIHRoZSBlZmZvcnQuIExldHMgcmVtb3Zl
ClRlc3RaZnNVY2xpYmMgZm9yIG5vdyBhbmQgaG9wZSB0aGUgaXNzdWUgd2lsbCBiZSBmaXhlZCBp
biB1Q2xpYmMtbmcgaW4gdXBjb21pbmcKcmVsZWFzZXMuIFRoZW4gVGVzdFpmc1VjbGliYyBjYW4g
YmUgYWRkZWQgYmFjay4KClRob3VnaHRzPwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICAgICAg
ICAgIF0KPiAgICAgICAgICBmb3IgY21kIGluIGNtZHM6Cj4gICAgICAgICAgICAgIHNlbGYuYXNz
ZXJ0UnVuT2soY21kLCB0aW1lb3V0PXNlbGYudGltZW91dCkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
