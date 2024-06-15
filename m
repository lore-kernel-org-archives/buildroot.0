Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E29C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 20:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B5440144;
	Sat, 15 Jun 2024 20:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6DkaFD-6QFq; Sat, 15 Jun 2024 20:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9316E40129
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9316E40129;
	Sat, 15 Jun 2024 20:28:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD911BF2FB
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 20:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5522F81F35
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 20:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vzvm69IKcDtH for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 20:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D968B81F20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D968B81F20
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D968B81F20
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 20:28:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4217990f8baso29727945e9.2
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 13:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718483310; x=1719088110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mYumP4bQ7itW1Wx4nIuwSsORJvmjCAjHKZqFCN1xrJc=;
 b=vXa0MEXM06pzt6BahZ66yQzITL0TlvqWfJJ5mLS0YJIIlYM6w8EUOZJlLjxWjZ+Nva
 pCZpoMzTPk6gQ5PuxDel7fUeAFMu/hmExo4oZXdkw2tTLqio/AiEr8hbvUqfTTCsj1q3
 fpGurRVH09ORiFK+CX2JknciOMH0PReI/FJbKLBNpgCWoFDNuu56i/sk9A2LoYTqtTB5
 yACPd9qHj/J53xfCRO1/VglRTasngQfipnbGHZeufWqJcGPnTL4vmlpI3K371AmMHQzA
 xyq4YsnoXWfkh5NnSbP078Vc8R1nuyYDBPgBE9WNX1xIxmfSFoOQ16r3cIWvx3XbMnfP
 MhIA==
X-Gm-Message-State: AOJu0Ywi4uAZMTKIwO/QO/YoYrQR7quz8o58fkPpkSjM7Vl5bfLgYSf/
 iWvrfTPCt21WP4AG4fOMLkHR0X9n0N2ofVo8mVFG5KGtrxcWEP2DFjKOPw==
X-Google-Smtp-Source: AGHT+IGwsgWYw9k+LCSNnPDlldLB1JvSJUJvdaSl1cEcSEuIRAcwPiJngZsbQPYpJs1S8S2SyDn1CA==
X-Received: by 2002:a05:600c:1f90:b0:421:9502:3f24 with SMTP id
 5b1f17b1804b1-423048264cdmr45359465e9.14.1718483309761; 
 Sat, 15 Jun 2024 13:28:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e74c7sm145349195e9.47.2024.06.15.13.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 13:28:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 22:28:24 +0200
Message-ID: <20240615202826.3303698-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718483310; x=1719088110; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mYumP4bQ7itW1Wx4nIuwSsORJvmjCAjHKZqFCN1xrJc=;
 b=PHtbugmDLUFF4JyPZTxxso2vNDRv/ucDhsuiKC4YNxd2dYkOuHQGh8Ty55XOrhp65X
 0I2VVCebP+wIp9bbjBa4XDad6I9pQ3qtvkrDeNFl8wH35u5WCVe4431U3UQ8XlqBmmAB
 X2mN+ToY0dbasR4a8FsmFxOp2MYiCprK/atAUmUQbp83WpLYRJr8UGeTmRimFXTJLw7v
 Znlg76WGxKzceoyPgdBxeeylX6uzLEuAkQu9lshMyr3BbGAQfEvPKfQ4fE0FrNLqX9YZ
 cjgIMSwfwNdnykT3TArLX823SJf1UPH8d5fRjVaDMWuyMjP5dQYD4cd4t6jvx5DohYUB
 OLdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PHtbugmD
