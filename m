Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8253AFEFB7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B6A40CFA;
	Fri, 27 Feb 2026 19:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvL35lQVKYpP; Fri, 27 Feb 2026 19:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF9040CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772219288;
	bh=1/XLM7Zram1Fwk0ivxybH7nnkmKEs8JFiH9Lh8nHQT4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfZaVX6I70S5As1RhlG/L5lAWg0zzkppjYOBxZyR+OEJWVMAjT0FMmne8ZfJKn+d+
	 gyIIq9zmdrBfuYNrzHiTLfa2exsfVNoEP8C9bWFhA03K5mq6ukRVDbeyoyS9zoXBao
	 T74phU1QEw/2f5Ki5EJIyF0Y9PSUHF5/YZYJok2g4ZQcR1DOykTWlMDMNh/wYnV0FD
	 RrXATSCWl3e+2W9g/3wA6QVqFKRtrfydEtmv3v10CWwcOpjjDI6eLxPA420dViiawC
	 t3wzojAfZgHG9B2Uqvk9w7XcUMQeC1SC6Npy3fDg9OGF3yYe50dCPU3UaqNu5ZxCHW
	 M6AKA+MjG8JdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF9040CEE;
	Fri, 27 Feb 2026 19:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED0061F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2EE440CEE
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf3ols05PBU3 for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDBC540C84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDBC540C84
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDBC540C84
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:08:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0CAADA4C2FE0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:07:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55624)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vw3Bo-000000001Tz-4AUs
 for buildroot@buildroot.org; Fri, 27 Feb 2026 19:07:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:07:52 +0100
Message-ID: <20260227190752.2041167-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227190752.2041167-1-bernd@kuhls.net>
References: <20260227190752.2041167-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772219273;
 bh=eoxsIhSQpLPxUPdadBDaeyKl0ZId51He4laQukEawEc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=gq/W1PA+AEZ8beYuW2D3DiEjX9FpZnKR8C6MUcd9meUOd2PlFR275D1ky8/0b1y1w
 AI5S8Cg7Qq158+SLJzAu3tuolarlkDi0I1l0xD0aiPG0GixHJCNsIR2eAEwwQg6Qwz
 vndBZo31eF2e/xv0x1GmIwhZx/sev3pWvI4Z9AmyixUiFzP8wuPTbi87Sgi1is+VzA
 y7R4uH25XijqRW0bVvIzOfR7sEsoKaIAQ2bDQWnMHbh3DhdrxYyHniGwzfjBBy4tq6
 Rdvi3gqvY5A5CxBuFtOfAGbMATjQlGbp3L8arZIAnNfxDx8AJslueFd9F1/+hzsG7O
 x6U61k1E68whg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gq/W1PA+
Subject: [Buildroot] [PATCH/next 2/2] package/flashbench: bump version
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

Bump to latest commit on the -dev branch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flashbench/flashbench.hash | 2 +-
 package/flashbench/flashbench.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 8b087c2a10..d5ff4e3a6e 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  408a2642700b7f8daf4356a49948b921137ad15bb6e0fd05b1cb8dc700c154dc  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
+sha256  27f41fb12012775c26f40b537a0a34387263c558dfb6446b54c333adebed381d  flashbench-d783b1bd2443812c6deadc31b081f043e43e4c1a.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index 28ce7f7dd1..186e9c162c 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
+FLASHBENCH_VERSION = d783b1bd2443812c6deadc31b081f043e43e4c1a
 FLASHBENCH_SITE = $(call github,bradfa,flashbench,$(FLASHBENCH_VERSION))
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
