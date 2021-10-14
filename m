Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E863C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 939E76108E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 939E76108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F036068A;
	Thu, 14 Oct 2021 21:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nbbki78r4TJj; Thu, 14 Oct 2021 21:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE8D605DA;
	Thu, 14 Oct 2021 21:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABDB1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89CC7404B2
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uK2EijTFlYcS for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:54:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719884033D
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:54:59 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8gjm2mFRumo4b8gjmr1du; Thu, 14 Oct 2021 23:54:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634248497; bh=0TxLgheNWEwDbCd1MQpwmnrOjtaqRw/VSByEx5EIrfk=;
 h=From:To:Subject:Date:MIME-Version;
 b=L/iNF+N+OJMPHTRiiMsuNwwHK56y6KXv2HIkloGLs7O3ydhIYESw9Jq3d4M53xSgJ
 2/iqBt1gyZCfHeAunRwBBg/X577r6uKbOEQhRk6386XW0w8M3ZFSt7nsYBAjOkrEoX
 +k3FWClYQvUqfxoruLbuib1r1NXhx9wMxyhYb8rTwduNUXe6EakLtqwfxt/yWQ0n68
 H+IKSTDH69cZeB/lJqHmegrcSepN2qp8KLc0Tvc7BO9hLViTTn+yni2NUXPg+83oZS
 KstS08CW3OBvT7uWrov3njST/EhCFsUSAYVUGEIBNfKOcDg+YNQ095ayZFu+Di0L4U
 H4BsYk/7QW6mA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:54:54 +0200
Message-Id: <20211014215455.2444205-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
References: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP3t6lrIfD4yk9C+2bAHU1yrJDj+J+XAiZ51ywtNqEBjzof6p03+ZGXmK3o0xFlMI2yl7Nawz30qqbZKhekWn28+qn1FP9dV4aedWa1WwxLZ6u2FLV1v
 qmSDqUiTmVhbcj+JwFxdLFinmNzmUeND9QM+2Q0EeJKiEQ8jb/LJnUR85hoVzYaW56O1D/CqFqqNLqdOFn2Tg6/mXn0EJUJaMpcESt64uvIgGYIUVUebXqI8
 6S9GHlfgBJEmrGC8vmCeOKgx9mYiFwYuRjuBHIPMSogIVsLCTLtotBgz+jWTwLgV/Oad+DSRwOyVXiQZqwVuPHre6U1+FYKPN5BYpmvTypI=
Subject: [Buildroot] [PATCH 2/2] package/erlang-jiffy: bump version to 1.0.9
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Will Newton <will.newton@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump version to 1.0.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 19e4f96012..93c5e1f8c8 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7cf67840c58b8732e12c84c8a3b714774da2601ae5e6a57f286273e25b205516  erlang-jiffy-1.0.6.tar.gz
+sha256  45c224afe0ea2d3ece39e227f01f5585ad53b8b91d2d6924f9f50548874ae879  erlang-jiffy-1.0.9.tar.gz
 sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index dce6a0f8b3..25e7227c39 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.0.6
+ERLANG_JIFFY_VERSION = 1.0.9
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
