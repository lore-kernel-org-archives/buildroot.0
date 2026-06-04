Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6354CD6E6E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 18:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48E384C50;
	Thu,  4 Jun 2026 18:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdXcoze0rC-L; Thu,  4 Jun 2026 18:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BDCE85530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780599227;
	bh=sMLLFUs35I4XN3UTIwH38OBTZdJqt33b1nP6TXSPlaY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lXSyskHgW4yxaONw7UrzT6AvSpq8ljr096IDqE19/0O6jmTQL8WE28BB7+wXuOegK
	 dnJcItakmf4CYLOdtizQv5vOHgsIj2M7jO4rTB5MbA+oFy1FtOqotXgjknpm8VPMnz
	 78AIahCc5WUi/qRnH68Sn2ase8neEruWeWO5WFHYqz0BJF83O3jjzdHhrgShIdvqEy
	 zLiFj45nOnS4SNnsSRuqIfAcxo9FMf3ArNwo9nQcOOUKazcw8ovU/2mKkbLm4foC0U
	 +QP/Z3eFgM9vyz1d4puTZijIrhhLKUoqRQ5yLwh0QIZ7lfFO2BZjkJDoE+hbI4XCkm
	 lQMQsqxsL6nqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BDCE85530;
	Thu,  4 Jun 2026 18:53:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D9EDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 18:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EFDA4269E
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 18:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j28D7xp0BF2H for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 18:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 611F84279B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611F84279B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 611F84279B
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 18:53:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18138A4C0628
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:53:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43716)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wVDCH-000000001SY-33Nh
 for buildroot@buildroot.org; Thu, 04 Jun 2026 18:53:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 20:53:41 +0200
Message-ID: <20260604185341.2155576-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780599222;
 bh=yLXMiQAHzYbyM+4iMRqWGmvskKae444CCc79E/jTM6Q=;
 h=From:To:Subject:Date:From;
 b=akRj7596whh7i8DXJ/d2n6iRnxLFThJvoX29N9GuZ/zRohAEGINRaoqUBKkM65/M/
 lm8u4o/rmx6mVVC13BPHWNrCXDOPz7jWka9hB729mla16yuhTIx6VqxYANq3axkiZI
 0rEClEyF3TUT9dPKd47ixnpumdhyldt03TbAJKPtMWMnVHULjp9RJK/kNL69j4XNUo
 DxGsSxuTQpS5nH6n8+hIkf1swrV/XoOqh0aul88dA39psxARD+Z+RTxD6QXllKLWmJ
 GikoTA6kmXgBH1g+t6GTmul2wjW2JVb7fcnMxqyQUhfjjBzCPeX8+rrxcvO7P+HD4N
 grCqufvF04hiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=akRj7596
Subject: [Buildroot] [PATCH 1/1] package/libde265: security bump version to
 1.1.1
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

