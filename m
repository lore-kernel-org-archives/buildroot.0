Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FC9C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4C8A80E19;
	Fri, 18 Sep 2026 17:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5-PptxdY8qN; Fri, 18 Sep 2026 17:02:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BBFED80DF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789750939;
	b=DkOOsU9gA+rkAA29LtUDkBddBdFh1tmgS92N7djKrZiZFbFmfZ9wQGN/kVAonpjGrm8V
	 CICASIgtCCcIIuVde7Yz2pJW56jvRk9GKVRtLNhLfHnQXEFnNLIPrG2xDVNC4dYoLIv/H
	 nyYbJ2UUqVkgWO3OxWyk3tbt8AWolcCjdKEGsmFZFWRv695Db+1IPRUqx6YzeEtmKFSM9
	 3lbl8b/pnCnUnZ/RL64RS3dYI5ixd12Su/SyP6vEx9e1M2V2bQp01/EoaRa/ueTb2UG05
	 fUQ6cAh1a9Sk6ruI1hbEbDqYmZatIqbtzWmGAjTKxuAXEknec5WO8iJPgq0FFEYZoSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789750939;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=klyYBBnG82qNq7It/YEmtNAGGmrWH1hKYL6wF7t0KDE=;
	b=kSVARKhQwFtcnbXzJ+WFCOH3nDasnltzuMtjfLOGqXMOwZA9GSMgnDuLRBsMtCHrh8cn
	 nbYDgY3DOwiqBpaPMKQsQhf2LRAYoD9iNmYtrqMSJToHDiai4efEWR0tF1TqueheSrKQH
	 2idg5WXBn5krPXtl28ZVC26AVDqoFbf7fLRCfJwXKsok9bUu7Csgqz95O2MbI2fE/IYX9
	 nmxUTgFPQK73Rxjn40rSFkJXmFWx/3xcgejvV8WV53nOpe5IriuB9fgHl62jxuz3ni+Uj
	 hIXP2nPybdKGFOmsC9g+ttQQ5TCK8whSHIS+DrirmCWIERqhLT1PKi9wsRJ1CXQvwzQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789750939;
	bh=klyYBBnG82qNq7It/YEmtNAGGmrWH1hKYL6wF7t0KDE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LZMFCB5k9WxoUoaG+/tBytMe+WZWimrC+yeYffLtd6PG2rqcMS2FJxoLN57uqdMfY
	 E2aD7F9R1U6yBM6kin2HXmCcct6Xy6P/cGQQ25DANOcDahWkDl8P0QkPdXUuxSMyYr
	 ZfTXh2nCIPcLbSchYvMRz7JjHitcWAHZG98as5c19k7BRO3XpdZukzr3SHk2XCxzZS
	 MibxDY4ybnIEUwYs3xL16uXBKk8YLowhnhMR8mu9iyt96qxGt+DgGFcWejPBUJXGKl
	 dG6Sv4yGIEoP2DGmBaz0Ep+ZDJ+5QSog0ABriNgq4Hg29tC8XjF+8VFy1NKD1fjVKN
	 TcybED3YXx0Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFED80DF3;
	Fri, 18 Sep 2026 17:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 927563B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FFD60D70
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlIIoNnmMQk5 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:02:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8808160D62
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789750933;
 b=qGjzWSF86SAhcU5bnj78HJ/XD02ehnYyIvJhyK3z01y/O6GhDgR305Nf/vBAxmzYLvsr
 5fJwdDMkVe7ibu2MLGCM+Nznf4GzK/Nad6Z3455vqgkJhTr7DI2l1A+ZSFpEVfwOlyCcJ
 AI8UrXHfybHP8eAinV4PMprJrqyGJ15PlKaTvxH1g9ClFACWrfZmzNnxWuYaXyGwFaIRM
 YjFYwRh6TAoLGr7icQevS6vDX7cDi2bx7tGSwQftUr1bk0AoJZydC9GwQFsiISPRyuOp5
 Hwd4Hm7Tzevc+PfyYxgU3+s7yFMTcrBVAP+ckDMLvd/vWYd4uBoKPVuv4XYvaglx1RA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789750933;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HLpqJDwVIN5hH5zazsp/kMjthvyARVMcDMVlpUs/OVM=;
 b=eqrkrm26mDKCHvK9NeuF2+uLIEHxWx3tFRl/d/h7hjKaFvIzGoMyi/kCTC97my9IWf+4
 AqDX+1CTLi4Rx5B+ZSi5pqQFq6aHI9lCKEu1BTuLsdGl7y5vCkB7T6mLOgP47EPHipIhx
 Y4ae/Z7yHHPlyq251VWdvr8f29S/0+xXmWzh5lUGAJm+rYZ36+xeRtqEsMmCUDcmkBhgU
 6QHDKsNedu7m3/V+QhSpPQS0Z7Xdp+Sp6eJqHeKwEOrEGieVNEzj5OjibTmh9UdwKZ46p
 baH4G/aD/r/FvxFROOVzq/WcXaLIUsNRPQR1UuxY2WQfs48Br6BlIHymuwboOj0XCww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8808160D62
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:02:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 145A0976A0; Fri, 18 Sep 2026 17:01:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 18:56:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 267db9da2b4ed1b0e70e46d97db717ca6aab5d47
X-Git-Newrev: 098be4f99a33b9ca67e2edfc92c517a66097fb2a
X-Patchwork-Hint: ignore
Message-Id: <20260918170106.145A0976A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: security bump version to
 1.26.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/098be4f99a33b9ca67e2edfc92c517a66097fb2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-1

Fixes CVE-2026-81642, CVE-2026-81634, CVE-2026-82717, CVE-2026-77955,
CVE-2026-78227, CVE-2026-80225, CVE-2026-82720, CVE-2026-85501 &
CVE-2026-77860.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index a6bab2218a..5a0a52a7c8 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
+sha256  35a6dc0e425a9282c3426d9a3043144011bf0534aed4b73ab62c52aee0af1503  unbound-1.26.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index a3a1baaa94..d6886d4a5d 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.26.0
+UNBOUND_VERSION = 1.26.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
