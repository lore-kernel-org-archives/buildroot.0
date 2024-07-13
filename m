Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53E1C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7518961066;
	Sat, 13 Jul 2024 09:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 892lECvCpgqN; Sat, 13 Jul 2024 09:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F30761313
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F30761313;
	Sat, 13 Jul 2024 09:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 274481BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1365240190
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70OKObYPo3vH for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6439240204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6439240204
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6439240204
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso18861645e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863448; x=1721468248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCcEnihXPyGYUQevIs/Lasd6dZivlc+2qWvhxW7eRyQ=;
 b=oW/Yi+nt8yh/izkYzA0cQH44sCdIVLcrGH4h1ET9TNa1BPqgC22pyxiledCd7d+4xx
 wILOy/lIXWojElaBch1BcAz98mliq+g3m2kToHVQrcX8zNcs4hhqkUA6CiUbqBDOnzR1
 8QxqL9Rvmb3ABE1D+yNnvJQLux9R9MGMbMuVy4KNMiudktvGFCjMoBqzDfrkP/kYn2hP
 HBQ4gyJ3Sx8UImsGRjc8X8mSDTQrm47pqjgBP8u7Wf8wo4kbsnhzMm00sQ2VaAJM7Vnh
 9qvoU//drp8f9xUD2WZqCu2lNl/KDBQB7yZorLMyPKK0+dWtYkYwRmflhOgVfpFezS4T
 u6+g==
X-Gm-Message-State: AOJu0Yx3/LRm+RRILSt5iqN3SyuGo6tsDPcoQqMuDDCKRFffeuaGQv8i
 kxkzQdcHmF4MmE7RPvh0C21AZ6pkirflr9sWfo/vM+6FSxztTd8qfBDrl7AqygJJ+ou+JnNBcT+
 K
X-Google-Smtp-Source: AGHT+IH+fnzCwqMKvntphSF9Hkhs0iCx7nv6eY1ts9pamy4uFV4W5gIM+sumwyC50u3Av8gJRXjkbg==
X-Received: by 2002:a05:600c:2257:b0:426:67f0:b4fa with SMTP id
 5b1f17b1804b1-426707cf189mr90852595e9.1.1720863448482; 
 Sat, 13 Jul 2024 02:37:28 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:36:59 +0200
Message-Id: <20240713093700.13981-7-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863448; x=1721468248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCcEnihXPyGYUQevIs/Lasd6dZivlc+2qWvhxW7eRyQ=;
 b=ZCG5qMKAE1W4+I5ZSWZUzmQOvW7XZOuINnX2Tiq/XgqDIL1Tyd+0b3hXIz4eMuTG6U
 3AaqiNJ4wet76hfGXkI+a9T2b4KP4BPsU0vSdtUQj6vVK56+Nne3Uxk+qoSJHwyf0gSB
 qMFWaAuknzPKd6vI4pUsETb2vcFsDZ7qS2vyc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ZCG5qMKA
