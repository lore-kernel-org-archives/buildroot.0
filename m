Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403DDCD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CA084241A;
	Wed, 27 May 2026 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2NrhW3SKfdk; Wed, 27 May 2026 21:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 161054241D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779915637;
	bh=TCYKJWqGD2ukAiLgbFoyI2eg5+fN29mf3ZKOKJ+s2rI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEOCYcy8AGm8yqc7uCYFK6zYQ51Ln+skXQP2lvngg4+cR5+pTf4ut1pDdHo9g70tl
	 KVxVBKVAEUuCM7LwFw5nrEA3C1vipEaecJdkAAUKAyMAVX6V9BaKkQ64DFbz2mdcNK
	 ZUcSDiULgwY4QG4+xnEeIwS8A0145L0HEx2GCruaKkRakiSObgUWefJFreDX2D8INj
	 kYq4sgNNEBODNP3vj+dLJYJ3AHlp1Y1jhBL7K9gZvc1v/q3EF8e1/+SVVRWrWNTWis
	 FlZ7Vp4nS3gvFvOyoz1XGt2rdt3/fsDEer4P/srrRQVYwYcGWYLZLhby6YabSNqUdT
	 7b1+zHH1HUwYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 161054241D;
	Wed, 27 May 2026 21:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70AE4288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FA27845A2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfM67-afrj6p for <buildroot@buildroot.org>;
 Wed, 27 May 2026 21:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FD5C8459E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD5C8459E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FD5C8459E
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13FE6A4C2E70;
 Wed, 27 May 2026 23:00:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSLMP-000000005B2-16Bh;
 Wed, 27 May 2026 21:00:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Wed, 27 May 2026 23:00:17 +0200
Message-ID: <20260527210017.3567220-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527210017.3567220-1-bernd@kuhls.net>
References: <20260527210017.3567220-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779915618;
 bh=GrZhIc2DpBWwowwsazZk4h+UmPz0Wz4RSvGJU5Nqhf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=u2oB71eT6xEnM2CXwj5WB9yTFO27yU0wQ/PYs9kjSrtYI6Wytv98sg5fCez3CF+kv
 e6SXiGh66TwBbuP6nq+rJQUZYYQ+EFxP1dY5v4Wd/PmkE3A7loz+PIWErWObhvWcTu
 9I5MgMe6jJDUmXReBPtjyI1cJS/zTloe9tSDP39fGiazcSxk8FqnmBPcjrdAXdKesJ
 v/Tdj8t+Qw4oCqfqWdrHf62Vg3HbCekFp1N7JUTf63DQVKGNyIvUicuhnAAczm3tMf
 P4f98zScca5h7EhBVzqCEBy8yx+F5WB4EeMELVLDZb9baKXJIvGnNY6SnyCaKvgMHI
 lqUVRHXNiEz4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=u2oB71eT
Subject: [Buildroot] [PATCH 3/3] package/odhcp6c: fix build with gcc >= 14.x
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

