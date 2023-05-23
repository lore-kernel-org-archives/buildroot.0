Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FAAC77B75
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 23:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A58941DCC;
	Tue, 23 May 2023 23:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A58941DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mR5E6HiI7Ivf; Tue, 23 May 2023 23:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA23404CA;
	Tue, 23 May 2023 23:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EA23404CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A16981BF369
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 23:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82E4F41EA4
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 23:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E4F41EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQ61-XdMPZJI for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 23:16:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FDAE41E8D
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FDAE41E8D
 for <buildroot@buildroot.org>; Tue, 23 May 2023 23:16:53 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5552a0a9557so338749eaf.0
 for <buildroot@buildroot.org>; Tue, 23 May 2023 16:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684883812; x=1687475812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TWEGpuhGN/aT+B6FKb1dUZp0/wmxtQGWYHCzEOHXAWc=;
 b=Y5+Z8IPF941p9XDvrRZMFdq4wbgd94oil+lCX+oyIdUL9l5lRjd5jtiPf7uMaqwIhz
 ZZFPsHSI9SPUa6na/5hbrH/oAyWJEQ5avsOVRc4TlNGUCBwpiGMQ7VcGEkI+QV/QRYXn
 2Ee7GrBOZW7es0iDx7U7YejoUS/hzznFJojKs+5dZk7BNEv6hDhbkwNMKM1j2VMnQ9oZ
 rWtQ0yqtTSTu64b/XRvqdPzeGoIxQqnI2LnduGykmjwZ+BC9R2BVGp0oPocEhFOd6NBA
 M+vsFtsDF5hJslciVySstlF8uIhDVZvuMxVcYh1U+zaMiGKdWL/J5VFiCKK+UqGVmUo/
 9m8g==
X-Gm-Message-State: AC+VfDwJlr2RDMJZ5TIb8LDr0u6JHmcO2OeqgZLDLhDIjC3wtpUnEHH0
 KunnQHlhUyPcShTwQ6uQ2vt8XYAFTPo=
X-Google-Smtp-Source: ACHHUZ5oLtC+la1Z9MEpCUEB+7iHGrGl23W9YnMCrUT2HgY+ocyp39ij5Mhx7Xs/BsNixC3gR3mZOw==
X-Received: by 2002:a05:6870:a402:b0:19e:9c93:5c8d with SMTP id
 m2-20020a056870a40200b0019e9c935c8dmr1737295oal.18.1684883811876; 
 Tue, 23 May 2023 16:16:51 -0700 (PDT)
Received: from casantos.remote.csb ([179.176.185.1])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a056870e35500b0017fea9c156esm4108050oae.18.2023.05.23.16.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 16:16:51 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 20:16:45 -0300
Message-Id: <20230523231645.33886-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684883812; x=1687475812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TWEGpuhGN/aT+B6FKb1dUZp0/wmxtQGWYHCzEOHXAWc=;
 b=asMTRBYCZVxNglKKnnJtBUZpfOuP668IJCGS8p85exOeHpE+ooJZtWcQUJkpTdbvFp
 ecUDx8em6JJYLgMhxM5TFhEj2Hu1cXt/whpC60Xq8aoUMNauw1KyzIN6PbPH2aqsS/de
 PWNgOdwSx0fDWdt8oL2QR4NH9GpX49V4zcWahAxxDRjF4e++nciqGe/ZDigkX2uJN8Oc
 TUpOaS+WH0f/504ErNEKHWh667aAvYH8W1oBgJsVNn0hkUG0ru4m4Ydv1iOZjRbPtwlh
 ++p5iu6Ifmi303hmqNVAc/U7p0yVo9Bbsj0dm+ZIt8JLdJzZqp80JsaYBzhqsAXMU71q
 2g2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=asMTRBYC
