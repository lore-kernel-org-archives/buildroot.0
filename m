Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B4C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 16:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F6D40778;
	Fri, 24 Jul 2026 16:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuIWIqh5xf4D; Fri, 24 Jul 2026 16:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EBB407A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784911715;
	bh=t9bNkQuyiRcSosRWn6xa6aXK8VuzOmykn4iu5mL51wk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NjABh8KKrLuKcEX+9VcCQeT5Y/JN7RuAmpO44ipgtMDZZtprvpZvDjUkizSfENaCJ
	 Pijy1OQ/kPrhZ5qYMUheAF6smm4L47LLjeLN7Moe3OSrkZq6mXd7gyK25myzVTeTcf
	 zWiK1UtagzdLgTDMZH+vOs5uGHSR+t4xv95Uq698bnRLOt4+apiQiiyxkX4WI0oRLH
	 yn24hTCFIHCZeha5Cqj87NpE2vDLQvPiSL3bGaj006NblDYkBWfQFwxIrISxPaVNlb
	 bvBENup2s+fYCObArRsmRkVE9LOCq7ypUurM7S1Ug4gSkdmk15pAeTdnNcjR0sdfp/
	 21pH0XynVITfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8EBB407A4;
	Fri, 24 Jul 2026 16:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51BE3224
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F4DE60B8C
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2anqZIBnN5Ii for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 16:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D5B860B79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D5B860B79
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5B860B79
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29A7FA4C3D99
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 18:48:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36132)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJ4Y-000000007PN-0Yan
 for buildroot@buildroot.org; Fri, 24 Jul 2026 16:48:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 18:48:27 +0200
Message-ID: <20260724164829.304335-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784911710;
 bh=0gmfwy/+xgy21joQZmVYJk2gT4q+aKYvSKqTxjr9bfM=;
 h=From:To:Subject:Date:From;
 b=KS0HRuWinAIpNoGIwlddpnQtMNGcVhQRVnaiAqpuCy38acxyPkzxiuitpdnfUn7II
 sxcrSlgNx33o67ZSAvGo+BiJAGrspFNxCliBFvVkHvLztvSZj1MyEBLhoxXnG1W8cA
 1LeIb797aP1vbBF1hj8Jm8c1Gk4OxP/OlPV9WLxyQUyB8pZN2YGb1O2JKVab2gLY8D
 z4Qv2b47shpSESWCHqX4LYPTHQly0qiwMkfvytEfEq4rIFWqYPCauUAis+bTUeMrGK
 wBUdSlllVDBg0cSJfQvMDD9k/ythUb0qWHbVasrnqqFrwKulAmCXthrf9JkMXYaxA5
 TSayWrBV+dmYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KS0HRuWi
Subject: [Buildroot] [PATCH 1/3] package/taglib: mp4 support needs threads
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

QnVpbGRyb290IGNvbW1pdCAxYzU3MzBlYmI1ZThiOWE2NzQzM2FhOTk5N2U1Y2ZkNmNhZTE4Y2Zl
IGJ1bXBlZCB0aGUKcGFja2FnZSBmcm9tIHZlcnNpb24gMi4yLjEgdG8gdmVyc2lvbiAyLjMgd2hp
Y2ggaW5jbHVkZXMgdXBzdHJlYW0gY29tbWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS90YWdsaWIvdGFn
bGliL2NvbW1pdC81ZDYzMTg3YThiOGQyOTFjYmY0Zjc3ZDFiYjk3M2JjNWVlOTFjZjAzCnRoYXQg
dXNlcyBzdGQ6OmNhbGxfb25jZSBhbmQgaXMgb25seSBhdmFpbGFibGUgd2l0aCB0aHJlYWRzIHN1
cHBvcnQuCgpJbnNwaXJlZCBieSBidWlsZHJvb3QgY29tbWl0IGY5YTJkNjVjYWU4OGNhN2M2NDFh
ZjJmNjkxNjFhYjBkMjFiYWM5MWMKd2hpY2ggZml4ZWQgYSBzaW1pbGFyIGVycm9yLgoKVGhpcyBw
YXRjaCBmaXhlcyBhIGJ1aWxkIGVycm9yCgovYnVpbGRzL2JrdWhscy9idWlsZHJvb3QvYnItdGVz
dC1wa2cvYnItYXJtLWZ1bGwtbm90aHJlYWQvYnVpbGQvdGFnbGliLTIuMy90YWdsaWIvbXA0L21w
NGl0ZW1mYWN0b3J5LmNwcDo1MToxNjoKIGVycm9yOiDigJhvbmNlX2ZsYWfigJkgaW4gbmFtZXNw
YWNlIOKAmHN0ZOKAmSBkb2VzIG5vdCBuYW1lIGEgdHlwZQoKY2F1Z2h0IGJ5IHRoZSBHaXRsYWIg
cGlwZWxpbmVzLiBUbyByZXByb2R1Y2UgdXNlIHRoaXMgZGVmY29uZmlnOgoKICBCUjJfYXJtPXkK
ICBCUjJfYXJtMTE3Nmp6Zl9zPXkKICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKICBCUjJfVE9P
TENIQUlOX0VYVEVSTkFMX0NVU1RPTT15CiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9ET1dOTE9B
RD15CiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9VUkw9Imh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy90b29sY2hhaW5zL3RhcmJhbGxzL2JyLWFybTExLWZ1bGwtbm90aHJlYWQtMjAyMC4x
MS4yLnRhci5iejIiCiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9HQ0NfOT15CiAgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9IRUFERVJTXzVfOT15CiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MT0NB
TEU9eQogICMgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9IQVNfVEhSRUFEUyBpcyBub3Qgc2V0CiAg
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9DWFg9eQogIEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklF
Uz15CiAgQlIyX1BBQ0tBR0VfVEFHTElCPXkKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS90YWdsaWIvdGFnbGliLm1rIHwgNiArKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Rh
Z2xpYi90YWdsaWIubWsgYi9wYWNrYWdlL3RhZ2xpYi90YWdsaWIubWsKaW5kZXggOTI0ZDNmMzM5
ZC4uOWExMTFhODZjNiAxMDA2NDQKLS0tIGEvcGFja2FnZS90YWdsaWIvdGFnbGliLm1rCisrKyBi
L3BhY2thZ2UvdGFnbGliL3RhZ2xpYi5tawpAQCAtMTIsNiArMTIsMTIgQEAgVEFHTElCX0xJQ0VO
U0UgPSBMR1BMLTIuMSBvciBNUEwtMS4xCiBUQUdMSUJfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcu
TEdQTCBDT1BZSU5HLk1QTAogVEFHTElCX0NQRV9JRF9WRU5ET1IgPSB0YWdsaWIKIAoraWZlcSAo
JChCUjJfVE9PTENIQUlOX0hBU19USFJFQURTKSx5KQorVEFHTElCX0NPTkZfT1BUUyArPSAtRFdJ
VEhfTVA0PU9OCitlbHNlCitUQUdMSUJfQ09ORl9PUFRTICs9IC1EV0lUSF9NUDQ9T0ZGCitlbmRp
ZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX1pMSUIpLHkpCiBUQUdMSUJfREVQRU5ERU5DSUVTICs9
IHpsaWIKIFRBR0xJQl9DT05GX09QVFMgKz0gLURXSVRIX1pMSUI9T04KLS0gCjIuNDcuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