RGV0ZWN0ZWQgYnkgR2l0bGFiIHBpcGVsaW5lIHdoZW4gdGVzdGluZyB0aGUgb3RoZXIgYnVpbGQg
Zml4ZXMgaW4gdGhpcwpzZXJpZXMuIEF1dG9idWlsZGVycyBkaWQgbm90IGRldGVjdCB0aGUgcHJv
YmxlbSBkdWUgdG8gdGhlIGJ1aWxkIGVycm9yCndpdGggZ2xpYmMgMi40My4KCmh0dHBzOi8vZ2l0
bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vam9icy8xNDU3MTczNzUxMgoKL2J1aWxkcy9ia3Vo
bHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tcG93ZXJwYy1lNTAwbWMtdWNsaWJjL2J1
aWxkL29kaGNwNmMtZjE5ZGQzN2ZiNDY3YzljZjEwY2FkNTdhZWZhMGQwNDgzMTJkN2RmZC9zcmMv
ZGhjcHY2LmM6MTM5NTo1ODoKIGVycm9yOiBjb21wYXJpc29uIG9mIGludGVnZXIgZXhwcmVzc2lv
bnMgb2YgZGlmZmVyZW50IHNpZ25lZG5lc3M6CiDigJh1aW50MzJfdOKAmSB7YWthIOKAmHVuc2ln
bmVkIGludOKAmX0gYW5kIOKAmGludOKAmSBbLVdlcnJvcj1zaWduLWNvbXBhcmVdCiAxMzk1IHwg
aWYgKGlhX2hkci0+aWFpZCAhPSBodG9ubChpZmluZGV4KSAmJiBvdHlwZSA9PSBESENQVjZfT1BU
X0lBX05BKQoKaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9qb2JzLzE0NTcx
NzM3NTEwCgovYnVpbGRzL2JrdWhscy9idWlsZHJvb3QvYnItdGVzdC1wa2cvYm9vdGxpbi1vcGVu
cmlzYy11Y2xpYmMvYnVpbGQvb2RoY3A2Yy1mMTlkZDM3ZmI0NjdjOWNmMTBjYWQ1N2FlZmEwZDA0
ODMxMmQ3ZGZkL3NyYy9kaGNwdjYuYzoxMzk1OjU4OgogZXJyb3I6IGNvbXBhcmlzb24gb2YgaW50
ZWdlciBleHByZXNzaW9ucyBvZiBkaWZmZXJlbnQgc2lnbmVkbmVzczoKIOKAmHVpbnQzMl904oCZ
IHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBhbmQg4oCYaW504oCZIFstV2Vycm9yPXNpZ24tY29t
cGFyZV0KCmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vam9icy8xNDU3MTcz
NzUwNQoKL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tbTY4ay02
ODA0MC11Y2xpYmMvYnVpbGQvb2RoY3A2Yy1mMTlkZDM3ZmI0NjdjOWNmMTBjYWQ1N2FlZmEwZDA0
ODMxMmQ3ZGZkL3NyYy9kaGNwdjYuYzoxMzk1OjU4OgogZXJyb3I6IGNvbXBhcmlzb24gb2YgaW50
ZWdlciBleHByZXNzaW9ucyBvZiBkaWZmZXJlbnQgc2lnbmVkbmVzczoKIOKAmHVpbnQzMl904oCZ
IHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBhbmQg4oCYaW504oCZIFstV2Vycm9yPXNpZ24tY29t
cGFyZV0KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpT
ZXJpZXMgcGFzc2VkIEdpdGxhYiBwaXBlbGluZToKaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9i
dWlsZHJvb3QvLS9waXBlbGluZXMvMjU1NzIyMzU1MQoKIC4uLjAwMi1kaGNwdjYtdXNlLXN0YWJs
ZS1JQUlELWZvci1JQV9OQS5wYXRjaCB8IDk1ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vZGhj
cDZjLzAwMDItZGhjcHY2LXVzZS1zdGFibGUtSUFJRC1mb3ItSUFfTkEucGF0Y2gKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL29kaGNwNmMvMDAwMi1kaGNwdjYtdXNlLXN0YWJsZS1JQUlELWZvci1JQV9O
QS5wYXRjaCBiL3BhY2thZ2Uvb2RoY3A2Yy8wMDAyLWRoY3B2Ni11c2Utc3RhYmxlLUlBSUQtZm9y
LUlBX05BLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZjNzAy
MDVjY2MKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29kaGNwNmMvMDAwMi1kaGNwdjYtdXNl
LXN0YWJsZS1JQUlELWZvci1JQV9OQS5wYXRjaApAQCAtMCwwICsxLDk1IEBACitGcm9tIDlhNGQ2
ZmU4MDJkMjFlNGZjMWI4NGY3ZDU1YjVjM2MyM2U3MWQ2YmEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBQYXVsIERvbmFsZCA8bmV3dHdlbitnaXRodWJAZ21haWwuY29tPgorRGF0ZTog
VGh1LCAxOCBEZWMgMjAyNSAxNToxMDoyNCArMDEwMAorU3ViamVjdDogW1BBVENIXSBkaGNwdjY6
IHVzZSBzdGFibGUgSUFJRCBmb3IgSUFfTkEKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworaHR0cHM6Ly93d3cucmZjLWVkaXRvci5vcmcvcmZjL3JmYzg0MTUuaHRtbCNzZWN0
aW9uLTEyCisKKyAgIC4uLi4uLi4uICBUaGUgSUFJRCBpcyBjaG9zZW4gYnkgdGhlIGNsaWVudC4g
IEZvciBhbnkgZ2l2ZW4gdXNlIG9mIGFuCisgICBJQSBieSB0aGUgY2xpZW50LCB0aGUgSUFJRCBm
b3IgdGhhdCBJQSBNVVNUIGJlIGNvbnNpc3RlbnQgYWNyb3NzCisgICByZXN0YXJ0cyBvZiB0aGUg
REhDUCBjbGllbnQuICBUaGUgY2xpZW50IG1heSBtYWludGFpbiBjb25zaXN0ZW5jeSBieQorICAg
ZWl0aGVyIHN0b3JpbmcgdGhlIElBSUQgaW4gbm9uLXZvbGF0aWxlIHN0b3JhZ2Ugb3IgdXNpbmcg
YW4gYWxnb3JpdGhtCisgICB0aGF0IHdpbGwgY29uc2lzdGVudGx5IHByb2R1Y2UgdGhlIHNhbWUg
SUFJRCBhcyBsb25nIGFzIHRoZQorICAgY29uZmlndXJhdGlvbiBvZiB0aGUgY2xpZW50IGhhcyBu
b3QgY2hhbmdlZC4KKworU2lnbmVkLW9mZi1ieTogUGF1bCBEb25hbGQgPG5ld3R3ZW4rZ2l0aHVi
QGdtYWlsLmNvbT4KK0xpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29kaGNwNmMvcHVs
bC8xNDAKK1NpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBn
bWFpbC5jb20+CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbndydC9vZGhjcDZj
L2NvbW1pdC85YTRkNmZlODAyZDIxZTRmYzFiODRmN2Q1NWI1YzNjMjNlNzFkNmJhCisKK1NpZ25l
ZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBzcmMvZGhjcHY2
LmMgIHwgMTUgKysrKysrKysrKysrKy0tCisgc3JjL29kaGNwNmMuaCB8ICAxICsKKyAyIGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQg
YS9zcmMvZGhjcHY2LmMgYi9zcmMvZGhjcHY2LmMKK2luZGV4IGQ4YmI4YmUuLjk3ODYwYjEgMTAw
NjQ0CistLS0gYS9zcmMvZGhjcHY2LmMKKysrKyBiL3NyYy9kaGNwdjYuYworQEAgLTI2Miw2ICsy
NjIsOSBAQCBzdGF0aWMgc3RydWN0IGRoY3B2Nl9zdGF0cyBkaGNwdjZfc3RhdHMgPSB7MH07Cisg
Ly8gY29uZmlnCisgc3RhdGljIHN0cnVjdCBjb25maWdfZGhjcCogY29uZmlnX2RoY3AgPSBOVUxM
OworIAorKy8vIHN0b3JlIHVuaXF1ZSBpZm5hbWUgaGFzaCB0byB1c2UgYXMgSUEtPklBSUQKKytz
dGF0aWMgdWludDMyX3QgaWZuYW1lX2hhc2hfaWFpZCA9IDA7CisrCisgc3RhdGljIHVpbnQzMl90
IG50b2hsX3VuYWxpZ25lZChjb25zdCB1aW50OF90ICpkYXRhKQorIHsKKyAJdWludDMyX3QgYnVm
OworQEAgLTU0Miw2ICs1NDUsMTIgQEAgdm9pZCBkaGNwdjZfcmVzZXRfc3RhdHModm9pZCkKKyAJ
bWVtc2V0KCZkaGNwdjZfc3RhdHMsIDAsIHNpemVvZihkaGNwdjZfc3RhdHMpKTsKKyB9CisgCisr
dWludDMyX3QgaGFzaF9pZm5hbWUoY29uc3QgY2hhciAqcykgeworKwl1aW50MzJfdCBoID0gMDsK
KysJd2hpbGUgKCpzKSBoID0gaCAqIDMxICsgKnMrKzsKKysJcmV0dXJuIGg7CisrfQorKworIGlu
dCBpbml0X2RoY3B2Nihjb25zdCBjaGFyICppZm5hbWUpCisgeworIAljb25maWdfZGhjcCA9IGNv
bmZpZ19kaGNwX2dldCgpOworQEAgLTU2Niw2ICs1NzUsOCBAQCBpbnQgaW5pdF9kaGNwdjYoY29u
c3QgY2hhciAqaWZuYW1lKQorIAlpZiAoaW9jdGwoc29jaywgU0lPQ0dJRklOREVYLCAmaWZyKSA8
IDApCisgCQlnb3RvIGZhaWx1cmU7CisgCisrCWlmbmFtZV9oYXNoX2lhaWQgPSBoYXNoX2lmbmFt
ZShpZm5hbWUpOworKworIAlpZmluZGV4ID0gaWZyLmlmcl9pZmluZGV4OworIAorIAkvLyBTZXQg
dGhlIHNvY2tldCB0byBub24tYmxvY2tpbmcgbW9kZQorQEAgLTgzOCw3ICs4NDksNyBAQCBzdGF0
aWMgdm9pZCBkaGNwdjZfc2VuZChlbnVtIGRoY3B2Nl9tc2cgcmVxX21zZ190eXBlLCB1aW50OF90
IHRyaWRbM10sIHVpbnQzMl90CisgCXN0cnVjdCBkaGNwdjZfaWFfaGRyIGhkcl9pYV9uYSA9IHsK
KyAJCS50eXBlID0gaHRvbnMoREhDUFY2X09QVF9JQV9OQSksCisgCQkubGVuID0gaHRvbnMoc2l6
ZW9mKGhkcl9pYV9uYSkgLSBESENQVjZfT1BUX0hEUl9TSVpFKSwKKy0JCS5pYWlkID0gaHRvbmwo
aWZpbmRleCksCisrCQkuaWFpZCA9IGh0b25sKGlmbmFtZV9oYXNoX2lhaWQpLAorIAkJLnQxID0g
MCwKKyAJCS50MiA9IDAsCisgCX07CitAQCAtMTM5Miw3ICsxNDAzLDcgQEAgc3RhdGljIGludCBk
aGNwdjZfaGFuZGxlX3JlcGx5KGVudW0gZGhjcHY2X21zZyBvcmlnLCBfb191bnVzZWQgY29uc3Qg
aW50IHJjLAorIAkJCQkJCWNvbnRpbnVlOworIAorIAkJCQkJLy8gVGVzdCBJRAorLQkJCQkJaWYg
KGlhX2hkci0+aWFpZCAhPSBodG9ubChpZmluZGV4KSAmJiBvdHlwZSA9PSBESENQVjZfT1BUX0lB
X05BKQorKwkJCQkJaWYgKGlhX2hkci0+aWFpZCAhPSBodG9ubChpZm5hbWVfaGFzaF9pYWlkKSAm
JiBvdHlwZSA9PSBESENQVjZfT1BUX0lBX05BKQorIAkJCQkJCWNvbnRpbnVlOworIAorIAkJCQkJ
dWludDE2X3QgY29kZSA9IERIQ1BWNl9TdWNjZXNzOworZGlmZiAtLWdpdCBhL3NyYy9vZGhjcDZj
LmggYi9zcmMvb2RoY3A2Yy5oCitpbmRleCBhYTczYmJjLi5jNTdmODg1IDEwMDY0NAorLS0tIGEv
c3JjL29kaGNwNmMuaAorKysrIGIvc3JjL29kaGNwNmMuaAorQEAgLTU0MCw2ICs1NDAsNyBAQCBz
dHJ1Y3Qgb2RoY3A2Y19vcHQgeworIAljb25zdCBjaGFyICpzdHI7CisgfTsKKyAKKyt1aW50MzJf
dCBoYXNoX2lmbmFtZShjb25zdCBjaGFyICpzKTsKKyBpbnQgaW5pdF9kaGNwdjYoY29uc3QgY2hh
ciAqaWZuYW1lKTsKKyBpbnQgZGhjcHY2X2dldF9pYV9tb2RlKHZvaWQpOworIGludCBkaGNwdjZf
cHJvbW90ZV9zZXJ2ZXJfY2FuZCh2b2lkKTsKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
