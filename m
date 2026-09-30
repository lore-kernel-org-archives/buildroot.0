Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EFFCA5FAC
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 12:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31CF360B05;
	Wed, 30 Sep 2026 12:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsgfrRd-BzbI; Wed, 30 Sep 2026 12:39:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97B39608E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790771940;
	b=aPHXA7el2Yee2vPC+/N6Qb8+ckHuJUE41GntgNojDcQ/04E22Bi4FkjnG8eMOvN83Z3b
	 JiInZLO3cSm6oAdqp6Enr4r9IQm2V9ewF3OQM26z8o04m9kLmi9McBFkFUwjStmMCS+ji
	 hGO/dMxENd5T13wysBWRWrAH7eUNTZ1Jf+xGHdoEkgb4TUWjWQrlYyaRLkLwoXx359vCL
	 HLIyUoPAgZW4qrv6qp65zefWJI/pinqlg7UqbvLZ37uuzU1vhYfjxV6HEQ7pvAGyl4JXq
	 M0JZUocL/TBpBoPdaX8W4NZXJiNMwpgztBOX1QijNbwvOZpyGqUc5Gcb4TF0nZRG03w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790771940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wlmOL6F/5Cpumgs/1j1csCR2GrwAg5pn1xdOk642FAI=;
	b=LhNbtyWI+bxFDoBt2W6CKgg8bpVG0gR7QGgFEgRq6/32AEWsm6D1plt0jWm52QGxSelO
	 sE/d3odhdbp+yEbl7tt79/3E9wfqk66qmpQpAka6LrdIKBpkStO6XoCgBtlF9qTYMx5eo
	 K45f0kwhhOe+7VqpBVcs0NXRpIqbrbJFaLe8CLZzCkVFguUbdU+ezWNvlCTVHpt6butxH
	 VCjcZPnUNS5+746C01LHH3Juu0albnBz2KJlJNeqCJ0i34Hd2BENkc9wXVbQcbbkRbszv
	 3BPP/ewX1YkqqPIrJUhqW7j68CJlo58eF7WAi0HQNHN5M9TAHAHZYWQc+cihTY85uhw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790771940;
	bh=wlmOL6F/5Cpumgs/1j1csCR2GrwAg5pn1xdOk642FAI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OjNuCkX01adcj/balJ5Sn9GueFvbUc3dNTw8bJPGPtj54YEb+kGLXUvq2yIWL2Q7/
	 D11Zn2EUT436vSsorXP5kA1hl73il2igKLFCdX24wkhuVa67w19AkD5wAaXR/ytcKF
	 3SWnCPdzBO3C65SMmQ7uZ2AC3RKct0e1Yoosf7OH5WLjtrmeeGAKdy80q/orR88+W6
	 Fu/0DOMZUhzC4KcCCUbftgl5xzdr2hGKN7ty9o5rRNwc77BcLA5EOIb+q/LaE+5MTY
	 +xeEKoMAjyqmWfd5nfVPtrDv6uQpTjjGHH3XiJismDh2EccvnzN2iJDHGekhGxH8W7
	 ILEy2hZA5gefg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B39608E7;
	Wed, 30 Sep 2026 12:39:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8C633B
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C50EA40071
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg3x-_nvEfRE for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 12:38:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D847C400D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790771938;
 b=ChUnaGid8iRLu1g49aq7Qz5vgBCdQZtSANVzd+IMKQgz/RFq6jGQwcZAGqJvFjAALDoj
 I7KUxBCKBfnhv1o4jALuf3kHYzIZSK1BEzysHCaJPATxEhc/5yIt5kJf+ZxCLfO0o+xDA
 a19uuykHd+C9+C2flIH5oEbPCsA4+LjgIrUzD6Tzun5fLNGMCWA81e7jyH+S9DyMZapV7
 BJgwrdlIEKkI7iW3iDsVDZj/inhgSQQiptT5ZE1aNhVpMd8+L+1wJuTF5YZ32EB43bS4W
 TWPgwHTWGbUvamboM0G+cTWPzqILnVwFdzPjQp2bbACIEWaJqujC32mgqiD38/1/y1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790771938;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=fwUxtv4btvo2IenlXaFGDbCEEdtiTFFuzUaJXljwnPw=;
 b=fSelX/Lxa45kQEWLo4B/h1w/NVqXj9ifz9JH5xzN6mHG0xtfZmyqMBD04EWVwfBWk0lj
 Hsfz2VOpcbl3k36/knW1SWs8AQzU/vAXi/9bglY4Waq8i+Rm2+HGE+JQbVA947no9TaxZ
 0pmrcR69k51Mj0kDi+IZFOJFkYzXwehal4JNP2rHcgnWwVNTP2TskMpq594t5WwZ0WiHM
 HPcvnkPpArCf5jdEq/lfERMFZS9ea4VJo3PsCZz0MS1by4C2Z7apLGJT8ECGcgFTcs3Wm
 WRqHXYuz8tE+1fEKD5IUdk9sJVKymxzVKQhn2+MhFrAdORvY8H5PaMFc9yT8zeSCzxg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Dq5jx42u; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::e;
 helo=mail-wr2-x0e.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0e.google.com (mail-wr2-x0e.google.com
 [IPv6:2a00:1450:4864:30::e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D847C400D7
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 12:38:57 +0000 (UTC)
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48aef5d66c1so1219077f8f.3
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 05:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790771935; x=1791376735;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fwUxtv4btvo2IenlXaFGDbCEEdtiTFFuzUaJXljwnPw=;
 b=Rk4NUoeTB3GJC5x+QbUX9KU80kS2a2RQinWfQoynAGqwFLLv0kk/Dr63LrgZPEw+B9
 VeswLLgv89pYdb04RCiaZyUpP0DIOFxQGFKNqzuKMEVPAFRke5jwQ6nfvZgXrqMIvmE8
 9j45H1YX5pitu75UFFWq/ZNeO9fLulWXYfTHna1xChYuMGCvkzcBPFjzf+ozNA0H/25Y
 7z5WETUCmWiictNupj3NeEqA5iXhOS/43qoc/oFpB5BdL+/8aA+bR2kgmZ+agJz41LZw
 pXUWm8k6CfAQfcP34pqNJ1TlRDn5xeMi2BAgc1EPHvpyypdNRqNiaXOF3gF3IqXjdeeS
 TC2w==
X-Gm-Message-State: AFq9FYIkxJcnxyoG6GVf+tKACgaFQQ6KILk+I/Z0co73OzUL9zx+V2EJ
 LMrn8GuFbBZGmvlEuzNe0sje0hn8ids8nyqLk/zhUQknjU5P7ZZurp4QIDpbo7OiGdq+Oo9Fr1J
 utQiGl8EN7g==
X-Gm-Gg: AYBFou1aoQDtw43egIce0LLJ/dGnT/AV/Cx2CFRK0DAGIfNkooR7tdZDsv7fGABK7HV
 9SsrZJv0vGsSEHooI8cEqXkg+bj3eqFhn90yLnq/XMzZxeBQLK2Ku6mE3z8kCxQjKuhJzmiIhWn
 YxgRCUiuYX+Yda6YAbzQ9sb190uS4BiPs5siqB1Mh+9XwO9HFyjxXmOkoaCPYq1naUNpgVB1GM6
 Z8DjYfn1sx64tPvhPSQTYbw7/E0tXIC6kcYgPZ7mebluklywvXkBhNpiwMjHiRob9qsLZQAZ82A
 3QUzEjP4lpSjE310zvPE/m0G3VLiqI0ftMywVGMJAEXQNRvTv2wUeN1FTTeYkZtpIJMbVm8Oftk
 fxHuvxUiinUCV+wvHotVnov5tik6t5hBEMvqNoI77ZakC/iDQykfEwIL79bQkmoWr/bo2Fnj1jP
 4iVf5ilSn2DiBY0jUYmaFkEqe8eqJaT2DxRiY8cO48zBGuiBfFVjhFhZdJiPnyY3sZA/eAAbVz1
 i6xqwqGslhpEg==
X-Received: by 2002:a05:6000:200f:b0:488:82c5:ee4a with SMTP id
 ffacd0b85a97d-48b024270eamr2898261f8f.7.1790771935042; 
 Wed, 30 Sep 2026 05:38:55 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02949f3asm3334735f8f.1.2026.09.30.05.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 05:38:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Wed, 30 Sep 2026 14:38:49 +0200
Message-ID: <20260930123851.486520-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: harfbuzz: new runtime test
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9oYXJmYnV6ei5weSAgICB8IDMzICsr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfaGFyZmJ1
enoucHkKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBkNjJiZmFh
ZmIzLi43ZmE5N2ZiMzZkIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMK
QEAgLTI4NjEsNiArMjg2MSw3IEBAIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Nh
bXBsZV9weXRob25fczN0cmFuc2Zlci5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2Uvc2FtcGxlX3B5dGhvbl9zZGJ1cy5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2Uvc2FtcGxlX3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdlci5weQogRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5CitGOglzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2hhcmZidXp6LnB5CiBGOglzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5LwogRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS5weQogRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fam1lc3BhdGgucHkKZGlmZiAtLWdpdCBhL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfaGFyZmJ1enoucHkgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2hhcmZidXp6LnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjQyNTlhODc1MTQKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2hhcmZidXp6LnB5CkBAIC0wLDAgKzEsMzMgQEAK
K2ltcG9ydCBvcworCitpbXBvcnQgaW5mcmEuYmFzZXRlc3QKKworCitjbGFzcyBUZXN0SGFyZmJ1
enooaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5C
QVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tB
R0VfSEFSRkJVWlo9eQorICAgICAgICBCUjJfUEFDS0FHRV9MSUJHTElCMj15CisgICAgICAgIEJS
Ml9QQUNLQUdFX0RFSkFWVT15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAg
ICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CisgICAgICAgICIiIgorCisg
ICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4o
c2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuY3BpbyIpCisgICAgICAgIHNlbGYuZW11
bGF0b3IuYm9vdChhcmNoPSJhcm12NSIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJu
ZWw9ImJ1aWx0aW4iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1pbml0
cmQiLCBjcGlvX2ZpbGVdKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKKworICAgICAg
ICAjIFRoZSBoYi1zaGFwZSB1dGlsaXR5IG5lZWRzIGEgZm9uZC4KKyAgICAgICAgZm9udCA9ICIv
dXNyL3NoYXJlL2ZvbnRzL2RlamF2dS9EZWphVnVTYW5zLnR0ZiIKKworICAgICAgICAjIFRoZSBs
aWJyYXJ5IGxvYWRzIGFuZCB0aGUgdXRpbGl0eSBydW5zLgorICAgICAgICBzZWxmLmFzc2VydFJ1
bk9rKCJoYi1zaGFwZSAtLXZlcnNpb24iKQorCisgICAgICAgICMgQmFzaWMgaW52b2NhdGlvbiB3
aXRoIGEgZm9udC4KKyAgICAgICAgY21kID0gZiJoYi1zaGFwZSAtLW5vLXBvc2l0aW9ucyB7Zm9u
dH0gQSIKKyAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihjbWQp
CisgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoZXhpdF9jb2RlLCAwKQorICAgICAgICBzZWxmLmFz
c2VydEVxdWFsKG91dHB1dFswXSwgIltBPTBdIikKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
