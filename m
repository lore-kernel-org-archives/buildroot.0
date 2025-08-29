Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00710CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C148C61687;
	Fri, 29 Aug 2025 15:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm7oobbEZejf; Fri, 29 Aug 2025 15:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8F696167D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8F696167D;
	Fri, 29 Aug 2025 15:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB0FA69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC78661675
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bERXenS9E_is for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB157612A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB157612A4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB157612A4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:34:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E1AEFC8F467
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:34:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6DDDA605F1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D1A241C22DA05; 
 Fri, 29 Aug 2025 17:34:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:34:33 +0200
Message-ID: <20250829153435.2193952-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756481677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=TF/J0WGCFLeL9HCCZVOW3pThwRZgqXuiP/nn5cR9mYM=;
 b=yAwibC4IkVwRRn0BYHkg/U5kTAIsCH6NPqkqRTPPsSFipY2GyOmLCvrd+Svv2pI1uQoWfY
 bTK+5SC0bxBMa6HEY0G+32c12c/w/OwhvEipO1kNzw3lQFHlV4Ktr5zgWwNtaIX8pbblFh
 VREQIxNJ5z9HYvhW5teQbGU+a4exCJDTzXn20PFKLPwDgCp69ITV2Kh/8B+T2d5QfejLGx
 Kfkxae2QdHfsQ6Tky3fPv6Rq0O+q4S5u18YrSQ8yvQszL6FqY1bqGu420NG3mp5VIjpLqp
 o82muN23+SIOF8NF+pXvQ/HgnHQ0lWk4TSxY1H2SlDEAnZcerTTh8/5sHS5ndw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yAwibC4I
