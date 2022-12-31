Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F74C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B23082339;
	Mon, 20 Feb 2023 23:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B23082339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhH3Lf5lWu_g; Mon, 20 Feb 2023 23:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5155C83F9F;
	Mon, 20 Feb 2023 23:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5155C83F9F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70D611BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EFA261AAF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFA261AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_8zbH2LS2xt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4790A61AC3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4790A61AC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38BF1828C8; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:04:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 44be514b21fd94096702b80c62d46c31d72f15a5
X-Git-Newrev: 4bb4288dd08c688072a25bf60c3a60e0047c1668
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.38BF1828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/modem-manager: qrtr
 needs qmi
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4bb4288dd08c688072a25bf60c3a60e0047c1668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure raised since bump to version 1.20.2 in
commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:

../output-1/build/modem-manager-1.20.2/meson.build:262:2: ERROR: Assert failed: QRTR support requires QMI enabled

Fixes:
 - http://autobuild.buildroot.org/results/04b9a41c5edbc492ef640b27d4d3d896d230cf34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/modem-manager/Config.in        | 12 ++++++++++++
 package/modem-manager/modem-manager.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index d211d68ee1..8489e6fc86 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -25,6 +25,18 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	select BR2_PACKAGE_LIBQMI
 	help
 	  This option enables support for QMI protocol
+
+config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
+	bool "QRTR support"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # libqrtr-glib
+	select BR2_PACKAGE_LIBQRTR_GLIB
+	select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	help
+	  This option enables support for QRTR protocol
+
+comment "QRTR support needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 endif
 
 comment "modemmanager needs a toolchain w/ wchar, threads"
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 8a0dbba3a4..8ef85b9b1d 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -37,7 +37,7 @@ else
 MODEM_MANAGER_CONF_OPTS += -Dmbim=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQRTR),y)
 MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
 MODEM_MANAGER_CONF_OPTS += -Dqrtr=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
