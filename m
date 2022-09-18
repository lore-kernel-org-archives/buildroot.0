Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B1C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 17:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034FB60F5D;
	Sun, 18 Sep 2022 17:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034FB60F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28Ob97LlwbK0; Sun, 18 Sep 2022 17:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10ED5607A3;
	Sun, 18 Sep 2022 17:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10ED5607A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 275211BF2CD
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 17:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0307483E8B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 17:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0307483E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P25QTwhK8dpe for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 17:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE88983E82
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 17:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE88983E82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9F47852F7; Sun, 18 Sep 2022 17:08:58 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 19:06:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b153345beca555164a11dae4f2c77862d4fb76b6
X-Git-Newrev: 123cb730461a6af6cd30566326624f7422d4bad2
X-Patchwork-Hint: ignore
Message-Id: <20220918170858.B9F47852F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: add option to
 build target tools
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
Content-Type: multipart/mixed; boundary="===============1383940536381726703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1383940536381726703==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=123cb730461a6af6cd30566326624f7422d4bad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These tools are required for debug scenarios where the debug
happens in-target.

Signed-off-by: Nuno Gonçalves <nunojpg@gmail.com>
[Arnout: install to target in case this option is selected]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/google-breakpad/Config.in          | 10 ++++++++++
 package/google-breakpad/google-breakpad.mk |  7 ++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 07c49996dd..4320ad64aa 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -41,3 +41,13 @@ comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread,
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+if BR2_PACKAGE_GOOGLE_BREAKPAD
+
+config BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS
+	bool "Build target tools"
+	help
+	  Build processor and tools for target: dump_syms,
+	  minidump_stackwalk and microdump_stackwalk.
+
+endif
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index cafe1359f3..132323363b 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -7,9 +7,6 @@
 GOOGLE_BREAKPAD_VERSION = c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
 GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
 GOOGLE_BREAKPAD_SITE_METHOD = git
-GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
-# Only a static library is installed
-GOOGLE_BREAKPAD_INSTALL_TARGET = NO
 GOOGLE_BREAKPAD_INSTALL_STAGING = YES
 GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause, MIT
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
@@ -17,6 +14,10 @@ GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
 
 HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support
 
+ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS),)
+GOOGLE_BREAKPAD_INSTALL_TARGET = NO
+endif
+
 # Avoid using depot-tools to download this file.
 define HOST_GOOGLE_BREAKPAD_LSS
 	$(INSTALL) -D -m 0644 \

--===============1383940536381726703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1383940536381726703==--
