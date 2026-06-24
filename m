Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ECECDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 20:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE269827A8;
	Wed, 24 Jun 2026 20:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd32PSOsPtR0; Wed, 24 Jun 2026 20:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4C882784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782333812;
	bh=Du3LQ2V3ff+l063naTlIOCwCxhyReO1gHaOF4cn8juo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U9lyOS53zgK7xLMaS79GhYN/BX+wiJRFkzIbdk1CjNgHJiN6N3T7EYeh5dD0dUrKb
	 xKlas0bDYOdmvVFZ0d7a46HUfh9weRYOyYxNT7NgbrYUbXI2q3zgUrRIQGBcoTUEeW
	 MWtBWHVFW/tG0v8RSdGFMROz8IJVuUMmS0Znx2WPIW6HGEcum/OzWWQ4/CQkauslXW
	 dhEHkpwAUBTXsi9xD7Z2QfYeWtleN5SmQhYpXBCIRv/3q7Op3qNQJ7PjV4Y+y9e2Po
	 vNt6ijL5y8kgizMWzo9g68QJJCrggPv4cQ7pL0DsZ/dYzC2U7tZcKfZc8iRE8/txBc
	 GBS9OJHaPk+0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4C882784;
	Wed, 24 Jun 2026 20:43:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BBCF4
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0620E405B3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zvj98ZDXXxCe for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 20:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90D4E40595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90D4E40595
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90D4E40595
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:43:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4f1.dip0.t-ipconnect.de [84.161.180.241])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3855A4C21E5;
 Wed, 24 Jun 2026 22:43:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36834)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcURR-000000000Rg-0SB1;
 Wed, 24 Jun 2026 20:43:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed, 24 Jun 2026 22:43:23 +0200
Message-ID: <20260624204324.368967-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782333805;
 bh=5LDVq6m0BDNiOHU+An56tQ4CPpaW+LT9UbMu6kEp+4I=;
 h=From:To:Cc:Subject:Date:From;
 b=kzvDQ6JyrvVV2LEaKJCBMi5P1jZGHodCOPE0RCKa0iWbawtU0ik8tZwcEAHYu4XHQ
 0sdXcAvRD3ZkYEYAUi9qcgUMV5qQyOm9Spf+Q6JpLoJ8kKZN237CCuKBtadfAOob4F
 Iwu4Re1sBZMNFiV433dQpsgRF/GAfPCZucS7pIK86J7oPC23U7d7cVzsjR6teGMrWC
 p75evMrLdxWoNIDx/bYOC4Oxbq5xY69zJYX9eBHpkd/koj7oNqCrEvWph/GVZLlyBO
 wptCpe45nnkwBnvkcXuyYsXXyjVn2XEoJ7GcleyDcxBx3ybhd8mCwPV9YhnDK/MOP2
 8F3PMI44dvhSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kzvDQ6Jy
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump version
 to 3.8.8
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

