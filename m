Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD574C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83EA761400;
	Fri, 11 Jul 2025 10:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4huMmXNIMUJX; Fri, 11 Jul 2025 10:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C323615A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C323615A5;
	Fri, 11 Jul 2025 10:45:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A11C199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B2698217E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnTliU14VOHw for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4458A83E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4458A83E0D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4458A83E0D
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1198464f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230717; x=1752835517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHkfKb5uSYA/coGwugZsKxIi1EJWMtVC1s0v/BSIYZs=;
 b=ORjxjVvj4bBCmFLiC9xBKfVIIm+2Oe3CTvpuPqff0JQF8BXXV2BeJOYezOIEgEc5/R
 al7aLa6ikKtJoisa5TMVp8/6UPwLj51C/C1Eccg7dmyZtXnG2nHZG0EA8OObIIqgw1A+
 AQpDtL0UCX42DkjzVpYSpaydFVyIXnekUa0sQCjlXMp988mxc0TKOM3sboEHkOdgHmq6
 112PgXze1058DkhSeYsBomocc2XCRgWaN6pL67j9ZwEom1YajsJ78lSJz3p5kn799Y7b
 s0bQSSv9m2w/3tKehQlJQ5udchGgEB4cHyUsLqUfsScasHbVvpj1GoDw2UzuYl8JuweJ
 UbTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ccV/N8DCuSYxIflXV8D1z4lmCiq0hIlbUHs9ZZeyeR6PvJiWZf5Rr1MBaJEtciwtl/rjjlsF8OA=@buildroot.org
X-Gm-Message-State: AOJu0YwHW/Wbv69MfBK1majp68LK78varOy2J8ga8RDxucKdWe73X0iH
 1RMxx7SkUe8NNkrl0MAi+Q2HdsH5RKtUyvEr9JhjqyH/7vposjMlr23hX1Gu+eCO0DY=
X-Gm-Gg: ASbGncskB628Hu0zdH8VWg7j30qAW5Hy3Vu1RNDKdh6skEzx5AAAs8QiQWPZZqZ13Nh
 uD9XqCUA23sQPNZE9JU5v6oB1efS5EE1bZXPKUGSuB2QKj21YDXVH7mRP5q2dBvblMomGsYUlvG
 TVZMgWapdOHw99kLXoKGrFY0tAv8X+X7wlpd7fx4YGVJ/cPQZuAthS3FJL4P4aUGqKu/tgUffkX
 LdXEzpCAk6FQn+X3mhMtjyzXN6Hrll/0u7YxTl9vIzsBpmmQQdsd0iIAskQ9kOC9ap3k85NOmZe
 VBAgmtgPcG7rI6KmkQWax+xjgSPtRpXHn9697L5l66aLAF6yAo2d1MiZ5wUZadz0eJXhCe7SEl1
 +s406WBtIdDfLpBMSD6V6hrgu
X-Google-Smtp-Source: AGHT+IG2Abvm3qCb7YojMkMN+U56uL/Ok8SFA72c1TmjPD2axTE0wsCqcHDE0+WFuUzXdR9mjoaSrg==
X-Received: by 2002:a05:6000:1446:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3b5f187a4b4mr2683450f8f.7.1752230717264; 
 Fri, 11 Jul 2025 03:45:17 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc9349sm4079174f8f.45.2025.07.11.03.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:13 +0200
Message-ID: <20250711104515.824951-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250706070615.543413-1-bernd@kuhls.net>
References: <20250706070615.543413-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230717; x=1752835517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHkfKb5uSYA/coGwugZsKxIi1EJWMtVC1s0v/BSIYZs=;
 b=KEiWU6IY7DbjmNYa6oR+iP5pmZkKYg1vN6hTpM5r6qMLz0GgbzY0HJ1oV2HfOh/CvV
 qv+W3MDHwXE1+9mm6+rXFAdTI7tE3Gu7LI435CStDcbxhN24LHx/HhtGVb9bauJbh7Ml
 rqNKA+zw/eNOlBhEuADY2Nc9ZsUh7as1muGwq1/pz+VNOmzdaCr0KumR+P3uB2Gj4NOf
 Iq+tug81qm+Hs/Tob4oLOwx3v3RGZzcpoCDjOsSJG/abm6VjrphrvjVxx2L+7zW1OOvr
 1qSRinYud/+KVWo4pOL0DBTYtftG08o6G4F6mTdZCwV3/icV84Nyz0FTpRh900l050WW
 cdSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KEiWU6IY
