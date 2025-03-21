Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5509AC36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 16:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFCB2847DB;
	Fri, 21 Mar 2025 16:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwwnh2W-mOME; Fri, 21 Mar 2025 16:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7F3847C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7F3847C3;
	Fri, 21 Mar 2025 16:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BE421A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DD1140461
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6-xOiJE03La for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 16:42:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F716400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F716400C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F716400C5
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:42:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c462.dip0.t-ipconnect.de [79.214.196.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89FE6A4C1094
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:42:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54150)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tvfSF-000000007Bk-2qBO
 for buildroot@buildroot.org; Fri, 21 Mar 2025 16:42:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 17:42:43 +0100
Message-Id: <20250321164243.936786-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742575363;
 bh=Y/M24L6jQCFlTuIx+ccVTCPhRW4fPofpOMwjfYpuqGo=;
 h=From:To:Subject:Date:From;
 b=DVNpbQ+NV0epaN357ibEQcolN9NxW7ZGUNr3fM2q8f5Gr5JrZoJ79VWOuw2ZhYwaZ
 Wi6fIu+nS4EUgwaXCU8AZp/fB7KFOw/zRhhHSeQ+7lr62oIoFlzzL56tehvXhm5iWn
 x7IC5kP6Dg6Yy63Jhoo5oih6MxPMcQB1eVJycrO+523hJWSHkHR+n4OAF0IpxImq//
 oJgdTIvoK92OLB+Bhw9gCSSbY/tU8gYLfsboj6R8gsNbyxiKDVyax0ZIuSlL8XRlCS
 9c8pW/87hOnYzCWWn4lEdAzzJnz/rDd5CJcK1+7EUI291ZxqRrk5BzMAMClITHIen/
 f+EnQ9cVr4lBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=DVNpbQ+N
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.15
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

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-15/17998

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index def488d516..d2e3cc533d 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.14.tar.gz.sha256sum
-sha256  5047e1ded12d9aac4eb858f7634a627714dd58ce99053d517691a4b304a66d10  tor-0.4.8.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.15.tar.gz.sha256sum
+sha256  5d5d99e21992c4c71af1afcef16c70f4c5e7ee021633ac138b2a2761be75064b  tor-0.4.8.15.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f4e1efb051..e8e769bdef 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.14
+TOR_VERSION = 0.4.8.15
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
