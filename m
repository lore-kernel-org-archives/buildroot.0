Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF49DC369AB
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 01:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D53640E08;
	Fri, 25 Apr 2025 01:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-B_XxdDthmI; Fri, 25 Apr 2025 01:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9482F41280
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9482F41280;
	Fri, 25 Apr 2025 01:43:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EEA127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 01:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA4A827DE
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 01:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0v_0vA5JqJtL for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 01:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 892FB82BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892FB82BA1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 892FB82BA1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 01:43:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39d94327297so204860f8f.0
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 18:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745545425; x=1746150225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feW5AOAoLmirdV/YT/V+vJ8hiWNnz2YWIsQRlagj/p8=;
 b=K7B6qHEatyV1dXUtYRx0Axiu2vFcWxuWhfR52YcKWyZ68/kh6lezgPo1zfX4WKJfCX
 k3+FkAPSEJ47XJ4xvMVE+99R/dbDXhkMxzh7AjSV9jtidgVpaA5XnpqajAzUwK+oJSyI
 xZjf44J3YUKm+LdgvX4h9iMl/6sRkBlfXYQZ17CIuBeaa1dWkJ+RU7TUsmX/kXOHAD/d
 LvoCPD1PGbtsME2ujB+eygX8n7W6RuxftDXLijM0+xYYTQQ19JvEPVFXTu8tFV9vfmzi
 oltkhszJKVTL67GH4epEDLyRlnGwZQcdHd+w81IlKw3Dqm4TKNOymOESO72RZEJXb47Q
 sMyA==
X-Gm-Message-State: AOJu0Yz/rsmcr3JjFlB4Dw5YHSTUp2xNM6H0GqRm7wVjJgOAi1A4yPsh
 9v5s6uLg9UWFBBEIhXM/6r0ysVpNK+eLBVvO5QXP+nCS2BmtMEh79A7jsacy
X-Gm-Gg: ASbGnct/ujqt4BnzkMFIwJ2+O9W1dDZthJ33KeXtmM0jGK3ijrLabCBdDEaCi/vG9A5
 I5q8/bwLEOhSLYuyDRose3QWe5TAmK8rufvzeM9ZteZtyWWcPKqGq2UjGwJ0fNADDd34ojWVigG
 kfiYZlkXfIiNU/zHQLrQ3DlQFC6Yhzcfu5cVx/MPpZPRMyFO9SdoyU6uPv6NMsvC+MUy9hDgaLs
 Pa5aQvBTGPUmGHqjAj2I1s7VxqEIMDgmgY8orgbqZEEipl2lQHsRCJypO+iXj8ghvWmQKRXUsGL
 u7MJoa+Flo/B+MrkPHKJo650lzouuhVEAj0NeoaL92GOKbxcsIw=
X-Google-Smtp-Source: AGHT+IEjz60gdPZknsjFVDNebr6OJmMoIxKSXl5tYAlEBlXTBXLEFqa4qDuJyAgWGkCklopLmzQ2NQ==
X-Received: by 2002:a5d:64cb:0:b0:39c:cc7:3d3b with SMTP id
 ffacd0b85a97d-3a074e2fd8amr56785f8f.8.1745545424891; 
 Thu, 24 Apr 2025 18:43:44 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5d264sm836554f8f.95.2025.04.24.18.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 18:43:44 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Fri, 25 Apr 2025 03:43:42 +0200
