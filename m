Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4499C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B13B660D88;
	Wed, 24 Apr 2024 19:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsnKgiimDmAD; Wed, 24 Apr 2024 19:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B97EE60D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97EE60D8C;
	Wed, 24 Apr 2024 19:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BD201BF34A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57E45405E2
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyT7TVvanqH7 for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 625FB40449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625FB40449
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 625FB40449
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:43:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41a7ae25d53so1452335e9.1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713987801; x=1714592601;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JbItiWfQOArQX9m9zU/8SPupXT7iltGPuBdDZIelx14=;
 b=uXgJ3ijJm84174EFPifmkWDDvZnZ3an4XU8IK9V1KZhh7kddKhOwQpg7sw3RguxmYa
 9jBToOe7U2OmGnTizbfUO8qmuC/3YIcf/FV+c6Q5cBOnqZoTNptCiIjcgj3JX662UcIr
 ItRIIFGVN7PB31QNRGsrgdbnYizLmc5Vgd6kBZuiHd0c4L+htEjZ1lZ9MWEVAALAmuXx
 zzWeiGtUBCpLvWSjmDc8wsaull6GeL+MgCmBl7HhZxnF+MouiuxIhmFNkVMslHDEwdnR
 cdAuhblcadnZsFuc7KEKpB5q4J4Hn88w2uCnrwWtrgwE5+atSRSHTeCn7rB1Stvbd6KF
 AqOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW29dJgFOAxXDYJ4r5sJbz2JUoWHk9SpIvEerOd4phPeg3qBbQgeNdUNDF0sxYg9ofK+o1vo9QPPSYjq8UixupbSxv5c9Q02w==
X-Gm-Message-State: AOJu0YxFGgZUeUdI2gC0Y9wOEvK+l81G7N3aYUy9Zl7SA0lwb6X0ISqI
 mcBAuxU0IVbFgK48FeNEtePbaU5cai0cBAd8B/M/KqavzwiCGT7Z+EHuJwUy7hTMwPXJTarPb1v
 E
X-Google-Smtp-Source: AGHT+IHa2cqiqIcjGzWT981Ad3rW09LVzX1qSfjQ2gxbf8g6njW4dt03OmCaGEQzIZA3NLBdabx13w==
X-Received: by 2002:a05:600c:4fc3:b0:419:87ab:f6da with SMTP id
 o3-20020a05600c4fc300b0041987abf6damr2679273wmq.3.1713987801016; 
 Wed, 24 Apr 2024 12:43:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b00419f419236fsm16487755wmb.41.2024.04.24.12.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 12:43:20 -0700 (PDT)
Message-ID: <ce9b7b50-6635-41bb-be28-0de747daa5d7@smile.fr>
Date: Wed, 24 Apr 2024 21:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZikvOACQEGe9oG7x@waldemar-brodkorb.de>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZikvOACQEGe9oG7x@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713987801; x=1714592601;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JbItiWfQOArQX9m9zU/8SPupXT7iltGPuBdDZIelx14=;
 b=VmlPL9iFTQOyw4koYwSVV4B8cY6kajgrUp9wJ4KGEcbX+WS3alIV2A15Oo/fnYqLGF
 hsmRbr8dyyS1h3ytkUpq4VL6elz2LqTAkb/JGX0bMBQygt9TRFesqkL/u9yR2lTZ2aTy
 LQZzxjoWNJtGt2tihEKfVgR6rsOKP0rt4MBcnkGWv1GsOQbeL7EMwWYw4oM5efRlzlNP
 CP4h4MgcXUxKNDXi2m2M0kAxw11XSFyXlxJYRuyuxN3plE3pCOdqTf8cK9nCVw5WDviD
 k4LrnID19UgG7xo4ilU+5nDUQLrFZ//H2PoBwIaXkOGj2G8Jz+zsU57m2BkW86gW96jm
 06uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VmlPL9iF
