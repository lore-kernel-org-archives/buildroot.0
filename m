Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A89C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9165E61139;
	Tue, 25 Jul 2023 17:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9165E61139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9q59ENXcsnB; Tue, 25 Jul 2023 17:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C9246112E;
	Tue, 25 Jul 2023 17:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C9246112E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8670B1BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60CAD8175A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60CAD8175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7y0Hhp5nPnYB for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:34:00 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B61F814B6
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B61F814B6
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31771a876b5so362501f8f.3
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306438; x=1690911238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3WaJipfOicE8rB0jC6MerdROqS5DRZTwznhkigFFCo=;
 b=V33gpqzEIUL/OBNGm+XobXyqwmk3DNNGXn97Pd4MhzXIn8b/okpzAgdN808dFedTxH
 MwszXLc0SCJJLqU9rq6pNh3mxd6bu+2rv18XNz5ORa1AeiwzVfWj343sKZp+i8VSw6bU
 pVGLw26au5XiClAJuzpq+CxJWjn6aHm/NCz5Jffzf6qTzYVXlptr700wFmizrvffXsKn
 1lHAt+1w6sQSueCpt7bCgfKrg59mKbC7m3MbKB7LAQkWdOmx6PMvv9KmnN1NAdsFl4/U
 SjexuWlNuNRr3Ci3kkDZnyb07aXcXjv/QzEYE7SMcICtASf5ROWF/Cw8CYBHKFVSdOBW
 u7YQ==
X-Gm-Message-State: ABy/qLZe83iGSDkkQCnCQD0xZBAim1Zr2KE6u99ckt8YXEc4yeErs88I
 P508B7F3a/vRQRJQQH8nB6AhTFRxrV7B84ojuLI=
X-Google-Smtp-Source: APBJJlHFUTs7Jw0n8sdwfqYGEeefH9BH2tgu1xHn2yraX1GN2Rnh97lXz3lJWCTVMLDrRrQAuFnQjQ==
X-Received: by 2002:a5d:45c1:0:b0:314:49d2:aaab with SMTP id
 b1-20020a5d45c1000000b0031449d2aaabmr10405840wrs.8.1690306438137; 
 Tue, 25 Jul 2023 10:33:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:57 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:31:01 +0200
Message-Id: <20230725173102.543874-10-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306438; x=1690911238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3WaJipfOicE8rB0jC6MerdROqS5DRZTwznhkigFFCo=;
 b=4xdzw1el+XT331Kc5xcYRYsEowYB5iNh6t64wfV8CzshtZfIjTVm7+eDs0ntEClNwt
 kMxYZ1Ej6dWUTsx7jmd7KcXRHmCBx1H0p/YPu6SbrWG1EP0S7u1Zk6+Gr0sjglItwbmo
 u4K/LTh1yB5Nb/Wd7ObACMb1SDaIHNL9ZOP/FCFcUshQi2EYkKmCIpTXbf/2Hqln3Lft
 szIGSoZy844C3zqP9nJZy6TzkB1mEdkMjGgYBMVA5MVd84ESQfvTndaM9fdiW2iFP+25
 6zmr4npVogeKYhHcUpSanx9jOnXRGmOEqPQ7tpzW6J/KM0TQEiIgBOYn0P2azlfkhypE
 BsgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=4xdzw1el
