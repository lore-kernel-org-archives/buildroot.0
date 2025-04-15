Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE75C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0874081A6D;
	Tue, 15 Apr 2025 15:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-E5byv8F83P; Tue, 15 Apr 2025 15:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 188C2814B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188C2814B1;
	Tue, 15 Apr 2025 15:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8658C109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BA446066F
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHMLodwKTebw for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4259560035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4259560035
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4259560035
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:18:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3332332f8f.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744730288; x=1745335088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6eV2HoL+3VgMES+2MDAmhRht6aYvMbJ8IvlhCX+x3Fs=;
 b=gPelyOinF5iL7QtlBFCvhfHuElor1Z7Sn+JR6hIICEVaLJfqSwB76ojbIzBpjXkO5v
 0AsEhbW9PsOJDpSH3LA/RqWcRgGacV/b0BTSZ1cLB5Z7tbWRiPUR8WwRbMFRd3t6+zyt
 NYsWo34INNXBgGisycUS+v19qFnmCTZxNCY580jtluZRDjw+DJ5IS7j0v71eLirX6Fwt
 KlZi4PMhoJrxjxvZbGHsIanFhibJF6Zf1PxH9Vm5uRs18vFLunDqIT/oHx+5TMU0GDhs
 AIOVyDrZN8P0wXPyo++2lGVCziscqXhqobd3rpZtHc5DhzV6iJ+gqiJRUqBhw76EBuV3
 wfOw==
X-Gm-Message-State: AOJu0YyPN+/w1KF/gZXYbH1phuYpvdCOvX7b1cNOa+06+DlTb+kxZSB2
 pSHuDA0VU7pvaudjwaHha20sgRamlKUDTw9ixJidVfJX+XUuJzzASmTm6N7kbNM9JfQFUazQvbo
 N
X-Gm-Gg: ASbGncsnJrJqQAN1cjOqL/G/p++18FdQGBQro3m3+seuzbwuPQW1FDoiUpkK3jg1XyR
 KnjuLbq1HTN9I6nVAhjnHH63tYzmCaAK5tmS4AxDZm/HWnOPbQWK7+/tPdYzBwjQTwG5to2f2r6
 y4cZRTErfaSRjS9C+NRj/bHD/oFjZ23KEY3d2isNCMz2nbJ47VyzqJUoKCBD4s6q92xfGXJfP5b
 l3kEiNCiqpKBD2dzQ1ADG3iwbWnf4yYU4zW2zRJti4KokzfqfHxkFQmCH7LhkqXBN3IZBE0r0mc
 RWL6rT6RLbqh5DkTbTCyk86pUrY5921EBkGRN+NlvQWJCeAZkZUpBiJ0pDAO
X-Google-Smtp-Source: AGHT+IHsKm1xtIk3ff2H+5Pf7fWECujYYYQ21sUQL1cnleR5UeqgsfCOo9GOsVCKwU8cmB2t/S9l2w==
X-Received: by 2002:a5d:5886:0:b0:39a:ca0c:fb0c with SMTP id
 ffacd0b85a97d-39ea5213f0bmr13610737f8f.28.1744730287673; 
 Tue, 15 Apr 2025 08:18:07 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae978018sm14345061f8f.49.2025.04.15.08.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:18:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 17:17:53 +0200
Message-ID: <20250415151755.865635-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744730288; x=1745335088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6eV2HoL+3VgMES+2MDAmhRht6aYvMbJ8IvlhCX+x3Fs=;
 b=AjD8XlkAb6Apdz+5W4kzRIM1Jv67dsjYEzd0fTWN0BocacrDlimVb4J8qLOiqybwJA
 0CavtB4K8XeoQJfHat8XXm7rPQ9AHu0JyurWubrRP8xy7xY70e26IOhh3GFE/ur6z7Tt
 iRkvc4MxU/nWFZNUrijqp3oL/eC+QD6stsUbUoJEZciJ5ciDoqm8dAXXfQycFQuYKQ9W
 WQacD9ZZmgtqKXgD2l4D0WgCxIZoCHM/9F2Zl4wIG3SMvr8CkWiTbTiFzc8ow5wfbQ0Y
 D3fOyPbL8lcB5GFrIEAzPeU2SaKBrq5ggkdQIDfCZHaQWD6vFoGa5tm9zmue9dosDnSJ
 qQmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AjD8XlkA
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.11.4
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIuaGFzaCB8
IDQgKystLQogcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5tayAg
IHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5z
ZmVyLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVyLmhh
c2gKaW5kZXggYmIxN2QwZjE4YS4uOThiMGRkYzUwNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRo
b24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9u
LXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgbWQ1
LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvczN0cmFuc2Zlci9qc29uCi1tZDUg
IGIwZDFlNjg3NTIyMGNlNGIxYjNkYjZkNmMxNWI5ZWJkICBzM3RyYW5zZmVyLTAuMTEuMi50YXIu
Z3oKLXNoYTI1NiAgM2IzOTE4NWNiNzJmNWFjYzc3ZGIxYTU4YjZlMjViOTc3ZjI4ZDIwNDk2YjZl
NThkNjgxM2Q3NWY0NjRkNjMyZiAgczN0cmFuc2Zlci0wLjExLjIudGFyLmd6CittZDUgIDBlN2Ji
YzE3YTI1NTU2OGM5M2FlYTlkZDUyY2I5ZDRiICBzM3RyYW5zZmVyLTAuMTEuNC50YXIuZ3oKK3No
YTI1NiAgNTU5ZjE2MTY1OGUxY2YwYTkxMWY0NTk0MDU1MmM2OTY3MzVmNWM3NGU2NDM2MmU1MTVm
MzMzZWJlZDg3ZDY3OSAgczN0cmFuc2Zlci0wLjExLjQudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0
ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQyYjVjNDcx
YmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBMSUNFTlNFLnR4dApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5tayBiL3Bh
Y2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIubWsKaW5kZXggYzYxNTUz
YjFjMi4uNDRhNjRlODU5YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9w
eXRob24tczN0cmFuc2Zlci5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhv
bi1zM3RyYW5zZmVyLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotUFlUSE9OX1MzVFJBTlNGRVJfVkVSU0lPTiA9IDAuMTEuMgorUFlUSE9OX1MzVFJBTlNG
RVJfVkVSU0lPTiA9IDAuMTEuNAogUFlUSE9OX1MzVFJBTlNGRVJfU09VUkNFID0gczN0cmFuc2Zl
ci0kKFBZVEhPTl9TM1RSQU5TRkVSX1ZFUlNJT04pLnRhci5negotUFlUSE9OX1MzVFJBTlNGRVJf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy82Mi80NS8yMzIz
YjU5MjhmODZmZDI5ZjlhZmRjZWY0NjU5ZjY4ZmE3M2VhYTUzNTY5MTJiNzc0MjI3ZjVjZjQ2YjUK
K1BZVEhPTl9TM1RSQU5TRkVSX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvMGYvZWMvYWExYTIxNWU1YzEyNmZlNWRlY2JlZTJlMTA3NDY4ZjUxZDljZTE5MGI5
NzYzY2I2NDlmNzZiYjQ1OTM4CiBQWVRIT05fUzNUUkFOU0ZFUl9TRVRVUF9UWVBFID0gc2V0dXB0
b29scwogUFlUSE9OX1MzVFJBTlNGRVJfTElDRU5TRSA9IEFwYWNoZS0yLjAKIFBZVEhPTl9TM1RS
QU5TRkVSX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAotLSAKMi40OS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
