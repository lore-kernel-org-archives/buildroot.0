Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38629CD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 18:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5B046F808;
	Fri, 19 Jun 2026 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txAqnhNsy3QB; Fri, 19 Jun 2026 18:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE7D6F7F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781895428;
	bh=QHnyfJ6U1q3AtpSQN5BYQq2yKZh1l66N2G8/KNDbcDA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q3al0RDpIAo7yUPA1pfTyk1DI/fd1pyifNGyjl41PCImWy9GyCPuIfEImgFz7sysW
	 PljjpEFS405/eTfNGD3FdNSJQdO1+EGkYqreBP3bZtdVJJBseBXX+RRJTrItaCcREh
	 +TxfPgc7rpbhMDIfQY7rYw6DRuf3lLkEp3xA7IfpnsuA0h3Fib0K5mSXt13kcJxiBN
	 54mqwRf4cEiuVBSAjGRiNVbZGRsEBVO6uHiLIG3+1uJrTso34MLQUSU4/CIsQyVFSV
	 GryETNl+r729D8VmLNSFosotIxl/RFaLodMue743hiDQDed6RSfHCczF7stU3QFpaD
	 Bbpo5IugjNHeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE7D6F7F7;
	Fri, 19 Jun 2026 18:57:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4068E279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 18:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24E9D6F7F7
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 18:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsHSjHNkVASy for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 18:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25AEE6F7FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25AEE6F7FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25AEE6F7FB
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 18:57:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a031f.dip0.t-ipconnect.de [91.58.3.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D2D0A4C039E;
 Fri, 19 Jun 2026 20:57:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41172)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waeOi-000000006J4-2h0J;
 Fri, 19 Jun 2026 18:57:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 19 Jun 2026 20:57:00 +0200
Message-ID: <20260619185700.3353234-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781895421;
 bh=KWxAVD6H1APo4jsCg563CUzx2FtPi93h+gucPhQUw4c=;
 h=From:To:Cc:Subject:Date:From;
 b=YedtiauKv92/Xf0XbqHbXEf+zH/RbMuAUlA8DFnXcN5ZVfkHat9VaKy8Mlzeorl9l
 4jxay3MsXvRpMSRIsaUhk/bkdfCePspwvf+EPwrIPv0lxHsvmAiGEBz26I1yMSUTwL
 ccEcqFxWYw6DWe0YuNmZtJm/5EJTRCtWALG7kK9DSNQckkoEx9Q6OQ/qruvrlnMS4v
 JD4YsRiUXf/AYEo965jxxPfecjYicAlV32vN6vGEsaMAReCEHswst32GPzLAo5sqsw
 EUBRU7qUbzDkNtZuBd8BF4NW+finITEWFcCsJ/WVkthDvRGQpzohlpFEi4LtHL8mUX
 eFh5SCg2tiCMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YedtiauK
Subject: [Buildroot] [PATCH 1/1] package/tmux: security bump to version 3.6b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://raw.githubusercontent.com/tmux/tmux/3.6b/CHANGES
https://github.com/tmux/tmux/issues/5109

Fixes CVE-2026-11623: https://seclists.org/oss-sec/2026/q2/934

Switched to tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c15a0ae45c2f5c1817dbc4695794841cc3a00ed6

 package/tmux/tmux.hash | 3 ++-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 867fbd6c55..34419940f3 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tmux/tmux/releases/tag/3.6b
+sha256  390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7  tmux-3.6b.tar.gz
 # Locally computed:
-sha256  b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759  tmux-3.6a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 1f98cad706..b435c62a8c 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.6a
+TMUX_VERSION = 3.6b
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
