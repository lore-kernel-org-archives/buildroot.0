Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18893C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 16:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93E2241AEF;
	Tue, 12 Dec 2023 16:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E2241AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vTaANqjqPje; Tue, 12 Dec 2023 16:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F6141B1B;
	Tue, 12 Dec 2023 16:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F6141B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5D801BF46A
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 16:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E9518176D
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 16:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9518176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4HLQX_rQ9Xo for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 16:02:00 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3539881762
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 16:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3539881762
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4SqNfC5dqcz9srG;
 Tue, 12 Dec 2023 17:01:55 +0100 (CET)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 17:01:11 +0100
Message-Id: <20231212160112.94272-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4SqNfC5dqcz9srG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1702396915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KAQF3DBaeSl4r4BsSqrKy+BIULIGlLZFU836owDcivw=;
 b=tUdZ8l5i5R3NZag1IbkP6GjYhglZyju/whmowYEcWc0hN/F1U8yPCYUoDzEsIZdgIz0IBj
 akU+FbUbwxFThHBgbkYd3Oj/3Jd0ItlyIwTQ5pSWw4HoVwHR1rpLCnB3AwA9X1eYaBYuEP
 b6AHu4QdkiXyEOvSHBp3sZkhBuRV5x2ooqm7OsSQNy1slOmI7Ru2xlAUaRvPEDIZcEnZug
 SmU2HR3mNJDAdPeOU24NYNL3lQgn52OShV/Ole4C9Pur9bvK4sxhABumjNE9bC1VtrduFy
 JaXg/BG4x9w+3sFGQkqtCW1pLGCAjnLOmgu1fyrY+0gAl7py5uw8HnMsF0NGag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=tUdZ8l5i
