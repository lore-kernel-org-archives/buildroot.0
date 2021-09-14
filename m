Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C305CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 22:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA4BF610A2
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 22:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA4BF610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82627404CB;
	Tue, 14 Sep 2021 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M24xqQuOEM0D; Tue, 14 Sep 2021 22:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9759D40375;
	Tue, 14 Sep 2021 22:11:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22AD11BF36F
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 22:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10FBC40375
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 22:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jBEVqI20isc for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 22:10:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FDFD400B9
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 22:10:57 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QGdimmhmhKBZzQGdimOwff; Wed, 15 Sep 2021 00:10:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631657455; bh=aef7GqSL0cq4w0ZOSUN0xe3G64heeV0ebYjEJ9BkvOU=;
 h=From:To:Subject:Date:MIME-Version;
 b=EYt1LgQTGCNhBnC8E14q8laBPZ/apcebdo26njgsVvyOUdrB0RfBUik1zrQjcLGVp
 XuEwtcTO4OW0qjKEZYXxND9+Xl1rjjdAZJRsVG4y1GJU1oKF+K1PMNvEMwI0tb8c9R
 sJuOmWrjnOR4AORzvbhF4Vj0EiAjCsi3IPoMEaZIEt7YZUJO23kVM90mZACMjMVnxv
 Ny1TeTRPCryy+4sSllxO0Tpon+49E8ZQRizhnrMHKXoX61dKSuco0hRzpMuKEHB4CK
 +iN77FZZHAlD9BL9M6+rLhUYSL0da6Q6JbCYyxy2hdV7SJ2VKfOnJ3Nj/06T7//pn4
 RXRFtXF9dozpA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 00:10:53 +0200
Message-Id: <20210914221053.265590-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfO0rSSOYCE1lIjAo4Sj1bjLW0Lbqw0YjlXPWdY0FfIFyba84qZCTgqqIoxv4jXW6EwMjhLekMpqmXYRUtZuPHCrxEfmcbXgYvl58+gl7YzKWM3bRZVN0
 WFw/KTSOgTTQhwUYUNxGvsTQyU1/x8HzLpBZZJuvDoaxlSnUSDvcjJcGOPns+MPwkGrRkb2iNGnsBjDYeE9C67NLgsdQS2geoc/Se5v2ztW024M9md1eeDPK
 G7oc96+aAAiRRpsSKf5B5m61WZXBW1DFdFVpIO1Z22fCtjaEp7jx5i1jmgLORBdOYmTtWKnTYRhlYaPl+s3/KmtxkANDsTRyMQmXl3eIAKs=
Subject: [Buildroot] [PATCH] package/mesa3d: fix build on m68k
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
since 'switch' blocks are pretty wide and lead to build failure. This way
'switch' blocks will have a 32-bit addressing by default instead of the
standard 16-bit.

Fixes:
http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mesa3d/mesa3d.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 54b50f684f..809a7d8e88 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -259,4 +259,13 @@ else
 MESA3D_CONF_OPTS += -Dzstd=disabled
 endif
 
+MESA3D_CFLAGS = $(TARGET_CFLAGS)
+
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+MESA3D_CFLAGS += -mlong-jump-table-offsets
+endif
+
+MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
+
 $(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
