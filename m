Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E741CCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 06:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEEE960D89;
	Wed, 12 Nov 2025 06:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvrBJOt9HXUu; Wed, 12 Nov 2025 06:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE00760C10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE00760C10;
	Wed, 12 Nov 2025 06:55:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E8CEFA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 06:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3498160C10
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 06:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcB36mTGf3ui for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 06:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=martink@posteo.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30D1260BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D1260BA9
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30D1260BA9
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 06:55:45 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0A407240027
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:55:44 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4d5vLR47h1z6twP;
 Wed, 12 Nov 2025 07:55:43 +0100 (CET)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Date: Wed, 12 Nov 2025 06:55:43 +0000
Message-ID: <20251112065527.57161-1-martink@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=posteo.de; s=2017; 
 t=1762930544; bh=VrtlTpojP25HKrYLhiQlBblT84gFsEz/ZaBt/771BHE=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=OZqwkATy95jufvvm8Mkb6A4Gft8jypl/LbqW6E465m52/YVLC54hmQJAwjSM87WDd
 d9YKhGF6pQrFKRKWcTc86+smSn5Fv1nZrEYkhc1WnPlNx5cVdt5CWfbmP3+2txH1M+
 rOQGCfIu5CWYX/ld7mhQlKNbyzInSYkjmyciejX0PKSJk8ia39boenK1mbWgt2cL63
 XkSz4SsjoAWOUdqtPVfvGe/gxgRnsr8M+3xtQY7GlRyYe9amu0DZNYOqqbNftISGNI
 gMn9GWl8ZMYT7jrGvnfe8ITCmUudvIeOjCSJ5vUcLMxKRALz2/w8DxlpQy3Ekb9rAM
 hTvmrdebb6qSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=OZqwkATy
Subject: [Buildroot] [PATCH] package/tslib: bump version to 1.24
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

UmVsZWFzZSBub3RlcyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ0cy90c2xpYi9yZWxlYXNl
cyA6CgpUaGlzIHJlbGVhc2UgaW5jbHVkZXMgbGlidHMgdmVyc2lvbiAwLjEwLjUgYW5kIHRoZSBm
b2xsb3dpbmcgY2hhbmdlczoKCiAgKiBpbXByb3ZlZCByZWxlYXNlIHByb2NlZHVyZQogICogZGVi
dWcgZml4ZXMgZm9yIDMyYml0IHN5c3RlbXMKICAqIENNYWtlIGFuZCBhdXRvY29uZiB1cGRhdGVz
IGZvciBuZXdlciB2ZXJzaW9ucwogICogZml4ZXMgZm9yIG1pbm9yIGNwcGNoZWNrIGVycm9ycwog
ICogdHNfY29uZiB0ZXN0IHByb2dyYW0gZml4ZXMKClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLZXBw
bGluZ2VyLU5vdmFrb3ZpxIcgPG1hcnRpbmtAcG9zdGVvLmRlPgotLS0KIHBhY2thZ2UvdHNsaWIv
dHNsaWIuaGFzaCB8IDQgKystLQogcGFja2FnZS90c2xpYi90c2xpYi5tayAgIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS90c2xpYi90c2xpYi5oYXNoIGIvcGFja2FnZS90c2xpYi90c2xpYi5oYXNoCmlu
ZGV4IDZmZTM1NjMzYWEuLjc5YzY5NjJkN2MgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdHNsaWIvdHNs
aWIuaGFzaAorKysgYi9wYWNrYWdlL3RzbGliL3RzbGliLmhhc2gKQEAgLTEsNSArMSw1IEBACi0j
IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ0cy90c2xpYi9yZWxlYXNlcy9kb3dubG9hZC8xLjIzL3Rz
bGliLTEuMjMudGFyLnh6LnNoYTI1Ngotc2hhMjU2ICA5YjQ4OWE1NGQ0ODAwNjIwMWYyZmU5NTVh
ODhjM2Y4NTc1MzVhYzkzYjZjZjhlNWExNmM3YjE2NmM4OTkxZGFjICB0c2xpYi0xLjIzLnRhci54
egorIyBodHRwczovL2dpdGh1Yi5jb20vbGlidHMvdHNsaWIvcmVsZWFzZXMvZG93bmxvYWQvMS4y
NC90c2xpYi0xLjI0LnRhci54ei5zaGEyNTYKK3NoYTI1NiAgNThkOTk0MWZmYWEyNjljMzk5ZjAw
ZDBkMzA4MTg0Yzk2MDg3ZjdhY2Y2OWFhOGUzYzY2NDVlODUyZjk5M2JhMiAgdHNsaWItMS4yNC50
YXIueHoKIAogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEyNTYgIDliODcyYThhMDcwYjhhZDMyOWM0
YmQzODBmYjFiZjAwMDBmNTY0Yzc1MDIzZWM4ZTFlNjgwM2YxNTM2NGI5ZTkgIENPUFlJTkcKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvdHNsaWIvdHNsaWIubWsgYi9wYWNrYWdlL3RzbGliL3RzbGliLm1r
CmluZGV4IGU4ZWIzYmVlYWYuLjYxMzg1MDNmNDAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdHNsaWIv
dHNsaWIubWsKKysrIGIvcGFja2FnZS90c2xpYi90c2xpYi5tawpAQCAtNCw3ICs0LDcgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVRTTElCX1ZFUlNJT04gPSAxLjIzCitUU0xJQl9W
RVJTSU9OID0gMS4yNAogVFNMSUJfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ0cy90c2xp
Yi9yZWxlYXNlcy9kb3dubG9hZC8kKFRTTElCX1ZFUlNJT04pCiBUU0xJQl9TT1VSQ0UgPSB0c2xp
Yi0kKFRTTElCX1ZFUlNJT04pLnRhci54egogVFNMSUJfTElDRU5TRSA9IEdQTC0yLjArIChwcm9n
cmFtcyksIExHUEwtMi4xKyAobGlicmFyaWVzKQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
