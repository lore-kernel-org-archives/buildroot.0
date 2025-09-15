Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650A4CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 18:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320D180870;
	Mon, 15 Sep 2025 18:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6wI4AaslhPe; Mon, 15 Sep 2025 18:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0C58086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0C58086A;
	Mon, 15 Sep 2025 18:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B2C12D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 342AC40800
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rt0n7rErLl3O for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 18:55:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AF5F407F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF5F407F5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AF5F407F5
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:27 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5357A5FFC0;
 Mon, 15 Sep 2025 20:55:20 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Mon, 15 Sep 2025 20:54:48 +0200
Message-ID: <20250915185448.11118-3-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915185448.11118-1-ju.o@free.fr>
References: <20250915185448.11118-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757962525;
 bh=9p/SJ1enZxr4VgNqu2qK7f9uvur3pJszXQBTn2AEdHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KI+r06Bm4AyGLgMZBxBBybLESasLU/OzQc8xWGTDHa1p80v5klTQJSR0WMFO91H8l
 sDL/zh8lHMJe0TjayhAarx3wvo2UJRzvZRjFvfVJraHagg7RxdvAY4OD/yy218lAjW
 ASogL4J4ZyWsuA707CMmONUtk0y2zHre3q/E4U2ragCQxQAU2pgPDuvUX0wT6CGBLA
 10fTbC74/dZ3yD6gP2f9vP6h5INLAx+3j3UH3eJG50k7yn1mEYNYzoMhzMvJnIQoeD
 PB6Ou+yPUE6++156tYWNtTZo+0F4hRvL0C4LpHjBrTlrHTyA7N157tmJk8zpwbO4/6
 5vYssq4Vw1MHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KI+r06Bm