Subject: [Buildroot] [PATCH 1/2] python-sip: fix compile error
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
Cc: Ralf Dragon <hypnotoad@lindra.de>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aG91dCB0aGUgcGF0Y2gsIHB5dGhvbi1zaXAgZmFpbHMgdG8gY29tcGlsZSB3aXRoOgoKc2lw
bGliLmM6IEluIGZ1bmN0aW9uIOKAmHNpcF9hcGlfZ2V0X2ZyYW1l4oCZOgpzaXBsaWIuYzoxMzc1
MDoyMjogZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlIOKAmHN0cnVjdCBfZnJh
bWXigJkKMTM3NTAgfCAgICAgICAgIGZyYW1lID0gZnJhbWUtPmZfYmFjazsKClRoaXMgbGlrZWx5
IGZpeGVzIGJ1ZyAxNTIwMSBbMV0uCgoKClsxXSBodHRwczovL2J1Z3MuYnVpbGRyb290Lm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTUyMDEKCgpTaWduZWQtb2ZmLWJ5OiBSYWxmIERyYWdvbiA8aHlwbm90
b2FkQGxpbmRyYS5kZT4KLS0tCkJhY2twb3J0IHRvOiAyMDIzLjAyLngKCiBwYWNrYWdlL3B5dGhv
bi1zaXAvMDAwMi1maXhmcmFtZS5wYXRjaCB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvcHl0aG9uLXNpcC8wMDAyLWZpeGZyYW1lLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tc2lwLzAwMDItZml4ZnJhbWUucGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1zaXAvMDAw
Mi1maXhmcmFtZS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5i
ZWZlNzZmYzczCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tc2lwLzAwMDItZml4
ZnJhbWUucGF0Y2gKQEAgLTAsMCArMSw1NSBAQAorc2lwbGliOiBmaXggYnVpbGQgd2l0aCBweXRo
b24gPj0gMy4xMQorCitXaXRoIHB5dGhvbiAzLjExLCB0aGUgUHlGcmFtZU9iamVjdCBzdHJ1Y3R1
cmUgbWVtYmVycyBoYXZlIGJlZW4KK3JlbW92ZWQgZnJvbSB0aGUgcHVibGljIEMgQVBJOgorCito
dHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMuMTEuaHRtbCN3aGF0c25ldzMx
MS1jLWFwaS1wb3J0aW5nCitodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMu
MTEuaHRtbCNweWZyYW1lb2JqZWN0LTMtMTEtaGlkaW5nCisKK1RoaXMgcGF0Y2ggbWlncmF0ZXMg
dG8gdGhlIG9wYXF1ZSBQeUZyYW1lT2JqZWN0LgorCitTaWduZWQtb2ZmLWJ5OiBSYWxmIERyYWdv
biA8aHlwbm90b2FkQGxpbmRyYS5kZT4KK1Vwc3RyZWFtOiBOL0EgYXMgU0lQIHY0IGlzIG5vIGxv
bmdlciBzdXBwb3J0ZWQuIDQuMTkuMjUgaXMgdGhlIGxhc3QgcmVsZWFzZS4KKworLS0tIGhvc3Qt
cHl0aG9uLXNpcC00LjE5LjI1Lm9yaWcvc2lwbGliL3NpcC5oCisrKysgaG9zdC1weXRob24tc2lw
LTQuMTkuMjUvc2lwbGliL3NpcC5oCitAQCAtMTc5OSw3ICsxNzk5LDcgQEAKKyAgICAgaW50ICgq
YXBpX2dldF90aW1lKShQeU9iamVjdCAqLCBzaXBUaW1lRGVmICopOworICAgICBQeU9iamVjdCAq
KCphcGlfZnJvbV90aW1lKShjb25zdCBzaXBUaW1lRGVmICopOworICAgICBpbnQgKCphcGlfaXNf
dXNlcl90eXBlKShjb25zdCBzaXBXcmFwcGVyVHlwZSAqKTsKKy0gICAgc3RydWN0IF9mcmFtZSAq
KCphcGlfZ2V0X2ZyYW1lKShpbnQpOworKyAgICBQeUZyYW1lT2JqZWN0ICooKmFwaV9nZXRfZnJh
bWUpKGludCk7CisgICAgIGludCAoKmFwaV9jaGVja19wbHVnaW5fZm9yX3R5cGUpKGNvbnN0IHNp
cFR5cGVEZWYgKiwgY29uc3QgY2hhciAqKTsKKyAgICAgUHlPYmplY3QgKigqYXBpX3VuaWNvZGVf
bmV3KShTSVBfU1NJWkVfVCwgdW5zaWduZWQsIGludCAqLCB2b2lkICoqKTsKKyAgICAgdm9pZCAo
KmFwaV91bmljb2RlX3dyaXRlKShpbnQsIHZvaWQgKiwgaW50LCB1bnNpZ25lZCk7CisKKworLS0t
IGhvc3QtcHl0aG9uLXNpcC00LjE5LjI1Lm9yaWcvc2lwbGliL3NpcGxpYi5jCisrKysgaG9zdC1w
eXRob24tc2lwLTQuMTkuMjUvc2lwbGliL3NpcGxpYi5jCitAQCAtNDQ4LDcgKzQ0OCw3IEBACisg
c3RhdGljIGludCBzaXBfYXBpX2dldF90aW1lKFB5T2JqZWN0ICpvYmosIHNpcFRpbWVEZWYgKnRp
bWUpOworIHN0YXRpYyBQeU9iamVjdCAqc2lwX2FwaV9mcm9tX3RpbWUoY29uc3Qgc2lwVGltZURl
ZiAqdGltZSk7Cisgc3RhdGljIGludCBzaXBfYXBpX2lzX3VzZXJfdHlwZShjb25zdCBzaXBXcmFw
cGVyVHlwZSAqd3QpOworLXN0YXRpYyBzdHJ1Y3QgX2ZyYW1lICpzaXBfYXBpX2dldF9mcmFtZShp
bnQpOworK3N0YXRpYyBQeUZyYW1lT2JqZWN0ICpzaXBfYXBpX2dldF9mcmFtZShpbnQpOworIHN0
YXRpYyBpbnQgc2lwX2FwaV9jaGVja19wbHVnaW5fZm9yX3R5cGUoY29uc3Qgc2lwVHlwZURlZiAq
dGQsCisgICAgICAgICBjb25zdCBjaGFyICpuYW1lKTsKKyBzdGF0aWMgUHlPYmplY3QgKnNpcF9h
cGlfdW5pY29kZV9uZXcoU0lQX1NTSVpFX1QgbGVuLCB1bnNpZ25lZCBtYXhjaGFyLAorQEAgLTEz
NzQxLDEzICsxMzc0MSwxMyBAQAorIC8qCisgICogUmV0dXJuIGEgZnJhbWUgZnJvbSB0aGUgZXhl
Y3V0aW9uIHN0YWNrLgorICAqLworLXN0YXRpYyBzdHJ1Y3QgX2ZyYW1lICpzaXBfYXBpX2dldF9m
cmFtZShpbnQgZGVwdGgpCisrc3RhdGljIFB5RnJhbWVPYmplY3QgKnNpcF9hcGlfZ2V0X2ZyYW1l
KGludCBkZXB0aCkKKyB7CistICAgIHN0cnVjdCBfZnJhbWUgKmZyYW1lID0gUHlFdmFsX0dldEZy
YW1lKCk7CisrICAgIFB5RnJhbWVPYmplY3QgKmZyYW1lID0gUHlFdmFsX0dldEZyYW1lKCk7Cisg
CisgICAgIHdoaWxlIChmcmFtZSAhPSBOVUxMICYmIGRlcHRoID4gMCkKKyAgICAgeworLSAgICAg
ICAgZnJhbWUgPSBmcmFtZS0+Zl9iYWNrOworKyAgICAgICAgZnJhbWUgPSBQeUZyYW1lX0dldEJh
Y2soZnJhbWUpOworICAgICAgICAgLS1kZXB0aDsKKyAgICAgfQorIAorCi0tIAoyLjM5LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
