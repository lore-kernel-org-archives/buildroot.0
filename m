Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5977CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BBC484090;
	Fri, 29 Aug 2025 08:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mltuih_2yDBs; Fri, 29 Aug 2025 08:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A190583DF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A190583DF1;
	Fri, 29 Aug 2025 08:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC516C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F83614FE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECOM_GiVB6NB for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16225614C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16225614C0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16225614C0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -21899111; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:35:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uruGX-00B4fz-34;
 Fri, 29 Aug 2025 10:15:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 10:15:20 +0200
Message-Id: <20250829081520.2639539-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=slw3FqHHvZsAmTwfxaprClzAc4yPXpcipCs4+xq9PaRiAdLljMWfoXH44Tt2PPlWiQ6x5l9bpqhREu+EpXexfBG/5wugM5OabgefDabTU3OTLVMq1x5LH88RimxZ489X/TCgaBtBXBJSx486Gv5qDlmIrfBOZg1li5D8Ph5vlJugPRYpul4zWtU+2r1aGngFUbNRtJYiDH1KBu0ck+HVe6yHCfqN5UC+Sf065xueJ+vpv6+Exox5WYX6rmlteaQBZE15oHxMKaAZR0SHG1cbDci+CsmBPVRKE1VLvstVobUEGhIwAkbx2ftuZuSJ7tO3uU/iLB676Vq+7FgL9oGpUw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wVQ/aXan98EUUQGZ1GknbgAv/0sDkBA8g/61NNZrDiI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=slw3FqHH
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/tstools: fix build w/ gcc-15
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
Cc: Tzu-Jung Lee <roylee17@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDLTE1IGRlZmF1bHRzIHRvIEMyMywgd2hpY2ggY2hhbmdlcyB0aGUgbWVhbmluZyBvZiBhbiBl
bXB0eSBwYXJhbWV0ZXIKbGlzdDoKCmh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTE1L3BvcnRpbmdf
dG8uaHRtbCNjMjMtZm4tZGVjbHMtd2l0aG91dC1wYXJhbWV0ZXJzCgpMZWFkaW5nIHRvIGEgYnVp
bGQgZmFpbHVyZToKCnRzc2VydmUuYzogSW4gZnVuY3Rpb24g4oCYc2V0X2NoaWxkX2V4aXRfaGFu
ZGxlcuKAmToKdHNzZXJ2ZS5jOjI5ODg6MjE6IGVycm9yOiBhc3NpZ25tZW50IHRvIOKAmF9fc2ln
aGFuZGxlcl904oCZIHtha2Eg4oCYdm9pZCAoKikoaW50KeKAmX0gZnJvbSBpbmNvbXBhdGlibGUg
cG9pbnRlciB0eXBlIOKAmHZvaWQgKCopKHZvaWQp4oCZIFstV2luY29tcGF0aWJsZS1wb2ludGVy
LXR5cGVzXQogMjk4OCB8ICAgYWN0aW9uLnNhX2hhbmRsZXIgPSBvbl9jaGlsZF9leGl0OwoKQWRk
IGEgcGF0Y2ggZnJvbSBhbiB1cHN0cmVhbSBQUiB0byBmaXggdGhhdC4KClNpZ25lZC1vZmYtYnk6
IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KLS0tCiAuLi4vdHN0b29scy8w
MDAyLWZpeC1idWlsZC13aXRoLWdjYy0xNS5wYXRjaCAgfCAyNyArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvdHN0b29scy8wMDAyLWZpeC1idWlsZC13aXRoLWdjYy0xNS5wYXRjaAoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvdHN0b29scy8wMDAyLWZpeC1idWlsZC13aXRoLWdjYy0xNS5wYXRjaCBiL3Bh
Y2thZ2UvdHN0b29scy8wMDAyLWZpeC1idWlsZC13aXRoLWdjYy0xNS5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xOTNiYWQ0M2I4Ci0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS90c3Rvb2xzLzAwMDItZml4LWJ1aWxkLXdpdGgtZ2NjLTE1LnBhdGNoCkBAIC0w
LDAgKzEsMjcgQEAKK0Zyb20gYTFmMmE3MWIyODYxMzVkODk4NjViYjAzMzJjYmUzZGI1OWNlYTMw
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJ1ZGkgSGVpdGJhdW0gPHJ1ZGlAaGVp
dGJhdW0uY29tPgorRGF0ZTogTW9uLCA5IERlYyAyMDI0IDE2OjU3OjUzICsxMTAwCitTdWJqZWN0
OiBbUEFUQ0hdIGZpeCBidWlsZCB3aXRoIGdjYy0xNQorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRo
dWIuY29tL2t5bmVzaW0vdHN0b29scy9wdWxsLzQ0CitTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3Jz
Z2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CistLS0KKyB0c3NlcnZlLmMgfCAyICstCisgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQg
YS90c3NlcnZlLmMgYi90c3NlcnZlLmMKK2luZGV4IGQ4MTA0MmUuLjI1M2JhMGMgMTAwNjQ0Cist
LS0gYS90c3NlcnZlLmMKKysrKyBiL3Rzc2VydmUuYworQEAgLTI5NTgsNyArMjk1OCw3IEBAIHN0
YXRpYyB2b2lkIHNldF9jaGlsZF9leGl0X2hhbmRsZXIoKTsKKyAvKgorICAqIFNpZ25hbCBoYW5k
bGVyIC0gY2F0Y2ggY2hpbGRyZW4gYW5kIHN0b3AgdGhlbSBiZWNvbWluZyB6b21iaWVzCisgICov
Cistc3RhdGljIHZvaWQgb25fY2hpbGRfZXhpdCgpCisrc3RhdGljIHZvaWQgb25fY2hpbGRfZXhp
dChpbnQgc2lnbnVtKQorIHsKKyAjaWYgMAorICAgcHJpbnRfbXNnKCJzaWdoYW5kbGVyOiBzdGFy
dGluZ1xuIik7CistLSAKKzIuMzkuNQorCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