Subject: Re: [Buildroot] [PATCH 1/1] package/hddtemp: fix build without nls
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzLzA2YjQ0ZGYyNjEzMThjZTFkMDdmNmNiMjBiMjZlNGFkNjQyMjI5NDAvCj4gCj4gU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCkFwcGxpZWQgdG8gMjAy
NS4wMi54ICYgMjAyNS4wNS54LiBUaGFua3MKCj4gLS0tCj4gIC4uLi9oZGR0ZW1wLzAwMDEtZml4
LWJ1aWxkLXdpdGhvdXQtbmxzLnBhdGNoICB8IDQwICsrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvaGRkdGVtcC8wMDAxLWZpeC1idWlsZC13aXRob3V0LW5scy5wYXRjaAo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2hkZHRlbXAvMDAwMS1maXgtYnVpbGQtd2l0aG91dC1ubHMucGF0Y2ggYi9w
YWNrYWdlL2hkZHRlbXAvMDAwMS1maXgtYnVpbGQtd2l0aG91dC1ubHMucGF0Y2gKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjM1NmI5NGIwMTAKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9oZGR0ZW1wLzAwMDEtZml4LWJ1aWxkLXdpdGhvdXQtbmxzLnBh
dGNoCj4gQEAgLTAsMCArMSw0MCBAQAo+ICtGcm9tIGM5ZDBkMjQ5ZmYwMTNkMzNjZjFmZDVhNTg2
YzE2ZWUzMDA5NWNjOTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IE5pY29sYXMg
UEFSTEFOVCA8bmljb2xhcy5wYXJsYW50QHBhcmh1ZXQuZnI+Cj4gK0RhdGU6IEZyaSwgMTQgRmVi
IDIwMjUgMTA6MDg6NDMgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBmaXggYnVpbGQgd2l0aG91
dCBubHMKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gKz4g
aGRkdGVtcC5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgo+ICs+IGhkZHRlbXAuYzoyNzQ6Mzog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGJpbmR0ZXh0ZG9tYWlu
4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICs+ICAgMjc0IHwgICBiaW5k
dGV4dGRvbWFpbiAoUEFDS0FHRSwgTE9DQUxFRElSKTsKPiArPiAgICAgICB8ICAgXn5+fn5+fn5+
fn5+fn4KPiArPiBoZGR0ZW1wLmM6Mjc1OjM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiDigJh0ZXh0ZG9tYWlu4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0
aW9uXQo+ICs+ICAgMjc1IHwgICB0ZXh0ZG9tYWluIChQQUNLQUdFKTsKPiArPiAgICAgICB8ICAg
Xn5+fn5+fn5+fgo+ICs+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NDk2OiBoZGR0ZW1wLWhkZHRl
bXAub10gRXJyb3IgMQo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS92aXRsYXYv
aGRkdGVtcC9wdWxsLzE2Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0Pgo+ICstLS0KPiArIHNyYy9oZGR0ZW1wLmMgfCAyICsrCj4gKyAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2hkZHRlbXAuYyBi
L3NyYy9oZGR0ZW1wLmMKPiAraW5kZXggNjRkMDAwZS4uYmZlYTU1NiAxMDA2NDQKPiArLS0tIGEv
c3JjL2hkZHRlbXAuYwo+ICsrKysgYi9zcmMvaGRkdGVtcC5jCj4gK0BAIC0yNzAsOSArMjcwLDEx
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyKiBhcmd2W10pIHsKPiArICAgYmFja3RyYWNlX3Np
Z2lsbCgpOwo+ICsgICBiYWNrdHJhY2Vfc2lnYnVzKCk7Cj4gKyAKPiArKyNpZiBFTkFCTEVfTkxT
Cj4gKyAgIHNldGxvY2FsZSAoTENfQUxMLCAiIik7Cj4gKyAgIGJpbmR0ZXh0ZG9tYWluIChQQUNL
QUdFLCBMT0NBTEVESVIpOwo+ICsgICB0ZXh0ZG9tYWluIChQQUNLQUdFKTsKPiArKyNlbmRpZgo+
ICsgCj4gKyAgIHNob3dfZGIgPSBkZWJ1ZyA9IG51bWVyaWMgPSBxdWlldCA9IHdha2V1cCA9IGFm
X2hpbnQgPSBzeXNsb2dfaW50ZXJ2YWwgPSBmb3JlZ3JvdW5kID0gMDsKPiArICAgdW5pdCA9IERF
RkFVTFQ7Cj4gLS0gCj4gMi4zOS41Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