aHR0cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliZGUyNjUvcmVsZWFzZXMvdGFnL3YxLjEu
MQoKRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBwcm9ibGVtczoKCkNWRSBUQkQgKEdIU0Et
Y2Nmdy0yOXg3LXJyeDMpCi0gUGl4ZWwgYWNjZXNzb3Igc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cg
Y2F1c2VzIGhlYXAgT09CIHJlYWQvd3JpdGUKCkNWRSBUQkQgKEdIU0EtajJxcS14MnhxLWc5d3Ip
Ci0gU0FPIHNlcXVlbnRpYWwgZmlsdGVyIGhlYXAgYnVmZmVyIG92ZXJmbG93IHZpYSBzaWduZWQg
aW50ZWdlciBvdmVyZmxvdwoKVGhpcyB2ZXJzaW9uIGJ1bXAgaW5jbHVkZXMgdXBzdHJlYW0gY29t
bWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS9zdHJ1a3R1cmFnL2xpYmRlMjY1L2NvbW1pdC85ZGVkMzdi
ZGE0ZTlmYmMyNTcwYzBiZDcxMGVlNDA3NjM2YmM0ZjM0CndoaWNoIHVzZXMgY29uc3RleHByKCkg
YW5kIGNhdXNlcyBhIGJ1aWxkIGVycm9yIGNhdWdodCBieSB0aGUgR2l0bGFiCnBpcGVsaW5lcyB3
aXRoIHRoZSBnY2MtNi1iYXNlZCBib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkIGRlZmNvbmZpZzoK
Ci9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ib290bGluLWFhcmNoNjQtZ2xp
YmMtb2xkL2J1aWxkL2xpYmRlMjY1LTEuMS4xL2xpYmRlMjY1L2RlYmxvY2suY2M6NTk0OjE0Ogog
ZXJyb3I6IGV4cGVjdGVkIOKAmCjigJkgYmVmb3JlIOKAmGNvbnN0ZXhwcuKAmQogICAgICAgICAg
IGlmIGNvbnN0ZXhwciAoc2l6ZW9mKHBpeGVsX3QpPT0xKSB7CgpUaGVyZWZvcmUgd2UgbmVlZCB0
byByYWlzZSB0aGUgbWluaW11bSBnY2MgdmVyc2lvbiBhY2NvcmRpbmcgdG8KaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9wcm9qZWN0cy9jeHgtc3RhdHVzLmh0bWwjY3h4MTcgdG8gZ2NjIDcuCgpTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KR2l0bGFiIHBpcGVsaW5l
cyBwYXNzZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy9i
OGFkNjIzMTI5OWI4OWNkOGEwY2NhNjdiMDI2ODUxOGM1ZDA3NDJjCgogcGFja2FnZS9saWJkZTI2
NS9Db25maWcuaW4gICAgIHwgOCArKysrKystLQogcGFja2FnZS9saWJkZTI2NS9saWJkZTI2NS5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL2xpYmRlMjY1L2xpYmRlMjY1Lm1rICAgfCAyICstCiAzIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmRlMjY1L0NvbmZpZy5pbiBiL3BhY2thZ2UvbGliZGUyNjUvQ29uZmlnLmlu
CmluZGV4IDI0MzZiZWZmNDEuLmNhOTFiMGEyMjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliZGUy
NjUvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbGliZGUyNjUvQ29uZmlnLmluCkBAIC0xLDYgKzEs
NyBAQAogY29uZmlnIEJSMl9QQUNLQUdFX0xJQkRFMjY1CiAJYm9vbCAibGliZGUyNjUiCiAJZGVw
ZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzcgIyBDKysxNwogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUwogCWhlbHAKIAkgIGxpYmRlMjY1IGlzIGFuIG9wZW4gc291cmNlIGltcGxlbWVudGF0aW9u
IG9mIHRoZSBoLjI2NSB2aWRlbwpAQCAtOCw1ICs5LDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QkRFMjY1CiAKIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJ1a3R1cmFnL2xpYmRlMjY1CiAKLWNv
bW1lbnQgImxpYmRlMjY1IG5lZWRzIGEgdG9vbGNoYWluIHcvIHRocmVhZHMsIEMrKyIKLQlkZXBl
bmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFCUjJfSU5TVEFMTF9MSUJTVERD
UFAKK2NvbW1lbnQgImxpYmRlMjY1IG5lZWRzIGEgdG9vbGNoYWluIHcvIHRocmVhZHMsIEMrKywg
Z2NjID49IDciCisJZGVwZW5kcyBvbiBcCisJCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8
IFwKKwkJIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCBcCisJCSFCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF83CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRlMjY1L2xpYmRlMjY1Lmhhc2ggYi9w
YWNrYWdlL2xpYmRlMjY1L2xpYmRlMjY1Lmhhc2gKaW5kZXggNzFhMDIyMTA4OS4uMDM4NTM2NGUy
ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJkZTI2NS9saWJkZTI2NS5oYXNoCisrKyBiL3BhY2th
Z2UvbGliZGUyNjUvbGliZGUyNjUuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vc3RydWt0dXJhZy9saWJkZTI2NS9yZWxlYXNlcy90YWcvdjEuMS4wCi1zaGEy
NTYgIGFmYzE5ZGQyOGUyZmM1MjNkZTU5NTJiYmE1MjI0ZWUxZDI4ZTI4NmM3MjQzNmQyODQzZGYx
MjZjY2ExMTgxZmQgIGxpYmRlMjY1LTEuMS4wLnRhci5negorIyBGcm9tIGh0dHBzOi8vZ2l0aHVi
LmNvbS9zdHJ1a3R1cmFnL2xpYmRlMjY1L3JlbGVhc2VzL3RhZy92MS4xLjEKK3NoYTI1NiAgZmQ0
OGE5MjdlOTRlZDc0ZmM3Y2U4ODI5ZDIyMmI5ZDg1OTlmY2JmZThiNjQ0OGJhNjY3MDViYWJjNTZh
YjIxOSAgbGliZGUyNjUtMS4xLjEudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAg
MDJjYzE1ODVhMjA2Nzc5OTJlMGJhNTc4ZmE2OTI2MzVkYzE5MzczNWYyNjkxZGM4MWRlOTI0YjUx
YzRlODAyMCAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkZTI2NS9saWJkZTI2NS5t
ayBiL3BhY2thZ2UvbGliZGUyNjUvbGliZGUyNjUubWsKaW5kZXggMmExMGRjZTZkMC4uODFmZmIz
OTUwMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJkZTI2NS9saWJkZTI2NS5taworKysgYi9wYWNr
YWdlL2xpYmRlMjY1L2xpYmRlMjY1Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotTElCREUyNjVfVkVSU0lPTiA9IDEuMS4wCitMSUJERTI2NV9WRVJTSU9O
ID0gMS4xLjEKIExJQkRFMjY1X1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vc3RydWt0dXJhZy9s
aWJkZTI2NS9yZWxlYXNlcy9kb3dubG9hZC92JChMSUJERTI2NV9WRVJTSU9OKQogTElCREUyNjVf
TElDRU5TRSA9IExHUEwtMy4wKwogTElCREUyNjVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