Subject: [Buildroot] [PATCH v2 9/9] package/mesa3d: add RustiCL support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpUbyBidWlsZCBSdXN0
aWNsIHlvdSBuZWVkIHRvIHNhdGlzZnkgdGhlIGZvbGxvd2luZyBidWlsZCBkZXBlbmRlbmNpZXM6
CgogICAgcnVzdGMKICAgIHJ1c3RmbXQgKGhpZ2hseSByZWNvbW1lbmRlZCwgYnV0IG9ubHkgcmVx
dWlyZWQgZm9yIENJIGJ1aWxkcyBvciB3aGVuIGF1dGhvcmluZyBwYXRjaGVzKQogICAgYmluZGdl
bgogICAgTExWTSBidWlsdCB3aXRoIGxpYmNsYyBhbmQgLURMTFZNX0VOQUJMRV9EVU1QPU9OLgog
ICAgU1BJUlYtVG9vbHMKICAgIFNQSVJWLUxMVk0tVHJhbnNsYXRvciBmb3IgYSBsaWJMTFZNU1BJ
UlZMaWIuc28gbWF0Y2hpbmcgeW91ciB2ZXJzaW9uIG9mIExMVk0sIGkuZS4gaWYgeW914oCZcmUg
dXNpbmcgTExWTSAxNSAobGliTExWTS5zby4xNSksIHRoZW4geW91IG5lZWQgYSBsaWJMTFZNU1BJ
UlZMaWIuc28uMTUuCgpTZWU6Cmh0dHBzOi8vZG9jcy5tZXNhM2Qub3JnL3J1c3RpY2wuaHRtbAoK
U2luY2UgcnVzdGljbCBpcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiBPcGVuQ0wsIG1ha2UgaXQgYSBw
cm92aWRlciBvZgpPcGVuQ0wuCgpXZSBuZWVkIHRvIHVzZSBvcGVuY2wtaWNkLWxvYWRlciBpbiBv
cmRlciB0byBiZSBhYmxlIHRvIGNhcHR1cmUgQVBJCmNhbGxzIGFuZCBmb3J3YXJkIHRoZW0gdG8g
dGhlIGNvcnJlY3QgaW1wbGVtZW50YXRpb24gb2YgT3BlbkNMIChSdXN0aUNMCmluIHRoaXMgY2Fz
ZSkKCm9wZW5jbC1pY2QtbG9hZGVyIG5lZWRzIHRvIGJlIGluc3RhbGxlZCBpbiB0aGUgdG9vbGNo
YWluJ3Mgc3lzcm9vdAphcyB3ZWxsIHRvIGJlIGFibGUgdG8gY29tcGlsZSBwYWNrYWdlcyBkZXBl
bmRpbmcgb24gbGlib3BlbmNsIHNpbmNlCm90aGVyd2lzZSB0aGVyZSdzIG9ubHkgZm9yIGV4YW1w
bGUgbGliUnVzdGlPcGVuQ0wuc28gYW5kIG5vCmxpYk9wZW5DTC5zbwoKU2lnbmVkLW9mZi1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+ClNpZ25lZC1vZmYtYnk6IFNlYmFz
dGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgotLS0KdjI6IGNoYW5nZSBjb21t
aXQgaGVhZGVyIC0+IFJ1c3RpQ0wgc3VwcG9ydCBpcyBub3QgZXhwZXJpbWVudGFsCi0tLQogcGFj
a2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgMTkgKysrKysrKysrKysrKysrKysrLQogcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMzcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L21lc2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KaW5kZXggYzdlZTJh
OGRiMC4uNGM3MjU3MDlkMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCisr
KyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgpAQCAtNTYsNiArNTYsMjMgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX01FU0EzRF9PUEVOQ0wKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ0xDCiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0hBU19MSUJPUEVOQ0wKIAorIyBsaWJjbGMgZGVwZW5kZW5jaWVzIGFy
ZSBzYXRpc2ZpZWQgYnkKKyMgQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KK2NvbmZpZyBCUjJfUEFD
S0FHRV9NRVNBM0RfUlVTVElDTAorCWJvb2wgIlJ1c3RpQ0wgKE9wZW5DTCkgc3VwcG9ydCIKKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9NRVNBM0RfR0FMTElVTV9EUklWRVJfUEFORlJPU1QKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQworCXNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX1JUVEkKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfQ0xBTkcKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9EVU1QCisJc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkNMQworCXNlbGVjdCBCUjJfUEFDS0FHRV9TUElSVl9UT09MUworCXNlbGVjdCBCUjJf
UEFDS0FHRV9TUElSVl9MTFZNX1RSQU5TTEFUT1IKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX0xJ
Qk9QRU5DTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOQ0xfSUNEX0xPQURFUgorCiAjIGluZm9y
bSB0aGUgLm1rIGZpbGUgb2YgZ2FsbGl1bSwgZHJpLCBkcmkzIG9yIHZ1bGthbiBkcml2ZXIgc2Vs
ZWN0aW9uCiBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0RSSTMKIAlib29sCkBAIC0zODcsNyAr
NDA0LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdMRVMKIAlkZWZhdWx0ICJt
ZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVMgJiYgIUJSMl9QQUNLQUdFX0xJ
QkdMVk5ECiAKIGNvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJPUEVOQ0wKLQlkZWZhdWx0
ICJtZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOQ0wKKwlkZWZhdWx0ICJtZXNhM2Qi
IGlmIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOQ0wgfHwgQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJ
Q0wKIAogZW5kaWYgIyBCUjJfUEFDS0FHRV9NRVNBM0QKIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCmluZGV4IDZmYTVjMWM2
ODYuLjNjN2Q5MTliYjcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5taworKysg
Yi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKQEAgLTU4LDE2ICs1OCwzNCBAQCBlbHNlCiBNRVNB
M0RfQ09ORl9PUFRTICs9IC1EbGx2bT1kaXNhYmxlZAogZW5kaWYKIAotIyBEaXNhYmxlIG9wZW5j
bC1pY2Q6IE9wZW5DTCBsaWIgd2lsbCBiZSBuYW1lZCBsaWJPcGVuQ0wgaW5zdGVhZCBvZgogIyBs
aWJNZXNhT3BlbkNMIGFuZCBDTCBoZWFkZXJzIGFyZSBpbnN0YWxsZWQKIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfTUVTQTNEX09QRU5DTCkseSkKIE1FU0EzRF9QUk9WSURFUyArPSBsaWJvcGVuY2wKIE1F
U0EzRF9ERVBFTkRFTkNJRVMgKz0gY2xhbmcgbGliY2xjCitpZmVxICgkKEJSMl9QQUNLQUdFX09Q
RU5DTF9JQ0RfTE9BREVSKSx5KQorTUVTQTNEX0NPTkZfT1BUUyArPSAtRGdhbGxpdW0tb3BlbmNs
PWljZAorTUVTQTNEX0RFUEVOREVOQ0lFUyArPSAgb3BlbmNsLWljZC1sb2FkZXIKKyMgRGlzYWJs
ZSBvcGVuY2wtaWNkOiBPcGVuQ0wgbGliIHdpbGwgYmUgbmFtZWQgbGliT3BlbkNMIGluc3RlYWQg
b2YKK2Vsc2UKIE1FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLW9wZW5jbD1zdGFuZGFsb25l
CitlbmRpZgogZWxzZQogTUVTQTNEX0NPTkZfT1BUUyArPSAtRGdhbGxpdW0tb3BlbmNsPWRpc2Fi
bGVkCiBlbmRpZgogCisjIC1EcnVzdF9zdGQ9MjAyMToga25vd24gbWVzb24gYnVnIChodHRwczov
L2dpdGh1Yi5jb20vbWVzb25idWlsZC9tZXNvbi9pc3N1ZXMvMTA2NjQpCisjICBCeSBkZWZhdWx0
IGRldmljZXMgYXJlIGRpc2FibGVkIGluIHJ1c3RpY2wuIElmIHlvdSB3YW50IHRvIGVuYWJsZSBh
IGRldmljZSwKKyMgIHlvdSBuZWVkIHRvIHNldCB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgUlVT
VElDTF9FTkFCTEUgdG8gdGhlIGRyaXZlciB5b3UKKyMgIGFyZSB1c2luZworIyAgcmVmOiBodHRw
czovL2RvY3MubWVzYTNkLm9yZy9lbnZ2YXJzLmh0bWwjZW52dmFyLVJVU1RJQ0xfRU5BQkxFCitp
ZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMKSx5KQorTUVTQTNEX1BST1ZJREVTICs9
IGxpYm9wZW5jbAorTUVTQTNEX0RFUEVOREVOQ0lFUyArPSBob3N0LXJ1c3RjIGhvc3QtcnVzdC1i
aW5kZ2VuIGNsYW5nIGxpYmNsYyBvcGVuY2wtaWNkLWxvYWRlciBzcGlydi10b29scyBzcGlydi1s
bHZtLXRyYW5zbGF0b3IKK01FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLXJ1c3RpY2w9dHJ1
ZSAtRHJ1c3Rfc3RkPTIwMjEKK2Vsc2UKK01FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLXJ1
c3RpY2w9ZmFsc2UKK2VuZGlmCisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX0VM
RlVUSUxTKSx5KQogTUVTQTNEX0RFUEVOREVOQ0lFUyArPSBlbGZ1dGlscwogZW5kaWYKLS0gCjIu
MzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
