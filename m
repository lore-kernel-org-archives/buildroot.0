Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7B2E81A29
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D3760B8A;
	Mon, 16 Feb 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ_ewvTo3JZZ; Mon, 16 Feb 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D2060B8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771252004;
	bh=zqwnHmRTN5vhyMldlKWhnt6IlOirQXdctGU4Ezr6Hwk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jrKtvFCCYenDUkthcJ/pYqqRoEhe+9DkLyU2G6FAmp/CsCwOvI6TTO5MTDtv0TCLf
	 Hl/voVbcOkQrS/pCDPPJeghrlJyk1T53ogbIw/jXIbavPZoPHORsOX6fjXxKZ64Iw/
	 6V498IIs17/jyNeQGQOp4/1g4JEmY0JdJqa8RYfw42tLfbZPO0fDpZiBM1arvAmvMF
	 a4+RRw/io8BzC1BLl0/4H381ngB0hFvgFS6QespPvnTZmWIWQuo8zmoG6o3Ue+NTKy
	 OMaJeAXdYdPtdKkec4xcCWJAEwV/LajmsNNJToa94vdX/52kXMt0hvU93TY26fbCmJ
	 xkaS/64HdGDhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D2060B8B;
	Mon, 16 Feb 2026 14:26:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF5E1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14D564031B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DA7xoVnqU1Au for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 14:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8FF540245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8FF540245
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8FF540245
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:26:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 096B51A0F9F;
 Mon, 16 Feb 2026 14:26:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CDBB0606CF;
 Mon, 16 Feb 2026 14:26:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF2D11036916C; Mon, 16 Feb 2026 15:26:38 +0100 (CET)
Date: Mon, 16 Feb 2026 15:26:33 +0100
MIME-Version: 1.0
Message-Id: <20260216-host-dtc-build-failure-v1-1-75dd77ff4650@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1ga0izpcRVxommqgVOkggnh3i
 8u3+P+ByEE4wlg9EPiSKIcvaOsKaF/8xiimGFSjdKNajfsRE5pEuGZxBu0iLgdGst3aE2mjhw5
 KfAa2cv/jaX7fD6CswrRoAAAA
X-Change-ID: 20260216-host-dtc-build-failure-cf7b8cc6d697
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Brandon Maier <brandon.maier@gmail.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771251999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=IvLwDfZNR0KhxGknG5RuDEbPwB8WA+A1+8bFYBmcS+4=;
 b=nlPFGlt/7jj6akNgpFpIWC4I1zgM98KTYezNXnwlT/tTlSVSQppDjjHYPhx3Bl3ahGU3r4
 PaBgWEj/fq3+KbpMWYRAV0t9FNQ8hqkN0clhqW4cLkNixUjFd2jcYG8jqX6CsDflcOb7mZ
 Zh8cVbCjIpfWCHIEIxMcsF4glI1IyUT+YGQtdLQ0zeu3eJzfyBKbHhFaGfnivDatGcCLus
 b8CGnv3eUVZD2O+kd5Mt0INTQFnxU0BNvFNtMAr9onX4dN75ZxFygyEBfwaPGeZU+R6j3S
 3roFSy+7u0NgbkKXQyW9PG8dWbxoQUPcaE4tyDUBP2CZ1YgrkCdc+99CxPFP2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=nlPFGlt/
