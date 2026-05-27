Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDE6CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 21:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB778459E;
	Wed, 27 May 2026 21:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6WrWzhC23hX; Wed, 27 May 2026 21:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E544845A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779915650;
	bh=852WyXIDsVytE6gxAmVBwW/SoriR9DL0RUh4SR7lduI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kxp/nKO+BVyvRkMeFTLN2Swj6u4j/EQSwARAlAUoj0EXzngWUkNOgf2nkAD3vbYu8
	 glmxlQOPctFW74RiB/c2Gd9Qr+xQXTjqkMCn5LwTP5vnu7+esxwnsMpb9B49Vs8W92
	 LlWHQtwm7tCFg/DoyfDWJ01iv4kBQno5x9wCMKtxgJu6KLRzyJA9drfOuH79huEAhL
	 N9parq67MTaZdIks+Ag8wFpwa5t5PLvxHascc4drQTvZ41u9oIKTjXaCc0XvbRv8k8
	 /KO8zRV1sxdQVvpbpfYTP1Fn8T7OA9mOnuvffVgDWkXUYWQP4i6JTKZp812zcFvyNS
	 yjvyPif2ASWYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E544845A2;
	Wed, 27 May 2026 21:00:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 195B0288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF1B142419
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_KkXAOre7Bv for <buildroot@buildroot.org>;
 Wed, 27 May 2026 21:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DA4742414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA4742414
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DA4742414
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E687DA4C2F6B;
 Wed, 27 May 2026 23:00:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSLMP-000000005B2-0k9e;
 Wed, 27 May 2026 21:00:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Wed, 27 May 2026 23:00:16 +0200
Message-ID: <20260527210017.3567220-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527210017.3567220-1-bernd@kuhls.net>
References: <20260527210017.3567220-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779915617;
 bh=6h9HvLxNNgCdVHAdu+cAlcJQ8KkzRW9DzMlpnzY7RH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IffuqYO543jOqG5r16PrsEZw809zMWDICGc9IoKK5gK8H5NoADrxmJJt6XOwj92t7
 Ez7bki/izkGhKG9MZPQ4p3nJ3Tv7fjlfbmx+KScodMaS9CCH8FSo5/K4LCcmxiwpZf
 ztbo+/ArYji6gGEBmadISjpbKaQKXLsWjuEWhXJ/KO3CE6d/UUyUUmbZO2veEnDSz9
 guzpz53AcDYQzIfkLMX+nH2Xiwo/Rpkbli0Hezp7XjbKrqvSRIg7i7menOImqemdiH
 reu8rmu4M058Y4bFTfYcOVB7S3W+GqZR4cumYdrfK1cIvmpH+zMQ24jdlzOzhJxtUg
 ZUebMl7uZYTbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=IffuqYO5
Subject: [Buildroot] [PATCH 2/3] package/odhcp6c: needs gcc >= 10
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

