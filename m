Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADDBC3ABBC
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 19:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6A5600D1;
	Mon,  5 May 2025 19:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g01N4KlNzBP1; Mon,  5 May 2025 19:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB7960B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB7960B2E;
	Mon,  5 May 2025 19:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94A6612E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 19:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C5B81361
 for <buildroot@buildroot.org>; Mon,  5 May 2025 19:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxkc1Scxrjzl for <buildroot@buildroot.org>;
 Mon,  5 May 2025 19:08:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90E5E8134A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E5E8134A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E5E8134A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 19:08:55 +0000 (UTC)
Received: from home.juju.sh (unknown [86.210.113.106])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EAA2CB00579;
 Mon,  5 May 2025 21:08:50 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon,  5 May 2025 21:08:32 +0200
Message-ID: <20250505190840.1316502-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746472132;
 bh=JXDJbG0XW4REAWvI026IAlUIkucVsQVbt59nlZjdzFY=;
 h=From:To:Cc:Subject:Date:From;
 b=PiTVPH6Yi9Ut3ohyUL/P5FijyHgPgm51zu6zfXnWwVNNU5rm3J3mUxptKfn1GbZID
 vk8EPPVQ2DS9hmLp72PTvT4aZ+fufh2KMifWwxZFtKWTSCi1OXxvTo3HHYXWDkwD5a
 /lSDbSQjPD0jkFYCN7bQrt5Xax9BTQ7Pt5XrnjTSMXARzQymAo9vdu8bCO4DSz+mpl
 JSePMpFBCvNNB3yxVtNS+BDmttZPdmXKCFYtDhSkVsulF/99+n/iumvUwqTwVPZak0
 xy7D2NMVP7dzUZx5hTw3GUpwWNS4rLwTsZWmBaNBQMbCYrmmQsaAGUBNZFhp1V3l0E
 NyvlCK9wStzwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PiTVPH6Y
Subject: [Buildroot] [PATCH 1/1] package/gmp: add patch to fix build with
 gcc-15
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