Subject: [Buildroot] [PATCH 3/3] boot/boot-wrapper-aarch64: bump to git
 commit b621b157b4 (2025-06-10)
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgpnaXQgbG9nIC0tb25lbGluZSBhYzY3NDI1MjBkLi5iNjIxYjE1N2I0CgpiNjIx
YjE1IGFhcmNoNjQ6IEVuYWJsZSBhY2Nlc3MgaW50byBGRUFUX1NQRV9GRFMgcmVnaXN0ZXIgZnJv
bSBFTDIgYW5kIGJlbG93Cjc4NTMwMmMgYWFyY2g2NDogRW5hYmxlIHVzZSBvZiBaVDAKN2Y1YTU0
NSBhYXJjaDY0OiBFbmFibGUgdXNlIG9mIEZQTVIKMGYzYTE1MyBhYXJjaDY0OiBzaHVmZmxlIElE
X0FBNjRQRlJ7MCwxfV9FTDEgZGVmaW5pdGlvbnMKMGU3ODQ5MiBNYWtlZmlsZTogRW5zdXJlIGlu
aXRyZCBwYXJhbWV0ZXJzIGluIC9jaG9zZW4gYXJlIHVwLXRvLWRhdGUKMTU3MTM0NSBhYXJjaDY0
OiBFbmFibGUgYWNjZXNzIGludG8gRkVBVF9QTVV2M3A5IHJlZ2lzdGVycyBmcm9tIEVMMiBhbmQg
YmVsb3cKZTFiOTEzNyBhYXJjaDY0OiBFbmFibGUgYWNjZXNzIGludG8gRkVBVF9GR1QyIHJlZ2lz
dGVycyBmcm9tIEVMMiBhbmQgYmVsb3cKCkNjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGxhcG9zdGUubmV0PgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgotLS0KUGF0Y2ggdGVzdGVkIHdpdGggY29tbWFuZHMgb24gYnJhbmNoIG1hc3RlciBhdCBj
b21taXQgY2NiY2IwZDoKCiAgICBtYWtlIGFybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCiAgICBt
YWtlCgpUaGVuIGZvbGxvd2luZyBib290IGluc3RydWN0aW9ucyBmcm9tOgpib2FyZC9hcm0vZm91
bmRhdGlvbi12OC9yZWFkbWUudHh0Ci0tLQogYm9vdC9ib290LXdyYXBwZXItYWFyY2g2NC9ib290
LXdyYXBwZXItYWFyY2g2NC5oYXNoIHwgMiArLQogYm9vdC9ib290LXdyYXBwZXItYWFyY2g2NC9i
b290LXdyYXBwZXItYWFyY2g2NC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9ib290LXdyYXBwZXIt
YWFyY2g2NC9ib290LXdyYXBwZXItYWFyY2g2NC5oYXNoIGIvYm9vdC9ib290LXdyYXBwZXItYWFy
Y2g2NC9ib290LXdyYXBwZXItYWFyY2g2NC5oYXNoCmluZGV4IDQyNzY1M2Q1NWEuLmQ4MTgxNjEw
MDIgMTAwNjQ0Ci0tLSBhL2Jvb3QvYm9vdC13cmFwcGVyLWFhcmNoNjQvYm9vdC13cmFwcGVyLWFh
cmNoNjQuaGFzaAorKysgYi9ib290L2Jvb3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3JhcHBlci1h
YXJjaDY0Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYg
IGZhYTI4NDNlYWEzYmMyMTlkYTViYTlmNjljMDJiNDUwODFhNzYzNDAzOGZhZWY1Y2JhMjE2ZDVl
OTI3Y2EyYmUgIGJvb3Qtd3JhcHBlci1hYXJjaDY0LWFjNjc0MjUyMGRlZDFkYTMwZDUwMGY3NGU4
YWZmZTg2ZTI3Y2FiZDUtZ2l0NC50YXIuZ3oKK3NoYTI1NiAgYzlmY2FjNWUyOGUxNTAxYmNmZmIz
YjM2ZDU2NDg3Y2JlZmNmN2NiNzA4ZTAwZjQ4ZmU2MzYwZWY4MmZiMzg0NyAgYm9vdC13cmFwcGVy
LWFhcmNoNjQtYjYyMWIxNTdiNDJmMWZlMzk4NTIwY2Y0OTlkYjg4YWE2NTRjNzhlMi1naXQ0LnRh
ci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBzaGEyNTYgIGJkYWE0NzliNDk3MzU4
MTUxZmMxMTY2ZGM3NWE2MTNlNjgzMjEzMjBiOTQ1ZTkyZWEwN2E0YjZkYzlhNjMyNzEgIExJQ0VO
U0UudHh0CmRpZmYgLS1naXQgYS9ib290L2Jvb3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3JhcHBl
ci1hYXJjaDY0Lm1rIGIvYm9vdC9ib290LXdyYXBwZXItYWFyY2g2NC9ib290LXdyYXBwZXItYWFy
Y2g2NC5tawppbmRleCAwZjQxZDBkNjdmLi43NWJlMjNmMjQzIDEwMDY0NAotLS0gYS9ib290L2Jv
b3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3JhcHBlci1hYXJjaDY0Lm1rCisrKyBiL2Jvb3QvYm9v
dC13cmFwcGVyLWFhcmNoNjQvYm9vdC13cmFwcGVyLWFhcmNoNjQubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1CT09UX1dSQVBQRVJfQUFSQ0g2NF9WRVJT
SU9OID0gYWM2NzQyNTIwZGVkMWRhMzBkNTAwZjc0ZThhZmZlODZlMjdjYWJkNQorQk9PVF9XUkFQ
UEVSX0FBUkNINjRfVkVSU0lPTiA9IGI2MjFiMTU3YjQyZjFmZTM5ODUyMGNmNDk5ZGI4OGFhNjU0
Yzc4ZTIKIEJPT1RfV1JBUFBFUl9BQVJDSDY0X1NJVEUgPSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tYXJrL2Jvb3Qtd3JhcHBlci1hYXJjaDY0LmdpdAog
Qk9PVF9XUkFQUEVSX0FBUkNINjRfU0lURV9NRVRIT0QgPSBnaXQKIEJPT1RfV1JBUFBFUl9BQVJD
SDY0X0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
