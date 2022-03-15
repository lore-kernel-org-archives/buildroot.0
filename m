Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5DEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC9F842BC;
	Tue, 15 Mar 2022 21:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_4Ms5QSfuoR; Tue, 15 Mar 2022 21:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7B98422B;
	Tue, 15 Mar 2022 21:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA601BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29AD360C30
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9UYsJzgiMGR for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A47860B83
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7C16A8412D; Tue, 15 Mar 2022 21:41:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:27:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12588a667a6e4d3c852a82a9d89c58bcf43eea1e
X-Git-Newrev: 54cb3b506de44fb8389832a1612b55d179b2cfd4
X-Patchwork-Hint: ignore
Message-Id: <20220315214147.7C16A8412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: disable fcgi
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

commit: https://git.buildroot.net/buildroot/commit/?id=54cb3b506de44fb8389832a1612b55d179b2cfd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfcgi raises the following build failure with glibc 2.34 and gcc
11.2.0:

In file included from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:488,
                 from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdio.h:27,
                 from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/fcgi_stdio.h:18,
                 from boinc_fcgi.h:19,
                 from coproc.cpp:22:
/home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/wchar.h:582:24: error: 'malloc' attribute argument 1 is ambiguous
  582 |   __attribute_malloc__ __attr_dealloc_fclose;
      |                        ^~~~~~~~~~~~~~~~~~~~~

RawTherapee has the same kind of issue:
 - https://github.com/Beep6581/RawTherapee/issues/6324
 - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101747

Fixes:
 - http://autobuild.buildroot.org/results/232dae62570ed7927a10864d83dccaf9b6214500

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/boinc/boinc.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 7f78c427ea..0d992f136c 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -26,6 +26,7 @@ BOINC_CONF_ENV = \
 BOINC_CONF_OPTS = \
 	--disable-apps \
 	--disable-boinczip \
+	--disable-fcgi \
 	--disable-manager \
 	--disable-server \
 	--enable-client \
@@ -38,13 +39,6 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 BOINC_DEPENDENCIES += freetype
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFCGI),y)
-BOINC_DEPENDENCIES += libfcgi
-BOINC_CONF_OPTS += --enable-fcgi
-else
-BOINC_CONF_OPTS += --disable-fcgi
-endif
-
 BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 # Remove boinc-client because it is incompatible with buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
