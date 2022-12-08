Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62199C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC55341931;
	Thu,  8 Dec 2022 21:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC55341931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqLB5G0gDQuq; Thu,  8 Dec 2022 21:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955A74161C;
	Thu,  8 Dec 2022 21:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955A74161C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF931BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C4C60746
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6C4C60746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DC-KteVdThLA for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:01:57 +0000 (UTC)
X-Greylist: delayed 03:16:25 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F2960B31
Received: from conquistador.localdomain (cardinal-lo423.yndx.net
 [93.158.188.105])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5F2960B31
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:01:56 +0000 (UTC)
Received: by conquistador.localdomain (Postfix, from userid 1000)
 id 33BAAE27124; Fri,  9 Dec 2022 00:03:30 +0300 (MSK)
From: conquistador@yandex-team.ru
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 00:03:28 +0300
Message-Id: <20221208210328.4671-1-conquistador@yandex-team.ru>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add staging install
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

From: Andrey Grafin <conquistador@yandex-team.ru>

SWupdate provides API for external programs, so some headers and
libraries must be install to staging.

This patch installs headers and libs to STAGING_DIR, to prevent a
header name collision a subdirectory /usr/include/swupdate creates.

Signed-off-by: Andrey Grafin <conquistador@yandex-team.ru>
---
 package/swupdate/swupdate.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ed0c1e56a8..54ae03f238 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -17,6 +17,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/MIT.txt \
 	LICENSES/OFL-1.1.txt
+SWUPDATE_INSTALL_STAGING = YES
 
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
@@ -228,6 +229,11 @@ define SWUPDATE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) $(SWUPDATE_MAKE_OPTS)
 endef
 
+define SWUPDATE_INSTALL_STAGING_CMDS
+        $(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
+                $(SWUPDATE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) INCLUDEDIR=/usr/include/swupdate install
+endef
+
 define SWUPDATE_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-- 
2.37.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