Rml4ZXMgYnVpbGQgZXJyb3JzIHNlZW4gd2l0aCBHaXRsYWIgcGlwZWxpbmUgYW5kIHRoaXMgZGVm
Y29uZmlnOgpzdXBwb3J0L2NvbmZpZy1mcmFnbWVudHMvYXV0b2J1aWxkL2Jvb3RsaW4tYWFyY2g2
NC1nbGliYy1vbGQuY29uZmlnCgpodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8t
L2pvYnMvMTQ1NzAwODA0NTUKCmFhcmNoNjQtbGludXgtZ2NjLmJyX3JlYWw6IGVycm9yOiB1bnJl
Y29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbgog4oCYLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD01
4oCZOyBkaWQgeW91IG1lYW4g4oCYLVduby1mYWxsdGhyb3VnaOKAmT8KYWFyY2g2NC1saW51eC1n
Y2MuYnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uCiDigJgt
V3NoYWRvdz1sb2NhbOKAmTsgZGlkIHlvdSBtZWFuIOKAmC1Xc2hhZG93LWl2YXLigJk/CgpSZW1v
dmluZyBhbGwgdGhlIHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9ucyBmcm9tIENNYWtl
TGlzdHMudHh0CnNob3dlZCBtb3JlIGJ1aWxkIGVycm9ycyBkdXJpbmcgY29tcGlsZToKCm91dHB1
dC9idWlsZC9vZGhjcDZjLTI0NDg1YmI0YjM1YWI4NGMxN2MyZTg3YmQ1NjFkMDI2ZDRjMTVjMDAv
c3JjL29kaGNwNmMuaDo0Nzo0NjoKIGVycm9yOiBleHBlY3RlZCDigJgp4oCZIGJlZm9yZSDigJhf
X1ZBX09QVF9f4oCZCiAjZGVmaW5lIGVycm9yKGZtdCwgLi4uKSBfX2lmbG9nKExPR19FUlIsIGZt
dCBfX1ZBX09QVF9fKCwgKSBfX1ZBX0FSR1NfXykKCkFub3RoZXIgcGlwZWxpbmUgd2l0aCBnY2Mg
OSBzaG93ZWQgb3RoZXIgZXJyb3JzOgpodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9v
dC8tL2pvYnMvMTQ1NzAwODA0NzkKCi9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBr
Zy9ici1hcm0tYmFzaWMvYnVpbGQvb2RoY3A2Yy0yNDQ4NWJiNGIzNWFiODRjMTdjMmU4N2JkNTYx
ZDAyNmQ0YzE1YzAwL3NyYy9kaGNwdjYuYzoxMTI2OjQ6CiBlcnJvcjogYSBsYWJlbCBjYW4gb25s
eSBiZSBwYXJ0IG9mIGEgc3RhdGVtZW50IGFuZCBhIGRlY2xhcmF0aW9uIGlzIG5vdCBhIHN0YXRl
bWVudAogMTEyNiB8ICAgIHN0cnVjdCBkaGNwdjZfYXV0aCAqciA9ICh2b2lkKikmb2RhdGFbLURI
Q1BWNl9PUFRfSERSX1NJWkVdOwoKc28gd2UgcmFpc2UgdGhlIG1pbmltdW0gZ2NjIHZlcnNpb24g
dG8gMTAuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0K
U2VyaWVzIHBhc3NlZCBHaXRsYWIgcGlwZWxpbmU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMv
YnVpbGRyb290Ly0vcGlwZWxpbmVzLzI1NTcyMjM1NTEKCiBwYWNrYWdlL29kaGNwNmMvQ29uZmln
LmluIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29kaGNwNmMvQ29uZmlnLmluIGIvcGFja2FnZS9v
ZGhjcDZjL0NvbmZpZy5pbgppbmRleCA4M2IzODc1NWMzLi4wYWNhZmY3ZmVkIDEwMDY0NAotLS0g
YS9wYWNrYWdlL29kaGNwNmMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uvb2RoY3A2Yy9Db25maWcu
aW4KQEAgLTIsNiArMiw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PREhDUDZDCiAJYm9vbCAib2Ro
Y3A2YyIKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCiAJZGVwZW5kcyBvbiAhQlIy
X1NUQVRJQ19MSUJTICMgbGlidWJveAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRf
TEVBU1RfMTAKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCAjIGxpYnVib3gg
LT4ganNvbi1jCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlVCT1gKIAloZWxwCkBAIC0xMCw3ICsx
MSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PREhDUDZDCiAKIAkgIGh0dHBzOi8vZ2l0Lm9wZW53
cnQub3JnL3Byb2plY3Qvb2RoY3A2Yy5naXQKIAotY29tbWVudCAib2RoY3A2YyBuZWVkcyBhIHRv
b2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCitjb21tZW50ICJvZGhjcDZjIG5lZWRzIGEgdG9v
bGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDEwIgogCWRlcGVuZHMgb24gQlIyX1VT
RV9NTVUKLQlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUworCWRlcGVuZHMgb24gQlIyX1NUQVRJ
Q19MSUJTIHx8ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMAogCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfU1lOQ180Ci0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
