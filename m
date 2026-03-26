Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF410AB829
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00ACD80BFB;
	Thu, 26 Mar 2026 21:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dd6pScqP3CMT; Thu, 26 Mar 2026 21:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 218D580C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559795;
	bh=CrvpPU24GcMc/w9ZbUxy9x1l7BsOkH2nYEeETvh39p4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DUjJyfs8e0+fLoX5NYik5lUPs/9U3piQZq58eOa2KrFx81gd63S6E+TkndmpN7opa
	 hqc3YcghXFJk/3TZ36oWkAT/gcz//0nelUK8DscSiBlkB0GMhJtm+/BNJiXub5nUNe
	 VUNdRTwWLItaNpOL2kQiKqRnvxS0r5mV8SwgMgZhK1Z3TFy0x8xUSEnFsO8UwG1WM9
	 kDsVPcMrmyLU6qfgGWtlqi3CVBhKUKJWY8J2ROcLoNQTu8rFrP5SN3VDLzrcr4lqKT
	 IA4n5gkjPY2haB1P1LTGh7AcWIa4rKPH3SGFPzE4JC6/+a08JbCMvlx5Ws6zXMJY3t
	 dY8OVKf3IvYSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 218D580C17;
	Thu, 26 Mar 2026 21:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B91C2D5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5168280BFB
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xby3wkFHZVcU for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4116C80C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4116C80C17
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4116C80C17
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E0DDA4C0DCF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:16:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55454)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s47-000000007Cc-0IRV
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:16:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:16:31 +0100
Message-ID: <20260326211631.3598817-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559791;
 bh=GdVshkeGq5OpUtez6ZyRzr9SHwXUc60M4oERZPeTx/4=;
 h=From:To:Subject:Date:From;
 b=HtnnoSRmQ55ynW3V24Oddy2n6vLPXmkkeBw9UkNwPo1f45n7BCK2zzmmIwncF3xL6
 uxZ2XZPd/eB/DLxyUPBx3NHqNN1mU1lhakdhwKX/y0lETYOhc386sfSn7E+Gi0EM1m
 cgNoxq3PJbQBNgvdWuzk9VUUX8cReTpExj6PZUC27JxQQH/vRDqSvtNtauykem4ieQ
 JqmtU29RPgyrXAGNgmtPdSF4QIH6eFJ3XMjo5V22RWEQsjaNrWUU3uAYsE+gfhjQwU
 rL50F7J6awh8ymCdxy06coq4IyMXXZQ0+yTN7WHYrKoqYToup4fsR2KASahcriRyB1
 aDoHXYS2n2d7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HtnnoSRm
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.6
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.6/ReleaseNotes

Fixes TROVE-2026-003 & TROVE-2026-004.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a4b0af12b5..a70b9e9baf 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
-sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
+sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 36be7967bf..f11afcc449 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.5
+TOR_VERSION = 0.4.9.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
