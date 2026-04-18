Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D1BF99C89
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 18:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 027C682260;
	Sat, 18 Apr 2026 18:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3ADR4Vkgdoa; Sat, 18 Apr 2026 18:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB4782254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776536499;
	bh=MoLxBGc6PH8CP2tZA98RyxIVh+dGJ7XiKJjJnHJF24Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YxPbul6ofMVnAZuayhH2Q1J73rYNvzFmZuzOytMiHj9DHzQyQQ0ui1ft8nt+Jy/tp
	 P2Ffikc+ADNRYjL3+R2scBvgi+wWCKTU5l4Y7su1mPA/z8U5J79opxpu0dfHd2W3ae
	 AoP4+WqrpedBAxALyDVinvWQDULySQkongr4zbWmFYTs6j694QjqyLtRgugpQHlNBG
	 vLNsL1O9dmzukklAAp8ClyHZXBODvS8+9AwZh8ponVpgYV+GemL5cKd2qy8DcTDJ2A
	 r4jxZlF+ljfXAKt6q2Jb0LDCSUaUDZd3DP7zq6xRMsfGHgBXybtvT5q4mMtXAj6ZpK
	 XXL2i87yK9A7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB4782254;
	Sat, 18 Apr 2026 18:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A314A347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 18:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97EBF40F60
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 18:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqopDrTaKfmD for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 18:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30FF640F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30FF640F75
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30FF640F75
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 18:21:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6CCEA4C3845;
 Sat, 18 Apr 2026 20:21:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45016)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEAIN-000000001rD-2FX8;
 Sat, 18 Apr 2026 18:21:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 18 Apr 2026 20:21:31 +0200
Message-ID: <20260418182131.3757238-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776536492;
 bh=yMWHLigDmyrMjfndxFvU1DF/FWTMj2S9khPFVRRjftE=;
 h=From:To:Cc:Subject:Date:From;
 b=Y3AtJXiSCDZyDY37rPh2aQLUKGhVUvHBQLwDQNufyZ6D+9dY7R303P4n27Kgk3q5P
 g5TVtHFwr5cVUqVdMtN9pjEMUZTym8B/uEFxTyj+RZW+tpJQvLS7zjZioJPZ7DA7gJ
 uhkpl+GdPMLvYc7ml2il3hhnKRSNnuwPjy+zQPCXhkZJg6wzpiLTP/j6jpN29XkRyq
 ZCa5w6Pl9/3eTTEv07+PxmRMzm6tz3766TIRJHjFVXTSkA49xg5xWDkzdqWfi9iPUM
 LKgLH5jC7WfEYPM3OptEjXGAZXvPTERl3YIF68/kCtpb4lIuFj5XuKe7b8lBJXvlmF
 FNYjTdSrjnZrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Y3AtJXiS
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: bump version to 5.3.1
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

