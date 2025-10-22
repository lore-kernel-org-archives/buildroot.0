Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217A1CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E779361382;
	Wed, 22 Oct 2025 16:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOppRgIxNRmG; Wed, 22 Oct 2025 16:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D020461347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D020461347;
	Wed, 22 Oct 2025 16:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35ABCDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1717640C82
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe-CKynaD9dC for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50AB040C3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50AB040C3C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E90F85F7D; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:38:48 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 9fbf9711b9f3e6bae86b2da06ee493e70fdb47fa
X-Git-Newrev: 55c380eca8e919a0307b78141ae8a94e8e9bc71c
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.4E90F85F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/gpsd: remove
 -std=gnu++98 from CFLAGS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2170058283133303609=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2170058283133303609==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=55c380eca8e919a0307b78141ae8a94e8e9bc71c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

In 2016 buildroot commit b4c050e9afed7a8dc302e6e1014cc4ffb508590d added
-std=gnu++98 also to CFLAGS knowing that it will cause warnings:

https://lists.nongnu.org/archive/html/gpsd-dev/2016-09/msg00082.html
'Although this leads to lots of warnings on every compilation with gcc:
"cc1: warning: command line option '-std=gnu++98' is valid for C++/ObjC++ but not for C"'

These warnings are still present but cause a misdetection in configure

    Checking if strerror_r() returns int... no

because here warnings are treated as errors, quoting config.log:

cc1: error: command-line option â€˜-std=gnu++98â€™ is valid for C++/ObjC++ but not for C [-Werror]
cc1: all warnings being treated as errors

In 2017 upstream committed
https://gitlab.com/gpsd/gpsd/-/commit/d287c76f4f2e1ffd275da41b84f9e08ea7f74344
which added "std::" namespace prefixes and fixed the original problem.

-std=gnu++98 being removed from CFLAGS lets configure correctly detect
strerror_r():

    Checking if strerror_r() returns int... yes

and no new build errors occur:

                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: OK
                bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/35]: OK
             bootlin-microblazeel-uclibc [10/35]: OK
                bootlin-mipsel32r6-glibc [11/35]: OK
                   bootlin-mipsel-uclibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
        bootlin-powerpc64le-power8-glibc [14/35]: OK
           bootlin-powerpc-e500mc-uclibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: OK
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: OK
                   bootlin-sparc64-glibc [21/35]: OK
                    bootlin-sparc-uclibc [22/35]: OK
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: OK
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: OK
                            br-arm-basic [28/35]: SKIPPED
                    br-arm-full-nothread [29/35]: SKIPPED
                      br-arm-full-static [30/35]: SKIPPED
                   br-i386-pentium4-full [31/35]: FAILED
                      br-mips64-n64-full [32/35]: OK
                 br-mips64r6-el-hf-glibc [33/35]: OK
               br-powerpc-603e-basic-cpp [34/35]: SKIPPED
               br-powerpc64-power7-glibc [35/35]: OK
35 builds, 6 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

The br-i386-pentium4-full error is not caused by gpsd:

package/python3/python3.mk:324: *** Python3 doesn't work with uClibc and
kernel headers < 5.1. Please use a different toolchain or unselect
Python3..

Fixes:
https://autobuild.buildroot.org/results/52d747d33d714ea10b9e7ee10adeadd9e4512c2d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f0023ca18d0cb023fb03b91827f322515a8fc498)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gpsd/gpsd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 1b20210c49..c5c4dad296 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -37,7 +37,6 @@ endif
 # Build libgpsmm if we've got C++
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GPSD_LDFLAGS += -lstdc++
-GPSD_CFLAGS += -std=gnu++98
 GPSD_CXXFLAGS += -std=gnu++98
 GPSD_SCONS_OPTS += libgpsmm=yes
 else

--===============2170058283133303609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2170058283133303609==--
