Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302BEC5AC67
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 21:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBE0860842;
	Thu,  6 Aug 2026 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gL5PpawiN-u; Thu,  6 Aug 2026 21:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3411860846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786051490;
	bh=8pm2o46U9UEVusy/EZ5Nl6OD7dYJRXP6HoRdGhDULG4=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tA7tgg3aUrLPxi5BbHsxDz86dsS5gUCbkEMHcgiN5eAoxAivkVjYLEKUAHeFhn0DW
	 83qfIFZn5xCOc8FJgQm2L+/JU5v+A9QOC+R0k2bGHgf76rVFZmMdc1zB0qLc+No26o
	 NCPRds8CDAdgIWQW2EF00m95YOxwDVQyMwEzOtSSlpcIWL6lsdXGzf9egPhN3tgM+I
	 3v0BLuaKgWygL9rf2S7ECBzbSz6+bygukyJq0y8Gg1vYfQXu+nKKxAqWvV5l6/JNKE
	 2tl8kvp0kDCCKGNWKaR0NMo+a05sCAW2oFdhY+2BYOk4huf+ShFDduy+hjVLBGJ5Xs
	 FCkqYi5c+3BgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3411860846;
	Thu,  6 Aug 2026 21:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F08218
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B1FE40869
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZ7RAIUJ9pyD for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 21:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D84040875
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D84040875
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D84040875
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E0AD51A1485
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF1015FEF7;
 Thu,  6 Aug 2026 21:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DCAFB11C36D53; 
 Thu,  6 Aug 2026 23:24:39 +0200 (CEST)
Date: Thu, 06 Aug 2026 23:24:23 +0200
MIME-Version: 1.0
Message-Id: <20260806-host_tools-v1-2-19c63ecc3b10@bootlin.com>
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
In-Reply-To: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786051480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rNYO5hJudwWl7F0UviLQJ2vQSa3aswyDJRuYZNUCB7o=;
 b=IBl6+W5/ZtRAIPR0E8IJNjXkouwAjo7bzGcFQtzNH4S6NmpoJNJfWr+bJO1OiQQlxoIA+j
 n0CLbXmgqIzohwGn+rOM6DLQ4hA5VmqNof6Bb7hszEK0ba+d5KzdxzeeAuF7wPV45qv0zn
 fLM/KJT6938li1jwWWAvRueFojT5vWgJire2g1/IlR4vrJFwuPkJ8DbfINi/M6MZ5+0XFE
 CNyRIh5/9WQrkPj0+c2PabykDdjuijA31lAQXntqb07AN1hVmgOl3EMuRPxrjpvZ+a8wY8
 JUbcYXOn0QhMc36OOZBLNOxZ41sNxyiXogaLnaxsIlgEyaxlqwDuPFtGiDY9mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IBl6+W5/
Subject: [Buildroot] [PATCH 2/2] package/sass: new package
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

