Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E560C04FF1
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC15C40952;
	Wed, 20 Sep 2023 19:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC15C40952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAIZ8GIFwe6D; Wed, 20 Sep 2023 19:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6DE4095E;
	Wed, 20 Sep 2023 19:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6DE4095E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFC361BF2AF
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 19:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A68D561350
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 19:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68D561350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuDTEX7TqqLq for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 19:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C70856134C
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 19:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70856134C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B02A6873DE; Wed, 20 Sep 2023 19:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 21:40:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9f2f48a7ebba2d5f0b38b6e9d2f12627575141a
X-Git-Newrev: ebf9fa28e380a808c6b823a675447167ec0b0db0
X-Patchwork-Hint: ignore
Message-Id: <20230920194030.B02A6873DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix build with
 uclibc-ng < 1.0.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebf9fa28e380a808c6b823a675447167ec0b0db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define static_assert if needed to avoid the following build failure with
uclibc-ng < 1.0.42 raised since bump to version 2.39 in commit
ad276d94a392fb13244e042851a44269e6254d61 and
https://github.com/util-linux/util-linux/commit/0ff57406522ba78ba829df7a64903b3066afb75f:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ./.libs/libsmartcols.so: undefined reference to `static_assert'

Fixes:
 - http://autobuild.buildroot.org/results/c3d38d92557ee9e59b717b85f6307810d5de1487

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 3 +++
 package/util-linux/util-linux.mk                      | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 20566345c6..e1fe1ec191 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -52,6 +52,9 @@ UTIL_LINUX_LIBS_CONF_OPTS += --disable-widechar
 # No libs use ncurses
 UTIL_LINUX_LIBS_CONF_OPTS += --without-ncursesw --without-ncurses
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+UTIL_LINUX_LIBS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
+
 # Unfortunately, the util-linux does LIBS="" at the end of its
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 73eda5c171..72126adb00 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -96,6 +96,9 @@ endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
+
 # Unfortunately, the util-linux does LIBS="" at the end of its
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