Subject: [Buildroot] [PATCH 1/1] package/avro-c: fix build with gcc 14
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGdjYyAxNDoKCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEv
YnVpbGQvYXZyby1jLTEuMTEuMy9zcmMvYXZyby9sZWdhY3kuaDozMywKICAgICAgICAgICAgICAg
ICBmcm9tIC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9idWls
ZC9hdnJvLWMtMS4xMS4zL3NyYy9hdnJvL2lvLmg6MzEsCiAgICAgICAgICAgICAgICAgZnJvbSAv
aG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEvYnVpbGQvYXZyby1j
LTEuMTEuMy9zcmMvYXZyby9jb25zdW1lci5oOjMwLAogICAgICAgICAgICAgICAgIGZyb20gL2hv
bWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS02L291dHB1dC0xL2J1aWxkL2F2cm8tYy0x
LjExLjMvc3JjL2F2cm8uaDoyOCwKICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2F1dG9idWls
ZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9idWlsZC9hdnJvLWMtMS4xMS4zL2V4YW1w
bGVzL3F1aWNrc3RvcC5jOjE4OgovaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTYv
b3V0cHV0LTEvYnVpbGQvYXZyby1jLTEuMTEuMy9leGFtcGxlcy9xdWlja3N0b3AuYzogSW4gZnVu
Y3Rpb24gJ3ByaW50X3BlcnNvbic6Ci9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
Ni9vdXRwdXQtMS9idWlsZC9hdnJvLWMtMS4xMS4zL2V4YW1wbGVzL3F1aWNrc3RvcC5jOjEyMzo2
MTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiAnZmlyc3RfdmFsdWUuaWZhY2UtPmdldF9z
dHJpbmcnIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdpbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc10KICAxMjMgfCAgICAgICAgICAgICAgICAgICAgICAgICBhdnJvX3ZhbHVlX2dl
dF9zdHJpbmcoJmZpcnN0X3ZhbHVlLCAmcCwgJnNpemUpOwogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludDMyX3QgKioge2FrYSBpbnQgKip9CgpGaXhlczoKIC0gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZmRiYzZhODg4YmE4YmI1MWY0ZTA3NmE0
NTA5MTk0NzdkMTM3OGViMwoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogLi4uLUZpeC10eXBvcy1pbi1kb2NzLWFuZC1leGFt
cGxlcy0yNzk1LnBhdGNoIHwgNTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDU5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2F2cm8tYy8wMDAx
LUFWUk8tMzk1Ny1GaXgtdHlwb3MtaW4tZG9jcy1hbmQtZXhhbXBsZXMtMjc5NS5wYXRjaAoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvYXZyby1jLzAwMDEtQVZSTy0zOTU3LUZpeC10eXBvcy1pbi1kb2Nz
LWFuZC1leGFtcGxlcy0yNzk1LnBhdGNoIGIvcGFja2FnZS9hdnJvLWMvMDAwMS1BVlJPLTM5NTct
Rml4LXR5cG9zLWluLWRvY3MtYW5kLWV4YW1wbGVzLTI3OTUucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNzJmYWFhMGFiZQotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvYXZyby1jLzAwMDEtQVZSTy0zOTU3LUZpeC10eXBvcy1pbi1kb2NzLWFuZC1leGFtcGxl
cy0yNzk1LnBhdGNoCkBAIC0wLDAgKzEsNTkgQEAKK0Zyb20gNTJmMDUxZGJlZWZhZDBiN2U3MzE4
N2JlY2FkNmMzMzc0N2IwNDdkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFNhaGls
IEthbmcgPHNhaGlsLmthbmdAYXNpbGF5Y29tcHV0aW5nLmNvbT4KK0RhdGU6IE1vbiwgMTEgTWFy
IDIwMjQgMDM6MDE6MjEgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gQVZSTy0zOTU3OiBbQ10gRml4
IHR5cG9zIGluIGRvY3MgYW5kIGV4YW1wbGVzICgjMjc5NSkKKworKiBBVlJPLTM5NTc6IFtDXSBG
aXggbWlzZm9ybWF0dGVkIHR5cGUgaW4gZG9jcworCitTaWduZWQtb2ZmLWJ5OiBTYWhpbCBLYW5n
IDxzYWhpbC5rYW5nQGFzaWxheWNvbXB1dGluZy5jb20+CitTaWduZWQtb2ZmLWJ5OiBTYWhpbCBL
YW5nIDxzYWhpbGthbmdAZ29vZ2xlLmNvbT4KKworKiBBVlJPLTM5NTc6IFtDXSBGaXggdHlwZSBp
biBxdWlja3N0b3AgZXhhbXBsZQorCitUaGlzIHJlbW92ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5n
OgorCisgIGF2cm8vbGFuZy9jL2V4YW1wbGVzL3F1aWNrc3RvcC5jOjEyMzo0MDogd2FybmluZzog
aW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZXMgcGFzc2luZyAnaW50MzJfdCAqKicgKGFrYSAnaW50
ICoqJykgdG8gcGFyYW1ldGVyIG9mIHR5cGUKKyAgICAgICAgJ2NvbnN0IGNoYXIgKionIFstV2lu
Y29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQorICAgICAgICAgICAgICAgICAgICAgICAgICBhdnJv
X3ZhbHVlX2dldF9zdHJpbmcoJmZpcnN0X3ZhbHVlLCAmcCwgJnNpemUpOworCitTaWduZWQtb2Zm
LWJ5OiBTYWhpbCBLYW5nIDxzYWhpbC5rYW5nQGFzaWxheWNvbXB1dGluZy5jb20+CitTaWduZWQt
b2ZmLWJ5OiBTYWhpbCBLYW5nIDxzYWhpbGthbmdAZ29vZ2xlLmNvbT4KKworLS0tLS0tLS0tCisK
K1NpZ25lZC1vZmYtYnk6IFNhaGlsIEthbmcgPHNhaGlsLmthbmdAYXNpbGF5Y29tcHV0aW5nLmNv
bT4KK1NpZ25lZC1vZmYtYnk6IFNhaGlsIEthbmcgPHNhaGlsa2FuZ0Bnb29nbGUuY29tPgorCitV
cHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2FwYWNoZS9hdnJvL2NvbW1pdC81MmYwNTFkYmVl
ZmFkMGI3ZTczMTg3YmVjYWQ2YzMzNzQ3YjA0N2QzCitTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZv
bnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KKy0tLQorIGxhbmcvYy9kb2NzL2lu
ZGV4LnR4dCAgICAgICB8IDIgKy0KKyBsYW5nL2MvZXhhbXBsZXMvcXVpY2tzdG9wLmMgfCAyICst
CisgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCisKK2Rp
ZmYgLS1naXQgYS9kb2NzL2luZGV4LnR4dCBiL2RvY3MvaW5kZXgudHh0CitpbmRleCBhNDM5YTA1
MjYzMS4uZGYxNmY5ZDk2NzggMTAwNjQ0CistLS0gYS9kb2NzL2luZGV4LnR4dAorKysrIGIvZG9j
cy9pbmRleC50eHQKK0BAIC0xNzgsNyArMTc4LDcgQEAgZGlmZmVyZW50IHZlcnNpb25zIG9mIHRo
ZSBBdnJvIGxpYnJhcnkuICBUaGF0IG1lYW5zIHRoYXQgaXQncyByZWFsbHkKKyBvbmx5IHNhZmUg
dG8gdXNlIHRoZXNlIGhhc2ggdmFsdWVzIGludGVybmFsbHkgd2l0aGluIHRoZSBjb250ZXh0IG9m
IGEKKyBzaW5nbGUgZXhlY3V0aW9uIG9mIGEgc2luZ2xlIGFwcGxpY2F0aW9uLgorIAorLVRoZSAr
cmVzZXQrIG1ldGhvZCDigJxjbGVhcnMgb3V04oCdIGFuICthdnJvX3ZhbHVlX3QgaW5zdGFuY2Us
IG1ha2luZyBzdXJlCisrVGhlICtyZXNldCsgbWV0aG9kIOKAnGNsZWFycyBvdXTigJ0gYW4gK2F2
cm9fdmFsdWVfdCsgaW5zdGFuY2UsIG1ha2luZyBzdXJlCisgdGhhdCBpdCdzIHJlYWR5IHRvIGFj
Y2VwdCB0aGUgY29udGVudHMgb2YgYSBuZXcgdmFsdWUuICBGb3Igc2NhbGFycywKKyB0aGlzIGlz
IHVzdWFsbHkgYSBuby1vcCwgc2luY2UgdGhlIG5ldyB2YWx1ZSB3aWxsIGp1c3Qgb3ZlcndyaXRl
IHRoZSBvbGQKKyBvbmUuICBGb3IgYXJyYXlzIGFuZCBtYXBzLCB0aGlzIHJlbW92ZXMgYW55IGV4
aXN0aW5nIGVsZW1lbnRzIGZyb20gdGhlCitkaWZmIC0tZ2l0IGEvZXhhbXBsZXMvcXVpY2tzdG9w
LmMgYi9leGFtcGxlcy9xdWlja3N0b3AuYworaW5kZXggZmY5ZTk3MDA1OTAuLmIyNmRhZDEwYzA0
IDEwMDY0NAorLS0tIGEvZXhhbXBsZXMvcXVpY2tzdG9wLmMKKysrKyBiL2V4YW1wbGVzL3F1aWNr
c3RvcC5jCitAQCAtMTA3LDcgKzEwNyw3IEBAIGludCBwcmludF9wZXJzb24oYXZyb19maWxlX3Jl
YWRlcl90IGRiLCBhdnJvX3NjaGVtYV90IHJlYWRlcl9zY2hlbWEpCisgCWlmIChydmFsID09IDAp
IHsKKyAJCWludDY0X3QgaWQ7CisgCQlpbnQzMl90IGFnZTsKKy0JCWludDMyX3QgKnA7CisrCQlj
b25zdCBjaGFyICpwOworIAkJc2l6ZV90IHNpemU7CisgCQlhdnJvX3ZhbHVlX3QgaWRfdmFsdWU7
CisgCQlhdnJvX3ZhbHVlX3QgZmlyc3RfdmFsdWU7Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
