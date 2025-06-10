Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B197C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 12:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D24419AD;
	Tue, 10 Jun 2025 12:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xUa0CzsZhdr; Tue, 10 Jun 2025 12:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C21454199E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C21454199E;
	Tue, 10 Jun 2025 12:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A945183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5A240477
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwHIF7trKhS6 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 12:54:01 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44D39400E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44D39400E9
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44D39400E9
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:53:59 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3109f106867so6518462a91.1
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749560039; x=1750164839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUX2czO5JO3RO9osGLkrgjatr4fQAqwcxasom9a7ld4=;
 b=a2bUbm/Rgv/5APk83bNCGzbQLObgroJJ87/E/y29VH3FNJqFYaglw3P9eVT443WIge
 YFRBw91gjqd29gPE8y8oj6AOzUGJ9r8C+xalfUH01Jf3MxwxvAhdAsuJwcB5LmG3wd1o
 50kwJsMGlDwCA7VMjPdJThkxNAxYc62XwCQ8kDuko26KXm9E7ETzovKMNxWKD/4KJHvC
 74vbLArc68cKTBvrx8zH3Aepq6qQvO55kzu94cdZpuSZtAkTr+WWQB+922wlbvbI6Lvp
 O9sbUSq+J2PnmurRWaV4rMGHNck9sc5k+0SIdLbWDuum0zsKg9ay4vkQdebk5f3mhuL9
 fQCA==
X-Gm-Message-State: AOJu0YwgW85x90O9S0NCl6B76pO3U55DVfXFF7MBuJU5S8qwlp3Ds9B5
 jvpxftUpphOMEUBZbIAX/Ei2meNhUvSb7hN4ZT3Gpbe81WNAix4PU6slc59jEZToqesf+Zl+osz
 qlFLB
X-Gm-Gg: ASbGncusFbrMYVbmA0HFMOhsB9sBswkr7+vVDbqy5vUViYnWKZm9fJYJxftYB/qiapR
 Nh96MA9peQXNL2V+gTTIbmL3ZvDNLzKkvh+ZZzTil/jHbsVsJZ27FLwhffFi28X3BPG23LUncA9
 CInKTYMUrc0T//lDuYJK6MQYMIyUWU+ZP0K9a3fSub7tuOsSVPPwc2J928I5ogiQ3e32zBF16IF
 6qC2vNhgNB+Ob0Ve4EnrDRahhNBFtvTf/MA3EZDjBepp4j0bE5PWl6isFnydFFzA5vfNef5dZas
 bM/MgR1O//1KeNjT/brW9wnNmMj++8eC34dkomC+P3NcbEYTgaA67yEbnBQqBRhF6mBzmcQgt2N
 YlhHULH448E54y0j5ZQ==
X-Google-Smtp-Source: AGHT+IEE8zFYrCt3jeyLfqt4P2fAxBfI7vj/L2HnKM/RNqjmQaMvzJdk7yqWaocMEgYSrq1oPDnirw==
X-Received: by 2002:a17:90b:5103:b0:313:23ed:701 with SMTP id
 98e67ed59e1d1-313a1521301mr3511108a91.4.1749560038957; 
 Tue, 10 Jun 2025 05:53:58 -0700 (PDT)
Received: from niltesque.mtz.newtesc.com ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fdf5b8sm7305814a91.33.2025.06.10.05.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:53:58 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Tue, 10 Jun 2025 09:53:23 -0300
Message-ID: <20250610125323.68124-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1749560039; x=1750164839;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FUX2czO5JO3RO9osGLkrgjatr4fQAqwcxasom9a7ld4=;
 b=UkTqkuPBUZ8knW9o5GobnOP35A4Jrji87w3jPCcJIivy7DA78mA42+Shu/SxOgSdkP
 AeDQFt/Mpa0uj/JxKFo1enNvYkZe+SqcB99GZjvZQKIp2K+wUTWWOXYyDD6j39z8CENM
 mwUGyuJU0rYr7c5R5zHbonxLyTAIoG1JR0ehlvHm/Ps4a38svLab8h8Dt1b/o6Tve1hj
 3bOAmzB1EtBY24DTTxVKUmpi/3YCEjKwTvb+O4IGkf56qftvqa0QzFPdAxm/s4htCQLS
 lVpGnIWMf8Fy1qNmWgqBTersBQdATISQjN6elZqBtG4m+KT2eQzmFvXSYKTdVSP1epr/
 tEZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UkTqkuPB
