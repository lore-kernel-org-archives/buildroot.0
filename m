Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E242C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A9A483F66;
	Thu, 16 Dec 2021 20:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfsW9k29h9Ix; Thu, 16 Dec 2021 20:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6127D83F62;
	Thu, 16 Dec 2021 20:18:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A45AB1BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9261840B5F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9fQjyfbX_Ka for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:17:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75A240465
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:17:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11331810AE; Thu, 16 Dec 2021 20:12:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 21:16:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e84bb6d29583726d59e4b48270ab354db784c409
X-Git-Newrev: ac1c781149469d71c34cd37ed60a6e1525ca9689
X-Patchwork-Hint: ignore
Message-Id: <20211216201235.11331810AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: fix build failure due to a
 library clash
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac1c781149469d71c34cd37ed60a6e1525ca9689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
