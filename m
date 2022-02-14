Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D02DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C712F404DB;
	Mon, 14 Feb 2022 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ls4ZHE5rshH; Mon, 14 Feb 2022 20:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACA74401B2;
	Mon, 14 Feb 2022 20:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2534F1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1387A812C4
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1aHdi2vYwwb for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:49:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53F76812C3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:49:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 20B2582BDB; Mon, 14 Feb 2022 20:41:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:46:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a738ecbce4979db46bcb8b960531f573e08c0e32
X-Git-Newrev: 184ce3ced3ccb39f43369482292b09730e6ab8e2
X-Patchwork-Hint: ignore
Message-Id: <20220214204133.20B2582BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: v4l-utils needs C++11
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=184ce3ced3ccb39f43369482292b09730e6ab8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/cacd73e08cfb359d608bca807189b7bd3c5c79bd

  v4l2-ctl.cpp:53:2: warning: identifier 'nullptr' is a keyword in C++11 [-Wc++0x-compat]
  v4l2-ctl.cpp:53:37: error: 'nullptr' was not declared in this scope
  [...]
  v4l2-ctl-tuner.cpp: In function 'void parse_freq_seek(char*, v4l2_hw_freq_seek&)':
  v4l2-ctl-tuner.cpp:160:10: error: 'constexpr' does not name a type
     static constexpr const char *subopts[] = {
            ^
  v4l2-ctl-tuner.cpp:160:10: note: C++11 'constexpr' only available with -std=c++11 or -std=gnu++11

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libv4l/Config.in | 4 ++++
 package/libv4l/libv4l.mk | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 57ddde1dfb..c88f280c3b 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -20,6 +20,7 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  v4l-utils is a collection of various video4linux and DVB
 	  utilities.
@@ -35,6 +36,9 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
+comment "v4l-utils tools needs a toolchain w/ C++11"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif
 
 comment "libv4l needs a toolchain w/ threads, C++ and headers >= 3.0"
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4dc0f15f94..8300f5c970 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -59,6 +59,9 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
+# v4l2-ctl needs c++11, use gnu++11 for typeof support
+LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
+
 # IR BPF decoder support needs toolchain with linux-headers >= 3.18
 # libelf and clang support
 LIBV4L_CONF_OPTS += --disable-bpf
@@ -71,8 +74,6 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
-# qt5 needs c++11 (since qt-5.7)/use gnu++11 for typeof support
-LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
 else
 LIBV4L_CONF_OPTS += --disable-qv4l2
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
