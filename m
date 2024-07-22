Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A4C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC67409B7;
	Mon, 22 Jul 2024 12:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mKEn-Qs3ofy; Mon, 22 Jul 2024 12:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0AAC408E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0AAC408E2;
	Mon, 22 Jul 2024 12:16:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4C661BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D6C80C7E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk2DtzaMSpmq for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B5CD80C4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B5CD80C4D
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:16:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED903813CA; Mon, 22 Jul 2024 12:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c9a5cee94ee767272290e071bf8bd3e7b98fda8
X-Git-Newrev: d1e812e739d0de9554c4e8a62fbc8743746b4aa7
X-Patchwork-Hint: ignore
Message-Id: <20240722121643.ED903813CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreefare: bump to latest git
 commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1e812e739d0de9554c4e8a62fbc8743746b4aa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc >= 14 thanks to
https://github.com/nfc-tools/libfreefare/commit/494233d33b3a9d21da1bb0f1c59606820afe4691

mifare_desfire_crypto.c: In function 'cmac':
mifare_desfire_crypto.c:139:23: error: implicit declaration of function 'malloc' [-Wimplicit-function-declaration]
  139 |     uint8_t *buffer = malloc (padded_data_length (len, kbs));
      |                       ^~~~~~
mifare_desfire_crypto.c:69:1: note: include '<stdlib.h>' or provide a declaration of 'malloc'
   68 | #include "freefare_internal.h"
  +++ |+#include <stdlib.h>
   69 |

Fixes:
 - http://autobuild.buildroot.org/results/778be216f62b8c2e05aba1b3e297dab0c6c6ccd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libfreefare/libfreefare.hash | 4 ++--
 package/libfreefare/libfreefare.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
index 9115518a3f..6ef30513d1 100644
--- a/package/libfreefare/libfreefare.hash
+++ b/package/libfreefare/libfreefare.hash
@@ -1,5 +1,5 @@
-# From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
-sha256  bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
+# Locally computed
+sha256  48db20cccdf3435a9f205bcbb67dbd4eec055991d21840fb419874efd9ce9df8  libfreefare-c2b0cfa4b9fb0e4be88604f00b7a2405618d5abc.tar.gz
 
 # Hash for license file:
 sha256  be6209dfd763a0ba77fbe990cfd2512804441d8b5f0cad927baa3341b50fcade  COPYING
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 16f15b34e4..7065c441dc 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBFREEFARE_VERSION = 0.4.0
-LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
-# Do not use the github helper here, the generated tarball is *NOT*
-# the same as the one uploaded by upstream for the release.
-LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
+LIBFREEFARE_VERSION = c2b0cfa4b9fb0e4be88604f00b7a2405618d5abc
+LIBFREEFARE_SITE = $(call github,nfc-tools,libfreefare,$(LIBFREEFARE_VERSION))
 LIBFREEFARE_DEPENDENCIES = host-pkgconf libnfc openssl
 LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
+# From git
+LIBFREEFARE_AUTORECONF = YES
 LIBFREEFARE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