c2FzcyBpcyBhIGNzcyBleHRlbnNpb24gYWRkaW5nIHByb2dyYW1taW5nIGZlYXR1cmVzIHRvIGNz
cy4KCmh0dHBzOi8vZ2l0aHViLmNvbS9zYXNzL2RhcnQtc2FzcwoKVGhlIHNvdXJjZSBjb25maWd1
cmVkIGZvciB0aGUgcGFja2FnZSBpcyBub3QgYSBnaXRodWIgcmVwb3NpdG9yeSwgYXMgdGhlCm9m
ZmljaWFsIHNvdXJjZXMgZm9yIHNhc3MgYXJlIGluIGZhY3QgaW4gRGFydDogdGhvc2Ugc291cmNl
cyBhcmUKYXV0b21hdGljYWxseSBidWlsdCBpbnRvIGEgamF2YXNjcmlwdCBtb2R1bGUgYnkgdGhl
IGNvcnJlc3BvbmRpbmcgZ2l0aHViCndvcmtmbG93IChbMV0pLiBSYXRoZXIgdGhhbiB0cnlpbmcg
dG8gcmVwbGljYXRlIHRoZSB3aG9sZSBkYXJ0IGJ1aWxkLAp0aGlzIG5ldyBwYWNrYWdlIGp1c3Qg
ZG93bmxvYWRzIHRoZSBzb3VyY2VzIGZvciBzYXNzIGZyb20gbnBtanMKZGlyZWN0bHkuCgpbMV0K
aHR0cHM6Ly9naXRodWIuY29tL3Nhc3MvZGFydC1zYXNzL2Jsb2IvbWFpbi8uZ2l0aHViL3dvcmtm
bG93cy9yZWxlYXNlLnltbAoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvQ29uZmlnLmluLmhvc3QgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9zYXNzL0NvbmZpZy5pbi5ob3N0
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysKIHBhY2thZ2Uvc2Fzcy9zYXNzLmhh
c2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL3Nhc3Mvc2Fz
cy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2Fzcy5weSAgICAgICAg
IHwgMjMgKysrKysrKysrKysrKysrKysKIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2Fzcy9zYW1w
bGVfc2Fzcy5zY3NzICAgICAgIHwgIDcgKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDMwMjdk
MTMxMDUyOC4uNGZlZTliOTc4NDY3IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVM
T1BFUlMKQEAgLTE1OCw2ICsxNTgsNyBAQCBOOiAJQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90
aG9yZUBib290bGluLmNvbT4KIEY6CXBhY2thZ2UvbGlieG1sc2VjMS8KIEY6CXBhY2thZ2Uvb3Bl
bnNjYXAvCiBGOiAJcGFja2FnZS9weXRob24tc2NwLworRjoJcGFja2FnZS9zYXNzLwogRjoJcGFj
a2FnZS91Z2xpZnlqcy8KIAogTjoJQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIy
My5tZT4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL0NvbmZp
Zy5pbi5ob3N0CmluZGV4IDBlNGUyOWNkMzUxNC4uNGM1ZWQzODY1Y2IzIDEwMDY0NAotLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbi5ob3N0CisrKyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKQEAgLTEw
OSw2ICsxMDksNyBAQCBtZW51ICJIb3N0IHV0aWxpdGllcyIKIAlzb3VyY2UgInBhY2thZ2UvcnVz
dGMvQ29uZmlnLmluLmhvc3QiCiAJc291cmNlICJwYWNrYWdlL3M2LXJjL0NvbmZpZy5pbi5ob3N0
IgogCXNvdXJjZSAicGFja2FnZS9zYW0tYmEvQ29uZmlnLmluLmhvc3QiCisJc291cmNlICJwYWNr
YWdlL3Nhc3MvQ29uZmlnLmluLmhvc3QiCiAJc291cmNlICJwYWNrYWdlL3NkYnVzLWNwcC9Db25m
aWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2Uvc2RidXNwbHVzL0NvbmZpZy5pbi5ob3N0Igog
CXNvdXJjZSAicGFja2FnZS9zZW50cnktY2xpL0NvbmZpZy5pbi5ob3N0IgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9zYXNzL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9zYXNzL0NvbmZpZy5pbi5ob3N0
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMTNmNDdlZmM4ZTg0Ci0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zYXNzL0NvbmZpZy5pbi5ob3N0CkBAIC0wLDAgKzEs
OCBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfU0FTUworCWJvb2wgImhvc3Qgc2FzcyIKKwlo
ZWxwCisJICBzYXNzIGlzIGEgcHVyZSBqYXZhc2NyaXB0IERhcnQgU2FzcyBkaXN0cmlidXRpb24s
IHdpdGggU2FzcworCSAgYmVpbmcgYSBDU1MgcHJlcHJvY2Vzc29yLCBhbGxvd2luZyB0byB1c2Ug
cHJvZ3JhbW1pbmcgZmVhdHVyZXMKKwkgIHdpdGggQ1NTCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9zYXNzL2RhcnQtc2FzcwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zYXNzL3Nhc3MuaGFzaCBiL3Bh
Y2thZ2Uvc2Fzcy9zYXNzLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi5kOGNjZTBkYTlkNGEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3Nhc3Mvc2Fzcy5o
YXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgY2MwYTlh
OGY5MDI1YzYwYzEzZWZmMjE0YTEzZjcxY2JkMGI3NjA1MWRiZTZlNTZmMjQ5OTBkYTczYjg1ZWZk
YiAgc2Fzcy0xLjEwMi4wLnRnegorc2hhMjU2ICAxNTIzMDExZGMxYzYxMzZhYzJjNDY4OWY5M2Iy
MDNmMTE2OTA4NDhkOTY0MTE4OWI3YTQwODQ4NTAyZDIxNTY4ICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3Nhc3Mvc2Fzcy5tayBiL3BhY2thZ2Uvc2Fzcy9zYXNzLm1rCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYzc5MTA5YmU0NGEyCi0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9zYXNzL3Nhc3MubWsKQEAgLTAsMCArMSwzMCBAQAorIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKKyMKKyMgc2FzcworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworU0FT
U19WRVJTSU9OID0gMS4xMDIuMAorU0FTU19TT1VSQ0UgPSBzYXNzLSQoU0FTU19WRVJTSU9OKS50
Z3oKK1NBU1NfU0lURSA9IGh0dHBzOi8vcmVnaXN0cnkubnBtanMub3JnL3Nhc3MvLQorU0FTU19M
SUNFTlNFID0gTUlUCitTQVNTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCitIT1NUX1NBU1NfREVQ
RU5ERU5DSUVTID0gaG9zdC1ub2RlanMKKworZGVmaW5lIEhPU1RfU0FTU19CVUlMRF9DTURTCisJ
JChIT1NUX0RJUikvYmluL25wbSBpbnN0YWxsIFwKKwkJLS1wcmVmaXggJChARCkgXAorCQktLXBy
b2R1Y3Rpb24gXAorCQktLW5vLWF1ZGl0IFwKKwkJLS1uby1mdW5kCitlbmRlZgorCitkZWZpbmUg
SE9TVF9TQVNTX0lOU1RBTExfQ01EUworCSQoSU5TVEFMTCkgLW0gMDc1NSAtZCAkKEhPU1RfRElS
KS9saWIvbm9kZV9tb2R1bGVzL3Nhc3MKKwkkKElOU1RBTEwpIC1tIDA3NTUgJChARCkvc2Fzcy5q
cyAkKEhPU1RfRElSKS9saWIvbm9kZV9tb2R1bGVzL3Nhc3MvCisJJChJTlNUQUxMKSAtbSAwNzU1
ICQoQEQpL3Nhc3MuZGFydC5qcyAkKEhPU1RfRElSKS9saWIvbm9kZV9tb2R1bGVzL3Nhc3MvCisJ
cnN5bmMgLWEgJChARCkvbm9kZV9tb2R1bGVzICQoSE9TVF9ESVIpL2xpYi9ub2RlX21vZHVsZXMv
c2Fzcy8KKwlsbiAtc2YgLi4vbGliL25vZGVfbW9kdWxlcy9zYXNzL3Nhc3MuanMgJChIT1NUX0RJ
UikvYmluL3Nhc3MKK2VuZGVmCisKKyQoZXZhbCAkKGhvc3QtZ2VuZXJpYy1wYWNrYWdlKSkKZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2Fzcy5weSBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2Fzcy5weQpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjI3MzllZmY3ZjY4MAotLS0gL2Rldi9udWxsCisrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2Fzcy5weQpAQCAtMCwwICsxLDIz
IEBACitpbXBvcnQgb3MKK2ltcG9ydCBpbmZyYQorZnJvbSBwYXRobGliIGltcG9ydCBQYXRoCisK
K2Zyb20gaW5mcmEuYmFzZXRlc3QgaW1wb3J0IEJSVGVzdAorCitJTlBVVF9TQU1QTEUgPSBQYXRo
KF9fZmlsZV9fKS5wYXJlbnQgLyAidGVzdF9zYXNzL3NhbXBsZV9zYXNzLnNjc3MiCisKKworY2xh
c3MgVGVzdEhvc3RTYXNzKEJSVGVzdCk6CisgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3QuQkFT
SUNfVE9PTENIQUlOX0NPTkZJRyArIFwKKyAgICAgICAgIiIiCisgICAgICAgIEJSMl9QQUNLQUdF
X0hPU1RfU0FTUz15CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAg
ICAgICBzYXNzX2JpbiA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaG9zdCIsICJiaW4i
LCAic2FzcyIpCisKKyAgICAgICAgY21kID0gW3Nhc3NfYmluLCAiLS12ZXJzaW9uIl0KKyAgICAg
ICAgaW5mcmEucnVuX2NtZF9vbl9ob3N0KHNlbGYuYnVpbGRkaXIsIGNtZCkKKworICAgICAgICBj
bWQgPSBbc2Fzc19iaW4sIElOUFVUX1NBTVBMRSwgIm91dHB1dC5jc3MiXQorICAgICAgICBpbmZy
YS5ydW5fY21kX29uX2hvc3Qoc2VsZi5idWlsZGRpciwgY21kKQpkaWZmIC0tZ2l0IGEvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9zYXNzL3NhbXBsZV9zYXNzLnNjc3MgYi9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3Nhc3Mvc2FtcGxlX3Nhc3Muc2NzcwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmI4YmY3MTIwMTE4YwotLS0gL2Rl
di9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2Fzcy9zYW1w
bGVfc2Fzcy5zY3NzCkBAIC0wLDAgKzEsNyBAQAorJGZvbnQtc3RhY2s6IEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsKKyRwcmltYXJ5LWNvbG9yOiAjMzMzOworCitib2R5IHsKKyAgZm9udDogMTAwJSAk
Zm9udC1zdGFjazsKKyAgY29sb3I6ICRwcmltYXJ5LWNvbG9yOworfQoKLS0gCjIuNTUuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
