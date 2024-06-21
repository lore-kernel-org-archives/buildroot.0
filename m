Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32A3C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670D16063C;
	Fri, 21 Jun 2024 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIJMx8o6fg6x; Fri, 21 Jun 2024 21:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 651AB607BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651AB607BA;
	Fri, 21 Jun 2024 21:51:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8AF1BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0918442A83
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZat4KIerm_q for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B2E442A7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2E442A7E
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B2E442A7E
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:51:46 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KmAasROhA8U42KmAas6QGX; Fri, 21 Jun 2024 23:51:44 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:51:43 +0200
Message-Id: <20240621215143.283984-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL8jjyZctHJH3FhS+iV2F04mSi7l9DlN/A9tP+Gyni/QWed37XGNaR018hKsCfgNjZ4rxsA0ZWgxeVw1YWdg9E2UfLCN7OdTAXVwOu75fGgpiNc4xATh
 /8GXHvnXX0hFtsv5FkDjArd7TzN4aPVbZ/I56NkaZF6fjvC0RBGG4pb50yqgNQzaKXo7DKXUJ9J+yrjQKMLnP+CfqunFZ75zpYPwgTjN7hpWiDYnIYMWcobs
 9Qp77O3ggQQi+g7u0xjBEQHTbM19AoQiSNbjezjiG0I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1719006704; bh=Uqt1AXr+vmWZElujgwU3jBflJUB5CSL0/t3Ciqof4nE=;
 h=From:To:Subject:Date:MIME-Version;
 b=J1MVycWf4ICmc3B/8lTGLGKYr/LsBxKRjNOPP8DlE1/FrAOHN7gQYXkHAvzWn9fi6
 aEeTpt1pVk6TFGdqwANy6D/GBOX9yHTtwUuZchSF2Vb/duWlS/QrwjhuonnnUrf2PT
 UaDjA0PbPm/KsEaXuDtXZny5y014MSp4tbH6DDvXr1O0qcXPFiSlQj9UMa1Bs1q0Zs
 VdVPV3pvMBYjqJJR6G+YCMNcwcjidbgSeJlgC8SfO8bl+Gc9PeK9CZ0jHHu6xFKaS7
 ytIXiBg6mn9a0EcHJYC7k7ZLyxHdmjdPJuLLk506Q2JUoX+Hxpsx+2Hzgv29f9Pgac
 1K3Ulzt7EVf8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=J1MVycWf
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2024.05.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 13964351f6..ac28acb1f4 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c8af1e964d0123a7d4bbba981170eff723db87dcd37e5881c584ffee54194d1a  swupdate-2024.05.tar.gz
+sha256  2736045e885ad6c5dcba8dcc6c7582d0b76ef29a3d6ab7c4080908356e35e3b2  swupdate-2024.05.2.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b36aabb1e7..75e4af5db4 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2024.05
+SWUPDATE_VERSION = 2024.05.2
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