Subject: [Buildroot] [PATCH 6/7] package/mesa3d: add RustiCL support
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
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
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
bGUgbGliUnVzdGlPcGVuQ0wuc28gYW5kIG5vCmxpYk9wZW5DTC5zbwoKTWFueSBHYWxsaXVtIGRy
aXZlcnMgYXJlIGNvbXBhdGlibGUgd2l0aCBydXN0aWNsLiBIb3dldmVyLCB0ZXN0cyB3ZXJlCnBl
cmZvcm1lZCB3aXRoIHBhbmZyb3N0LiBUaHVzIG9ubHkgcGFuZnJvc3QgaXMgYWN0aXZlZCBmb3Ig
dGhlIG1vbWVudC4KVG8gYWN0aXZhdGUgYW5vdGhlciBkcml2ZXIsIG1ha2UgaXQgc2VsZWN0CkJS
Ml9QQUNLQUdFX01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklWRVIuIFRoZSBsaXN0IG9mIGFs
bApjb21wYXRpYmxlIGRyaXZlcnMgY2FuIGJlIGZvdW5kIGhlcmU6Cmh0dHBzOi8vZG9jcy5tZXNh
M2Qub3JnL2VudnZhcnMuaHRtbCNlbnZ2YXItUlVTVElDTF9FTkFCTEUKClNpZ25lZC1vZmYtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgpTaWduZWQtb2ZmLWJ5OiBTZWJh
c3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4KU2lnbmVkLW9mZi1ieTogQW50
b2luZSBDb3V0YW50IDxhbnRvaW5lLmNvdXRhbnRAc21pbGUuZnI+Ci0tLQogcGFja2FnZS9tZXNh
M2QvQ29uZmlnLmluIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQogcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIHwgIDkgKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L21lc2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KaW5kZXggNDU5MDUx
YjJkYi4uNzU1MDRjMTFkYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCisr
KyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgpAQCAtNDQsMTcgKzQ0LDU2IEBAIGNvbW1lbnQg
Imxsdm0gc3VwcG9ydCBuZWVkcyBhIHRvb2xjaGFpbiBub3QgYWZmZWN0ZWQgYnkgR0NDIGJ1ZyA2
NDczNSIKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xMVk1fQVJDSF9TVVBQT1JUUwogCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR182NDczNQogCi0jIGNsYW5nIGFuZCBsaWJj
bGMgZGVwZW5kZW5jaWVzIGFyZSBzYXRpc2ZpZWQgYnkKLSMgQlIyX1BBQ0tBR0VfTUVTQTNEX0xM
Vk0KLWNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMCittZW51Y29uZmlnIEJSMl9QQUNL
QUdFX01FU0EzRF9PUEVOQ0wKIAlib29sICJPcGVuQ0wgc3VwcG9ydCIKKwlkZWZhdWx0IG4KIAlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9NRVNBM0RfR0FMTElVTV9EUklWRVJfUjYwMCB8fCBcCi0JCUJSMl9QQUNLQUdFX01FU0EzRF9H
QUxMSVVNX0RSSVZFUl9SQURFT05TSQorCQlCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklW
RVJfUkFERU9OU0kgfHwgXAorCQlCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NV
UFBPUlRTICYmIFwKKwkJQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJQ0xfU1VQUE9SVEVEX0RSSVZF
UgogCXNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX1JUVEkKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQ0xB
TkcKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ0xDCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19M
SUJPUEVOQ0wKKwloZWxwCisJICBPcGVuQ0wgaXMgYSBzdGFuZGFyZCBmb3IgcGFyYWxsZWwgcHJv
Z3JhbW1pbmcgb2YgaGV0ZXJvZ2VuZW91cworCSAgc3lzdGVtcyAoQ1BVcywgR1BVcywgRFNQcywg
RlBHQXMsIGV0Yy4pCisKKwkgIGh0dHA6Ly93d3cua2hyb25vcy5vcmcvb3BlbmNsLworCitpZiBC
UjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMCisKKyMgY2xhbmcgYW5kIGxpYmNsYyBkZXBlbmRlbmNp
ZXMgYXJlIHNhdGlzZmllZCBieQorIyBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQorY29uZmlnIEJS
Ml9QQUNLQUdFX01FU0EzRF9DTE9WRVIKKwlib29sICJDbG92ZXIiCisJZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfUjYwMCB8fCBcCisJCUJSMl9QQUNLQUdFX01F
U0EzRF9HQUxMSVVNX0RSSVZFUl9SQURFT05TSQorCisjIGxpYmNsYyBkZXBlbmRlbmN5IGlzIHNh
dGlzZmllZCBieQorIyBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQorY29uZmlnIEJSMl9QQUNLQUdF
X01FU0EzRF9SVVNUSUNMCisJYm9vbCAiUnVzdGlDTCIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklWRVIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQworCXNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX0RVTVAKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfT1BFTkNMX0lDRF9MT0FERVIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU1BJUlZfVE9PTFMKKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfU1BJUlZfTExWTV9UUkFOU0xBVE9SCisJaGVscAorCSAgUnVzdGlD
TCBpcyBhbiBPcGVuQ0wgaW1wbGVtZW50YXRpb24gd3JpdHRlbiBpbiBSdXN0LgorCisJICBCeSBk
ZWZhdWx0IGRldmljZXMgYXJlIGRpc2FibGVkIGluIFJ1c3RpQ0wuIElmIHlvdSB3YW50IHRvIGVu
YWJsZSBhIGRldmljZSwKKwkgIHlvdSBuZWVkIHRvIHNldCB0aGUgZW52aXJvbm1lbnQgdmFyaWFi
bGUgUlVTVElDTF9FTkFCTEUgdG8gdGhlIGRyaXZlciB5b3UKKwkgIGFyZSB1c2luZy4KKwkgIHJl
ZjogaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcvZW52dmFycy5odG1sI2VudnZhci1SVVNUSUNMX0VO
QUJMRQorCitlbmRpZiAjIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOQ0wKKworY29uZmlnIEJSMl9Q
QUNLQUdFX01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklWRVIKKwlib29sCiAKICMgaW5mb3Jt
IHRoZSAubWsgZmlsZSBvZiBnYWxsaXVtIG9yIHZ1bGthbiBkcml2ZXIgc2VsZWN0aW9uCiBjb25m
aWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSCkBAIC0xNTMsNiArMTkyLDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9QQU5GUk9TVAogCWJvb2wg
IkdhbGxpdW0gcGFuZnJvc3QgZHJpdmVyIgogCWRlcGVuZHMgb24gKEJSMl9UT09MQ0hBSU5fSEFT
X1NZTkNfNCAmJiAhQlIyX1JJU0NWXzMyKSB8fCAhQlIyX1BBQ0tBR0VfWE9SRzcgIyBsaWJ4c2ht
ZmVuY2UKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSCisJc2VsZWN0
IEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklWRVIKIAloZWxwCiAJICBN
ZXNhIGRyaXZlciBmb3IgQVJNIE1hbGkgTWlkZ2FyZCBhbmQgQmlmcm9zdCBHUFVzLgogCkBAIC0z
ODUsNyArNDI1LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdMRVMKIAlkZWZh
dWx0ICJtZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVMgJiYgIUJSMl9QQUNL
QUdFX0xJQkdMVk5ECiAKIGNvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJPUEVOQ0wKLQlk
ZWZhdWx0ICJtZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOQ0wKKwlkZWZhdWx0ICJt
ZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9DTE9WRVIgfHwgQlIyX1BBQ0tBR0VfTUVTQTNE
X1JVU1RJQ0wKIAogZW5kaWYgIyBCUjJfUEFDS0FHRV9NRVNBM0QKIApkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCmluZGV4IDJj
YjhmM2EyYzguLjdiMWZjOTNhMjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5t
aworKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKQEAgLTUzLDYgKzUzLDcgQEAgZW5kaWYK
IGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5DTCkseSkKIE1FU0EzRF9QUk9WSURFUyAr
PSBsaWJvcGVuY2wKIE1FU0EzRF9ERVBFTkRFTkNJRVMgKz0gY2xhbmcgbGliY2xjIG9wZW5jbC1o
ZWFkZXJzCitpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9DTE9WRVIpLHkpCiBpZmVxICgkKEJS
Ml9QQUNLQUdFX09QRU5DTF9JQ0RfTE9BREVSKSx5KQogTUVTQTNEX0NPTkZfT1BUUyArPSAtRGdh
bGxpdW0tb3BlbmNsPWljZAogTUVTQTNEX0RFUEVOREVOQ0lFUyArPSAgb3BlbmNsLWljZC1sb2Fk
ZXIKQEAgLTY0LDYgKzY1LDE0IEBAIGVuZGlmCiBlbHNlCiBNRVNBM0RfQ09ORl9PUFRTICs9IC1E
Z2FsbGl1bS1vcGVuY2w9ZGlzYWJsZWQKIGVuZGlmCitpZmVxICgkKEJSMl9QQUNLQUdFX01FU0Ez
RF9SVVNUSUNMKSx5KQorTUVTQTNEX0RFUEVOREVOQ0lFUyArPSBob3N0LXJ1c3RjIGhvc3QtcnVz
dC1iaW5kZ2VuIG9wZW5jbC1pY2QtbG9hZGVyIHNwaXJ2LXRvb2xzIHNwaXJ2LWxsdm0tdHJhbnNs
YXRvcgorIyAtRHJ1c3Rfc3RkPTIwMjE6IGtub3duIG1lc29uIGJ1ZyAoaHR0cHM6Ly9naXRodWIu
Y29tL21lc29uYnVpbGQvbWVzb24vaXNzdWVzLzEwNjY0KQorTUVTQTNEX0NPTkZfT1BUUyArPSAt
RGdhbGxpdW0tcnVzdGljbD10cnVlIC1EcnVzdF9zdGQ9MjAyMQorZWxzZQorTUVTQTNEX0NPTkZf
T1BUUyArPSAtRGdhbGxpdW0tcnVzdGljbD1mYWxzZQorZW5kaWYKK2VuZGlmCiAKIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX0VMRlVUSUxTKSx5KQogTUVTQTNEX0RFUEVOREVOQ0lF
UyArPSBlbGZ1dGlscwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