Subject: [Buildroot] [PATCH 1/1] nanomq: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbmFub21xL0NvbmZpZy5pbiAgIHwgMTMg
KysrKysrKysrKysrCiBwYWNrYWdlL25hbm9tcS9TNTBuYW5vbXEgICB8IDEyICsrKysrKysrKysr
CiBwYWNrYWdlL25hbm9tcS9uYW5vbXEuaGFzaCB8ICAzICsrKwogcGFja2FnZS9uYW5vbXEvbmFu
b21xLm1rICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNiBm
aWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9uYW5vbXEvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uYW5vbXEvUzUw
bmFub21xCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uYW5vbXEvbmFub21xLmhhc2gKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25hbm9tcS9uYW5vbXEubWsKCmRpZmYgLS1naXQgYS9E
RVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBhN2JiM2JkODM0Li41ZDBjMDE2ZmYyIDEwMDY0
NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTExMjYsNiArMTEyNiw3IEBA
IEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX25ldHdvcmttYW5h
Z2VyX2dvaS5weQogTjoJRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+CiBGOgljb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZwogRjoJYm9h
cmQvYXN1cy90aW5rZXItcy8KK0Y6CXBhY2thZ2UvbmFub21xLwogRjoJcGFja2FnZS9weXRob24t
cGFoby1tcXR0LwogRjoJcGFja2FnZS9weXRob24tc3FsYWxjaGVteS8KIEY6CXBhY2thZ2UvcnN5
c2xvZy8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4K
aW5kZXggNTc5YjVmZmM4Ny4uYzRmYWY3YWUzYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcu
aW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTI1NzgsNiArMjU3OCw3IEBAIGVuZGlmCiAJ
c291cmNlICJwYWNrYWdlL21ycC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL21zdHBkL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbXRyL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2th
Z2UvbmFub21xL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbmJkL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvbmNmdHAvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9uZGlzYzYv
Q29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uYW5vbXEvQ29uZmlnLmluIGIvcGFja2Fn
ZS9uYW5vbXEvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjUyZTEwOWQzMTQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25hbm9tcS9Db25maWcuaW4K
QEAgLTAsMCArMSwxMyBAQAorY29uZmlnIEJSMl9QQUNLQUdFX05BTk9NUQorCWJvb2wgIm5hbm9t
cSIKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfNQorCWhlbHAKKwkg
IEFuIFVsdHJhLWxpZ2h0d2VpZ2h0IGFuZCBCbGF6aW5nLWZhc3QgTVFUVCBCcm9rZXIgZm9yIElv
VCBFZGdlCisKKwkgIGh0dHBzOi8vbmFub21xLmlvLworCitjb25maWcgQlIyX1BBQ0tBR0VfTkFO
T01RX05BTk9fQ0xJCisJYm9vbCAibmFub21xX2NsaSIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X05BTk9NUQorCWhlbHAKKwkgIE1xdHQgY2xpIGNsaWVudApkaWZmIC0tZ2l0IGEvcGFja2FnZS9u
YW5vbXEvUzUwbmFub21xIGIvcGFja2FnZS9uYW5vbXEvUzUwbmFub21xCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE5ZjEyNzlhNWQKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL25hbm9tcS9TNTBuYW5vbXEKQEAgLTAsMCArMSwxMiBAQAorIyEvYmluL3NoCisKK0RB
RU1PTj0ibmFub21xIgorQ09ORl9QQVRIPSIvZXRjL25hbm9tcS5jb25mIgorCitpZiBbICIkMSIg
PSAic3RvcCIgXSA7IHRoZW4KKwkvdXNyL2Jpbi8kREFFTU9OICIkMSIKK2Vsc2UgOgorCS91c3Iv
YmluLyREQUVNT04gIiQxIiAtLWNvbmYgJENPTkZfUEFUSCAtZAorZmkKKworZXhpdCAkPwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9uYW5vbXEvbmFub21xLmhhc2ggYi9wYWNrYWdlL25hbm9tcS9uYW5v
bXEuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yYmFmMDYxMzNm
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9uYW5vbXEvbmFub21xLmhhc2gKQEAgLTAsMCAr
MSwzIEBACisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgNTNmN2Y3ZGQzMjM4YjJlMThhZmJl
MWRjY2UzZDYxOWNkMjQwMTJjMGE5ZTBiZTNhZTBhYTZjZWQyZGM3MWQxMyAgbmFub21xLTAuMjMu
OC1naXQ0LnRhci5negorc2hhMjU2ICBmOGIzOWYwNTE1NjgwYTdiMzNkMmI3YjgzN2ZkNjc4MzVh
ODdkZWNhNWYzYjk4NmRjZDRjZTM0Njc4YTJmMTVjICBMSUNFTlNFLnR4dApkaWZmIC0tZ2l0IGEv
cGFja2FnZS9uYW5vbXEvbmFub21xLm1rIGIvcGFja2FnZS9uYW5vbXEvbmFub21xLm1rCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE0YzcyMTU2ZGUKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL25hbm9tcS9uYW5vbXEubWsKQEAgLTAsMCArMSw0MiBAQAorIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgbmFub21xCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IworCitOQU5PTVFfVkVSU0lPTiA9IDAuMjMuOAorIyB0YXIgZmlsZSBpcyBwcm92aWRlZCwgYnV0
IGl0IGxhY2tzIHN1Ym1vZHVsZXMKK05BTk9NUV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL25h
bm9tcS9uYW5vbXEuZ2l0CitOQU5PTVFfU0lURV9NRVRIT0QgPSBnaXQKK05BTk9NUV9HSVRfU1VC
TU9EVUxFUyA9IFlFUworTkFOT01RX0NNQUtFX0JBS0VORCA9IG5pbmphCitOQU5PTVFfTElDRU5T
RSA9IE1JVAorTkFOT01RX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAorCisjIFdoZW4gQlVJ
TERfU0hBUkVEX0xJQlMgaXMgT04sIG5vIGV4ZWN1dGFibGUgaXMgY3JlYXRlZCBmb3IgbmFub21x
CitOQU5PTVFfQ09ORl9PUFRTICs9IC1EQlVJTERfU0hBUkVEX0xJQlM9T0ZGIC1EQlVJTERfU1RB
VElDX0xJQj1PRkYKKworZGVmaW5lIE5BTk9NUV9JTlNUQUxMX0NPTkZfRklMRQorCSQoSU5TVEFM
TCkgLUQgLW0gMDY0NCAkKEBEKS9ldGMvbmFub21xLmNvbmYgXAorCQkkKFRBUkdFVF9ESVIpL2V0
YworZW5kZWYKKworTkFOT01RX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gTkFOT01RX0lO
U1RBTExfQ09ORl9GSUxFCisKK2RlZmluZSBOQU5PTVFfSU5TVEFMTF9JTklUX1NZU1YKKwkkKElO
U1RBTEwpIC1EIC1tIDA3NTUgcGFja2FnZS9uYW5vbXEvUzUwbmFub21xIFwKKwkJJChUQVJHRVRf
RElSKS9ldGMvaW5pdC5kL1M1MG5hbm9tcQorZW5kZWYKKworaWZlcSAoJChCUjJfUEFDS0FHRV9O
QU5PTVFfTkFOT19DTEkpLHkpCisgIE5BTk9NUV9DT05GX09QVFMgKz0gLURCVUlMRF9DTElFTlQ9
T04KK2Vsc2UKKyAgIyBOTkcgcHJveHkgYmx1aWRzIGNsaQorICBOQU5PTVFfQ09ORl9PUFRTICs9
IC1EQlVJTERfQ0xJRU5UPU9GRiAtREJVSUxEX05OR19QUk9YWT1PRkYKK2VuZGlmCisKK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfU1FMSVRFKSx5KQorICBOQU5PTVFfQ09ORl9PUFRTICs9IC1ETk5HX0VO
QUJMRV9TUUxJVEU9T04KK2VuZGlmCisKKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQotLSAKMi40
OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
