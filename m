Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA53CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 09:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC9260A99;
	Tue, 16 Sep 2025 09:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWK6MPAcV0jU; Tue, 16 Sep 2025 09:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A426360A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A426360A6A;
	Tue, 16 Sep 2025 09:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB67199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 09:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FA3940728
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 09:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlBNU96kbx_J for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 09:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3AFE4072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3AFE4072F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3AFE4072F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 09:31:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 304541550; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 09:31:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uyS1i-002Cdk-2j;
 Tue, 16 Sep 2025 11:31:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 11:31:05 +0200
Message-Id: <20250916093105.525147-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hoXJXoTQxIPsepoxlUYH+ISb/npupo/f3yXFJEW9nEyToFp4m8UcCzAQiSLRkcuHhtt7zMY5NDXqsGEan1wy6Zv3KSpUpHjhTdfnKp7pA40mAvQ2NONgyhzT072aYI8OXr837T1dzfvdVAUPmfLSdMku+7xSZ36vmbZ2ZJ5dd9jbXV86MbnVN1bSxeOHypNQy0B68s5pMaiPUhDi2ZomP+NXLdT6m4KGA08XXGyd7smwys0imDKApWBdif/i9H3Jx7ZHmn1KfoDmJESEUZDDbVyK6MrePtGWYtgI2gsCWoE3OWc6NcJF+VQDIno1wHt8tNBjEO/ymYf8YzYOLvTZrw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=vXVE+M24OFbnQdv36/s6FZtU5/e6Jl6ALVTuokKecQk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=hoXJXoTQ
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/cjson: security bump to version 1.7.19
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZToKCkNWRS0yMDI1LTU3MDUyOiBjSlNP
TiAxLjUuMCB0aHJvdWdoIDEuNy4xOCBhbGxvd3Mgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgdmlhCnRo
ZSBkZWNvZGVfYXJyYXlfaW5kZXhfZnJvbV9wb2ludGVyIGZ1bmN0aW9uIGluIGNKU09OX1V0aWxz
LmMsIGFsbG93aW5nCnJlbW90ZSBhdHRhY2tlcnMgdG8gYnlwYXNzIGFycmF5IGJvdW5kcyBjaGVj
a2luZyBhbmQgYWNjZXNzIHJlc3RyaWN0ZWQgZGF0YQp2aWEgbWFsZm9ybWVkIEpTT04gcG9pbnRl
ciBzdHJpbmdzIGNvbnRhaW5pbmcgYWxwaGFudW1lcmljIGNoYXJhY3RlcnMKCmh0dHBzOi8vbnZk
Lm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTU3MDUyCmh0dHBzOi8veC0wci5jb20vcG9z
dHMvY0pTT04tQXJyYXktSW5kZXgtUGFyc2luZy1WdWxuZXJhYmlsaXR5Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9EYXZlR2FtYmxlL2NKU09OL2NvbW1pdC83NGUxZmY0OTk0YWE0MTM5MTI2OTY3ZjZkMjg5
YjY3NWI0YjM2ZmVmCmh0dHBzOi8vZ2l0aHViLmNvbS9EYXZlR2FtYmxlL2NKU09OL3JlbGVhc2Vz
L3RhZy92MS43LjE5CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNn
YWFyZC5jb20+Ci0tLQogcGFja2FnZS9janNvbi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2Nt
YWtlXzQuMC5wYXRjaCB8IDQgKysrLQogcGFja2FnZS9janNvbi9janNvbi5oYXNoICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvY2pzb24vY2pzb24ubWsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Nqc29u
LzAwMDEtbWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoIGIvcGFja2FnZS9janNv
bi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2NtYWtlXzQuMC5wYXRjaAppbmRleCAxZmU1Y2Q0
M2VmLi42ODQ3NzNlNGRhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9jb21w
YXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCisrKyBiL3BhY2thZ2UvY2pzb24vMDAwMS1tYWtl
X2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2gKQEAgLTE2LDYgKzE2LDggQEAgQ01ha2Ug
RXJyb3IgYXQgQ01ha2VMaXN0cy50eHQ6MiAoY21ha2VfbWluaW11bV9yZXF1aXJlZCk6CiBUaGlz
IGNoYW5nZSByYWlzZXMgdGhlIG1pbmltdW0gcmVxdWlyZWQgQ01ha2UgdmVyc2lvbiB0byAzLjUg
YW5kIHRodXMgbWFrZXMgdGhlIHByb2plY3QgY29tcGF0aWJsZSB3aXRoIENNYWtlIDQuMAogCiBT
aWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+CitT
aWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CitQZXRl
cjogdXBkYXRlIGZvciAxLjcuMTkKIFVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vRGF2ZUdh
bWJsZS9jSlNPTi9wdWxsLzkzNQogLS0tCiAgQ01ha2VMaXN0cy50eHQgfCAyICstCkBAIC0zMSw0
ICszMyw0IEBAIGluZGV4IDM2YTZjYjU3Li45NDI4ZGE1OCAxMDA2NDQKICtjbWFrZV9taW5pbXVt
X3JlcXVpcmVkKFZFUlNJT04gMy41KQogIAogIHByb2plY3QoY0pTT04KLSAgICAgVkVSU0lPTiAx
LjcuMTgKKyAgICAgVkVSU0lPTiAxLjcuMTkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2pzb24vY2pz
b24uaGFzaCBiL3BhY2thZ2UvY2pzb24vY2pzb24uaGFzaAppbmRleCBlMDdhZTBmN2JmLi5hODc2
ZmZhZmU4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Nqc29uL2Nqc29uLmhhc2gKKysrIGIvcGFja2Fn
ZS9janNvbi9janNvbi5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkOgot
c2hhMjU2ICAzYWE4MDY4NDRhMDM0NDJjMDA3NjliODNlOTk5NzBiZTcwZmJlZjAzNzM1ZmY4OThm
NDgxMWRkMDNiOWY1ZWU1ICBjanNvbi0xLjcuMTgudGFyLmd6CitzaGEyNTYgIDdmYTYxNmUzMDQ2
ZWRmYTdhMjhhMzJkNWY5ZWFjZmQyM2Y5MjkwMGZlMWY4Y2NkOTg4YzE2NjJmMzA0NTQ1NjIgIGNq
c29uLTEuNy4xOS50YXIuZ3oKIHNoYTI1NiAgYTM2ZGRhMjA3YzM2ZGI1ODE4NzI5YzU0ZTdhZDRl
OGIwYzZmYmE4NDc0OTFiYTY0ZjM3MmMxYTIwMzdiNmQ1YyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9janNvbi9janNvbi5tayBiL3BhY2thZ2UvY2pzb24vY2pzb24ubWsKaW5kZXggMzUz
MDRlYzYxOC4uZTAzMjA3NzBjYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9janNvbi9janNvbi5tawor
KysgYi9wYWNrYWdlL2Nqc29uL2Nqc29uLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotQ0pTT05fVkVSU0lPTiA9IDEuNy4xOAorQ0pTT05fVkVSU0lPTiA9
IDEuNy4xOQogQ0pTT05fU0lURSA9ICQoY2FsbCBnaXRodWIsRGF2ZUdhbWJsZSxjanNvbix2JChD
SlNPTl9WRVJTSU9OKSkKIENKU09OX0lOU1RBTExfU1RBR0lORyA9IFlFUwogQ0pTT05fTElDRU5T
RSA9IE1JVAotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
