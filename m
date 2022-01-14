Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187C1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 08:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86200416CA;
	Fri, 14 Jan 2022 08:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mwnnHDooEHh; Fri, 14 Jan 2022 08:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB28F416C8;
	Fri, 14 Jan 2022 08:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AC751BF38D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 495DA416C8
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 08:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gv3PCqci1vYo for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 08:45:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEA69416C7
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 08:45:10 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8ICpnR1CFiF0a8ICqnsFsD; Fri, 14 Jan 2022 09:45:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642149908; bh=PCThXe67HzvjaCvtTypJsI8VyZrTt6XXfMW+hk+YiSk=;
 h=From:To:Subject:Date:MIME-Version;
 b=JcM+njH0hHXGEyKhcE33WAYKoyUf7yrLnjeobYG7VacB/YXjfuI6EW90Wfb8v440Y
 Td5fdhMDx0euisqHW3m8Bx4Ddw3+PdWWJmYAgceeDp+xJJBBk1REYqjUxdluu6GUf5
 R99Nx9YYjOHDmS5NZKmaGrmcy0Hc5E7zRzYznZBW0iLosM2VDWD5arcVVktCufsowI
 SvzaH6+CQsObcrLNM0yYrOBNVPrv9AL8Ua+r0QpV0PyKHFw09Fnx6kNGw2+txqRMGM
 6G+Sq8UeXU5LF26zYlbcXjFLnq4oFMrEICQTYedD86nNoTyftph040hcU1OD4EmZ0a
 DGeZJKBCatGgA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 09:45:06 +0100
Message-Id: <20220114084506.776644-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGd/l6IDJ0+nijw2mOM5S+7znpI78hezss9yw15qe3+yDNL3P2HHS34YPGi+mIGRIGp1O7wuScCCzNyrlVjT7o0ivsf8WD+uVqNxKGJrjk2o4yEWxsue
 wZI5KTXG9n5PAE04iGczQ+NlEQegp1ioYO5shNSdUh9JneSvpW6Csn3X5gmAHRG5AV07GDIMQ0sNvyiC1Kdi2PEUSdT8DNJ/+8hx7jFbxX7T/di6i3GomHuq
 aqsu72AoJYsNm/QOJjjC9CxMiMvB/uZO/XjcHb4xf8BZqLrOCZT1zl8qgw2qfEUQkmkB/MbIClXHrwdkwx72KQ==
Subject: [Buildroot] [PATCH] package/poppler: fix build failure due to gcc
 bug 68485
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bullet package exhibits gcc bug 68485 when built for the Microblaze
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/96e77ddba5042ba4dacb16b328fc298a4f00f49a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/poppler/poppler.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 9e9bfc9cba..18c044a9f6 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -131,4 +131,12 @@ else
 POPPLER_CONF_OPTS += -DUSE_FLOAT=ON
 endif
 
+POPPLER_CXXFLAGS = $(TARGET_CXXCFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+POPPLER_CXXFLAGS += -O0
+endif
+
+POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(POPPLER_CXXFLAGS)"
+
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
