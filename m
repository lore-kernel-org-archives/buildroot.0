Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FA9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADA2D40524;
	Tue,  1 Feb 2022 22:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOP1RI8qaH_6; Tue,  1 Feb 2022 22:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BCA9401DD;
	Tue,  1 Feb 2022 22:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 488891BF989
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B85C83342
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NH2q73wEx6Ov for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D445832EB
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 233938285F; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:58:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b292f1d41a8734b6cdcbcf2ae726b51f9e1338a9
X-Git-Newrev: 789e84b5dacbb39a34fe0ea873f044690a0944a2
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.233938285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: override neon check
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

commit: https://git.buildroot.net/buildroot/commit/?id=789e84b5dacbb39a34fe0ea873f044690a0944a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Override neon check to avoid the following build failure with uclibc-ng
raised since bump to version 5.0.1 in commit
df3f0c226fccd8d6143b09a1e05a0f5f23587136:

src/arch/simddetect.cpp:61:14: fatal error: sys/auxv.h: No such file or directory
   61 | #    include <sys/auxv.h>
      |              ^~~~~~~~~~~~

It should be noted that a patch to properly fix this build failure was
rejected by upstream as "ARM support without NEON would result in a very
slow Tesseract": https://github.com/tesseract-ocr/tesseract/pull/3717

So, a follow-up patch adding a dependency on !BR2_TOOLCHAIN_USES_UCLIBC
for all CPU architectures or only for ARM without NEON could be
approriate.

Fixes:
 - http://autobuild.buildroot.org/results/0bac6491188b6681df2ca13eb230706e83cbb130

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tesseract-ocr/tesseract-ocr.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 7e23e64136..a7498931fb 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -24,6 +24,12 @@ TESSERACT_OCR_CONF_ENV = \
 TESSERACT_OCR_CONF_OPTS = \
 	--disable-opencl
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+TESSERACT_OCR_CONF_ENV += ax_cv_check_cxxflags__mfpu_neon=yes
+else
+TESSERACT_OCR_CONF_ENV += ax_cv_check_cxxflags__mfpu_neon=no
+endif
+
 # Language data files download
 ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_ENG),y)
 TESSERACT_OCR_DATA_FILES += eng.traineddata
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
