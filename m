Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35996C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 23:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1BAD4079A;
	Thu, 24 Apr 2025 23:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJo5Eaa7AN6j; Thu, 24 Apr 2025 23:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E439840701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E439840701;
	Thu, 24 Apr 2025 23:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C04DC127
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 23:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6AA16067A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 23:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyyhfNp4YV4s for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 23:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A81E605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A81E605A6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A81E605A6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 23:46:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so179363f8f.3
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 16:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745538414; x=1746143214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIBJKF0nUOqxuQRZnwuzEJzdR9qe85UB8waC0YpCpW8=;
 b=KHljyQhuemVukjtCEmn+2A3d5OTBalSOV3sJb7e7JiDbEeWnbqkqEU8J7a2z7xzTP3
 ntICl8xksYB3cNsxKMUYk8CVKJoTk6NT89gvpKm6hQSeKwJ7pmjKxsPBCnGU0KbdJTeS
 7Bp3U8FWpE6K5wWE3QGGJtC3O2hlmrKzqNRn8wY2Bh6yCrmIQIzqKug/HeHlwJVcJyEm
 629JdSswSR4xAiOk0QiVU6Nf8RIZwFZbFc8bk/OWuoR/ev3YouixZED+NDugQkSA3qLd
 RSUfF/NY4rDxhD114PyXY6cSjCB+K+cxDOSzjcKrCosEqeoHB+zvWt5HbrHv8VHkXYqI
 /3jQ==
X-Gm-Message-State: AOJu0YzXaj13RiudedN7Y/CIJtjP38DAOIZ8bFJg8dy3/BUfO5B1rS8s
 HT2zcgXy3DNOvLkI5jruEY4GqBQmeM5Nhs/mIUxZAgqmC1iwjw9HttAml5hG
X-Gm-Gg: ASbGnctrXRT8A8upcQVoMN6ELERDc1jBtLH+wMDG/kW8e0tjAEqFmtt8l0OMJJ4Wm3r
 i/AdRVqwstDZQLKn4BlHSlR2IzRywZgjCPsPz3ZPs1WZdtpenNW3m9+GIorVFfr0mYTJ2G6GULF
 jJFdOMk84UhXeT/hSKl2B1mpzBAd5nW6zyg8h7lixnI0gtrkb2SwAlnJ+lTdDqf6x58S3//cjUt
 PFOn8aTO5xPYShe4OFr3IwfDhZflwHFjKsfWERvn0ij19q88xQD6GIAIgwdudAnN83yojk5+P+S
 hc06ARWCq4lMSCBBuJhCj1NBu8otRgMMXUCSd+UGfyWb7BzQM7S+gjjDWqPLVQ==
X-Google-Smtp-Source: AGHT+IHtLQuxHVo0hdl+Uj6FMRqoayaEe5mZ67cM1CvfvrvHIcdmjPALjh8IM+o077/ijiKO2KtsEQ==
X-Received: by 2002:a05:6000:420a:b0:3a0:6bd0:a4b0 with SMTP id
 ffacd0b85a97d-3a074e0e122mr15197f8f.2.1745538413664; 
 Thu, 24 Apr 2025 16:46:53 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8d60asm695353f8f.18.2025.04.24.16.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 16:46:53 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Fri, 25 Apr 2025 01:46:45 +0200
