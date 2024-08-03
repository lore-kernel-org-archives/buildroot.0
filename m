Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D91C52D6D
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F14340528;
	Sat,  3 Aug 2024 10:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OF3_xJOHVHS; Sat,  3 Aug 2024 10:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CEC54057B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CEC54057B;
	Sat,  3 Aug 2024 10:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33D011BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2214980F21
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twlZcMGbbeY1 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DF3180F1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF3180F1D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DF3180F1D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:50:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02F15A4C015A
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:47:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34320)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCIR-000000003VZ-2ZYi
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:47:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:47:35 +0200
Message-Id: <20240803104735.2574298-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682056;
 bh=KDH4xMNpnnpJt5jELCTR6s9xZ9b9m1mBLNQn5/WyjSE=;
 h=From:To:Subject:Date:From;
 b=ZeQP8LQbw006+vc5jEoCDT9U6bVndHCLG0TNMEQvKPIeSX82F2BLiaqTgNUEAZNbK
 cQu8iuPibgVQ1V46hzjBsW3pag5HYHd0J6J31qkhaHEeL9jFV49AzOSEDj0NCGGkzQ
 NfrlQdCSylFde+4R+/DAFzNLCl3vo3Z0F4nUF+JlFdt0iN1x6muV+3ELDEeYZJegad
 VBdiN1C3yfMobXNRRqbqVH8En/y9w9sA7t6yjTOVOrlzXzhc1/C4s00QPYSn/VfcQ3
 Tri/1UNsXt7NUj7QDPncTldNxiSTQCDmX2QZdEHrc7LsVejd2grMuUY/zPhn66fF83
 ber3RG29okbxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ZeQP8LQb
Subject: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.17.3
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

Release notes:
https://github.com/libass/libass/releases/tag/0.17.2
https://github.com/libass/libass/releases/tag/0.17.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index bf9b8251d7..2f6b554e3d 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f0da0bbfba476c16ae3e1cfd862256d30915911f7abaa1b16ce62ee653192784  libass-0.17.1.tar.xz
+sha256  eae425da50f0015c21f7b3a9c7262a910f0218af469e22e2931462fed3c50959  libass-0.17.3.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index f48673014a..f198ee89f0 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.1
+LIBASS_VERSION = 0.17.3
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
