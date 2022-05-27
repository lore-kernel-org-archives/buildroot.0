Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA5FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4942F61652;
	Fri, 27 May 2022 09:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aN0Igh9yzG6Q; Fri, 27 May 2022 09:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685DC61643;
	Fri, 27 May 2022 09:38:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6601BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B2F74121F
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZubDWt5X_DF for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C548F4056C
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6FAB8662C; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:28:27 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ede7d0a00070e2b0231084fc498ff49ffadc9c10
X-Git-Newrev: ae4774654e46a81b6699d2e3e5130e667549978a
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.C6FAB8662C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libpri: fix
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae4774654e46a81b6699d2e3e5130e667549978a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

pritest, rosetest and testprilib needs a static library and pridump
needs a dynamic library resulting in the following static build failure
since the addition of the package in commit
a77f356b78f9134227f9702a1eb09c3203c42d88:

/home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -fPIC -MD -MT pridump.o -MF .pridump.o.d -MP -c -o pridump.o pridump.c
/home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -static -shared -Wl,-hlibpri.so.1.4  -o libpri.so.1.4 copy_string.o pri.o q921.o prisched.o q931.o pri_aoc.o pri_cc.o pri_facility.o asn1_primitive.o rose.o rose_address.o rose_etsi_aoc.o rose_etsi_cc.o rose_etsi_diversion.o rose_etsi_ect.o rose_etsi_mwi.o rose_other.o rose_q931.o rose_qsig_aoc.o rose_qsig_cc.o rose_qsig_ct.o rose_qsig_diversion.o rose_qsig_mwi.o rose_qsig_name.o version.o
/home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0xd0): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/1217922af3a72646ae242c2c4dec22ead7883b91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 987988cee5aa6e934df7bee0d58ec5a23fffcc5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpri/libpri.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
index e1fa2abcf5..34d84393c4 100644
--- a/package/libpri/libpri.mk
+++ b/package/libpri/libpri.mk
@@ -17,6 +17,7 @@ LIBPRI_INSTALL_STAGING = YES
 # So we need to explicitly build only what we can.
 ifneq ($(BR2_SHARED_LIBS),y)
 LIBPRI_LIBS = libpri.a
+LIBPRI_UTILS += pritest rosetest testprilib
 define LIBPRI_INSTALL_A
 	$(INSTALL) -D -m 0644 $(@D)/libpri.a $(1)/usr/lib/libpri.a
 endef
@@ -24,14 +25,13 @@ endif
 
 ifneq ($(BR2_STATIC_LIBS),y)
 LIBPRI_LIBS += libpri.so.1.4
+LIBPRI_UTILS += pridump
 define LIBPRI_INSTALL_SO
 	$(INSTALL) -D -m 0644 $(@D)/libpri.so.1.4 $(1)/usr/lib/libpri.so.1.4
 	ln -sf libpri.so.1.4 $(1)/usr/lib/libpri.so
 endef
 endif
 
-LIBPRI_UTILS = pridump pritest rosetest testprilib
-
 define LIBPRI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
