Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA29CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7757061028;
	Wed, 27 Apr 2022 19:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dPK0QM55csm; Wed, 27 Apr 2022 19:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE39D6101D;
	Wed, 27 Apr 2022 19:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6B71BF9CB
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE22360C18
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdAqEVNP0H48 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258E260B3D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 71F7784607; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:27:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcaf5eb0c19e57b48a15a815d7b466bc06475ea5
X-Git-Newrev: 8915f51cc0dcc6977973bd5f1cd12fa4aa87f1e0
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.71F7784607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brotli: workaround m68k build
 issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=8915f51cc0dcc6977973bd5f1cd12fa4aa87f1e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On m68k building with optimizations  results in failures such as:

/tmp/cckiMnG5.s: Assembler messages:
/tmp/cckiMnG5.s:142572: Error: value -39206 out of range
/tmp/cckiMnG5.s:142629: Error: value -40282 out of range
/tmp/cckiMnG5.s:146408: Error: value -53294 out of range
/tmp/cckiMnG5.s:159014: Error: value -39206 out of range
/tmp/cckiMnG5.s:159071: Error: value -40282 out of range
/tmp/cckiMnG5.s:162850: Error: value -53294 out of range
/tmp/cckiMnG5.s:175456: Error: value -39206 out of range
/tmp/cckiMnG5.s:175513: Error: value -40282 out of range
/tmp/cckiMnG5.s:179292: Error: value -53294 out of range
/tmp/cckiMnG5.s:191898: Error: value -39206 out of range
/tmp/cckiMnG5.s:191955: Error: value -40282 out of range
/tmp/cckiMnG5.s:195734: Error: value -53294 out of range

These only appear when building with -O2, the smaller code generated
with -Os does not cause trouble, so workaround by using that.

Fixes:

  http://autobuild.buildroot.net/results/2f222d5a86b4237b81ca31dba89f58b0e6e879db/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/brotli/brotli.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 43c8524c0b..ac49fe664f 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -21,6 +21,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 BROTLI_CFLAGS += -O0
 endif
 
+# Workaround "Error: value -1234 out of range" assembler issues
+# when building with optimizations.
+ifeq ($(BR2_m68k),y)
+BROTLI_CFLAGS += -Os
+endif
+
 BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(BROTLI_CFLAGS)"
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