Subject: Re: [Buildroot] [PATCH] package/elf2flt: fix riscv64 noMMU build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsCgpMZSAyNC8wNC8yMDI0IMOgIDE4OjExLCBXYWxkZW1hciBCcm9ka29y
YiBhIMOpY3JpdMKgOgo+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3Bl
bmFkay5vcmc+CgpJIGFkZGVkIHRoZSBsaW5rIHRvIGdpdGxhYiBpc3N1ZSBiZWZvcmUgYXBwbHlp
bmcuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IC0tLQo+ICAuLi5yLW5ldy1zdHlsZS1jdG9ycy13aGVuLXVzaW5nLXJpc2N2NjQucGF0Y2ggfCAz
NCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2VsZjJmbHQvMDAwMS1maXgtYWxpZ25tZW50
LWZvci1uZXctc3R5bGUtY3RvcnMtd2hlbi11c2luZy1yaXNjdjY0LnBhdGNoCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZWxmMmZsdC8wMDAxLWZpeC1hbGlnbm1lbnQtZm9yLW5ldy1zdHlsZS1j
dG9ycy13aGVuLXVzaW5nLXJpc2N2NjQucGF0Y2ggYi9wYWNrYWdlL2VsZjJmbHQvMDAwMS1maXgt
YWxpZ25tZW50LWZvci1uZXctc3R5bGUtY3RvcnMtd2hlbi11c2luZy1yaXNjdjY0LnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mZWE3MjZkYWIyCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZWxmMmZsdC8wMDAxLWZpeC1hbGlnbm1lbnQtZm9y
LW5ldy1zdHlsZS1jdG9ycy13aGVuLXVzaW5nLXJpc2N2NjQucGF0Y2gKPiBAQCAtMCwwICsxLDM0
IEBACj4gK0Zyb20gZWVhZDhkNWU5ZjM5MTEyNDMxODIzMTFmMTYxNzhjMjVjNmVhMDNjNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVu
YWRrLm9yZz4KPiArRGF0ZTogU2F0LCAyMyBNYXIgMjAyNCAwNzoyMzo0NSArMDEwMAo+ICtTdWJq
ZWN0OiBbUEFUQ0hdIGZpeCBhbGlnbm1lbnQgZm9yIG5ldy1zdHlsZSBjdG9ycyB3aGVuIHVzaW5n
IHJpc2N2NjQKPiArCj4gK1JlY2VudGx5IHVDbGliYy1uZyBlbmFibGVkIFVDTElCQ19DVE9SX0RU
T1IgZm9yIHJpc2N2NjQsIHNvCj4gK3RoYXQgZi5lLiBDKysgYXBwbGljYXRpb25zIGFyZSBydW5u
aW5nIGZpbmUuIEFzIGEgc2lkZSBlZmZlY3QKPiArdGhpcyBicmVha3Mgbm9NTVUgc3VwcG9ydC4g
VGhlIHByb2JsZW0gaXMgdGhlIGFsaWdubWVudCBmb3IKPiArdGhlIGN0b3JzIGluIGVsZjJmbHQu
IFRoaXMgcGF0Y2ggZml4ZXMgaXQuCj4gKwo+ICtUZXN0ZWQgd2l0aCBRZW11IGZvciBBUk0sIE02
OGsgYW5kIFh0ZW5zYSB3aXRoIG5vIHJlZ3Jlc3Npb25zLgo+ICsKPiArU2lnbmVkLW9mZi1ieTog
V2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPiArVXBzdHJlYW06IGh0dHBzOi8v
Z2l0aHViLmNvbS91Y2xpbnV4LWRldi9lbGYyZmx0L2NvbW1pdC9lZWFkOGQ1ZTlmMzkxMTI0MzE4
MjMxMWYxNjE3OGMyNWM2ZWEwM2M0Cj4gKy0tLQo+ICsgZWxmMmZsdC5sZC5pbiB8IDIgKy0KPiAr
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlm
ZiAtLWdpdCBhL2VsZjJmbHQubGQuaW4gYi9lbGYyZmx0LmxkLmluCj4gK2luZGV4IGE5OWM2OWUu
LjIzMGMzODIgMTAwNjQ0Cj4gKy0tLSBhL2VsZjJmbHQubGQuaW4KPiArKysrIGIvZWxmMmZsdC5s
ZC5pbgo+ICtAQCAtMTM5LDcgKzEzOSw3IEBAIFJfUk9EQVQ6CSooLmdudS5saW5rb25jZS5yKikK
PiArIAkJQFNZTUJPTF9QUkVGSVhAX3Nzcm9fc2l6ZSA9IEBTWU1CT0xfUFJFRklYQF9lc3NybyAt
IEBTWU1CT0xfUFJFRklYQF9zc3JvOwo+ICsgCQlQUk9WSURFKEBTWU1CT0xfUFJFRklYQF9TREEy
X0JBU0VfID0gQFNZTUJPTF9QUkVGSVhAX3Nzcm8gKyAoQFNZTUJPTF9QUkVGSVhAX3Nzcm9fc2l6
ZSAvIDIpKTsKPiArIAo+ICstCQkuID0gQUxJR04oNCkgOwo+ICsrCQkuID0gQUxJR04oOCkgOwo+
ICsgVE9SOgkJQFNZTUJPTF9QUkVGSVhAX19DVE9SX0xJU1RfXyA9IC47Cj4gKyBUT1I6CQlMT05H
KChAU1lNQk9MX1BSRUZJWEBfX0NUT1JfRU5EX18gLSBAU1lNQk9MX1BSRUZJWEBfX0NUT1JfTElT
VF9fKSAvIDQgLSAyKQo+ICsgU0lOR0xFX0xJTks6CS8qIGdjYyB1c2VzIGNydGJlZ2luLm8gdG8g
ZmluZCB0aGUgc3RhcnQgb2YKPiArLS0gCj4gKzIuMzAuMgo+ICsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
