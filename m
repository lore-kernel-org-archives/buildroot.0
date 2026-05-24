Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E05CD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA090411C1;
	Sun, 24 May 2026 17:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_1XL-3FodNC; Sun, 24 May 2026 17:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C3241192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779642984;
	bh=9OXX8MuRqfpn0ojLAdFfY/WcsWuTWd4EESsgajkJuOo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MRvQ6kd64YzJerSc2yEtP0et4F+xq7DF+VrnWgLIFopEvUiOZfYPR82SzK5KjKdzg
	 vrmf7LnY25dgv1BI35/RjOk70+wj/HUNuAtVMrndL0bvOfMsETN0uMzeo9yFdvBaDl
	 LT8TZImAufrR1NZ08166UZAOzLVQNNJkWVfSGZJoVt4HDjCDckzU6IBcTLIO+DgFHv
	 eV7OL0MpgSrJdmyeBGNcPWvTNc/XukWmlK1F++gJQm2WST9cPFAcBbBsceb8Ysi7UD
	 MTZDVeo0UqgMTXchjGlrNE1cIFwaZiYJfIshfp155gmrAX6TSKnRlcJcmLPmHVAr2N
	 ycaMcof12nhrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31C3241192;
	Sun, 24 May 2026 17:16:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF3E9263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A560060ABB
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EID8_9xk0Av for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 257DF60ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257DF60ABA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 257DF60ABA
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:16:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC68AA4C0EEA
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:16:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46128)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRCQz-000000001IM-40Th
 for buildroot@buildroot.org; Sun, 24 May 2026 17:16:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 19:16:16 +0200
Message-ID: <20260524171618.3225459-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779642978;
 bh=t+0Z/KYClvH+QSWArJfthT60NdOXdwuY5pm39Vq/Pbk=;
 h=From:To:Subject:Date:From;
 b=pFzZLxk0KwEfXVu75tAMo6RYVERjmT9U6ZG8R5JL84yGt9jIUBFea70q352Gil1ko
 px7uDapsPwqEDlBmLCs6OG3wL9AvWzyfveLOQ2LMYNtjpYi6+OW60ixFZSUHOsPQ6U
 vhdVTvc8GXWNdqTt7o7g/WLrFc8F7XfHRkYFcDe/PlTuMVfGLTudv893PO1g0Cyq6X
 OmjuU3kTvqSlvbWQ7N3yOfmHJfy1Oul7iKcv3C1rUrCnX847OCDYY86T/dprFBH1bT
 /JttKl3fA7vygdla1ooljSY0PHrLI3jX/jQ8kTEYN2AA/nxSDmekdSEuwFXya8Adrf
 LHRr1aLZePC9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pFzZLxk0
Subject: [Buildroot] [PATCH 1/2] package/powerpc-utils: fix build with gcc
 >= 15.x
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

