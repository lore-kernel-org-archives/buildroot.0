Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 16:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 448334020B;
	Thu, 16 Dec 2021 16:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5msKIz9_KMG; Thu, 16 Dec 2021 16:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A3674034A;
	Thu, 16 Dec 2021 16:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54BB41BF3BD
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 16:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4385C812FF
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 16:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yOyL2riMq4c for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 16:51:38 +0000 (UTC)
X-Greylist: delayed 00:05:33 by SQLgrey-1.8.0
Received: from mail.bitwise.fi (mail.bitwise.fi [109.204.228.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C470812E4
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 16:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.bitwise.fi (Postfix) with ESMTP id A4EC0460042
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:46:02 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from mail.bitwise.fi ([127.0.0.1])
 by localhost (mustetatti.dmz.bitwise.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlUCYOyCXKe1 for <buildroot@buildroot.org>;
 Thu, 16 Dec 2021 18:45:59 +0200 (EET)
Received: from localhost.net (fw1.dmz.bitwise.fi [192.168.69.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: anssiha)
 by mail.bitwise.fi (Postfix) with ESMTPSA id C74AC460041
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:45:59 +0200 (EET)
From: Anssi Hannula <anssi.hannula@bitwise.fi>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 18:45:22 +0200
Message-Id: <20211216164522.3877446-1-anssi.hannula@bitwise.fi>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/icu: fix build failure due to a library
 clash
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

ICU build scripting adds some host libraries to LD_LIBRARY_PATH by
using constructs of the following form:

  LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"

If the original LD_LIBRARY_PATH is empty, this causes the last search
directory be an empty string, i.e. the working directory.

ICU build runs some basic host commands (e.g. "rm") in $(TARGET_DIR)/lib
under such an LD_LIBRARY_PATH, causing target libraries (e.g. libc) to
possibly get loaded instead of host system libraries if they are
compatible enough (e.g. arch matches).

Since the target libraries may not actually be ABI compatible with host
system binaries (e.g. target has an old libc), this can cause crashes
or other errors.

Observed errors include:
  (1) rm: libc.so.6: version `GLIBC_2.33' not found (required by rm)
  (2) sh: line 1: 1362670 Segmentation fault      (core dumped) rm -f libicudata.so.65

Workaround the issue by setting a dummy LD_LIBRARY_PATH when it would
otherwise be empty.

https://unicode-org.atlassian.net/browse/ICU-21417

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---
 package/icu/icu.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 2c04c3c775..c5d0c3eefb 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -50,6 +50,17 @@ HOST_ICU_CONF_OPTS = \
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
+# ICU build scripting adds paths to LD_LIBRARY_PATH using
+#   LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"
+# which, if LD_LIBRARY_PATH was empty, causes the last search directory
+# to be the working directory, causing the build to try to load target
+# libraries, possibly crashing the build due to ABI mismatches.
+# Workaround by ensuring LD_LIBRARY_PATH is never empty.
+# https://unicode-org.atlassian.net/browse/ICU-21417
+ifeq ($(LD_LIBRARY_PATH),)
+ICU_MAKE_ENV += LD_LIBRARY_PATH=/dev/null
+endif
+
 ICU_CUSTOM_DATA_PATH = $(call qstrip,$(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH))
 
 ifneq ($(ICU_CUSTOM_DATA_PATH),)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
