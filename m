Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E911C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135A54EB91;
	Mon, 20 Feb 2023 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135A54EB91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDhS5eMjK-FR; Mon, 20 Feb 2023 22:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D014EE83;
	Mon, 20 Feb 2023 22:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D014EE83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC8DD1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC555416BE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC555416BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bm0UlU-7H8fq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D120416C0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D120416C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05DA886494; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:23:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef13132fd390cc25643e78afc692640c86d7aaf2
X-Git-Newrev: eb2f2886b2364e5b6a0867f55106bf83acb064e7
X-Patchwork-Hint: ignore
Message-Id: <20230220205206.05DA886494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swupdate: add staging
 install
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb2f2886b2364e5b6a0867f55106bf83acb064e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SWupdate provides API for external programs, so some headers and
libraries must be install to staging.

This patch installs headers and libs to STAGING_DIR, to prevent a
header name collision a subdirectory /usr/include/swupdate creates.

Signed-off-by: Andrey Grafin <conquistador@yandex-team.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