QWRkZWQgdXBzdHJlYW0gcGF0Y2ggdG8gZml4IGJ1aWxkIGVycm9ycyB3aXRoIGdjYyA+PSAxNS54
LgoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85NmEvOTZh
YjFkOWFkOGJiNzE2ZjczMmNkNzZhYmQzYjY0Mzc2ZWMxZDQ4Zi8KClNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpUaGlzIHBhdGNoIHdhcyBjb21taXR0ZWQg
dXBzdHJlYW0gYWZ0ZXIgdGhlIHJlbGVhc2Ugb2YgMS4zLjEzLCBpdAphcHBsaWVzIHRvIGJvdGgg
dGhlIGN1cnJlbnQgdmVyc2lvbiAxLjMuMTEgYXMgd2VsbCBhcyB0byB0aGUgdXBjb21pbmcKYnVt
cCB0byAxLjMuMTMuCgogLi4uLUNvcnJlY3QtbGlicnRhcy1mdW5jdGlvbi1wcm90b3R5cGVzLnBh
dGNoIHwgNjQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Bvd2VycGMtdXRpbHMvMDAwMS1udnJh
bS5jLUNvcnJlY3QtbGlicnRhcy1mdW5jdGlvbi1wcm90b3R5cGVzLnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9wb3dlcnBjLXV0aWxzLzAwMDEtbnZyYW0uYy1Db3JyZWN0LWxpYnJ0YXMtZnVu
Y3Rpb24tcHJvdG90eXBlcy5wYXRjaCBiL3BhY2thZ2UvcG93ZXJwYy11dGlscy8wMDAxLW52cmFt
LmMtQ29ycmVjdC1saWJydGFzLWZ1bmN0aW9uLXByb3RvdHlwZXMucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNDM3M2U4OWM1ZgotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcG93ZXJwYy11dGlscy8wMDAxLW52cmFtLmMtQ29ycmVjdC1saWJydGFzLWZ1bmN0
aW9uLXByb3RvdHlwZXMucGF0Y2gKQEAgLTAsMCArMSw2NCBAQAorRnJvbSAwYzZhY2RhZTA5MGNi
NzRjYTYwYzgxMTk0YWM5YWM4MTlhMTk5MzVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogTWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4KK0RhdGU6IE1vbiwgNCBBdWcg
MjAyNSAxMzoyNTozOCArMDIwMAorU3ViamVjdDogW1BBVENIXSBudnJhbS5jOiBDb3JyZWN0IGxp
YnJ0YXMgZnVuY3Rpb24gcHJvdG90eXBlcworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAorCitGaXggYnVpbGQgYnJlYWthZ2Ugd2l0aCBHQ0MgMTUgKHdoaWNoIGFzc3VtZXMgQzIz
KSBzdWNoIHRoYXQgYW5kIGVtcHR5Cithcmd1bWVudCBsaXN0IGlzIHRyZWF0ZWQgYXMgemVybyBh
cmd1bWVudHMgcmF0aGVyIHRoYW4gYW4gYXJiaXRyYXJ5CitudW1iZXIuCisKK3NyYy9udnJhbS5j
OiBJbiBmdW5jdGlvbiDigJhkdW1wX3J0YXNfZXZlbnRfZW50cnnigJk6CitzcmMvbnZyYW0uYzo5
MzI6MTg6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYcGFyc2VfcnRh
c19ldmVudOKAmTsgZXhwZWN0ZWQgMCwgaGF2ZSAyCisgIDkzMiB8ICAgICBydGFzX2V2ZW50ID0g
cGFyc2VfcnRhc19ldmVudChkYXRhLCBsZW4pOworICAgICAgfCAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn4gfn5+fgorc3JjL252cmFtLmM6OTM4OjU6IGVycm9yOiB0b28gbWFueSBh
cmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYcnRhc19wcmludF9ldmVudOKAmTsgZXhwZWN0ZWQgMCwg
aGF2ZSAzCisgIDkzOCB8ICAgICBydGFzX3ByaW50X2V2ZW50KHN0ZG91dCwgcnRhc19ldmVudCwg
MCk7CisgICAgICB8ICAgICBefn5+fn5+fn5+fn5+fn5+IH5+fn5+fgorc3JjL252cmFtLmM6OTQw
OjU6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYY2xlYW51cF9ydGFz
X2V2ZW504oCZOyBleHBlY3RlZCAwLCBoYXZlIDEKKyAgOTQwIHwgICAgIGNsZWFudXBfcnRhc19l
dmVudChydGFzX2V2ZW50KTsKKyAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fiB+fn5+fn5+
fn5+CitJbiBmaWxlIGluY2x1ZGVkIGZyb20gc3JjL3ZjcHVzdGF0LmM6MzQ6CisKK1NpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+CitbdHlyZWxkOiBhZGQg
ZGVzY3JpcHRpb24gdG8gY29tbWl0IGxvZ10KK1NpZ25lZC1vZmYtYnk6IFR5cmVsIERhdHd5bGVy
IDx0eXJlbGRAbGludXguaWJtLmNvbT4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9p
Ym0tcG93ZXItdXRpbGl0aWVzL3Bvd2VycGMtdXRpbHMvY29tbWl0LzBjNmFjZGFlMDkwY2I3NGNh
NjBjODExOTRhYzlhYzgxOWExOTkzNWYKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJl
cm5kQGt1aGxzLm5ldD4KKy0tLQorIHNyYy9udnJhbS5jIHwgMTAgKysrKysrLS0tLQorIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQg
YS9zcmMvbnZyYW0uYyBiL3NyYy9udnJhbS5jCitpbmRleCAxOTg3YzNkOS4uNDVhNjFlYmYgMTAw
NjQ0CistLS0gYS9zcmMvbnZyYW0uYworKysrIGIvc3JjL252cmFtLmMKK0BAIC04ODYsNiArODg2
LDggQEAgZHVtcF9lcnJsb2coc3RydWN0IG52cmFtICpudnJhbSkKKyAgICAgcmV0dXJuIDA7Cisg
fQorIAorK3N0cnVjdCBydGFzX2V2ZW50OworKworIC8qKgorICAqIGR1bXBfcnRhc19ldmVudF9l
bnRyeQorICAqIEBicmllZiBEdW1wIGV2ZW50LXNjYW4gZGF0YS4KK0BAIC05MDEsMTEgKzkwMywx
MSBAQCBkdW1wX2VycmxvZyhzdHJ1Y3QgbnZyYW0gKm52cmFtKQorIGludAorIGR1bXBfcnRhc19l
dmVudF9lbnRyeShjaGFyICpkYXRhLCBpbnQgbGVuKQorIHsKKy0gICAgdm9pZCAqcnRhc19ldmVu
dDsKKysgICAgc3RydWN0IHJ0YXNfZXZlbnQgKnJ0YXNfZXZlbnQ7CisgICAgIHZvaWQgKmhhbmRs
ZTsKKy0gICAgdm9pZCAqKCpwYXJzZV9ydGFzX2V2ZW50KSgpOworLSAgICB2b2lkICgqcnRhc19w
cmludF9ldmVudCkoKTsKKy0gICAgdm9pZCAoKmNsZWFudXBfcnRhc19ldmVudCkoKTsKKysgICAg
c3RydWN0IHJ0YXNfZXZlbnQgKigqcGFyc2VfcnRhc19ldmVudCkoY2hhciAqLCBpbnQpOworKyAg
ICBpbnQgKCpydGFzX3ByaW50X2V2ZW50KShGSUxFICosIHN0cnVjdCBydGFzX2V2ZW50ICosIGlu
dCk7CisrICAgIGludCAoKmNsZWFudXBfcnRhc19ldmVudCkoc3RydWN0IHJ0YXNfZXZlbnQgKik7
CisgCisgICAgIGhhbmRsZSA9IGRsb3BlbigiL3Vzci9saWIvbGlicnRhc2V2ZW50LnNvIiwgUlRM
RF9MQVpZKTsKKyAgICAgaWYgKGhhbmRsZSA9PSBOVUxMKQotLSAKMi40Ny4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