Message-ID: <20250424234645.2452900-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745538414; x=1746143214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vIBJKF0nUOqxuQRZnwuzEJzdR9qe85UB8waC0YpCpW8=;
 b=j1ZqvoyHBoCHqDNMuKSctKpEu4bEhod1xBf6XrjVcwA0NxFwqZu+AFgIgsFQJc7I57
 P7/1pwAd8/Yqb4o5R1cAtLtp29TIkZsv1PzH4qFSDUnvJPrQGAT6NHJEZ3O/+oZ+jcs0
 +GsT49/2NTdEzqFqmUJi70HqemYUJ0W1n9oRmZMZr/QovdTChJ7bqZqaLWg7uqnFyd5h
 ebXQ8UVZM8H8GGLG3jSTlwNASRdNbYWdchEyVySpyQU+ykVJ+rsYgphizsyxv7t/9AIL
 57yUP8u5ZLl5n72ihI3gAd02vSkwS5eYJbekE7Jasow0ixBcX77zoPIGt5yLgS+HgOs3
 z+pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j1ZqvoyH
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi2_64: new defconfig
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

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeSBQaSAy
IFJldiAxLjIKKDY0LWJpdCkuCgpOb3RlOiBSYXNwYmVycnkgUGkgMiBNb2RlbCBCIFJldiAxLjJb
MV0gc3dpdGNoZWQgZnJvbSBCQ00yODM2WzJdIHRvCkJDTTI4MzdbM10gdGhhdCBpcyA2NC1iaXQu
CgoJQkNNMjgzNlsyXQoKCVRoZSBCcm9hZGNvbSBjaGlwIHVzZWQgaW4gdGhlIFJhc3BiZXJyeSBQ
aSAyIE1vZGVsIEIuIFRoZQoJdW5kZXJseWluZyBhcmNoaXRlY3R1cmUgaW4gQkNNMjgzNiBpcyBp
ZGVudGljYWwgdG8gQkNNMjgzNS4gVGhlCglvbmx5IHNpZ25pZmljYW50IGRpZmZlcmVuY2UgaXMg
dGhlIHJlbW92YWwgb2YgdGhlIEFSTTExNzZKWkYtUwoJcHJvY2Vzc29yIGFuZCByZXBsYWNlbWVu
dCB3aXRoIGEgcXVhZC1jb3JlIENvcnRleC1BNyBjbHVzdGVyLgoKCUJDTTI4MzdbM10KCglUaGlz
IGlzIHRoZSBCcm9hZGNvbSBjaGlwIHVzZWQgaW4gdGhlIFJhc3BiZXJyeSBQaSAzIE1vZGVsIEIs
CglsYXRlciBtb2RlbHMgb2YgdGhlIFJhc3BiZXJyeSBQaSAyIE1vZGVsIEIsIGFuZCB0aGUgUmFz
cGJlcnJ5IFBpCglDb21wdXRlIE1vZHVsZSAzLiBUaGUgdW5kZXJseWluZyBhcmNoaXRlY3R1cmUg
b2YgdGhlIEJDTTI4MzcgaXMKCWlkZW50aWNhbCB0byB0aGUgQkNNMjgzNi4gVGhlIG9ubHkgc2ln
bmlmaWNhbnQgZGlmZmVyZW5jZSBpcyB0aGUKCXJlcGxhY2VtZW50IG9mIHRoZSBBUk12NyBxdWFk
IGNvcmUgY2x1c3RlciB3aXRoIGEgcXVhZC1jb3JlIEFSTQoJQ29ydGV4IEE1MyAoQVJNdjgpIGNs
dXN0ZXIuCgoJVGhlIEFSTSBjb3JlcyBydW4gYXQgMS4yR0h6LCBtYWtpbmcgdGhlIGRldmljZSBh
Ym91dCA1MCUgZmFzdGVyCgl0aGFuIHRoZSBSYXNwYmVycnkgUGkgMi4gVGhlIFZpZGVvQ29yZSBJ
ViBydW5zIGF0IDQwME1Iei4KClsxXTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3Vt
ZW50YXRpb24vY29tcHV0ZXJzL3Jhc3BiZXJyeS1waS5odG1sI2ZsYWdzaGlwLXNlcmllcwpbMl06
IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9wcm9j
ZXNzb3JzLmh0bWwjYmNtMjgzNgpbM106IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1
bWVudGF0aW9uL2NvbXB1dGVycy9wcm9jZXNzb3JzLmh0bWwjYmNtMjgzNwoKU2lnbmVkLW9mZi1i
eTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+Ci0tLQogYm9hcmQv
cmFzcGJlcnJ5cGkvY29uZmlnXzJfNjRiaXQudHh0IHwgMjYgKysrKysrKysrKysrKysrKysrKysr
CiBib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0ICAgICAgICAgfCAgNCArKysrCiBib2FyZC9y
YXNwYmVycnlwaTItNjQgICAgICAgICAgICAgICAgfCAgMSArCiBjb25maWdzL3Jhc3BiZXJyeXBp
Ml82NF9kZWZjb25maWcgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZp
bGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9y
YXNwYmVycnlwaS9jb25maWdfMl82NGJpdC50eHQKIGNyZWF0ZSBtb2RlIDEyMDAwMCBib2FyZC9y
YXNwYmVycnlwaTItNjQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3Jhc3BiZXJyeXBpMl82
NF9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMl82NGJp
dC50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMl82NGJpdC50eHQKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNWI1MzFiMWNhZQotLS0gL2Rldi9udWxsCisrKyBi
L2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18yXzY0Yml0LnR4dApAQCAtMCwwICsxLDI2IEBACisj
IFBsZWFzZSBub3RlIHRoYXQgdGhpcyBpcyBvbmx5IGEgc2FtcGxlLCB3ZSByZWNvbW1lbmQgeW91
IHRvIGNoYW5nZSBpdCB0byBmaXQKKyMgeW91ciBuZWVkcy4KKyMgWW91IHNob3VsZCBvdmVycmlk
ZSB0aGlzIGZpbGUgdXNpbmcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFLgor
IyBTZWUgaHR0cDovL2J1aWxkcm9vdC5vcmcvbWFudWFsLmh0bWwjcm9vdGZzLWN1c3RvbQorIyBh
bmQgaHR0cDovL2VsaW51eC5vcmcvUlBpY29uZmlnIGZvciBhIGRlc2NyaXB0aW9uIG9mIGNvbmZp
Zy50eHQgc3ludGF4CisKK3N0YXJ0X2ZpbGU9c3RhcnQuZWxmCitmaXh1cF9maWxlPWZpeHVwLmRh
dAorCitrZXJuZWw9SW1hZ2UKKworIyBUbyB1c2UgYW4gZXh0ZXJuYWwgaW5pdHJhbWZzIGZpbGUK
KyNpbml0cmFtZnMgcm9vdGZzLmNwaW8uZ3oKKworIyBEaXNhYmxlIG92ZXJzY2FuIGFzc3VtaW5n
IHRoZSBkaXNwbGF5IHN1cHBvcnRzIGRpc3BsYXlpbmcgdGhlIGZ1bGwgcmVzb2x1dGlvbgorIyBJ
ZiB0aGUgdGV4dCBzaG93biBvbiB0aGUgc2NyZWVuIGRpc2FwcGVhcnMgb2ZmIHRoZSBlZGdlLCBj
b21tZW50IHRoaXMgb3V0CitkaXNhYmxlX292ZXJzY2FuPTEKKworIyBIb3cgbXVjaCBtZW1vcnkg
aW4gTUIgdG8gYXNzaWduIHRvIHRoZSBHUFUgb24gUGkgbW9kZWxzIGhhdmluZworIyAyNTYsIDUx
MiBvciAxMDI0IE1CIHRvdGFsIG1lbW9yeQorZ3B1X21lbV8yNTY9MTAwCitncHVfbWVtXzUxMj0x
MDAKK2dwdV9tZW1fMTAyND0xMDAKKworIyBlbmFibGUgNjRiaXRzIHN1cHBvcnQKK2FybV82NGJp
dD0xCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IGIvYm9hcmQvcmFz
cGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCA0NzgxNDczNmJkLi43ZGRhNjMxMzg3IDEwMDY0NAot
LS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBp
L3JlYWRtZS50eHQKQEAgLTU0LDYgKzU0LDEwIEBAIEZvciBtb2RlbCAyIEI6CiAKICAgJCBtYWtl
IHJhc3BiZXJyeXBpMl9kZWZjb25maWcKIAorb3IgZm9yIG1vZGVsIDIgQiAoUmV2IDEuMiwgbW9k
ZWwgQjMgd2l0aG91dCB3aXJlbGVzcyBMQU4gYW5kIEJsdWV0b290aCwgNjQgYml0KToKKworICAk
IG1ha2UgcmFzcGJlcnJ5cGkyXzY0X2RlZmNvbmZpZworCiBGb3IgbW9kZWwgMyBCLCBCKywgQ00z
IGFuZCBDTTMrOgogCiAgICQgbWFrZSByYXNwYmVycnlwaTNfZGVmY29uZmlnCmRpZmYgLS1naXQg
YS9ib2FyZC9yYXNwYmVycnlwaTItNjQgYi9ib2FyZC9yYXNwYmVycnlwaTItNjQKbmV3IGZpbGUg
bW9kZSAxMjAwMDAKaW5kZXggMDAwMDAwMDAwMC4uZmNkYWZjODFlZAotLS0gL2Rldi9udWxsCisr
KyBiL2JvYXJkL3Jhc3BiZXJyeXBpMi02NApAQCAtMCwwICsxIEBACityYXNwYmVycnlwaQpcIE5v
IG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGky
XzY0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGkyXzY0X2RlZmNvbmZpZwpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yMTFlODQ3MGI0Ci0tLSAvZGV2L251bGwK
KysrIGIvY29uZmlncy9yYXNwYmVycnlwaTJfNjRfZGVmY29uZmlnCkBAIC0wLDAgKzEsMzQgQEAK
K0JSMl9hYXJjaDY0PXkKK0JSMl9BUk1fRlBVX1ZGUFY0PXkKK0JSMl9UT09MQ0hBSU5fRVhURVJO
QUw9eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKK0JSMl9UT09MQ0hBSU5fRVhU
RVJOQUxfQk9PVExJTl9BQVJDSDY0X0dMSUJDX1NUQUJMRT15CitCUjJfR0xPQkFMX1BBVENIX0RJ
Uj0iYm9hcmQvcmFzcGJlcnJ5cGkvcGF0Y2hlcyIKK0JSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19I
QVNIRVM9eQorQlIyX1NZU1RFTV9ESENQPSJldGgwIgorQlIyX1JPT1RGU19QT1NUX0JVSUxEX1ND
UklQVD0iYm9hcmQvcmFzcGJlcnJ5cGkyLTY0L3Bvc3QtYnVpbGQuc2giCitCUjJfUk9PVEZTX1BP
U1RfSU1BR0VfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaTItNjQvcG9zdC1pbWFnZS5zaCIKK0JS
Ml9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTD15CitCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLHJhc3Bi
ZXJyeXBpLGxpbnV4LGNkMjMxZDQ3NzViMTRmMjI4NjA2YzA5ZjIxOWI0ODMwOGY2YWIzYWEpL2xp
bnV4LWNkMjMxZDQ3NzViMTRmMjI4NjA2YzA5ZjIxOWI0ODMwOGY2YWIzYWEudGFyLmd6IgorQlIy
X0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTEiCitCUjJfTElOVVhfS0VSTkVMX0RUU19T
VVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20y
NzEwLXJwaS0yLWIiCitCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CitCUjJf
UEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTPXkKK0JSMl9QQUNLQUdFX1haPXkKK0JSMl9QQUNL
QUdFX1JQSV9GSVJNV0FSRT15CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQk9PVENPREVfQklO
PXkKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJQU5UX1BJPXkKK0JSMl9QQUNLQUdFX1JQ
SV9GSVJNV0FSRV9DT05GSUdfRklMRT0iYm9hcmQvcmFzcGJlcnJ5cGkyLTY0L2NvbmZpZ18yXzY0
Yml0LnR4dCIKKyMgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRCX09WRVJMQVlT
IGlzIG5vdCBzZXQKK0JSMl9QQUNLQUdFX0tNT0Q9eQorQlIyX1BBQ0tBR0VfS01PRF9UT09MUz15
CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CitC
UjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCisjIEJSMl9UQVJHRVRfUk9PVEZTX1RB
UiBpcyBub3Qgc2V0CitCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tBR0Vf
SE9TVF9HRU5JTUFHRT15CitCUjJfUEFDS0FHRV9IT1NUX0tNT0RfWFo9eQorQlIyX1BBQ0tBR0Vf
SE9TVF9NVE9PTFM9eQotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
