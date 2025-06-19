Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32274C7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 21:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA2F140B01;
	Thu, 19 Jun 2025 21:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLWm5kSMH_0R; Thu, 19 Jun 2025 21:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F333440AFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F333440AFE;
	Thu, 19 Jun 2025 21:28:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47008181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 21:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38FC2400DC
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 21:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wUG21eWtcje for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 21:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BFA940AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFA940AD8
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BFA940AD8
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 21:28:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so9547055e9.1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750368530; x=1750973330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmMuDi117Ge9svZHW/3dwhoWn1mPiBnvU6W5Z80GlxE=;
 b=HYXnrL2PTPpYr/Jc9/XBV9tRJ0wiBnFdN7GCAXe8Ktt8BLOjeqMAUygfhyZ0gMdfbm
 ca2ig3KA+WIAUtoVCB7qWIz9IcM1Jd82oD/csGDNR08WekUj6dCHTW03mrErGYX1hyyX
 wf45vhdjfetb6IcNAgGf1OE9/1ArxhZqFmRPvd6RpiFmnKpjkUzsGTBHXdvlSeNP3fwZ
 Pt2N5dAXlfBZGlTbtYfjWdp6ae32t1z0MSC6YLcM0Vq7t11/0hm1EikVj0+XdOwL9oV5
 mMXt6aD+4cRVnOEKQcK+jWXHae00RHSWI4bi5yzETwHHeQihBbBDmvJB6PV6OEHYADCV
 rNUg==
X-Gm-Message-State: AOJu0YxCyWrTW3hobMXw4A+88xANZqTxS5Mm1nlx5NBhiGsvbJrPBKVY
 Z6L4ogL2/PBwtZz8XaFuTdLijoOqaa47izwJi9SwgZgeXfeGuR005Wign3am4A==
X-Gm-Gg: ASbGncsVQni2F3TW5RstWSCwcgcx040o8SierBGg9CQuNJXuReGDdwkPxPH7kivf+LO
 Cr+Bq5Kmm7WEqRA44nbfTbUBKSo7sH5p4KQewcD1A4NWEDoLr4zQbS4uLv834AjwoYvWQAB806v
 Ly+B+6AEsMp9kobVv1J8YUtenvdzV5+Ugy/DAxMib2DZS7iHo+Gv9rQXOwYDcapkiS7PXBIgdza
 7zxylM19SU6AlF73YmvROUEpqK64ADkgdAtj83eejU/6gwRKa+rV5h9W1B7eCP/AOeVp5kpZi7M
 vZ6EB8koBhu+JrLvHan9fkHf4JQBZLRhZVR9T27w36z3cqCaN8q6BlbwDH8Icn3LxnMkyJRwZJd
 RzwQMHGK6WRYFOF5raRHf/GxwrAyS7u847uJYXAk30rvlPpWvc5bATKZuoGYZfFq+CaqNhZQ=