Subject: [Buildroot] [PATCH] package/dtc: fix host build with glibc 2.43
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB0cnlpbmcgdG8gYnVpbGQgaG9zdC1kdGMgb24gYSBob3N0IHdpdGggZ2xpYmMgMi40Mywg
dGhlIGJ1aWxkIGZhaWxzCm9uIHRoZSBmb2xsb3dpbmcgZXJyb3I6CgogIGxpYmZkdC9mZHRfb3Zl
cmxheS5jOiBJbiBmdW5jdGlvbiDigJhvdmVybGF5X2ZpeHVwX3BoYW5kbGXigJk6CiAgbGliZmR0
L2ZkdF9vdmVybGF5LmM6NDI0OjIxOiBlcnJvcjogYXNzaWdubWVudCBkaXNjYXJkcyDigJhjb25z
dOKAmQogIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2Fy
ZGVkLXF1YWxpZmllcnNdCiAgICA0MjQgfCAgICAgICAgICAgICAgICAgc2VwID0gbWVtY2hyKGZp
eHVwX3N0ciwgJzonLCBmaXh1cF9sZW4pOwogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICBe
CiAgbGliZmR0L2ZkdF9vdmVybGF5LmM6NDM0OjIxOiBlcnJvcjogYXNzaWdubWVudCBkaXNjYXJk
cyDigJhjb25zdOKAmQogIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZXJy
b3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCiAgICA0MzQgfCAgICAgICAgICAgICAgICAgc2VwID0g
bWVtY2hyKG5hbWUsICc6JywgZml4dXBfbGVuKTsKICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgXgogIGZkdHB1dC5jOiBJbiBmdW5jdGlvbiDigJhjcmVhdGVfbm9kZeKAmToKICBmZHRwdXQu
YzoyMzU6MTE6IGVycm9yOiBhc3NpZ25tZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmll
ciBmcm9tCiAgcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVy
c10KICAgIDIzNSB8ICAgICAgICAgcCA9IHN0cnJjaHIobm9kZV9uYW1lLCAnLycpOwogICAgICAg
IHwgICAgICAgICAgIF4KICBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9y
cwogIG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MzU5OiBmZHRwdXQub10gRXJyb3IgMQogIG1ha2Vb
Ml06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgY2MxOiBhbGwgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKICBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjM1OTog
bGliZmR0L2ZkdF9vdmVybGF5Lm9dIEVycm9yIDEKICBtYWtlWzFdOiAqKiogW3BhY2thZ2UvcGtn
LWdlbmVyaWMubWs6MjczOgogIC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290L2R0Yy9idWlsZC9o
b3N0LWR0Yy0xLjcuMi8uc3RhbXBfYnVpbHRdIEVycm9yIDIKICBtYWtlOiAqKiogW01ha2VmaWxl
OjgzOiBfYWxsXSBFcnJvciAyCgpUaGUgaXNzdWUgY2FuIGJlIHJlcHJvZHVjZWQgb24gbWFzdGVy
IHdpdGggdGhpcyBtaW5pbWFsIGRlZmNvbmZpZyBvbiBhCmhvc3QgaGF2aW5nIGdsaWJjIDIuNDM6
CgogIEJSMl94ODZfNjQ9eQogIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogIEJSMl9QQUNLQUdF
X1FPUklRX01DX1VUSUxTPXkKCihRT1JJUV9NQ19VVElMUyB3aWxsIHB1bGwgSE9TVF9EVEMpCgpU
aGlzIGVycm9yIGlzIGR1ZSB0byBzb21lIGZ1bmN0aW9ucyBwcm90b3R5cGUgdXBkYXRlIGluIGds
aWJjIDIuNDMgZm9yCklTTyBDMjMgKHNlZSBbMV0sIHBvaW50IDMgaW4gdGhlIE5FV1MgbGlzdCku
IFRoZSBjb3JyZXNwb25kaW5nIGZpeCBoYXMKYWxyZWFkeSBiZWVuIGludGVncmF0ZWQgdXBzdHJl
YW0sIGJ1dCBpdCBoYXMgbm90IGJlZW4gcmVsZWFzZWQgc2luY2UKdGhlbi4KCkJyaW5nIHRoZSBj
b3JyZXNwb25kaW5nIHVwc3RyZWFtIHBhdGNoIHRvIGFsbG93IGhvc3QtZHRjIHRvIGJ1aWxkIG9u
CmFmZmVjdGVkIGhvc3RzLgoKWzFdIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwv
aW5mby1nbnUvMjAyNi0wMS9tc2cwMDAwNS5odG1sCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90
aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KVGhlIGlzc3VlIGFmZmVjdHMg
Ym90aCBtYXN0ZXIgYW5kIDIwMjUuMDIueAotLS0KIC4uLi9kdGMvMDAwMi1maXgtZGlzY2FyZGVk
LWNvbnN0LXF1YWxpZmllcnMucGF0Y2ggIHwgODggKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2R0Yy8w
MDAyLWZpeC1kaXNjYXJkZWQtY29uc3QtcXVhbGlmaWVycy5wYXRjaCBiL3BhY2thZ2UvZHRjLzAw
MDItZml4LWRpc2NhcmRlZC1jb25zdC1xdWFsaWZpZXJzLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOTVkYjg4NjM4OWNkCi0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9kdGMvMDAwMi1maXgtZGlzY2FyZGVkLWNvbnN0LXF1YWxpZmllcnMucGF0Y2gKQEAg
LTAsMCArMSw4OCBAQAorRnJvbSA5YTFjODAxYTFhM2MxMDJiZjk1YzUzMzljOWU5ODViMjZiODIz
YTIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogU3RlcGhlbiBHYWxsYWdoZXIgPHNn
YWxsYWdoQHJlZGhhdC5jb20+CitEYXRlOiBUdWUsIDYgSmFuIDIwMjYgMTQ6MTk6MzAgLTA1MDAK
K1N1YmplY3Q6IEZpeCBkaXNjYXJkZWQgY29uc3QgcXVhbGlmaWVycworCitJdCdzIHVuc2FmZSB0
byBpbXBsaWNpdGx5IGRpc2NhcmQgdGhlIGNvbnN0IHF1YWxpZmllciBvbiBhIHBvaW50ZXIuIElu
CitvdmVybGF5X2ZpeHVwX3BoYW5kbGUoKSwgdGhpcyB3YXMgcHJvYmFibHkganVzdCBhbiBvdmVy
c2lnaHQsIGFuZCBtYWtpbmcKK3RoZSAic2VwIiB2YXJpYWJsZSBhIGNvbnN0IGNoYXIgKiBpcyBz
dWZmaWNpZW50IHRvIGZpeCBpdC4KKworSW4gY3JlYXRlX25vZGUoKSwgaG93ZXZlciwgdGhlICJw
IiB2YXJpYWJsZSBpcyBkaXJlY3RseSBtb2RpZnlpbmcgdGhlCitidWZmZXIgcG9pbnRlZCB0byBi
eSAiY29uc3QgY2hhciogbm9kZV9uYW1lIi4gVG8gZml4IHRoaXMsIHdlIG5lZWQgdG8KK2FjdHVh
bGx5IG1ha2UgYSBkdXBsaWNhdGUgb2YgdGhlIGJ1ZmZlciBhbmQgb3BlcmF0ZSBvbiB0aGF0IGlu
c3RlYWQuCisKK1RoaXMgaW50cm9kdWNlcyBhIG1hbGxvYygpL2ZyZWUoKSAgYW5kIGFuIHVuYm91
bmRlZCBzdHJkdXAoKSBpbnRvIHRoZQorb3BlcmF0aW9uLCBidXQgZmR0cHV0IGlzbid0IGEgbG9u
Zy1ydW5uaW5nIHNlcnZpY2UgYW5kIHRoZSBub2RlX25hbWUKK2FyZ3VtZW50IGNvbWVzIGRpcmVj
dGx5IGZyb20gYXJndiwgc28gdGhpcyBzaG91bGRuJ3QgaW50cm9kdWNlIGEKK3NpZ25pZmljYW50
IHBlcmZvcm1hbmNlIGltcGFjdC4KKworU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBHYWxsYWdoZXIg
PHNnYWxsYWdoQHJlZGhhdC5jb20+CitTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlk
QGdpYnNvbi5kcm9wYmVhci5pZC5hdT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vdXRpbHMvZHRjL2R0Yy5naXQvY29tbWl0Lz9pZD05YTFjODAxYTFhM2MxMDJiZjk1
YzUzMzljOWU5ODViMjZiODIzYTIxCitTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFs
ZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgorCistLS0KKyBmZHRwdXQuYyAgICAgICAgICAgICB8
IDggKysrKystLS0KKyBsaWJmZHQvZmR0X292ZXJsYXkuYyB8IDMgKystCisgbWVzb24uYnVpbGQg
ICAgICAgICAgfCAxICsKKyAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2ZkdHB1dC5jIGIvZmR0cHV0LmMKK2luZGV4IDA1ZjJi
OTMuLmZkYjU4MWEgMTAwNjQ0CistLS0gYS9mZHRwdXQuYworKysrIGIvZmR0cHV0LmMKK0BAIC0y
NTQsMTkgKzI1NCwyMSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9wYXRocyhjaGFyICoqYmxvYiwgY29u
c3QgY2hhciAqaW5fcGF0aCkKKyBzdGF0aWMgaW50IGNyZWF0ZV9ub2RlKGNoYXIgKipibG9iLCBj
b25zdCBjaGFyICpub2RlX25hbWUpCisgeworIAlpbnQgbm9kZSA9IDA7CistCWNoYXIgKnA7Cisr
CWNvbnN0IGNoYXIgKnA7CisrCWNoYXIgKnBhdGggPSBOVUxMOworIAorIAlwID0gc3RycmNocihu
b2RlX25hbWUsICcvJyk7CisgCWlmICghcCkgeworIAkJcmVwb3J0X2Vycm9yKG5vZGVfbmFtZSwg
LTEsIC1GRFRfRVJSX0JBRFBBVEgpOworIAkJcmV0dXJuIC0xOworIAl9CistCSpwID0gJ1wwJzsK
KyAKKyAJKmJsb2IgPSByZWFsbG9jX25vZGUoKmJsb2IsIHAgKyAxKTsKKyAKKyAJaWYgKHAgPiBu
b2RlX25hbWUpIHsKKy0JCW5vZGUgPSBmZHRfcGF0aF9vZmZzZXQoKmJsb2IsIG5vZGVfbmFtZSk7
CisrCQlwYXRoID0geHN0cm5kdXAobm9kZV9uYW1lLCAoc2l6ZV90KShwIC0gbm9kZV9uYW1lKSk7
CisrCQlub2RlID0gZmR0X3BhdGhfb2Zmc2V0KCpibG9iLCBwYXRoKTsKKysJCWZyZWUocGF0aCk7
CisgCQlpZiAobm9kZSA8IDApIHsKKyAJCQlyZXBvcnRfZXJyb3Iobm9kZV9uYW1lLCAtMSwgbm9k
ZSk7CisgCQkJcmV0dXJuIC0xOworZGlmZiAtLWdpdCBhL2xpYmZkdC9mZHRfb3ZlcmxheS5jIGIv
bGliZmR0L2ZkdF9vdmVybGF5LmMKK2luZGV4IGU2YjllYjYuLjUxYTM4NTkgMTAwNjQ0CistLS0g
YS9saWJmZHQvZmR0X292ZXJsYXkuYworKysrIGIvbGliZmR0L2ZkdF9vdmVybGF5LmMKK0BAIC00
MDcsNyArNDA3LDggQEAgc3RhdGljIGludCBvdmVybGF5X2ZpeHVwX3BoYW5kbGUodm9pZCAqZmR0
LCB2b2lkICpmZHRvLCBpbnQgc3ltYm9sc19vZmYsCisgCQljb25zdCBjaGFyICpmaXh1cF9zdHIg
PSB2YWx1ZTsKKyAJCXVpbnQzMl90IHBhdGhfbGVuLCBuYW1lX2xlbjsKKyAJCXVpbnQzMl90IGZp
eHVwX2xlbjsKKy0JCWNoYXIgKnNlcCwgKmVuZHB0cjsKKysJCWNvbnN0IGNoYXIgKnNlcDsKKysJ
CWNoYXIgKmVuZHB0cjsKKyAJCWludCBwb2Zmc2V0LCByZXQ7CisgCisgCQlmaXh1cF9lbmQgPSBt
ZW1jaHIodmFsdWUsICdcMCcsIGxlbik7CitkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNv
bi5idWlsZAoraW5kZXggNjZiNDRlOC4uNTAxYjcwNiAxMDA2NDQKKy0tLSBhL21lc29uLmJ1aWxk
CisrKysgYi9tZXNvbi5idWlsZAorQEAgLTE4LDYgKzE4LDcgQEAgYWRkX3Byb2plY3RfYXJndW1l
bnRzKAorICAgICAnLVdzaGFkb3cnLAorICAgICAnLVdzdWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXQn
LAorICAgICAnLVd3cml0ZS1zdHJpbmdzJywKKysgICAgJy1XZGlzY2FyZGVkLXF1YWxpZmllcnMn
LAorICAgXSksCisgICBsYW5ndWFnZTogJ2MnCisgKQorLS0gCitjZ2l0IDEuMi4zLWtvcmcKKwor
CgotLS0KYmFzZS1jb21taXQ6IGJlYWJkOGJhZWVmMzdmMTc4MGY1MmUzYzlkNDY0YzYxMTczMWJh
OTgKY2hhbmdlLWlkOiAyMDI2MDIxNi1ob3N0LWR0Yy1idWlsZC1mYWlsdXJlLWNmN2I4Y2M2ZDY5
NwoKQmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290
bGluLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
