Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACC6CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 18:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80B482334;
	Tue,  4 Nov 2025 18:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6K3e3QJRidKP; Tue,  4 Nov 2025 18:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D974782336
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D974782336;
	Tue,  4 Nov 2025 18:25:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54953462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B0E440B9A
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9SpFoskW0ej for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 18:25:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5591A40B86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5591A40B86
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5591A40B86
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:25:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F28D05FFB4;
 Tue,  4 Nov 2025 19:25:47 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Tue,  4 Nov 2025 19:25:39 +0100
Message-ID: <20251104182543.4087242-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762280750;
 bh=Jnl6TGpAWJxA9/jIkFyFLGMd3EO9sbSag4ncHQUMVcU=;
 h=From:To:Cc:Subject:Date:From;
 b=rNFz9+RgihT7OoyLyGi7IzemhiYXvgiYhOA4ANo2Liiquc+cxifkpz9/HVLwWvlp+
 FmhTwnKlhsH2136aktGfihleeUR0Fudn6b0AQUElgay+WNra8x7C45bt3auuw4Rghe
 OpFikWSbsGpO6gWKHec6dui8HIYseHb6FE+mG2hDg5ofrfIZve2iy9XMw+htRige1G
 5SDdorpHIn1TSN6+dDJWZ1S0LUiTovzUCYUoAjavirIAzFtQa5ayNcau6SPOeZUoD3
 ZwmsGFewskGv3aohX+yZfVHLQXViUYq1ybKF1jpI7fXDM7gXBI5gurjJgA3qEoBAr/
 bN2fs+cvBOn+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rNFz9+Rg
Subject: [Buildroot] [PATCH 1/1] package/bcc: add upstream patch to fix
 build with llvm >= 21
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

