Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BFDC54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EAEA407BE;
	Sun,  3 Mar 2024 20:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyk-7lRSZ3Te; Sun,  3 Mar 2024 20:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4AC407C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4AC407C5;
	Sun,  3 Mar 2024 20:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A33B1BF340
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8650C60680
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDZWOKNvHEk2 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE67360698
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE67360698
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:14:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C65B87FE5; Sun,  3 Mar 2024 20:14:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 21:11:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8895cae09b7f364fdd8eb55ad487a9bad55e2faf
X-Git-Newrev: c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c
X-Patchwork-Hint: ignore
Message-Id: <20240303201414.6C65B87FE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/stdint.h:26,
                 from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/include/stdint.h:9,
                 from ../include/selinux/avc.h:9,
                 from avc.c:10:
/home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

This LFS workaround for glibc < 2.23 was added in 2016 by commit
ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
anymore as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23

Fixes:
 - http://autobuild.buildroot.org/results/d85c81f87adf3a5945fa369bcec233e6def2ed12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libselinux/libselinux.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 601038e46f..734084ba50 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -52,14 +52,6 @@ define LIBSELINUX_BUILD_PYTHON_BINDINGS
 endef
 endif # python3
 
-# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22. We
-# set CFLAGS, CPPFLAGS and LDFLAGS here because we want to win over the
-# CFLAGS/CPPFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_SETUPTOOLS_ENV)
-# when the python binding is enabled.
-LIBSELINUX_MAKE_OPTS += \
-	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
-
 define LIBSELINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(LIBSELINUX_MAKE_OPTS) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
