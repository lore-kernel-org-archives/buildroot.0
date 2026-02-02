Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC9CE7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDBFD60BD2;
	Mon,  2 Feb 2026 17:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbBCKcVg6TtG; Mon,  2 Feb 2026 17:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0AB36076C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053814;
	bh=Q4my9+M5/NWT9j5DMXQJ+P18gmEOWUVrQrzovupdGvg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=gw6A3J4eBn0zYgV+ZuPWjSCPm3GCkm6WLptp591dVWakZ7a72gpsh3tiU9bsLJwAA
	 Ly4pjLeT6HA0467mueKBtj+q/Ha/4huzy8w2g2O3EMa04Jzat8XanPYK3DBVL4+tXT
	 CKQ5oNCCu5FBkrkTSox07A8vyxZZiV6TojPVmCNS43HVa+/xF2LyaJZZV9MGhN3yoB
	 HLAWtsQ2dYgNjuLclUCkZMQTFwdDmMpP+69974Wi9S5J6RISu6L0Qc0e71V3dOW+dS
	 MT8Z87ajpM/3HNPnlMGTyrFHrat885QRWlApOiSUlcH1lp0Scrfw18tPRhA1V2oneQ
	 7T/UL6chHyS9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0AB36076C;
	Mon,  2 Feb 2026 17:36:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D447C149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC8A66076C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOvn9E82DQSV for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D109460744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D109460744
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D109460744
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:36:51 +0000 (UTC)
Received: from framework-OT (host-109-89-232-55.dynamic.voo.be [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 25B8D2C82ED6;
 Mon, 02 Feb 2026 18:36:49 +0100 (CET)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Mon,  2 Feb 2026 18:36:58 +0100
Message-ID: <20260202173700.428773-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770053809; bh=V9aAdZLyCQ6387mnSZshGznDBTtndXxlZBPI7CXkW+c=;
 h=From:To:Cc:Subject:Date;
 b=qNuvSPHob/alKhfMKyignzLjcbeZojeNPreqbORugefgyXhxZ/G5bnzjnifoHgNkq
 ImRao85bWmILaHJu3V5a3lSsBY/S3Agd5jYJACazy6D5QNHZ5r0todkrJbFiTllekt
 r30dEnGkFM6kwIvQDcV3hfTWBzachIO1lwrqlTkP9R/lBwALgPTZaO4Fcpn2Lp/lrx
 lHUaAUmqbtNXypEatytSOw5KqtGQBy+ffT5gMLpaiW82rjFER1loLXupni1Z9NIPlI
 mGEuzIkFtSZ4vaFPiCQbxIniZ7JMFt80cTAuJbjsHSXEhnVqLlXKBXXrzwXMwnPfpX
 BJvaIR2o9N1bA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=qNuvSPHo
Subject: [Buildroot] [PATCH] package/systemd: fix building with libsseccomp
 and kernel headers < 5.8
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBhbHNvIGZpeGVkIGluIHN5c3RlbWQgdjI1OCsuCgpGaXhlczogaHR0cHM6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzhmZi84ZmY3N2U3OWNjNzM3M2Y0NTJjMjUyMTJj
N2UyMDU4MzY4Y2RkMDVmLwoKU2lnbmVkLW9mZi1ieTogTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJv
b3RAYnVidTEuZXU+Ci0tLQogLi4ubmx5LWFkZC1icGYtc3lzY2FsbC10by1zZWNjb21wLWFsbG93
LnBhdGNoIHwgNDYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3N5c3RlbWQvMDAwMS1uc3Bhd24t
c2VjY29tcC1vbmx5LWFkZC1icGYtc3lzY2FsbC10by1zZWNjb21wLWFsbG93LnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kLzAwMDEtbnNwYXduLXNlY2NvbXAtb25seS1hZGQtYnBm
LXN5c2NhbGwtdG8tc2VjY29tcC1hbGxvdy5wYXRjaCBiL3BhY2thZ2Uvc3lzdGVtZC8wMDAxLW5z
cGF3bi1zZWNjb21wLW9ubHktYWRkLWJwZi1zeXNjYWxsLXRvLXNlY2NvbXAtYWxsb3cucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNGE3NDA4MzM5MQotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2Uvc3lzdGVtZC8wMDAxLW5zcGF3bi1zZWNjb21wLW9ubHktYWRk
LWJwZi1zeXNjYWxsLXRvLXNlY2NvbXAtYWxsb3cucGF0Y2gKQEAgLTAsMCArMSw0NiBAQAorRnJv
bSBlNmFiNzIzYzk2YjkxZTdjNGM0OTVmY2VmMDY1NDEwMmZhYzI2NTcwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogTWFyY3VzIEhvZmZtYW5uIDxidWJ1QGJ1YnUxLmV1PgorRGF0ZTog
TW9uLCAyIEZlYiAyMDI2IDE4OjI2OjE5ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIG5zcGF3bi1z
ZWNjb21wOiBvbmx5IGFkZCBicGYgc3lzY2FsbCB0byBzZWNjb21wIGFsbG93bGlzdCBpZgorIGhl
YWRlcnMgZGVmaW5lIENBUF9CUEYKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRl
eHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQK
KworV2hlbiBidWlsZGluZyBzeXN0ZW1kIHdpdGgga2VybmVsIGhlYWRlcnMgPCA1LjggKHdoaWNo
IGFkZGVkIENBUF9CUEYpIGl0IGZhaWxzIHdpdGg6CisKKyAgLi4vc3JjL25zcGF3bi9uc3Bhd24t
c2VjY29tcC5jOiBJbiBmdW5jdGlvbiDigJhhZGRfc3lzY2FsbF9maWx0ZXJz4oCZOgorICAuLi9z
cmMvbnNwYXduL25zcGF3bi1zZWNjb21wLmM6MTE0OjE5OiBlcnJvcjog4oCYQ0FQX0JQRuKAmSB1
bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKKyAgICAxMTQgfCAgICAgICAg
ICAgICAgICAgeyBDQVBfQlBGLCAgICAgICAgICAgICJicGYiLCAgICAgICAgICAgICAgICAgICAg
ICAgICB9LAorICAgICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KKyAgLi4vc3JjL25z
cGF3bi9uc3Bhd24tc2VjY29tcC5jOjExNDoxOTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50
aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMg
aW4KKworSWYgdGhlIGtlcm5lbCBoZWFkZXJzIGRvbid0IGRlZmluZSBDQVBfQlBGLCBpdCdzIGxp
a2VseSB0aGF0IHRoZSBydW5uaW5nCitrZXJuZWwgZG9lc24ndCBrbm93IGFib3V0IHRoaXMgY2Fw
YWJpbGl0eSBlaXRoZXIsIHNvIHdlIGNhbiBhc3N1bWUgdGhhdAord2UnZCBuZXZlciBhbGxvdyB0
aGlzIHN5c2NhbGwgYW55d2F5LgorCitTbyBpZiBDQVBfQlBGIGlzbid0IGRlZmluZWQsIGp1c3Qg
c2tpcCB0aGlzIGFsbG93X2xpc3QgZW50cnkgZW50aXJlbHkuCisKK1NpZ25lZC1vZmYtYnk6IE1h
cmN1cyBIb2ZmbWFubiA8YnVidUBidWJ1MS5ldT4KK1Vwc3RyZWFtOiBOL0EgLSBmaXhlZCBpbiBz
eXN0ZW1kID49IDI1OCBieSBpbnRyb2R1Y2luZyB2ZW5kb3JlZCBrZXJuZWwgaGVhZGVycyBmb3Ig
dGhpcyB1c2UtY2FzZWEKKy0tLQorIHNyYy9uc3Bhd24vbnNwYXduLXNlY2NvbXAuYyB8IDIgKysK
KyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9zcmMvbnNw
YXduL25zcGF3bi1zZWNjb21wLmMgYi9zcmMvbnNwYXduL25zcGF3bi1zZWNjb21wLmMKK2luZGV4
IDY5NTY2ODlhYjUuLmFhYWM2MDg1YjYgMTAwNjQ0CistLS0gYS9zcmMvbnNwYXduL25zcGF3bi1z
ZWNjb21wLmMKKysrKyBiL3NyYy9uc3Bhd24vbnNwYXduLXNlY2NvbXAuYworQEAgLTEwOCw3ICsx
MDgsOSBAQCBzdGF0aWMgaW50IGFkZF9zeXNjYWxsX2ZpbHRlcnMoCisgICAgICAgICAgICAgICAg
IHsgQ0FQX1NZU19CT09ULCAgICAgICAicmVib290IiAgICAgICAgICAgICAgICAgICAgICAgfSwK
KyAgICAgICAgICAgICAgICAgeyBDQVBfU1lTTE9HLCAgICAgICAgICJzeXNsb2ciICAgICAgICAg
ICAgICAgICAgICAgICB9LAorICAgICAgICAgICAgICAgICB7IENBUF9TWVNfVFRZX0NPTkZJRywg
InZoYW5ndXAiICAgICAgICAgICAgICAgICAgICAgIH0sCisrI2lmZGVmIENBUF9CUEYKKyAgICAg
ICAgICAgICAgICAgeyBDQVBfQlBGLCAgICAgICAgICAgICJicGYiLCAgICAgICAgICAgICAgICAg
ICAgICAgICB9LAorKyMgZW5kaWYKKyAKKyAgICAgICAgICAgICAgICAgLyoKKyAgICAgICAgICAg
ICAgICAgICogVGhlIGZvbGxvd2luZyBzeXNjYWxscyBhbmQgZ3JvdXBzIGFyZSBrbm93aW5nbHkg
ZXhjbHVkZWQ6CistLSAKKzIuNTIuMAorCi0tIAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