Subject: [Buildroot] [PATCH] package/libgsm: fix build failure with GCC 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CgogIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzk1ZjBmZjg0
MmU0ZmRkY2Y5ZDJmZmFlYjdkZGJiOWFiZWI4MjEzMTkvCgpUaGVyZSBpcyBubyBwcm9wZXIgdXBz
dHJlYW0gcHJvamVjdCB3aXRoIGEgR2l0IHJlcG8gb3IgbWFpbGluZyBsaXN0LApzbyB3ZSBqdXN0
IHNlbnQgdGhlIHBhdGNoIGJ5IGUtbWFpbCB0byB0aGUgcHJvamVjdCBtYWludGFpbmVyLgoKU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KLS0tCiAuLi4vMDAwMi1GaXgtc2lnbmFsLWhhbmRsZXItcHJvdG90eXBlLnBhdGNoICAgfCA2
MSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZ3NtLzAwMDItRml4LXNpZ25hbC1oYW5kbGVy
LXByb3RvdHlwZS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ3NtLzAwMDItRml4LXNp
Z25hbC1oYW5kbGVyLXByb3RvdHlwZS5wYXRjaCBiL3BhY2thZ2UvbGliZ3NtLzAwMDItRml4LXNp
Z25hbC1oYW5kbGVyLXByb3RvdHlwZS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi5jMjhjZjU4NGExCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJnc20v
MDAwMi1GaXgtc2lnbmFsLWhhbmRsZXItcHJvdG90eXBlLnBhdGNoCkBAIC0wLDAgKzEsNjEgQEAK
K0Zyb20gN2ZmYWIwYTUwMjhmMGJmY2I4NjRjMjM4N2Y0MWI4ZDRlYjMzZmI4ZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlA
Ym9vdGxpbi5jb20+CitEYXRlOiBGcmksIDI5IEF1ZyAyMDI1IDE3OjI3OjU1ICswMjAwCitTdWJq
ZWN0OiBbUEFUQ0hdIEZpeCBzaWduYWwgaGFuZGxlciBwcm90b3R5cGUKK01JTUUtVmVyc2lvbjog
MS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKKworUmVjZW50IHZlcnNpb25zIG9mIGdjYywgc3RhcnRpbmcg
ZnJvbSBnY2MgMTUueCwgYXJlIG1vcmUgcGlja3kgYWJvdXQKK2Z1bmN0aW9uIHByb3RvdHlwZXMs
IGFuZCB0aGF0IGNhdXNlIHRoZSBmb2xsb3dpbmcgaXNzdWU6CisKK3Vzci9pbmNsdWRlL3NpZ25h
bC5oOjkzOjIzOiBub3RlOiBleHBlY3RlZCDigJhfX3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZv
aWQgKCopKGludCnigJl9IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmHZvaWQgKCopKHZvaWQp
4oCZCisKK3VsdGltYXRlbHkgY2F1c2luZyBhIGJ1aWxkIGZhaWx1cmUuCisKK1RoaXMgcGF0Y2gg
Zml4ZXMgdGhhdCBieSBlbnN1cmluZyB0aGUgc2lnbmFsIGhhbmRsZXIgaGFzIHRoZSByaWdodAor
cHJvdG90eXBlLiBUaGUgb25pbnRyKCkgZnVuY3Rpb24gaXMgbm90IG9ubHkgdXNlZCBhcyBhIHNp
Z25hbCBoYW5kbGVyLAorYnV0IGFsc28gb24gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSwgaW4g
d2hpY2ggY2FzZSBhIGR1bW15IHZhbHVlIG9mCiswIGlzIHBhc3NlZCBhcyBhcmd1bWVudCwgc2lu
Y2UgYW55d2F5IHRoaXMgdmFsdWUgaXNuJ3QgdXNlZCBieQorb25pbnRyKCkuCisKK1Vwc3RyZWFt
OiBzZW50IGJ5IGUtbWFpbCB0byBKdXR0YSBEZWdlbmVyIDxqdXR0YUBwb2JveC5jb20+CitTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PgorLS0tCisgc3JjL3RvYXN0LmMgfCA2ICsrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvdG9hc3QuYyBiL3Ny
Yy90b2FzdC5jCitpbmRleCAwNWNkMGIzLi43MGExNGJhIDEwMDY0NAorLS0tIGEvc3JjL3RvYXN0
LmMKKysrKyBiL3NyYy90b2FzdC5jCitAQCAtMjExLDcgKzIxMSw3IEBAIHN0YXRpYyBjaGFyICog
c3VmZml4IFAyKChuYW1lLCBzdWYpLCBjaGFyICpuYW1lLCBjaGFyICogc3VmKQorIH0KKyAKKyAK
Ky1zdGF0aWMgdm9pZCBjYXRjaF9zaWduYWxzIFAxKChmdW4pLCBTSUdIQU5ETEVSX1QgKCpmdW4p
ICgpKQorK3N0YXRpYyB2b2lkIGNhdGNoX3NpZ25hbHMgUDEoKGZ1biksIFNJR0hBTkRMRVJfVCAo
KmZ1bikgKGludCkpCisgeworICNpZmRlZglTSUdIVVAKKyAJc2lnbmFsKCBTSUdIVVAsICAgZnVu
ICk7CitAQCAtMjMwLDcgKzIzMCw3IEBAIHN0YXRpYyB2b2lkIGNhdGNoX3NpZ25hbHMgUDEoKGZ1
biksIFNJR0hBTkRMRVJfVCAoKmZ1bikgKCkpCisgI2VuZGlmCisgfQorIAorLXN0YXRpYyBTSUdI
QU5ETEVSX1Qgb25pbnRyIFAwKCkKKytzdGF0aWMgU0lHSEFORExFUl9UIG9uaW50ciBQMSgoc2ln
bm8pLCBpbnQgc2lnbm8pCisgeworIAljaGFyICogdG1wID0gb3V0bmFtZTsKKyAKK0BAIC0yNTMs
NyArMjUzLDcgQEAgc3RhdGljIGNoYXIgKiBlbWFsbG9jIFAxKChsZW4pLCBzaXplX3QgbGVuKQor
IAlpZiAoIShzID0gbWFsbG9jKGxlbikpKSB7CisgCQlmcHJpbnRmKHN0ZGVyciwgIiVzOiBmYWls
ZWQgdG8gbWFsbG9jICVkIGJ5dGVzIC0tIGFib3J0XG4iLAorIAkJCXByb2duYW1lLCAoaW50KWxl
bik7CistCQlvbmludHIoKTsKKysJCW9uaW50cigwKTsKKyAJCWV4aXQoMSk7CisgCX0KKyAJcmV0
dXJuIHM7CistLSAKKzIuNTAuMQorCi0tIAoyLjUwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