U3dpdGNoZWQgdG8gc2hhMjU2IHRhcmJhbGwgaGFzaCBwcm92aWRlZCBieSB1cHN0cmVhbS4KCkFk
ZGVkIC1EX0dOVV9TT1VSQ0UgdG8gQ0ZMQUdTIHRvIGZpeCBhIGJ1aWxkIGVycm9yCgppbmNsdWRl
L2plbWFsbG9jL2ludGVybmFsL2plbWFsbG9jX2ludGVybmFsX2lubGluZXNfYS5oOjIwOjMyOiBl
cnJvcjoKIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHNjaGVkX2dldGNwdeKA
mTsgZGlkIHlvdSBtZWFuCiDigJhTWVNfZ2V0Y3B14oCZPyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0KICAgMjAgfCAgICAgICAgIHJldHVybiAobWFsbG9jX2NwdWlkX3Qpc2NoZWRf
Z2V0Y3B1KCk7Cgpmb3VuZCBieSB0ZXN0LXBrZzoKCiAgICAgICAgICAgICAgICAgICBib290bGlu
LWFybXY3bS11Y2xpYmMgWyA3LzMyXTogRkFJTEVECiAgICAgICAgICAgICAgICBib290bGluLW02
OGstNTIwOC11Y2xpYmMgWyA5LzMyXTogRkFJTEVECgp1c2luZyB0aGlzIGRlZmNvbmZpZzoKCkJS
Ml9QQUNLQUdFX0pFTUFMTE9DPXkKCldpdGggdGhpcyBjaGFuZ2UgYWRkZWQgdGhlIGRlZmNvbmZp
ZyBidWlsZHMgd2l0aG91dCBlcnJvcnM6CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFy
bS1hYXJjaDY0IFsgMS8zMl06IE9LCiAgICAgICAgICAgICAgICAgICBib290bGluLWFhcmNoNjQt
Z2xpYmMgWyAyLzMyXTogT0sKICAgICAgICAgICAgICAgYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9s
ZCBbIDMvMzJdOiBPSwogICAgICAgICAgICAgICBib290bGluLWFyY2xlLWhzMzgtdWNsaWJjIFsg
NC8zMl06IFNLSVBQRUQKICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY1LXVjbGliYyBb
IDUvMzJdOiBPSwogICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3LWdsaWJjIFsgNi8z
Ml06IE9LCiAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWyA3LzMyXTog
T0sKICAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctbXVzbCBbIDgvMzJdOiBPSwog
ICAgICAgICAgICAgICAgYm9vdGxpbi1tNjhrLTUyMDgtdWNsaWJjIFsgOS8zMl06IE9LCiAgICAg
ICAgICAgICAgIGJvb3RsaW4tbTY4ay02ODA0MC11Y2xpYmMgWzEwLzMyXTogT0sKICAgICAgICAg
ICAgIGJvb3RsaW4tbWljcm9ibGF6ZWVsLXVjbGliYyBbMTEvMzJdOiBTS0lQUEVECiAgICAgICAg
ICAgICAgICAgIGJvb3RsaW4tbWlwczY0ZWwtZ2xpYmMgWzEyLzMyXTogT0sKICAgICAgICAgICAg
ICAgIGJvb3RsaW4tbWlwc2VsMzJyNi1nbGliYyBbMTMvMzJdOiBPSwogICAgICAgICAgICAgICAg
ICAgYm9vdGxpbi1taXBzZWwtdWNsaWJjIFsxNC8zMl06IE9LCiAgICAgICAgICAgICAgICAgYm9v
dGxpbi1vcGVucmlzYy11Y2xpYmMgWzE1LzMyXTogT0sKICAgICAgICBib290bGluLXBvd2VycGM2
NGxlLXBvd2VyOC1nbGliYyBbMTYvMzJdOiBTS0lQUEVECiAgICAgICAgICAgYm9vdGxpbi1wb3dl
cnBjLWU1MDBtYy11Y2xpYmMgWzE3LzMyXTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4t
cmlzY3YzMi1nbGliYyBbMTgvMzJdOiBPSwogICAgICAgICAgICAgICAgICAgYm9vdGxpbi1yaXNj
djY0LWdsaWJjIFsxOS8zMl06IE9LCiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1yaXNjdjY0
LW11c2wgWzIwLzMyXTogT0sKICAgICAgICAgICAgICAgICBib290bGluLXMzOTB4LXoxMy1nbGli
YyBbMjEvMzJdOiBTS0lQUEVECiAgICAgICAgICAgICAgICAgICAgICBib290bGluLXNoNC11Y2xp
YmMgWzIyLzMyXTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tc3BhcmM2NC1nbGliYyBb
MjMvMzJdOiBPSwogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tc3BhcmMtdWNsaWJjIFsyNC8z
Ml06IFNLSVBQRUQKICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC1nbGliYyBbMjUv
MzJdOiBPSwogICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC1tdXNsIFsyNi8zMl06
IE9LCiAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC11Y2xpYmMgWzI3LzMyXTogT0sK
ICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LWk2ODYtbXVzbCBbMjgvMzJdOiBPSwogICAg
ICAgICAgICAgICAgICAgYm9vdGxpbi14dGVuc2EtdWNsaWJjIFsyOS8zMl06IFNLSVBQRUQKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1iYXNpYyBbMzAvMzJdOiBPSwogICAgICAg
ICAgICAgICAgICAgIGJyLWFybS1mdWxsLW5vdGhyZWFkIFszMS8zMl06IFNLSVBQRUQKICAgICAg
ICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbMzIvMzJdOiBPSwoKMzIgYnVpbGRz
LCA3IHNraXBwZWQsIDAgYnVpbGQgZmFpbGVkLCAwIGxlZ2FsLWluZm8gZmFpbGVkLCAwIHNob3ct
aW5mbyBmYWlsZWQKCkFsc28gdGhpcyBkZWZjb25maWcsIGVuYWJsaW5nIHBhY2thZ2VzIHVzaW5n
IGplbWFsbG9jLCBidWlsZHMgZmluZToKCkJSMl94ODZfNjQ9eQpCUjJfVE9PTENIQUlOX0VYVEVS
TkFMPXkKQlIyX1BBQ0tBR0VfUVQ1PXkKQlIyX1BBQ0tBR0VfQ1VURUxZU1Q9eQpCUjJfUEFDS0FH
RV9ST0NLU0RCPXkKQlIyX1BBQ0tBR0VfSkVNQUxMT0M9eQpCUjJfUEFDS0FHRV9BSVJDUkFDS19O
Rz15CkJSMl9QQUNLQUdFX0JJTkQ9eQpCUjJfUEFDS0FHRV9UTVVYPXkKQlIyX1BBQ0tBR0VfRkxV
RU5UX0JJVD15CgpUaGUgemVlayBwYWNrYWdlIGlzIGJyb2tlbiBhdG0gZHVlIHRvIGFuIHVucmVs
YXRlZCBlcnJvcjoKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC8/cmVhc29uPXplZWst
NC4xLjEKCiAgLS0gQ291bGQgTk9UIGZpbmQgQklORCAobWlzc2luZzogQklORF9MSUJSQVJZKQoK
U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiBwYWNrYWdl
L2plbWFsbG9jL2plbWFsbG9jLmhhc2ggfCAzICsrLQogcGFja2FnZS9qZW1hbGxvYy9qZW1hbGxv
Yy5tayAgIHwgOCArKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9qZW1hbGxvYy9qZW1hbGxvYy5oYXNo
IGIvcGFja2FnZS9qZW1hbGxvYy9qZW1hbGxvYy5oYXNoCmluZGV4IDIxNGZlODA2MmIuLjdhYmFj
Y2Q2YjMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvamVtYWxsb2MvamVtYWxsb2MuaGFzaAorKysgYi9w
YWNrYWdlL2plbWFsbG9jL2plbWFsbG9jLmhhc2gKQEAgLTEsMyArMSw0IEBACisjIEZyb20gaHR0
cHM6Ly9naXRodWIuY29tL2plbWFsbG9jL2plbWFsbG9jL3JlbGVhc2VzL3RhZy81LjMuMQorc2hh
MjU2ICAzODI2YmM4MDIzMmYyMmVkNWM0NjYyZjMwMzRmNzk5Y2EzMTZlODE5MTAzYmRjN2JiOTkw
MThhNDIxNzA2ZjkyICBqZW1hbGxvYy01LjMuMS50YXIuYnoyCiAjIExvY2FsbHkgY2FsY3VsYXRl
ZAotc2hhMjU2ICAyZGI4MmQxZTcxMTlkZjNlNzFiNzY0MDIxOWI2ZGZlODQ3ODliYzA1Mzc5ODNj
M2I3YWM0ZjcxODlhZWNmZWFhICBqZW1hbGxvYy01LjMuMC50YXIuYnoyCiBzaGEyNTYgIDk0YWEy
Y2FhOThjMjVkOTQyZjU4Yjk1NmM3MWRiYTZhOTlmZjk4ZmMzYTMxY2JjNjY5ZmUyYTRjZDAyNjhi
NTMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvamVtYWxsb2MvamVtYWxsb2MubWsgYi9w
YWNrYWdlL2plbWFsbG9jL2plbWFsbG9jLm1rCmluZGV4IGJkOGEyZDc2NTQuLjYxMDQ1YzUwZDUg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvamVtYWxsb2MvamVtYWxsb2MubWsKKysrIGIvcGFja2FnZS9q
ZW1hbGxvYy9qZW1hbGxvYy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLUpFTUFMTE9DX1ZFUlNJT04gPSA1LjMuMAorSkVNQUxMT0NfVkVSU0lPTiA9IDUu
My4xCiBKRU1BTExPQ19TT1VSQ0UgPSBqZW1hbGxvYy0kKEpFTUFMTE9DX1ZFUlNJT04pLnRhci5i
ejIKIEpFTUFMTE9DX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vamVtYWxsb2MvamVtYWxsb2Mv
cmVsZWFzZXMvZG93bmxvYWQvJChKRU1BTExPQ19WRVJTSU9OKQogSkVNQUxMT0NfTElDRU5TRSA9
IEJTRC0yLUNsYXVzZQpAQCAtMTIsMTEgKzEyLDE1IEBAIEpFTUFMTE9DX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCiBKRU1BTExPQ19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIEpFTUFMTE9DX0NPTkZJ
R19TQ1JJUFRTID0gamVtYWxsb2MtY29uZmlnCiAKK0pFTUFMTE9DX0NGTEFHUyA9ICQoVEFSR0VU
X0NGTEFHUykgLURfR05VX1NPVVJDRQorCiAjIGdjYyBidWcgaW50ZXJuYWwgY29tcGlsZXIgZXJy
b3I6IGluIG1lcmdlX292ZXJsYXBwaW5nX3JlZ3MsIGF0CiAjIHJlZ3JlbmFtZS5jOjMwNC4gVGhp
cyBidWcgaXMgZml4ZWQgc2luY2UgZ2NjIDYuCiBpZmVxICgkKEJSMl9vcjFrKTokKEJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzYpLHk6KQotSkVNQUxMT0NfQ09ORl9FTlYgKz0gQ0ZMQUdTPSIk
KFRBUkdFVF9DRkxBR1MpIC1PMCIKK0pFTUFMTE9DX0NGTEFHUyArPSAtTzAKIGVuZGlmCiAKK0pF
TUFMTE9DX0NPTkZfRU5WICs9IENGTEFHUz0iJChKRU1BTExPQ19DRkxBR1MpIgorCiAkKGV2YWwg
JChhdXRvdG9vbHMtcGFja2FnZSkpCiAkKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkK
LS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
