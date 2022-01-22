Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61614C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 17:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02BCC81448;
	Sat, 22 Jan 2022 17:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNOI9tGwFX2O; Sat, 22 Jan 2022 17:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3577981444;
	Sat, 22 Jan 2022 17:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE8021BF2C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADB7781444
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cxdRCDrpFLl for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:39:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB5B481442
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6D7F82A06; Sat, 22 Jan 2022 17:32:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:39:17 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ff1cd8a27540f677dcf6106f3958701922fdb40e
X-Git-Newrev: 1ca45102f557d277bee9ed856c51c08f02db1cb2
X-Patchwork-Hint: ignore
Message-Id: <20220122173259.B6D7F82A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/icu: fix build
 failure due to a library clash
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ca45102f557d277bee9ed856c51c08f02db1cb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit ac1c781149469d71c34cd37ed60a6e1525ca9689)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
