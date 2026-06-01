Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898FDCD6E56
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 12:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4802784DC8;
	Mon,  1 Jun 2026 12:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ht7J2YbdjsGY; Mon,  1 Jun 2026 12:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F17B84DCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780317209;
	bh=DOGLK4cr638R3mLtZcIaXqRzytK8nWkJ8lXvGh4f01s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XJJsCLdjjOeXqfsLfXu6jZ9JnkNQMDqaiuou4Rt7OId1Fj+K05eq80fSb8PTs+StY
	 kf8CPTWGQhRzNv/upA5JnnQlSZAAsDvb7NZe5XVn08uhJmAmk+VObYHF/FE90Tk0hB
	 mDDyx7QcPWPPHUszsGvJIJ/Fh2U4cQyS6pPqui5O+Zxq/MrpGxLoPleUnyDHo5d7gc
	 rniNDhfxJxchI34doRxmE5+wpP0z9qlwVjX4gmkbY+Q3iCdRsAtOYnf7i3R3tJyX1c
	 J3qpA9NJ/Io1+VmNz9paxvlCAHBSXuY5oIP/AUI8T3zkqPoA409DdHSbo97QXRRn4s
	 ua5JT8bWlG9VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F17B84DCF;
	Mon,  1 Jun 2026 12:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E60A294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6050960F7D
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KL4G51iyjsg for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 12:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29D4060F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D4060F97
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29D4060F97
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:33:23 +0000 (UTC)
Received: from localhost.localdomain ([151.78.192.252])
 by Aruba SMTP with ESMTPSA
 id U1pXwKvI0tpTfU1pXwWsV8; Mon, 01 Jun 2026 14:33:19 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  1 Jun 2026 14:33:18 +0200
Message-ID: <20260601123318.127134-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEkc5ddkLsxcuyDCbDCYIRtFhEDdfb3Uc/ScoPlIXbcAQrZXRy0AT+b6vwdB8bRYQF+zmNEYIOnRVH7zfQT6k3QT4Oe8eDhhB3yieuKmU9GF6PcN4FR6
 KZe4aqsVXpwydLDw/fk7ccuv0VgIT3XrAApKJRqJCBgM5yAxxpzzLXxHzbJvlCkt5dxpTN6iimf71gAXngHHb+K1nvY29wHw9K/bFjyJwWmA9USEwdu2VbUl
 DacntAZUmNQUK24mjHEpOdWAWUzQxwBwR+OeEcmpagoQLLB0AK6RS05RCInI552iJxEknBC9ImsARDJ1GoVrkA+J94Q9bKqDjHnHIYQjI6p6lgW2/vRBetPs
 R6u3A+LK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1780317199; bh=iDKtKN+p0ui/9hwS/gfnhQN5TFEm3yiJFt1tsJJ0Ty0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ao+SVuCY6lIz/9VkFFfFA1bZF77FKSYLlKj4n7ZR8H1UAcbbhHjfk13rEoAacsmcf
 GH6XpqujtXeTJgtGoSfMiGnplt2vO8M4J4ZcMZQhJBsKarUjBUuA4dl2skR7RAxWsW
 ChvRYZtyAwuIlxNWuh6omqrE/fODNUkP70ODrwkLvqbN/j3bC9pmeKC4Rk++kWVzPK
 8MaSKNddAuyGIa+GuelVUHz7mRo79vA+B1yigH5porc9S6Jn6Ch7O+33tYvy+I64t0
 CQMIEKXoX5/Pi66Zqh9IItV/lArp7eLzsLn8Y/TsXEiwBNsNhyV79B6XCVvNzoIEyA
 jONzSoa5juNyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ao+SVuCY
Subject: [Buildroot] [PATCH v3] package/erlang-jiffy: bump to version 2.0.0
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

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.0

On version 2.0.0 it's been used https://github.com/kolemannix/ffc.h
that is covered by Apache-2.0 so let's add it to license list.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed LICENSE hash as pointed by Julien Olivain
V2->V3:
* updated license list by adding Apache-2.0 since now package is covered by
  it too. This as pointed by Thomas Petazzoni
---
 package/erlang-jiffy/erlang-jiffy.hash | 4 ++--
 package/erlang-jiffy/erlang-jiffy.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index b5cbb99f0e..615bd02104 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
-sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
+sha256  d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  erlang-jiffy-2.0.0.tar.gz
+sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b0839210d6..b07db71a09 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.3
+ERLANG_JIFFY_VERSION = 2.0.0
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
-ERLANG_JIFFY_LICENSE = MIT (core), \
+ERLANG_JIFFY_LICENSE = Apache-2.0, \
+	MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
 	BSD-3-Clause (tests)
 ERLANG_JIFFY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