V2hlbiB1c2luZyBob3N0IGdjYyAxNSwgaG9zdC1nbXAgZmFpbHMgYXQgY29uZmlndXJlIHRpbWUg
d2l0aAplcnJvciBtZXNzYWdlOgoKICAgIGNvbmZpZ3VyZTogZXJyb3I6IGNvdWxkIG5vdCBmaW5k
IGEgd29ya2luZyBjb21waWxlciwgc2VlIGNvbmZpZy5sb2cgZm9yIGRldGFpbHMKClRoZSBlcnJv
ciBpcyBkdWUgdG8gdGhlIG1hY3JvIEdNUF9QUk9HX0NDX1dPUktTIGluIHRoZSBmaWxlCmFjaW5j
bHVkZS5tNCBjb250YWluaW5nIEMtY29kZSBkZWNsYXJpbmcgZnVuY3Rpb25zIHdpdGhvdXQgZGVj
bGFyaW5nCml0cyBwYXJhbWV0ZXJzLiBUaGlzIGNvbnN0cnVjdCBpcyBub3cgYW4gZXJyb3IgaW4g
QzIzLCB3aGljaCBpcyB0aGUKbmV3IGRlZmF1bHQgaW4gZ2NjIDE1LiBTZWU6Cmh0dHBzOi8vZ2Nj
LmdudS5vcmcvZ2NjLTE1L3BvcnRpbmdfdG8uaHRtbCNjMjMKClRoaXMgY29tbWl0IGZpeGVzIHRo
ZSBpc3N1ZSBieSBhZGRpbmcgYSBwYWNrYWdlIHBhdGNoIGZyb20KdXBzdHJlYW0gY2hhbmdlc2V0
cywgbm90IHlldCBwdWJsaXNoZWQgaW4gYSByZWxlYXNlLgoKRXZlbiBpZiBnY2MgMTUgaXMgbm90
IHlldCBpbmNsdWRlZCBpbiBCdWlsZHJvb3QsIHRoaXMgY29tbWl0IGFsc28Kc2V0cyBfQVVUT1JF
Q09ORiA9IFlFUyBmb3IgdGhlIHRhcmdldCBwYWNrYWdlIGluIG9yZGVyIHRvIGhhdmUgdGhpcwpw
YWNrYWdlIGFscmVhZHkgZml4ZWQuCgpGaXhlczoKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzYyMzYzNGZhN2JiZWNlZWI2ZDkwYjE1Y2UwYWJiMWI5YjRiMjQwNDUvCgpT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgotLS0KUGF0Y2ggdGVz
dGVkIGJ5IGNvbXBpbGluZyBxZW11X2FhcmNoNjRfdmlydF9kZWZjb25maWcgaW4KLSBCdWlsZHJv
b3QgcmVmZXJlbmNlIGRvY2tlciBpbWFnZSAoRGViaWFuIDEyLCBob3N0IGdjYyAxMikKLSBGZWRv
cmEgNDEgKGhvc3QgZ2NjIDE0KQotIEZlZG9yYSA0MiAoaG9zdCBnY2MgMTUpCi0tLQogLi4ubi1w
cm90b3R5cGUtaW4tYWNpbmNsdWRlLm00LWZvci1DMjMtLnBhdGNoIHwgNTEgKysrKysrKysrKysr
KysrKysrKwogcGFja2FnZS9nbXAvZ21wLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKysKIDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvZ21wLzAwMDEtQ29tcGxldGUtZnVuY3Rpb24tcHJvdG90eXBlLWluLWFjaW5j
bHVkZS5tNC1mb3ItQzIzLS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ21wLzAwMDEtQ29t
cGxldGUtZnVuY3Rpb24tcHJvdG90eXBlLWluLWFjaW5jbHVkZS5tNC1mb3ItQzIzLS5wYXRjaCBi
L3BhY2thZ2UvZ21wLzAwMDEtQ29tcGxldGUtZnVuY3Rpb24tcHJvdG90eXBlLWluLWFjaW5jbHVk
ZS5tNC1mb3ItQzIzLS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4xMjlhNGE4OGUwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9nbXAvMDAwMS1Db21wbGV0
ZS1mdW5jdGlvbi1wcm90b3R5cGUtaW4tYWNpbmNsdWRlLm00LWZvci1DMjMtLnBhdGNoCkBAIC0w
LDAgKzEsNTEgQEAKK0Zyb20gOWNkMGMzNmQwMTEwMTkxYTVmNDJlMjY4ZDdiZDIxYTk1YTJhYTg4
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE1hcmMgR2xpc3NlIDxtYXJjLmdsaXNz
ZUBpbnJpYS5mcj4KK0RhdGU6IFdlZCwgMjkgSmFuIDIwMjUgMjI6Mzg6MDIgKzAxMDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gQ29tcGxldGUgZnVuY3Rpb24gcHJvdG90eXBlIGluIGFjaW5jbHVkZS5tNCBm
b3IgQzIzCisgY29tcGF0aWJpbGl0eQorCitBZGQgcGFyYW1ldGVyIG5hbWVzIHRvIGZ1bmN0aW9u
IHByb3RvdHlwZQorCitVcHN0cmVhbTogaHR0cHM6Ly9nbXBsaWIub3JnL3JlcG8vZ21wL3Jldi9k
NjZkNjZkODJkYmIKK1Vwc3RyZWFtOiBodHRwczovL2dtcGxpYi5vcmcvcmVwby9nbXAvcmV2Lzhl
N2JiNGFlN2ExOAorU2lnbmVkLW9mZi1ieTogTWFyYyBHbGlzc2UgPG1hcmMuZ2xpc3NlQGlucmlh
LmZyPgorW0p1bGllbjogZ2l0IHBhdGNoIGFkYXB0ZWQgZnJvbSB0d28gdXBzdHJlYW0gbWVyY3Vy
aWFsIGNoYW5nZXNldHNdCitTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgorLS0tCisgQ2hhbmdlTG9nICAgIHwgOSArKysrKysrKysKKyBhY2luY2x1ZGUubTQgfCAy
ICstCisgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisK
K2RpZmYgLS1naXQgYS9DaGFuZ2VMb2cgYi9DaGFuZ2VMb2cKK2luZGV4IDI5MDJjZDIuLmQ4MDhh
OGIgMTAwNjQ0CistLS0gYS9DaGFuZ2VMb2cKKysrKyBiL0NoYW5nZUxvZworQEAgLTEsMyArMSwx
MiBAQAorKzIwMjUtMDMtMTUgIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CisrCisrCSog
YWNpbmNsdWRlLm00OiBBZGQgcGFyYW1ldGVyIG5hbWVzIHRvIGZ1bmN0aW9uIHByb3RvdHlwZS4K
KysKKysyMDI1LTAxLTI5ICBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KKysJICAg
IE1hcmMgR2xpc3NlIDxtYXJjLmdsaXNzZUBpbnJpYS5mcj4KKysKKysJKiBhY2luY2x1ZGUubTQ6
IENvbXBsZXRlIGZ1bmN0aW9uIHByb3RvdHlwZS4KKysKKyAyMDIzLTA3LTI5ICBUb3JiasO2cm4g
R3Jhbmx1bmQgIDx0Z0BnbXBsaWIub3JnPgorIAorIAkqIFZlcnNpb24gNi4zLjAgcmVsZWFzZWQu
CitkaWZmIC0tZ2l0IGEvYWNpbmNsdWRlLm00IGIvYWNpbmNsdWRlLm00CitpbmRleCA5Y2Y5NDgz
Li5iNzlhNDMxIDEwMDY0NAorLS0tIGEvYWNpbmNsdWRlLm00CisrKysgYi9hY2luY2x1ZGUubTQK
K0BAIC02MDksNyArNjA5LDcgQEAgR01QX1BST0dfQ0NfV09SS1NfUEFSVChbJDFdLCBbbG9uZyBs
b25nIHJlbGlhYmlsaXR5IHRlc3QgMV0sCisgCisgI2lmIGRlZmluZWQgKF9fR05VQ19fKSAmJiAh
IGRlZmluZWQgKF9fY3BsdXNwbHVzKQorIHR5cGVkZWYgdW5zaWduZWQgbG9uZyBsb25nIHQxO3R5
cGVkZWYgdDEqdDI7Cistdm9pZCBnKCl7fQorK3ZvaWQgZyhpbnQgYSx0MSBjb25zdCpiLHQxIGMs
dDIgZCx0MSBjb25zdCplLGludCBmKXt9Cisgdm9pZCBoKCl7fQorIHN0YXRpYyBfX2lubGluZV9f
IHQxIGUodDIgcnAsdDIgdXAsaW50IG4sdDEgdjApCisge3QxIGMseCxyO2ludCBpO2lmKHYwKXtj
PTE7Zm9yKGk9MTtpPG47aSsrKXt4PXVwW2ldO3I9eCsxO3JwW2ldPXI7fX1yZXR1cm4gYzt9Cist
LSAKKzIuNDkuMAorCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dtcC9nbXAubWsgYi9wYWNrYWdlL2dt
cC9nbXAubWsKaW5kZXggN2U4ZGE5MDI1Yy4uMDdhYTRhZWZkZiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9nbXAvZ21wLm1rCisrKyBiL3BhY2thZ2UvZ21wL2dtcC5tawpAQCAtMTQsNiArMTQsMTAgQEAg
R01QX0NQRV9JRF9WRU5ET1IgPSBnbXBsaWIKIEdNUF9ERVBFTkRFTkNJRVMgPSBob3N0LW00CiBI
T1NUX0dNUF9ERVBFTkRFTkNJRVMgPSBob3N0LW00CiAKKyMgMDAwMS1Db21wbGV0ZS1mdW5jdGlv
bi1wcm90b3R5cGUtaW4tYWNpbmNsdWRlLm00LWZvci1DMjMtLnBhdGNoCitHTVBfQVVUT1JFQ09O
RiA9IFlFUworSE9TVF9HTVBfQVVUT1JFQ09ORiA9IFlFUworCiBHTVBfQ09ORl9FTlYgKz0gQ0Nf
Rk9SX0JVSUxEPSIkKEhPU1RDQykgLXN0ZD1jOTkiCiAKICMgR01QIGRvZXNuJ3Qgc3VwcG9ydCBh
c3NlbWJseSBmb3IgY29sZGZpcmUgb3IgbWlwcyByNiBJU0EgeWV0Ci0tIAoyLjQ5LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
