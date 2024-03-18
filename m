Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B54C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 20:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B335607E0;
	Mon, 18 Mar 2024 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UR1qZQOLtQzm; Mon, 18 Mar 2024 20:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD2E60807
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD2E60807;
	Mon, 18 Mar 2024 20:35:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8245F1BF427
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 20:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C0B860807
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 20:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gh77pOHC-BVR for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 20:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDBCB607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDBCB607E0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDBCB607E0
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 20:35:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mJhqrBnaQABX0mJhqrN8k4; Mon, 18 Mar 2024 21:35:38 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 21:35:37 +0100
Message-Id: <20240318203537.341523-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPgnf89lqGjcBW1CptkPtclOBKrxjHUZSctt1kgp8xDzM9on/zHOIVqV0pHRd5ZhUbS6TkRfXZvewOi92JIcm2iPYZP7m9WtMECgd48d42bZTzZhpmu0
 +70U4+wobqH05x/2t3SabGQ+s/iUX8L7T5PNcw6U2mZJ02Yms4vNi2kxi/BbGK8WQr1bX+9z+roOuAYWnJb9o5lxidQ7uzVHDlkd3B9oXF9t7dYtJAicODob
 MgcRuedMhhS7BWER1UDJVF04RKJ7Rbmp/9eqFG0E0V8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1710794138; bh=kJ0FyrE+USD3zXjWXEmMQJcpLL73WxOuGwskNkHazhU=;
 h=From:To:Subject:Date:MIME-Version;
 b=IGnbowHpKZSxuQBVrmZ/gm+DMZAFUGvNljRJ6jV+qezlLHA16b3U4ZkY4sQuHgvwX
 a1HkCXfF3BKSl7epy7fyFuyMLTM8RAxk3HkOZJPjgJmdZ1nuaP+VYl5+C5ilqQjypd
 JaK2RB7AqCfuNDz56wl0HTCPJNcsjRvQns0uBmqTz+Tb3GUb0eMO0WlRxZFJXcYQUI
 8C8Iv9LJCjptRSyGN9X/PqbqL1niBgCdqTrDC3MykWxRKZ2iCPkHTNJbi0qGgFIx4S
 928zuD3iCUKkCmB1pgjV1VxSqWyqlHTLBNmb03X/rA0RNwtEfvP+ECZ2RBQSjvTfXF
 nvk7TK9dwjJRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=IGnbowHp
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2024-03-16 on branch v5.6.4.2
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

This version adds support up to Linux version 6.8.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 414ea98b08..6283cb0f87 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  969fa96c90e16fcaf8f6b30d4576a8446c7041932bea34bbfea7e9c91038bfe5  rtl8812au-aircrack-ng-4a983e47dafc048019412350d36270864f6b5f2d.tar.gz
+sha256  752d9ae67140966eddc463238fde1f6b86457db22a45f61c13886c3244eaffe1  rtl8812au-aircrack-ng-f23979f0d20aafb563ac71b56fcbc74268c798c2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index df3b03998e..d5571b9d5c 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 4a983e47dafc048019412350d36270864f6b5f2d
+RTL8812AU_AIRCRACK_NG_VERSION = f23979f0d20aafb563ac71b56fcbc74268c798c2
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
