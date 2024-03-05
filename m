Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0585C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 12:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 801D441622;
	Tue,  5 Mar 2024 12:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fwv8_JyIpFUU; Tue,  5 Mar 2024 12:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3922241624
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3922241624;
	Tue,  5 Mar 2024 12:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5641BF3D4
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 12:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA3041620
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 12:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ep_WmOYTKpa6 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 12:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B00441621
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B00441621
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 12:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25DAE88102; Tue,  5 Mar 2024 12:33:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Mar 2024 12:29:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4766ace0d05dd264c37ee923634b897ba0dd3a43
X-Git-Newrev: 06026055fcef1d36f586c5e808ca595b9ab782f2
X-Patchwork-Hint: ignore
Message-Id: <20240305123334.25DAE88102@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix build with
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06026055fcef1d36f586c5e808ca595b9ab782f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

configure:5239: /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -Os -g2 -I/home/autobuild/autobuild/instance-1/output-1/host/bin/../mips-buildroot-linux-gnu/sysroot/usr/include/tirpc  -fno-builtin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 conftest.c >&5
In file included from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/limits.h:26,
                 from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/limits.h:205,
                 from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/syslimits.h:7,
                 from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/limits.h:34,
                 from conftest.c:12:
/home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

[...]

checking for /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc options needed to detect all undeclared functions... cannot detect
configure: error: in `/home/autobuild/autobuild/instance-1/output-1/build/ltp-testsuite-20240129':
configure: error: cannot make /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc report undeclared builtins

Indeed, this LFS workaround was added by commit
ca3524ba707126de7284210c00268a8e7ca6379a and is only needed to fix a
build failure with the old codesourcery-arm toolchain from 2014 which
uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes:
 - http://autobuild.buildroot.org/results/d2e75a79bc42b6a9a2b407fd557aca5c7f207d84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ea57686a9c..0996b77e58 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -47,10 +47,7 @@ else
 LTP_TESTSUITE_CONF_ENV += have_numa_headers=no
 endif
 
-# ltp-testsuite uses <fts.h>, which isn't compatible with largefile
-# support.
-LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+LTP_TESTSUITE_CFLAGS = $(TARGET_CFLAGS)
 LTP_TESTSUITE_LIBS =
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
@@ -66,7 +63,6 @@ endif
 
 LTP_TESTSUITE_CONF_ENV += \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
-	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
