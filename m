Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E92C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D3C660BE4;
	Sun,  6 Feb 2022 10:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcchEnljJyzo; Sun,  6 Feb 2022 10:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4E660D7B;
	Sun,  6 Feb 2022 10:26:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC4951BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7FAC60B6A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSxkKRuzmGtK for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F9D86059E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:26:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01D3A8267F; Sun,  6 Feb 2022 10:18:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:26:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d24fb7e7b013e6cbbac91abe7c45ca9ed788756
X-Git-Newrev: 0ca3b660f4d75f1746508fc7cdee74daa14250a1
X-Patchwork-Hint: ignore
Message-Id: <20220206101852.01D3A8267F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: fix uclibc/musl compile
 with libexecinfo enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ca3b660f4d75f1746508fc7cdee74daa14250a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- depend and link against libexecinfo if enabled to fix linking failure
  in case execinfo.h is detected, see
  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8/meson.build:

   32 if cc.has_header_symbol('execinfo.h', 'backtrace')
   33     config_h.set('HAVE_BACKTRACE', 1)
   34 endif

- libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC

Fixes:

  - http://autobuild.buildroot.net/results/a1077815895ab847c5ca82ec17c7d13fe97cff53

  .../powerpc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/log.cpp.o: in function `libcamera::Logger::backtrace()':
  log.cpp:(.text+0x34b0): undefined reference to `backtrace'
  .../powerpc-buildroot-linux-uclibc/bin/ld: log.cpp:(.text+0x34c0): undefined reference to `backtrace_symbols'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 524cf07e03..534d8d2637 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -99,4 +99,9 @@ else
 LIBCAMERA_CONF_OPTS += -Dtracing=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LIBCAMERA_DEPENDENCIES += libexecinfo
+LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