X-Google-Smtp-Source: AGHT+IGD4+eVw2G7WjI5PjNaWMaMc5ki3en/FF3mpIm+mh9u+Jmf2n/P6KA8M7dVHOHq0mD2A/L4Ow==
X-Received: by 2002:a05:6000:2810:b0:3a4:d0ed:257b with SMTP id
 ffacd0b85a97d-3a6d12dd6c5mr258069f8f.22.1750368529644; 
 Thu, 19 Jun 2025 14:28:49 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online
 (67.85-87-136.dynamic.clientes.euskaltel.es. [85.87.136.67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d1188139sm338179f8f.73.2025.06.19.14.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 14:28:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Thu, 19 Jun 2025 23:28:24 +0200
Message-ID: <20250619212824.896332-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750368530; x=1750973330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NmMuDi117Ge9svZHW/3dwhoWn1mPiBnvU6W5Z80GlxE=;
 b=gmul9+3rwLUQ0MRcD6a+i2v911C9k7kX210hhrbToameJT/8Vwv9bfFjHNlbrqr1XJ
 8+ka3xQVn6FNnSa3HEIx2eAuAT1cv0DmcmHxvvB21UW9f0zLB4EA64Bz3xZDIg7VEYPb
 zLsYbI3ir9pfw8uhIp2PMBD8ASJXc3NNhk5lw2/4pP9j08VbMqiIuRVLO+ZqhzLx1Qd9
 89Npa77bko2NMdJb/XDTMEorMn7mlzjOwJ4nDGOHADW87CntkZcgx8xww6MxX/QpSm5T
 uwrliJMRFj+Y4rHztMLWtPtzPr0440jCxXElLuePYhH2HrsXlJCiru14xHZ/dowOJwnQ
 rDrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gmul9+3r
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.3
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

UmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgotIDAwMDEtZml4LVNfSUZNVC11bmRlY2xhcmVkLWF0
LXN0YXR4X2MucGF0Y2gKCkZvciByZWxlYXNlIG5vdGUsIHNlZToKaHR0cHM6Ly9naXRodWIuY29t
L29wZW56ZnMvemZzL3JlbGVhc2VzL3RhZy96ZnMtMi4zLjMKClNpZ25lZC1vZmYtYnk6IEpvc8Op
IEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgotLS0KIC4u
LjAwMS1maXgtU19JRk1ULXVuZGVjbGFyZWQtYXQtc3RhdHhfYy5wYXRjaCB8IDM2IC0tLS0tLS0t
LS0tLS0tLS0tLS0KIHBhY2thZ2UvemZzL3pmcy5oYXNoICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA0ICstLQogcGFja2FnZS96ZnMvemZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3pmcy8wMDAxLWZpeC1TX0lGTVQtdW5kZWNs
YXJlZC1hdC1zdGF0eF9jLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvMDAwMS1maXgt
U19JRk1ULXVuZGVjbGFyZWQtYXQtc3RhdHhfYy5wYXRjaCBiL3BhY2thZ2UvemZzLzAwMDEtZml4
LVNfSUZNVC11bmRlY2xhcmVkLWF0LXN0YXR4X2MucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDIzMzExOGY3ZjYuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS96ZnMvMDAwMS1m
aXgtU19JRk1ULXVuZGVjbGFyZWQtYXQtc3RhdHhfYy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDM2ICswLDAgQEAKLUZyb20gOGU5ZmNkYWM2ZjdiYmM0ZWM5MmU4OWI4Y2RjZTFkY2M0MDRmMTk5
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206ID0/VVRGLTg/cT9Kb3M9QzM9QTk9MjBM
dWlzPTIwU2FsdmFkb3I9MjBSdWZvPz0KLSA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgot
RGF0ZTogRnJpLCAyIE1heSAyMDI1IDA4OjEwOjA4ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRl
c3RzOiBmaXggYFNfSUZNVGAgdW5kZWNsYXJlZCBhdCBgc3RhdHguY2AKLU1JTUUtVmVyc2lvbjog
MS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotYFNfSUZNVGAgaXMgZGVjbGFyZWQgaW4gYHN5cy9zdGF0
LmhgLCBidXQgd2UgY2Fubm90IGluY2x1ZGUgdGhpcyBoZWFkZXIKLWJlY2F1c2UgaXQgcmVkZWNs
YXJlcyB0aGUgYHN0YXR4YCBmdW5jdGlvbiB3aXRoIGRpZmZlcmVudCBhcmd1bWVudAotdHlwZXMu
IFRoZXJlZm9yZSwgd2UgZGVmaW5lIGBTX0lGTVRgIG91cnNlbHZlcywgaW4gdGhlIHNhbWUgd2F5
IGFzIHRoZQotb3RoZXIgZGVmaW5pdGlvbnMuCi0KLUNsb3NlczogIzE3MjkzCi0KLVVwc3RyZWFt
OiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvY29tbWl0LzYzNGMxNzJlZTg5ZjUzMDM0
OTNhNzVkYzdmZjU1ZTBhMzU1YjUwM2EKLVNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgotLS0tCi0gdGVzdHMvemZzLXRl
c3RzL2NtZC9zdGF0eC5jIHwgMyArKysKLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Ci0KLWRpZmYgLS1naXQgYS90ZXN0cy96ZnMtdGVzdHMvY21kL3N0YXR4LmMgYi90ZXN0cy96ZnMt
dGVzdHMvY21kL3N0YXR4LmMKLWluZGV4IDg5OTM5ZjZlZmI0MC4uMWFjYzdlNThjNWNlIDEwMDY0
NAotLS0tIGEvdGVzdHMvemZzLXRlc3RzL2NtZC9zdGF0eC5jCi0rKysgYi90ZXN0cy96ZnMtdGVz
dHMvY21kL3N0YXR4LmMKLUBAIC0xMDksNiArMTA5LDkgQEAgX3N0YXR4KGludCBmZCwgY29uc3Qg
Y2hhciAqcGF0aCwgaW50IGZsYWdzLCB1bnNpZ25lZCBpbnQgbWFzaywgdm9pZCAqc3R4KQotICNp
Zm5kZWYgU1RBVFhfRElPQUxJR04KLSAjZGVmaW5lCVNUQVRYX0RJT0FMSUdOCSgxPDwxMykKLSAj
ZW5kaWYKLSsjaWZuZGVmIFNfSUZNVAotKyNkZWZpbmUJU19JRk1UIDAxNzAwMDAKLSsjZW5kaWYK
LSAKLSB0eXBlZGVmIHN0cnVjdCB7Ci0gCWludDY0X3QJCXR2X3NlYzsKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKaW5kZXggNGM2MDdkODRh
NC4uODdlZTUxM2FlZCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLmhhc2gKKysrIGIvcGFj
a2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0yLjMuMi96ZnMtMi4zLjIuc2hh
MjU2LmFzYwotc2hhMjU2ICA4MGRhNjI4YTk1NDNlYzMzNTViZjQxMDYxNzQ1MGUxNjc3MDY5NDhj
ZWIyODc1NDE0NTVhMWI4ZDg3Yjg3NThhICB6ZnMtMi4zLjIudGFyLmd6CisjIEZyb20gaHR0cHM6
Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0yLjMuMy96ZnMt
Mi4zLjMuc2hhMjU2LmFzYworc2hhMjU2ICA4NDQxMjIxMThmMGVhODEyMDVhMDE3NTNiYmNiMTMx
NTMzMGY4OTY3YzFmODY2ZGNkMTAxNTUyNzMxMzFmMDcxICB6ZnMtMi4zLjMudGFyLmd6CiAKICMg
SGFzaCBmb3IgbGljZW5zZSBmaWxlczoKIHNoYTI1NiAgMWZmYjcwYzMzYzRmNzlmMDRlOTQ3ZmFj
YzVjNzg1MWYyODk2MDkyNTZhYWNiNDdmYzExNWY3MDA0MjdkOTUyMCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS96ZnMvemZzLm1rIGIvcGFja2FnZS96ZnMvemZzLm1rCmluZGV4IGJkZDdi
MmEzYjAuLmFkNGYzZjIzMmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL3pmcy5taworKysgYi9w
YWNrYWdlL3pmcy96ZnMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1aRlNfVkVSU0lPTiA9IDIuMy4yCitaRlNfVkVSU0lPTiA9IDIuMy4zCiBaRlNfU0lU
RSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMt
JChaRlNfVkVSU0lPTikKIFpGU19TRUxJTlVYX01PRFVMRVMgPSB6ZnMKIFpGU19MSUNFTlNFID0g
Q0RETAotLSAKMi41MC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