Message-ID: <20250425014342.2468690-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745545425; x=1746150225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=feW5AOAoLmirdV/YT/V+vJ8hiWNnz2YWIsQRlagj/p8=;
 b=MOpX7SzuFDYd2pBMJeN+6UmTvUlI0frVgQOJzSmuRIdepqQDDHYtRXyd6/CQKDFNp2
 bH9Hi1ez0sCN6L20CFSFfJlwDz48i0G5FEVxEisYXjrcn2C+iqV81c6q5Rhg1EgMqb26
 sVTNk4mNnC21HjVj/jhmRJr/IWvF+TWqYW5g9ewcx8kryXAScLH9eAG1SYPuTb5wnS+l
 qyfwluofYruuoxd7+VZ/+YbbiZxXEPfCQG07ur8t2v5NVvWsKRqrol3Xln4L5N2PnMsH
 Ptam5dZPNDnHQY2U9tkA5QYJ15AIPTqtSll04eui/KBaT+XR1DT17nxFlTZAu63STA4s
 6+KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MOpX7Szu
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypicm5io: new defconfig
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

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIENvbXB1dGUgTW9kdWxl
IDUgSU8gQm9hcmQuCgpJbXBvcnRhbnQ6IFRoZSBkZWJ1ZyBVQVJUIGhlYWRlciBpcyBub3QgYXNz
ZW1ibGVkIG9uIHRoZSBDb21wdXRlIE1vZHVsZQo1WzFdLgoKCTIuMjMuIERlYnVnIFVBUlQKCiAg
ICAgICAgU3BhY2UgaXMgcHJvdmlkZWQgZm9yIHRoZSB1c2VyIHRvIGZpdCBhIGRlYnVnIFVBUlQg
Y29ubmVjdG9yLgogICAgICAgIFRoaXMgY29ubmVjdG9yIHByb3ZpZGVzIHRoZSBzYW1lIGZ1bmN0
aW9uYWxpdHkgYXMgUmFzcGJlcnJ5IFBpCiAgICAgICAgNS4gVGhlIGNvbm5lY3RvciBpcyBhIHRo
cmVlLXBpbiAxbW0gcGl0Y2ggSlNULVNIIGNvbm5lY3RvciwgUGFydAogICAgICAgIG51bWJlciBC
TTAzQi1TUlNTLVRCLiBUaGUgc2lnbmFscyBhcmUgcmVwbGljYXRlZCBvbiB0aGUgYm90dG9tCglh
cyB0ZXN0IHBvaW50cy4KClsxXTogaHR0cHM6Ly9kYXRhc2hlZXRzLnJhc3BiZXJyeXBpLmNvbS9j
bTUvY201LWRhdGFzaGVldC5wZGYKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5w
b3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ19jbTVp
by50eHQgfCAyMSArKysrKysrKysrKysrKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50
eHQgICAgICAgfCAgNyArKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBpY201aW8gICAgICAgICAgICAg
fCAgMSArCiBjb25maWdzL3Jhc3BiZXJyeXBpY201aW9fZGVmY29uZmlnIHwgMzUgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfY201aW8udHh0CiBj
cmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvcmFzcGJlcnJ5cGljbTVpbwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGNvbmZpZ3MvcmFzcGJlcnJ5cGljbTVpb19kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ib2Fy
ZC9yYXNwYmVycnlwaS9jb25maWdfY201aW8udHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
X2NtNWlvLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42ZTc0OGNk
NWQ0Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNWlvLnR4
dApAQCAtMCwwICsxLDIxIEBACisjIFBsZWFzZSBub3RlIHRoYXQgdGhpcyBpcyBvbmx5IGEgc2Ft
cGxlLCB3ZSByZWNvbW1lbmQgeW91IHRvIGNoYW5nZSBpdCB0byBmaXQKKyMgeW91ciBuZWVkcy4K
KyMgWW91IHNob3VsZCBvdmVycmlkZSB0aGlzIGZpbGUgdXNpbmcgQlIyX1BBQ0tBR0VfUlBJX0ZJ
Uk1XQVJFX0NPTkZJR19GSUxFLgorIyBTZWUgaHR0cDovL2J1aWxkcm9vdC5vcmcvbWFudWFsLmh0
bWwjcm9vdGZzLWN1c3RvbQorIyBhbmQgaHR0cDovL2VsaW51eC5vcmcvUlBpY29uZmlnIGZvciBh
IGRlc2NyaXB0aW9uIG9mIGNvbmZpZy50eHQgc3ludGF4CisKK2tlcm5lbD1JbWFnZQorCisjIFRv
IHVzZSBhbiBleHRlcm5hbCBpbml0cmFtZnMgZmlsZQorI2luaXRyYW1mcyByb290ZnMuY3Bpby5n
egorCisjIERpc2FibGUgb3ZlcnNjYW4gYXNzdW1pbmcgdGhlIGRpc3BsYXkgc3VwcG9ydHMgZGlz
cGxheWluZyB0aGUgZnVsbCByZXNvbHV0aW9uCisjIElmIHRoZSB0ZXh0IHNob3duIG9uIHRoZSBz
Y3JlZW4gZGlzYXBwZWFycyBvZmYgdGhlIGVkZ2UsIGNvbW1lbnQgdGhpcyBvdXQKK2Rpc2FibGVf
b3ZlcnNjYW49MQorCisjIGVuYWJsZSBSVEMKK2R0cGFyYW09aTJjX3ZjPW9uCitkdG92ZXJsYXk9
aTJjLXJ0YyxwY2Y4NTA2M2EsaTJjX2NzaV9kc2kKKworIyBlbmFibGUgZHdjMiBVU0IgY29udHJv
bGxlciAoVVNCIDIuMCkKK2R0b3ZlcmxheT1kd2MyLGRyX21vZGU9aG9zdApkaWZmIC0tZ2l0IGEv
Ym9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50
eHQKaW5kZXggNDc4MTQ3MzZiZC4uYjkzZmNjMWQ0YiAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJl
cnJ5cGkvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CkBAIC0y
MCw2ICsyMCw3IEBAIFRoZXNlIGluc3RydWN0aW9ucyBhcHBseSB0byBhbGwgbW9kZWxzIG9mIHRo
ZSBSYXNwYmVycnkgUGk6CiAgIC0gdGhlIG1vZGVsIENNNHMgKGFrYSBSYXNwYmVycnkgUGkgQ29t
cHV0ZSBNb2R1bGUgNHMpLgogICAtIHRoZSBtb2RlbCBCNSAoYWthIFJhc3BiZXJyeSBQaSA1KS4K
ICAgLSB0aGUgbW9kZWwgNTAwIChha2EgUmFzcGJlcnJ5IFBpIDUwMCkuCisgIC0gdGhlIG1vZGVs
IENNNSAoYWthIFJhc3BiZXJyeSBQaSBDb21wdXRlIE1vZHVsZSA1IGFuZCBJTyBCb2FyZCkuCiAK
IEhvdyB0byBidWlsZCBpdAogPT09PT09PT09PT09PT09CkBAIC04Miw2ICs4MywxMCBAQCBGb3Ig
bW9kZWwgNSBCIGFuZCA1MDA6CiAKICAgJCBtYWtlIHJhc3BiZXJyeXBpNV9kZWZjb25maWcKIAor
Rm9yIG1vZGVsIENNNSAob24gSU8gQm9hcmQpOgorCisgICQgbWFrZSByYXNwYmVycnlwaWNtNWlv
X2RlZmNvbmZpZworCiBCdWlsZCB0aGUgcm9vdGZzCiAtLS0tLS0tLS0tLS0tLS0tCiAKQEAgLTEx
OSw2ICsxMjQsOCBAQCBBZnRlciBidWlsZGluZywgeW91IHNob3VsZCBvYnRhaW4gdGhpcyB0cmVl
OgogICAgICstLSBiY20yNzEyLXJwaS01LWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3
MTJkMC1ycGktNS1iLmR0YiAgICAgICBbMV0KICAgICArLS0gYmNtMjcxMi1ycGktNTAwLmR0YiAg
ICAgICAgIFsxXQorICAgICstLSBiY20yNzEyLXJwaS1jbTUtY201aW8gICAgICAgWzFdCisgICAg
Ky0tIGJjbTI3MTItcnBpLWNtNWwtY201aW8gICAgICBbMV0KICAgICArLS0gYm9vdC52ZmF0CiAg
ICAgKy0tIHJvb3Rmcy5leHQ0CiAgICAgKy0tIHJwaS1maXJtd2FyZS8KZGlmZiAtLWdpdCBhL2Jv
YXJkL3Jhc3BiZXJyeXBpY201aW8gYi9ib2FyZC9yYXNwYmVycnlwaWNtNWlvCm5ldyBmaWxlIG1v
ZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmZjZGFmYzgxZWQKLS0tIC9kZXYvbnVsbAorKysg
Yi9ib2FyZC9yYXNwYmVycnlwaWNtNWlvCkBAIC0wLDAgKzEgQEAKK3Jhc3BiZXJyeXBpClwgTm8g
bmV3bGluZSBhdCBlbmQgb2YgZmlsZQpkaWZmIC0tZ2l0IGEvY29uZmlncy9yYXNwYmVycnlwaWNt
NWlvX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGljbTVpb19kZWZjb25maWcKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZTYxYzQ3YzhkMgotLS0gL2Rldi9udWxs
CisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGljbTVpb19kZWZjb25maWcKQEAgLTAsMCArMSwzNSBA
QAorQlIyX2FhcmNoNjQ9eQorQlIyX2NvcnRleF9hNzY9eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TD15CitCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQorQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKK0JSMl9HTE9CQUxfUEFUQ0hfRElS
PSJib2FyZC9yYXNwYmVycnlwaS9wYXRjaGVzIgorQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hB
U0hFUz15CitCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCitCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NS
SVBUPSJib2FyZC9yYXNwYmVycnlwaWNtNWlvL3Bvc3QtYnVpbGQuc2giCitCUjJfUk9PVEZTX1BP
U1RfSU1BR0VfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaWNtNWlvL3Bvc3QtaW1hZ2Uuc2giCitC
UjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQorQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1YixyYXNw
YmVycnlwaSxsaW51eCxjZDIzMWQ0Nzc1YjE0ZjIyODYwNmMwOWYyMTliNDgzMDhmNmFiM2FhKS9s
aW51eC1jZDIzMWQ0Nzc1YjE0ZjIyODYwNmMwOWYyMTliNDgzMDhmNmFiM2FhLnRhci5neiIKK0JS
Ml9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY20yNzEyIgorQlIyX0xJTlVYX0tFUk5FTF9DT05G
SUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL3Jhc3BiZXJyeXBpL2xpbnV4LTRrLXBhZ2Utc2l6ZS5m
cmFnbWVudCIKK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQorQlIyX0xJTlVYX0tFUk5F
TF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3MTItcnBpLWNtNS1jbTVpbyBicm9hZGNv
bS9iY20yNzEyLXJwaS1jbTVsLWNtNWlvIgorQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09Q
RU5TU0w9eQorQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15CitCUjJfUEFDS0FHRV9Y
Wj15CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkU9eQorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJF
X0NPTkZJR19GSUxFPSJib2FyZC9yYXNwYmVycnlwaWNtNWlvL2NvbmZpZ19jbTVpby50eHQiCitC
UjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ01ETElORV9GSUxFPSJib2FyZC9yYXNwYmVycnlwaWNt
NWlvL2NtZGxpbmVfY201aW8udHh0IgorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExf
RFRCX09WRVJMQVlTPXkKK0JSMl9QQUNLQUdFX0tNT0Q9eQorQlIyX1BBQ0tBR0VfS01PRF9UT09M
Uz15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15
CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCisjIEJSMl9UQVJHRVRfUk9PVEZT
X1RBUiBpcyBub3Qgc2V0CitCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tB
R0VfSE9TVF9HRU5JTUFHRT15CitCUjJfUEFDS0FHRV9IT1NUX0tNT0RfWFo9eQorQlIyX1BBQ0tB
R0VfSE9TVF9NVE9PTFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9SQVNQQkVSUllQSV9VU0JCT09UPXkK
LS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
