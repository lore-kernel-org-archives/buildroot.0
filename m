Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A5CCFA07
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 06:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 734CE41019;
	Thu, 26 Sep 2024 06:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3erX-NvVdhNr; Thu, 26 Sep 2024 06:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E89D41085
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E89D41085;
	Thu, 26 Sep 2024 06:15:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7780D1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 06:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7103340705
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 06:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJrnlXpYbJQd for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 06:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 247E342717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247E342717
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 247E342717
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 06:15:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf66.dip0.t-ipconnect.de [84.161.191.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B4C5A4C2D6C
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:15:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48428)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sthmS-000000000Qz-2tDW
 for buildroot@buildroot.org; Thu, 26 Sep 2024 06:15:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 08:15:11 +0200
Message-Id: <20240926061512.13021-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1727331313;
 bh=Px3UGU7yQGfi9EAYzw4neaZeuA0Tx7NGawISr29G5Kk=;
 h=From:To:Subject:Date:From;
 b=o6KHN+s56N/X6gtwSCG3+NbM16SuWSEI8CzOJiyQEJ2Shj1PpGe3WVzlbm+qlVwt+
 E3aX4fGlOorWGAZiu94bFGVSk8iJrK/vhTgCrCRvS7oiYdIuY1IusLsLoqj14OktM9
 wZriI8lfydfuyT2eKLbG+5QqErQgSpnmLrYrj532yV+X2W74SJA2SM8TvVki2LBp/9
 Z7moy5o7cUnhy2KJQbvymAy6F4kw3kywiYgdamcOlBCVSXaZKTXnXLR703QKYeZvGq
 9fQsAsWlxr+tlyXWtL3HxaSXrABc4UMPqlCbMyI23zhbLF/ocNZujj9BxXiLpfmRbM
 S3sdCtTeMiXUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=o6KHN+s5
Subject: [Buildroot] [PATCH 1/2] package/libilbc: switch to github
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

The previous repo is not available anymore.

Fixes:
https://autobuild.buildroot.org/results/8c8b073ce163131763fca978b400e596fcf39e62

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
This patch is suitable to be backported to LTS releases.

 package/libilbc/Config.in    | 2 +-
 package/libilbc/libilbc.hash | 2 +-
 package/libilbc/libilbc.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libilbc/Config.in b/package/libilbc/Config.in
index 89d5db2fd6..db3486c1cb 100644
--- a/package/libilbc/Config.in
+++ b/package/libilbc/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBILBC
 	  iLBC (internet Low Bitrate Codec) is a FREE speech codec
 	  suitable for robust voice communication over IP.
 
-	  http://www.webrtc.org/license-rights/ilbc-freeware
+	  https://github.com/freeswitch/libilbc
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index bd0bf89d42..be88d6f9c3 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ba11bc22e353887cd7c605a25a5b9bac464f11f8cb103f652e095ae7e0f04f77  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-git4.tar.gz
+sha256  fe4827a548e96f0549dd8f30eb6a48c6c55fd4535de6c8e9c6e4f38bea6190bf  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libilbc/libilbc.mk b/package/libilbc/libilbc.mk
index 06d94eb36d..d8139ba205 100644
--- a/package/libilbc/libilbc.mk
+++ b/package/libilbc/libilbc.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
-LIBILBC_SITE = https://freeswitch.org/stash/scm/sd/libilbc.git
-LIBILBC_SITE_METHOD = git
+LIBILBC_SITE = $(call github,freeswitch,libilbc,$(LIBILBC_VERSION))
 LIBILBC_LICENSE = Global IP Sound iLBC Public License v2.0
 LIBILBC_LICENSE_FILES = gips_iLBClicense.pdf
 LIBILBC_AUTORECONF = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
