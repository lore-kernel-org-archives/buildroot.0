Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566F0EE0206
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 17:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A9A81378;
	Wed, 11 Sep 2024 17:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAYgGhX2Rls7; Wed, 11 Sep 2024 17:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA1D81376
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA1D81376;
	Wed, 11 Sep 2024 17:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F2D1BF306
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 17:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF53460753
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 17:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHMNXciqKO4V for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 17:20:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B635B605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B635B605F9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B635B605F9
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 17:20:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E0A2AB00572;
 Wed, 11 Sep 2024 19:19:54 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 19:19:37 +0200
Message-ID: <20240911171937.10842-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726075198;
 bh=0+SLl+R9wUHS1s3eopzsW/ZZXo4u+MWmguaqa2dFoqg=;
 h=From:To:Cc:Subject:Date:From;
 b=bxG+XlhFeW3/cTzWIdN0ZAusQNtzbNZ2sm6L26dEPEDt74Pig4IGFh6VqXTRTpDV6
 xGgFv2sl089NfeppJ7x6N10+O92mcrceTrqQ2fGEZ40q1nAepoBe8OJiu8VObQMJS5
 a8Fd6cBYQoMwDEqAeXOKeHwkmGRyY/HKyDnUpokjGx2AcMeeHpdJiP8MMeR18C5NHg
 NYgo/bEYuUFuSStKLoOcuorg8tuAH+adLEFnDBziqbzgFXevUKM7DRptA3hLN3W2de
 1HJt+lT7anA0A8djQ9buEdAH6M7Wel3gbQ33cIDllj4ZTCXBDJWRrI2ggBS2LQ9C/I
 VlAYw8xc0AzTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bxG+XlhF
Subject: [Buildroot] [PATCH 1/1] boot/grub2: needs host-python3
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
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB0aGUgYnVpbGQgaG9zdCBkb2VzIG5vdCBoYXZlIGEgUHl0aG9uIGludGVycHJldGVyIGlu
c3RhbGxlZCwKaG9zdC1ncnViMiBpcyBmYWlsaW5nIHRvIGNvbmZpZ3VyZSBkdWUgdG8gdGhpcyBt
aXNzaW5nIGludGVycHJldGVyLgpOb3RlIHRoYXQgaG9zdC1ncnViMiBpcyB0aGUgZmlyc3QgcGFj
a2FnZSB0byBmYWlsIGJlY2F1c2UgaXQgaXMgYQpkZXBlbmRlbmN5IG9mIGdydWIyLiBUaGUgZ3J1
YjIgdGFyZ2V0IHBhY2thZ2UgaGFzIHRoZSBzYW1lIGRlcGVuZGVuY3kKcmVxdWlyZW1lbnQuCgpU
aGUgaXNzdWUgY2FuIGJlIHF1aWNrbHkgcmVwcm9kdWNlZCBvbiBhIGhvc3Qgd2l0aG91dCBQeXRo
b24gd2l0aCB0aGUKY29tbWFuZHM6CgogICAgY2F0IDw8RU9GID4uY29uZmlnCiAgICBCUjJfYWFy
Y2g2ND15CiAgICBCUjJfVEFSR0VUX0dSVUIyPXkKICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9
eQogICAgRU9GCiAgICBtYWtlIG9sZGRlZmNvbmZpZwogICAgbWFrZSBncnViMgoKZ3J1YjIgYXV0
b3Rvb2xzIGNvbmZpZ3VyZS5hYyBzZWFyY2ggZm9yIGEgUHl0aG9uIGludGVycHJldGVyIHNpbmNl
CnVwc3RyZWFtIGNvbW1pdCBbMV0gOGI0Njc4NDRlICJweXRob246IFVzZSBBTV9QQVRIX1BZVEhP
TiB0byBkZXRlcm1pbmUKaW50ZXJwcmV0ZXIgZm9yIGdlbnRwbC5weSIsIGZpcnN0IGluY2x1ZGVk
IGluIGdydWIgdjIuMDQgcmVsZWFzZWQKb24gMjAxOS0wNy0wNC4gRm9yIHJlZmVyZW5jZSwgZ3J1
YjIgaGFzIGJlZW4gdXBkYXRlZCB0byB0aGF0IHZlcnNpb24KaW4gY29tbWl0IFsyXSBlYTdlYzQx
YyAiYm9vdC9ncnViMjogYnVtcCB0byB2ZXJzb24gMi4wNCIuCgpUaGlzIGNvbW1pdCBmaXhlcyB0
aGUgaXNzdWUgYnkgYWRkaW5nIHRoZSBob3N0LXB5dGhvbjMgZGVwZW5kZW5jeSB0bwpob3N0LWdy
dWIyIGFuZCBncnViMi4KCkZpeGVzOgoKICAgIGNoZWNraW5nIGZvciBhIFB5dGhvbiBpbnRlcnBy
ZXRlciB3aXRoIHZlcnNpb24gPj0gMi42Li4uIG5vbmUKICAgIGNvbmZpZ3VyZTogZXJyb3I6IG5v
IHN1aXRhYmxlIFB5dGhvbiBpbnRlcnByZXRlciBmb3VuZAoKWzFdIGh0dHBzOi8vZ2l0LnNhdmFu
bmFoLmdudS5vcmcvZ2l0d2ViLz9wPWdydWIuZ2l0O2E9Y29tbWl0ZGlmZjtoPThiNDY3ODQ0ZTEx
MTcwMDc3YzhjYTcyN2MzOWQyYmQzNmVlYjVmMDgKWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lYTdlYzQxY2Y2NGU4NmE2OTJhYzQ1ZTBkMDEy
YzZlODE5OWVmMTEwCgpSZXBvcnRlZC1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhs
ZUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgot
LS0KIGJvb3QvZ3J1YjIvZ3J1YjIubWsgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9ncnViMi9ncnViMi5t
ayBiL2Jvb3QvZ3J1YjIvZ3J1YjIubWsKaW5kZXggMTI2M2M2M2NmZC4uN2M5NWFkYzczOSAxMDA2
NDQKLS0tIGEvYm9vdC9ncnViMi9ncnViMi5taworKysgYi9ib290L2dydWIyL2dydWIyLm1rCkBA
IC05LDggKzksOCBAQCBHUlVCMl9TSVRFID0gaHR0cDovL2Z0cC5nbnUub3JnL2dudS9ncnViCiBH
UlVCMl9TT1VSQ0UgPSBncnViLSQoR1JVQjJfVkVSU0lPTikudGFyLnh6CiBHUlVCMl9MSUNFTlNF
ID0gR1BMLTMuMCsKIEdSVUIyX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCi1HUlVCMl9ERVBFTkRF
TkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWdhd2sgaG9zdC1ncnViMgotSE9TVF9H
UlVCMl9ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWdhd2sKK0dSVUIy
X0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9zdC1mbGV4IGhvc3QtZ2F3ayBob3N0LWdydWIy
IGhvc3QtcHl0aG9uMworSE9TVF9HUlVCMl9ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3Qt
ZmxleCBob3N0LWdhd2sgaG9zdC1weXRob24zCiBHUlVCMl9JTlNUQUxMX0lNQUdFUyA9IFlFUwog
CiAjIENWRS0yMDE5LTE0ODY1IGlzIGFib3V0IGEgZmxhdyBpbiB0aGUgZ3J1YjItc2V0LWJvb3Rm
bGFnIHRvb2wsIHdoaWNoCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