Subject: [Buildroot] [PATCH v2] package/qemu: install keyboard maps only if
 necessary
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQ2FybG9zIFNhbnRvcyA8dW5peG1hbmlhQGdtYWlsLmNvbT4KClRoZXkgYXJlIHJlcXVp
cmVkIG9ubHkgZm9yIHN5c3RlbSBlbXVsYXRpb24sIHNvIHB1bGwgYSBwYXRjaCBhbHJlYWR5CnJl
dmlld2QgdXBzdHJlYW0gdGhhdCBtYWtlcyB0aGUgaW5zdGFsbGF0aW9uIGNvbmRpdGlvbmFsOgoK
ICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNo
LzIwMjMwMzI3MTcyMTQ3LjE5NjYwNy0xLWNhc2FudG9zQHJlZGhhdC5jb20vCgpTaWduZWQtb2Zm
LWJ5OiBDYXJsb3MgU2FudG9zIDx1bml4bWFuaWFAZ21haWwuY29tPgotLS0KQ2hhbmdlcyB2MS0+
djIKICAtIEZpeGVkIHJlZmVyZW5jZSB0byB1cHRyZWFtIHBhdGNoLCB1c2luZyB0aGUgUUVNVSBw
YXRjaHdvcmsKCk5vdGUgYWJvdXQgdGhlICJTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgU2FudG9zIDxj
YXNhbnRvc0ByZWRoYXQuY29tPiIgaW4KdGhlIHBhdGNoOgoKVGhvdXNhbmRzIG9mIFJlZCBIYXQg
ZW1wbG95ZWVzIGNvbnRyaWJ1dGUgdG8gZnJlZSBzb2Z0d2FyZSBwcm9qZWN0cwp1c2luZyB0aGVp
ciB3b3JrIGVtYWlsIGFkZHJlc3Nlcy4gVGhlcmUgaXMgbm8gY29udHJhZGljdGlvbiBiZXR3ZWVu
CnBlcnNvbmFsIGFuZCBlbXBsb3llZSBhY3Rpdml0eSByZWdhcmRpbmcgdGhpcy4gQ2hlY2sgdGhp
cyBkb2N1bWVudCBmb3IKYWRkaXRpb25hbCBpbmZvcm1hdGlvbjoKCiAgIFJlZCBIYXTigJlzIG9w
ZW4gc291cmNlIHBhcnRpY2lwYXRpb24gZ3VpZGVsaW5lcwogICBodHRwczovL3d3dy5yZWRoYXQu
Y29tL2VuL3Jlc291cmNlcy9vcGVuLXNvdXJjZS1wYXJ0aWNpcGF0aW9uLWd1aWRlbGluZXMtb3Zl
cnZpZXcKLS0tCiAuLi50YWxsLWtleWJvYXJkLW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2gg
fCAzNiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcWVtdS8wMDAzLW1lc29uLWluc3RhbGwta2V5
Ym9hcmQtbWFwcy1vbmx5LWlmLW5lY2Vzc2FyeS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cWVtdS8wMDAzLW1lc29uLWluc3RhbGwta2V5Ym9hcmQtbWFwcy1vbmx5LWlmLW5lY2Vzc2FyeS5w
YXRjaCBiL3BhY2thZ2UvcWVtdS8wMDAzLW1lc29uLWluc3RhbGwta2V5Ym9hcmQtbWFwcy1vbmx5
LWlmLW5lY2Vzc2FyeS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li45MWVhMWU4NmM5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xZW11LzAwMDMtbWVzb24t
aW5zdGFsbC1rZXlib2FyZC1tYXBzLW9ubHktaWYtbmVjZXNzYXJ5LnBhdGNoCkBAIC0wLDAgKzEs
MzYgQEAKK0Zyb20gOWQ5Yjc0ZjgwNmY1ZGJjYTUzZGY2NjMwYzFhMDU5MWVhZWRkNDUwMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENhcmxvcyBTYW50b3MgPGNhc2FudG9zQHJlZGhh
dC5jb20+CitEYXRlOiBTdW4sIDEgSmFuIDIwMjMgMjE6MDA6NTcgLTAzMDAKK1N1YmplY3Q6IFtQ
QVRDSF0gbWVzb246IGluc3RhbGwga2V5Ym9hcmQgbWFwcyBvbmx5IGlmIG5lY2Vzc2FyeQorCitU
aGV5IGFyZSByZXF1aXJlZCBvbmx5IGZvciBzeXN0ZW0gZW11bGF0aW9uIChpLmUuIGhhdmVfc3lz
dGVtIGlzIHRydWUpLgorCitTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgU2FudG9zIDxjYXNhbnRvc0By
ZWRoYXQuY29tPgorLS0tCisgcGMtYmlvcy9rZXltYXBzL21lc29uLmJ1aWxkIHwgNiArKysrLS0K
KyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZm
IC0tZ2l0IGEvcGMtYmlvcy9rZXltYXBzL21lc29uLmJ1aWxkIGIvcGMtYmlvcy9rZXltYXBzL21l
c29uLmJ1aWxkCitpbmRleCAxNThhM2I0MTBjLi5iZmYzMDgzMzEzIDEwMDY0NAorLS0tIGEvcGMt
Ymlvcy9rZXltYXBzL21lc29uLmJ1aWxkCisrKysgYi9wYy1iaW9zL2tleW1hcHMvbWVzb24uYnVp
bGQKK0BAIC00Nyw3ICs0Nyw3IEBAIGlmIG5hdGl2ZV9xZW11X2tleW1hcC5mb3VuZCgpCisgICAg
ICAgICAgICAgICAgICAgICAgICBidWlsZF9ieV9kZWZhdWx0OiB0cnVlLAorICAgICAgICAgICAg
ICAgICAgICAgICAgb3V0cHV0OiBrbSwKKyAgICAgICAgICAgICAgICAgICAgICAgIGNvbW1hbmQ6
IFtuYXRpdmVfcWVtdV9rZXltYXAsICctZicsICdAT1VUUFVUQCcsIGFyZ3Muc3BsaXQoKV0sCist
ICAgICAgICAgICAgICAgICAgICAgICBpbnN0YWxsOiB0cnVlLAorKyAgICAgICAgICAgICAgICAg
ICAgICAgaW5zdGFsbDogaGF2ZV9zeXN0ZW0sCisgICAgICAgICAgICAgICAgICAgICAgICBpbnN0
YWxsX2RpcjogcWVtdV9kYXRhZGlyIC8gJ2tleW1hcHMnKQorICAgZW5kZm9yZWFjaAorIAorQEAg
LTU2LDQgKzU2LDYgQEAgZWxzZQorICAgaW5zdGFsbF9kYXRhKGtleW1hcHMua2V5cygpLCBpbnN0
YWxsX2RpcjogcWVtdV9kYXRhZGlyIC8gJ2tleW1hcHMnKQorIGVuZGlmCisgCistaW5zdGFsbF9k
YXRhKFsnc2wnLCAnc3YnXSwgaW5zdGFsbF9kaXI6IHFlbXVfZGF0YWRpciAvICdrZXltYXBzJykK
KytpZiBoYXZlX3N5c3RlbQorKyAgaW5zdGFsbF9kYXRhKFsnc2wnLCAnc3YnXSwgaW5zdGFsbF9k
aXI6IHFlbXVfZGF0YWRpciAvICdrZXltYXBzJykKKytlbmRpZgorLS0gCisyLjMxLjEKKwotLSAK
Mi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
