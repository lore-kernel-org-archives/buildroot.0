Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB1C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 12:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89AB68164B;
	Tue, 15 Apr 2025 12:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TsfPw8pEUEj; Tue, 15 Apr 2025 12:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90FCC81FE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90FCC81FE3;
	Tue, 15 Apr 2025 12:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 273F6108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181CF61AF3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IecYyWUQHzQC for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 12:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 719826121E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719826121E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 719826121E
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:33:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso3299738f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 05:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744720385; x=1745325185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hsQwoQzDepAGdCk0z6uEle9goGS9j4Xd7MvP0abyIJ8=;
 b=EZx46pDa5MaigIvOmJkqPV5PayZ/IMLLEP3izOz7lFjj0Z+vH6P4PoUmN2r8XB4zH4
 CR0ijXsd7S8GgQc8rsrhWOkIAoH/aNqvdaSSduXlxl86+2HMlK5vlAMWu5XhhMPqP8Jv
 z9nzEzEMGBo3MaU30DpPQnyIq4dxTCH4yZjbVs4ASEr8UcV1foDNx7U8w3TZzp5RGwh8
 TZalVd7NLv4Hbn9NIQ5ho+7c8+D9sUsL/k6uI15L89kwBb0infxHvJRhfcCpQg2O5Yp3
 5seX0iReJXqPmbLrM0LL46QeLSir5DWW2xGCxgu8ktKU5IMK4rHaQYdqTOLE/kpxuSgZ
 JB6A==
X-Gm-Message-State: AOJu0Ywq+UaIyuT7w1CXJfZMajOvWCrOg/kyR6719suaVQPz/bGdyOke
 u8nWTcDymD7qY3AXIEg2vV5kiqCZ9nPolG0jVBAL3klxWv7dpX3qTHtIs7QNEyTUt3o9RlA5kH5
 0
X-Gm-Gg: ASbGncuEiZjLCde6M+VSaDWkyfGjs0mAqBAK+c1EQy7e3DdlINr0mn0LWKMGm7Glxee
 Xv7e+0VQbjDkNyf3O81Zqj5cxm/Jo5HBFRb82vLqc835xxz/AVSxns+6h/4hoeOpNljzg4k2tXO
 wRYrh3yMfK4SvR8Y88uQEP8i22X8Yc1Vm1UjUK3JvOEzmfhk3rCv5gBBCcoDeAqyKyYMmINaHNk
 O6SI3kkpaLpS7HgajAQAJ7eyVaHIrE2VFdSNebEqY0LUJTHXm4DrvjTtwCpjZfhPQ3K+keEjH+f
 6b0Nkw1Ai5zS7Zmy1hLCvbBft359mw2VTPtqU8IFacfwpD5Jd+rXACmLwypNmx0mUtoWepI=
X-Google-Smtp-Source: AGHT+IGEL9d5UhaT7cBnGuYtrmdzeGgENHJYADdYhr9kZw5x/Wx5ICO2XIJeHZNQ9XTjfW+wlRfYtw==
X-Received: by 2002:a05:6000:1863:b0:391:3998:2660 with SMTP id
 ffacd0b85a97d-39ea51ee002mr12596088f8f.7.1744720384925; 
 Tue, 15 Apr 2025 05:33:04 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cb29sm14104953f8f.76.2025.04.15.05.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:33:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 14:32:53 +0200
Message-ID: <20250415123254.632587-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744720385; x=1745325185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hsQwoQzDepAGdCk0z6uEle9goGS9j4Xd7MvP0abyIJ8=;
 b=Y0oEoQRo+IqZnvKA+Rzqv0TEtRttGcA+9cpc7jnH3kMYppJpUq4xUY14iM1EHg4/vP
 R3YBX3caaiwBFOxuaquOnc1P6ci7So79D384MXLxEAfTBVENSKlSEZh8AZFnppWf4E+9
 6amtL7gryyVUA/Yr2vI1RW5tOv12BAKaf41cRlEESBx/uBhpFm6/K+8Suu6HIFByqfCt
 yY9RP3XBt8ZyFXVLgT7OcE8WCjsXUbFgDTQ2Cdiz5g48JABsOE5EtZwY4eFpjhFPt07p
 1ziXBCUlo937NefIpXBcvAKGhgAt934APrVuFpB87HjA5TWcWreT+M6OIPC/Pyx9ENVm
 pJEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Y0oEoQRo
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 boto3-1.37.34
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

