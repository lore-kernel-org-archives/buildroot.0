Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBFAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D82B4404AB;
	Mon,  7 Mar 2022 19:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URLv2JxPx9sA; Mon,  7 Mar 2022 19:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AECDA403F8;
	Mon,  7 Mar 2022 19:56:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37EE1BF2B9
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C251C8242D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGRPbZyIi9Yp for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:56:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 219B581BA8
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7AB7B81E16; Mon,  7 Mar 2022 19:48:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:52:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8a4972a9a46738e57b66d1434f074ecfe8adc07
X-Git-Newrev: 6e33e5908086a511294296f317f6e6f86fa84b1d
X-Patchwork-Hint: ignore
Message-Id: <20220307194833.7AB7B81E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: Use 64-bit time_t
 with glibc toolchains for > year 2038 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e33e5908086a511294296f317f6e6f86fa84b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To use time_t 64-bit for glibc >= 2.34 toolchains we have to set both
_FILE_OFFSET_BITS=64 and _TIME_BITS=64 for glibc toolchains. Buildroot
already define _FILE_OFFSET_BITS=64 since 2008 [1] before the first
release tag 2009.02.

_TIME_BITS is not needed for musl libc since it already year2038
ready [2].

The uclibc-ng libc only support time_t 32-bit (long int) so it will be
affected by the year2038 issue [3].

Fixes (in French, chapter Buildroot 2022 and GlibC):
https://www.blaess.fr/christophe/2038

Runtime tested with qemu_arm_vexpress_defconfig and the Bootlin glibc
bleeding-edge 2021.11-1 toolchain.

Before:
 # date
 Tue Jan 19 03:14:07 UTC 2038
 # date
 Thu Jan  1 00:00:00 UTC 1970

After:
 # date
 Tue Jan 19 03:14:07 UTC 2038
 # date
 Tue Jan 19 03:14:08 UTC 2038
 # date
 Tue Jan 19 03:14:09 UTC 2038

[1] 60b5eee76edfa153ef118d2788c74ac8da1497a0
[2] https://git.musl-libc.org/cgit/musl/tree/include/alltypes.h.in?h=v1.2.2#n3
[3] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/time.h?h=v1.0.40#n75
    https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libc/sysdeps/linux/common/bits/types.h?h=v1.0.40#n106

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Christophe Blaess <christophe.blaess@logilin.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 508ea7c366..cde050ca82 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -167,7 +167,7 @@ else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 endif
 
-TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