aHR0cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9yZWxlYXNlcy90YWcvdjMu
OC44CiJMaWJhcmNoaXZlIDMuOC44IGlzIGEgc2VjdXJpdHksIGJ1Z2ZpeCBhbmQgbWlub3IgZmVh
dHVyZSByZWxlYXNlLiIKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5u
ZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhs
cy9idWlsZHJvb3QvLS9jb21taXRzLzhjNjY1MGQyZDNmZTlkZDNhYzhlOTk4NTMxMzdjNzE0ZTkz
NjVmMWMKCndpdGggdGhlIHVucmVsYXRlZCBleGNlcHRpb24gb2YgdUNsaWJjLWJhc2VkIHRvb2xj
aGFpbnMgd2hpY2ggYXJlIGJyb2tlbgoKZXh0cmFzL2xpYmMuYzo0OTA6MjU6IGVycm9yOiBwYXNz
aW5nIGFyZ3VtZW50IDEgb2Yg4oCYaWNvbnZfY2xvc2XigJkgbWFrZXMKIGludGVnZXIgZnJvbSBw
b2ludGVyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1jb252ZXJzaW9uXQoKd2hlbiBidWlsZGluZyB2
bGMsIHRoaXMgd2FzIGZpeGVkIHdpdGggaW4gdUNsaWJjIDEuMC41OCB3aXRoIGNvbW1pdApodHRw
czovL2dpdGh1Yi5jb20vd2J4LWdpdGh1Yi91Y2xpYmMtbmcvY29tbWl0LzMyOGUxNGU1NWYzNWVl
MzMzZTVhMTljNTcxN2NiNGJiZjQyNmMzZjEKCiBwYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2
ZS5oYXNoIHwgNiArKystLS0KIHBhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5oYXNoIGIvcGFja2FnZS9s
aWJhcmNoaXZlL2xpYmFyY2hpdmUuaGFzaAppbmRleCA2NjUyNTlmMmI2Li5kY2NiMmNjNGE3IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5oYXNoCisrKyBiL3BhY2th
Z2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLmhhc2gKQEAgLTEsNiArMSw2IEBACi0jIEZyb20gaHR0
cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9yZWxlYXNlcy90YWcvdjMuOC43
CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9yZWxlYXNl
cy90YWcvdjMuOC44CiAjIEFmdGVyIHZlcmlmeWluZyB0aGUgcGdwIHNpZ25hdHVyZSBmcm9tOgot
IyBodHRwczovL3d3dy5saWJhcmNoaXZlLmRlL2Rvd25sb2Fkcy9saWJhcmNoaXZlLTMuOC43LnRh
ci54ei5hc2MKLXNoYTI1NiAgZDNhOGJhNDU3YWUyNWMyN2M4NGZkMjgzMGEyZWZkY2M1YjFkNDBi
ZjU4NWQ0ZWIwZDM1ZjQ3ZTk5ZTVkNDc3NCAgbGliYXJjaGl2ZS0zLjguNy50YXIueHoKKyMgaHR0
cHM6Ly93d3cubGliYXJjaGl2ZS5kZS9kb3dubG9hZHMvbGliYXJjaGl2ZS0zLjguOC50YXIueHou
YXNjCitzaGEyNTYgIDM4NzNhODg4MDFkYTA2N2QwNTI4YTk4OWFmMDY4Nzc3MTA1MjlkNTBlZThm
ZTZmMzk3MGNiYjQzMDJlZmI5MTggIGxpYmFyY2hpdmUtMy44LjgudGFyLnh6CiAjIExvY2FsbHkg
Y29tcHV0ZWQ6CiBzaGEyNTYgIDMwZTU1NmIzOTU5ZTM5ODVkNjZlZmVmZWM1ZWFhYzUxZDQ5OTUw
NTNjYWExZDNjZmZlNmViOTE2ZjE0NmYyMjkgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGliYXJjaGl2ZS9saWJhcmNoaXZlLm1rIGIvcGFja2FnZS9saWJhcmNoaXZlL2xpYmFyY2hpdmUu
bWsKaW5kZXggZjExZjVkOGY2Zi4uMjNjYjgyZjdiNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJh
cmNoaXZlL2xpYmFyY2hpdmUubWsKKysrIGIvcGFja2FnZS9saWJhcmNoaXZlL2xpYmFyY2hpdmUu
bWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJBUkNI
SVZFX1ZFUlNJT04gPSAzLjguNworTElCQVJDSElWRV9WRVJTSU9OID0gMy44LjgKIExJQkFSQ0hJ
VkVfU09VUkNFID0gbGliYXJjaGl2ZS0kKExJQkFSQ0hJVkVfVkVSU0lPTikudGFyLnh6CiBMSUJB
UkNISVZFX1NJVEUgPSBodHRwczovL3d3dy5saWJhcmNoaXZlLmRlL2Rvd25sb2FkcwogTElCQVJD
SElWRV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
