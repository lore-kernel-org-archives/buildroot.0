Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871BED10366
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 22:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DBF641100;
	Tue, 25 Nov 2025 22:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cz2zeAZ4FSHF; Tue, 25 Nov 2025 22:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5770A41101
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5770A41101;
	Tue, 25 Nov 2025 22:12:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F771A6
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E882D83E3F
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imsfJk8rUMR4 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 22:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE46883E3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE46883E3E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE46883E3E
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:12:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD2AEA4C74B2
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 23:12:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46996)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vO1HC-0000000054v-2IdD
 for buildroot@buildroot.org; Tue, 25 Nov 2025 22:12:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 25 Nov 2025 23:12:46 +0100
Message-ID: <20251125221246.857929-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764108766;
 bh=zVn8VVs2tBJXv8KwxazPI6uoaOxrBlznOWZOh2BHkms=;
 h=From:To:Subject:Date:From;
 b=VZCATgec9ikXp5WZuEC+O/aPLWDygQR4HfclR+D93caGz0ODyKYss/srYhlvu0rdD
 w9De3lw2PDeoL2ZIMCRxoPdDqP8VQttq3qjuMrCPL01gpW6tpiCqQ4XyzDkzzH8ocA
 M0VL4ygfMS3MhrE3qp6vaLZsgNSMQCWTYddHgsnroawHqNvBen+CLs5nl80OzhBINU
 pQ9w5tBGU42KV2StHb7ieBdnep7W+5aq3ediTUz3Etjoh+A3OUK18x1mSVoOec/L0P
 xtJtubIE5jdrEiSXmU6zbfHmWra50bcGRpwShZL7hX3VL2FWxjsbgKikOKQloEDR78
 FbJX+JeoQKZUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=VZCATgec
Subject: [Buildroot] [PATCH 1/1] package/udpcast: bump version to 20250223
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

Release notes of this bugfix release:
https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/JTGZCUMSXYLVT73TIRJJICBX7AWIE4CA/

Switched _SITE to https.

Fixes:
https://autobuild.buildroot.net/results/acf/acf208588c2ca7e658a9a7bee49b947309d6b8be

Upstream removed the tarball of the previous version causing autobuilder
errors, first recorded March, 2nd 2025.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/udpcast/udpcast.hash | 2 +-
 package/udpcast/udpcast.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index aca098d982..5b0426efe6 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  17b5cd8b1e54f7e2e53357ac02ee86e4198bf704096987a03a3b5c402a0ecea1  udpcast-20230924.tar.gz
+sha256  cefd7554c877e1bc76987d2b96b23f7699a2e5340c254454f61b6e0dae370aa7  udpcast-20250223.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 64a0bfbd37..e087f2dbb2 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20230924
-UDPCAST_SITE = http://www.udpcast.linux.lu/download
+UDPCAST_VERSION = 20250223
+UDPCAST_SITE = https://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
 UDPCAST_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