U2luY2UgQnVpbGRyb290IGNvbW1pdCBbMV0gInBhY2thZ2UvbGx2bS1wcm9qZWN0OiBidW1wIHRv
IHZlcnNpb24KMjEuMS40IiwgYmNjIGlzIGZhaWxpbmcgYXQgY29tcGlsYXRpb24gdGltZS4KClRo
aXMgY29tbWl0IGFkZHMgYW4gdXBzdHJlYW0gcGF0Y2ggdG8gZml4IHRoaXMgaXNzdWUuCgpbMV0g
aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2Q2YTdj
MDIyNjMzMzEzODcyMWFlNzIyYjg5ZTMxYTgyY2ZiMjJhZTAKClNpZ25lZC1vZmYtYnk6IEp1bGll
biBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQogLi4uaXgtYS1idWlsZC1mYWlsdXJlLXdpdGgt
Y2xhbmcyMS01MzY5LnBhdGNoIHwgNTMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDUzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2JjYy8wMDAx
LUZpeC1hLWJ1aWxkLWZhaWx1cmUtd2l0aC1jbGFuZzIxLTUzNjkucGF0Y2gKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2JjYy8wMDAxLUZpeC1hLWJ1aWxkLWZhaWx1cmUtd2l0aC1jbGFuZzIxLTUzNjku
cGF0Y2ggYi9wYWNrYWdlL2JjYy8wMDAxLUZpeC1hLWJ1aWxkLWZhaWx1cmUtd2l0aC1jbGFuZzIx
LTUzNjkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMGFlYjZh
NmZlYQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYmNjLzAwMDEtRml4LWEtYnVpbGQtZmFp
bHVyZS13aXRoLWNsYW5nMjEtNTM2OS5wYXRjaApAQCAtMCwwICsxLDUzIEBACitGcm9tIDA1MWJl
MGM5ODc2MjI2ODNjNzViMzM1YmRhMTZiOWI2MWZjNjdmYTQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiB5b25naG9uZy1zb25nIDx5czExNDMyMUBnbWFpbC5jb20+CitEYXRlOiBNb24s
IDE0IEp1bCAyMDI1IDIwOjIxOjU5IC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCBhIGJ1aWxk
IGZhaWx1cmUgd2l0aCBjbGFuZzIxICgjNTM2OSkKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKKworVGhlIGJ1aWxkIGVycm9yIG1lc3NhZ2U6CisgIHNyYy9jYy9mcm9udGVuZHMv
Y2xhbmcvbG9hZGVyLmNjOjQwMDo3MzogZXJyb3I6IG5vIG1hdGNoaW5nIGZ1bmN0aW9uIGZvcgor
ICAgY2FsbCB0byDigJhjbGFuZzo6VGV4dERpYWdub3N0aWNQcmludGVyOjpUZXh0RGlhZ25vc3Rp
Y1ByaW50ZXIoCisgICAgIGxsdm06OnJhd19mZF9vc3RyZWFtJiwgY2xhbmc6OkRpYWdub3N0aWNP
cHRpb25zKinigJkKKyAgNDAwIHwgICBhdXRvIGRpYWdfY2xpZW50ID0gbmV3IFRleHREaWFnbm9z
dGljUHJpbnRlcihsbHZtOjplcnJzKCksICYqZGlhZ19vcHRzKTsKKyAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgorVGhlIGxsdm0gY29tbWl0CisgIGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0t
cHJvamVjdC9wdWxsLzEzOTU4NAorY2F1c2VkIHRoZSBidWlsZCBmYWlsdXJlLgorCitBZGp1c3Qg
dGhlIGNvZGUgcHJvcGVybHkgYW5kIHRoZSBlcnJvciBpcyBmaXhlZC4KKworVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9pb3Zpc29yL2JjYy9jb21taXQvOGM1Yzk2YWQzYmVlZWQyZmE4Mjcw
MTdmNDUxYTk1MjMwNjgyNjk3NAorU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9A
ZnJlZS5mcj4KKy0tLQorIHNyYy9jYy9mcm9udGVuZHMvY2xhbmcvbG9hZGVyLmNjIHwgOCArKysr
KysrKworIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL3Ny
Yy9jYy9mcm9udGVuZHMvY2xhbmcvbG9hZGVyLmNjIGIvc3JjL2NjL2Zyb250ZW5kcy9jbGFuZy9s
b2FkZXIuY2MKK2luZGV4IDA3ZGM5ZDZhLi42ZjgzODdhYSAxMDA2NDQKKy0tLSBhL3NyYy9jYy9m
cm9udGVuZHMvY2xhbmcvbG9hZGVyLmNjCisrKysgYi9zcmMvY2MvZnJvbnRlbmRzL2NsYW5nL2xv
YWRlci5jYworQEAgLTM5NiwxMSArMzk2LDE5IEBAIGludCBDbGFuZ0xvYWRlcjo6ZG9fY29tcGls
ZSgKKyAgICAgICAgICAgICAgICAgICAgIGZsYWdzX2NzdHJfcmVtLmVuZCgpKTsKKyAKKyAgIC8v
IHNldCB1cCB0aGUgZXJyb3IgcmVwb3J0aW5nIGNsYXNzCisrI2lmIExMVk1fVkVSU0lPTl9NQUpP
UiA+PSAyMQorKyAgRGlhZ25vc3RpY09wdGlvbnMgZGlhZ19vcHRzOworKyAgYXV0byBkaWFnX2Ns
aWVudCA9IG5ldyBUZXh0RGlhZ25vc3RpY1ByaW50ZXIobGx2bTo6ZXJycygpLCBkaWFnX29wdHMp
OworKworKyAgSW50cnVzaXZlUmVmQ250UHRyPERpYWdub3N0aWNJRHM+IERpYWdJRChuZXcgRGlh
Z25vc3RpY0lEcygpKTsKKysgIERpYWdub3N0aWNzRW5naW5lIGRpYWdzKERpYWdJRCwgZGlhZ19v
cHRzLCBkaWFnX2NsaWVudCk7CisrI2Vsc2UKKyAgIEludHJ1c2l2ZVJlZkNudFB0cjxEaWFnbm9z
dGljT3B0aW9ucz4gZGlhZ19vcHRzKG5ldyBEaWFnbm9zdGljT3B0aW9ucygpKTsKKyAgIGF1dG8g
ZGlhZ19jbGllbnQgPSBuZXcgVGV4dERpYWdub3N0aWNQcmludGVyKGxsdm06OmVycnMoKSwgJipk
aWFnX29wdHMpOworIAorICAgSW50cnVzaXZlUmVmQ250UHRyPERpYWdub3N0aWNJRHM+IERpYWdJ
RChuZXcgRGlhZ25vc3RpY0lEcygpKTsKKyAgIERpYWdub3N0aWNzRW5naW5lIGRpYWdzKERpYWdJ
RCwgJipkaWFnX29wdHMsIGRpYWdfY2xpZW50KTsKKysjZW5kaWYKKyAKKyAgIC8vIHNldCB1cCB0
aGUgY29tbWFuZCBsaW5lIGFyZ3VtZW50IHdyYXBwZXIKKyAKKy0tIAorMi41MS4xCisKLS0gCjIu
NTEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