VGhlIHRlc3QgdGltZW91dCBpcyBubyBsb25nZXIgc3VmZmljaWVudCwgc28gZG91YmxlIGl0LgoK
U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNoICAgICAgICAgICAg
IHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgICAgICAgICAg
ICAgICB8IDQgKystLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
Ym90bzMucHkgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMu
aGFzaCBiL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNoCmluZGV4IDQwMzY1
MTkxODMuLjgzM2VjMjRiMjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhv
bi1ib3RvMy5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNo
CkBAIC0xLDUgKzEsNSBAQAogIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlw
aS9ib3RvMy9qc29uCi1tZDUgIGE4ZjdhODgxYWM3NTRhODg5NDkwYzY1Y2FkN2FhOTdiICBib3Rv
My0xLjM2LjMudGFyLmd6Ci1zaGEyNTYgIDUzYTUzMDdmNmEzNTI2ZWUyZjg1OTBlM2M0NWVmYTUw
NGEzZWE0NTMyYzFiZmU0OTI2YzBjMTliZjE4OGQxNDEgIGJvdG8zLTEuMzYuMy50YXIuZ3oKK21k
NSAgMmI1MzBmOTcyMjg0ZWUxMmNkMGZjN2E4MjlhNjVkNjcgIGJvdG8zLTEuMzcuMzQudGFyLmd6
CitzaGEyNTYgIDk0Y2EwNzMyODQ3NGRiM2ZhNjA1ZWI5OWIwMTE1MTJjYWE3M2Y3MTYxNzQwZDM2
NWExZjAwY2ZlYmZiNmRkOTAgIGJvdG8zLTEuMzcuMzQudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0
ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICAwZDU0MmUwYzg4MDRlMzlhYTdmMzdlYjAwZGE1
YTc2MjE0OWRjNjgyZDc4Mjk0NTEyODdlMTFiOTM4ZTk0NTk0ICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgYi9wYWNrYWdlL3B5dGhvbi1i
b3RvMy9weXRob24tYm90bzMubWsKaW5kZXggM2Q4YTc4NTJlYS4uMjM3M2E2YmI4ZiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLm1rCisrKyBiL3BhY2thZ2Uv
cHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9CT1RPM19WRVJTSU9OID0gMS4zNi4zCitQWVRIT05f
Qk9UTzNfVkVSU0lPTiA9IDEuMzcuMzQKIFBZVEhPTl9CT1RPM19TT1VSQ0UgPSBib3RvMy0kKFBZ
VEhPTl9CT1RPM19WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9CT1RPM19TSVRFID0gaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzA3LzEyL2I5YWQ0YzNkZDZlNjA0NDI0M2Qw
OGJhZTA3Njc5NWU0MTM1NzY1MTY4M2Y0ZmFkOTlkNTgyOGM0MjkxYworUFlUSE9OX0JPVE8zX1NJ
VEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzkvNWQvNmIxY2Ey
MGJhNGRhMzUwNzk5NTA5YTY5ZjJkMjk1YWUxMWQ1ZWMwOGE5OGU4MmY3NGI1NzA4YTgxODBjCiBQ
WVRIT05fQk9UTzNfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9CT1RPM19MSUNFTlNF
ID0gQXBhY2hlLTIuMAogUFlUSE9OX0JPVE8zX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCmRpZmYg
LS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvMy5w
eSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG8zLnB5Cmlu
ZGV4IDAyYTFmNjlkNDAuLmU1ZmJjMzg2YjkgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG8zLnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG8zLnB5CkBAIC0xMiw3ICsxMiw3IEBAIGNsYXNz
IFRlc3RQeXRob25QeTNCb3RvMyhUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgogICAgICAgICBCUjJf
VEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjI1ME0iCiAgICAgICAgICIiIgogICAgIHNhbXBsZV9z
Y3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYm90bzMucHkiXQotICAgIHRp
bWVvdXQgPSAxMAorICAgIHRpbWVvdXQgPSAyMAogCiAgICAgZGVmIGxvZ2luKHNlbGYpOgogICAg
ICAgICBleHQyX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJy
b290ZnMuZXh0MiIpCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
