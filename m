Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB39BCD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB0F60D8B;
	Tue, 16 Jun 2026 16:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLpj6zMeEk71; Tue, 16 Jun 2026 16:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC276089D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781627121;
	bh=HNSi2kW1xlw9A60k1vO9v+Nf2Sgz+ajdAVfYPNt0FIs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CgDhjdOKLO+jaoVKHg26UVTX58LCEnhp57KcJk/8Qot8qGLzEKppvt4kTbQWtc4yU
	 0kxPwNKHwip6acJ8GgoMsOuNklOsEgFjUua88nXYv/jhwaHb8JmDzmF7jftfOqD7zg
	 ugBL/Ej7HDpgP3njl1WIOBh9VT5TyPSIdCly6Y1hjfMSr4Ka4nBH2/xY1G0P3Yd+BU
	 VQh66/Zmj6nr1wF6BErMnFTPgjBkrosaimyxR3xLGNQtz1eNp1pK4upg5G222CGH3b
	 PYf/cSWWeR80VV4wkV2lFc3pqVj06xR8LMwlFFXLbYMfYEXoPumXOkZ5mbe43sNZyY
	 zkpe3qCLgZKQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC276089D;
	Tue, 16 Jun 2026 16:25:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1FB1169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3ED440200
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tII5_SozJ8Af for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49A51401EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A51401EA
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49A51401EA
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:25:18 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZWbDw8gk0P2aDZWbEwn8Eu; Tue, 16 Jun 2026 18:25:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Jun 2026 18:25:15 +0200
Message-ID: <20260616162515.2677961-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ5wxZ9YK4bk+hDYNzyUNGTLZjrzjA3tdMcHUiOsz+eceftwLAP1avg20xdq2S3YEP11WgsfGXZsZJLvKpmquRsDUGyrwMHHiT8/sl/OpexJaeWxXOan
 2dprYXVdBpwrws4pJB3pnMR9L1tnAIbkP6lNCmB85tmvyZON59iE/T68XON3d5KicMnFz+wBVdAX7+d/eosC38jPdYg+WQXS9b0N7Qudi770IxsfD0KIZhnK
 68GUpfre8ZeLerTSBxi6z/RWH1P5QZRihN9uBb40DygmsTdPCoYi6qsMnRY6+MC53Qo/MzD85DCtkAWtU5vLRA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781627116; bh=+OsYMm76rIxCRXAxaiRy9mtO4mC1E4UwjbM4wGUhnq4=;
 h=From:To:Subject:Date:MIME-Version;
 b=baZIriFGj7Uaq5sb5HZIn32erUyQvEdv7anspAs+A0mhn3j8M35M1pXL5XPgwQMZa
 3wT/EO0QVZQeSop1GaeZW/JatPUc6sWX1S9DuNyl0YHeHwe+iL+66zosF1snTae24A
 /6W07pG5ciFJPtzfXSfDDsimAV1qhXb0/MjzypVHM82KTdNYWQn/oPTrx55WWToOtL
 Zwc4yffmY04R3icwN1lYLOUf2o9ROqugesKCtExn96MCFAEp4Cmzk3hPMuTnaE0ph8
 W/cqS8ugwNJzZ6ktlVwGA2y4F1akR4yvQJbIPHO6w0Z7Z2nEqJ4OsSrriGVcOKwutw
 m65qggS48HEzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=baZIriFG
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure due to
 warnings treated as errors
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

At the moment a lot of warnings are treated as errors and this leads to
build failure. So let's work around the problem by setting -Wno-error
thus keeping warnings as they are.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..6ce398933a 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -8,7 +8,11 @@ RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+RTL8188EU_EXTRA_CFLAGS = -Wno-error
+
+RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m \
+			     USER_EXTRA_CFLAGS="$(RTL8188EU_EXTRA_CFLAGS)"
 
 define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
