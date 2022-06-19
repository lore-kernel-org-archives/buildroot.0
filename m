Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96754C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBF382404;
	Sun, 19 Jun 2022 13:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBF382404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqd3_U8_4jPk; Sun, 19 Jun 2022 13:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D9E81D11;
	Sun, 19 Jun 2022 13:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D9E81D11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 824F01BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DA0E81D11
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA0E81D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 293lUqOk7HGN for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:40:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8406F81CE9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8406F81CE9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8216A87306; Sun, 19 Jun 2022 13:28:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:38:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 0352cceac284c434ed8286d0f9accce022a0a317
X-Git-Newrev: 5ca7f462b0c2792f53d9af8ce8a7b4a88f9afeb5
X-Patchwork-Hint: ignore
Message-Id: <20220619132802.8216A87306@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/zstd: fix build
 without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ca7f462b0c2792f53d9af8ce8a7b4a88f9afeb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Move libzstd.pc in ZSTD_BUILD_LIBS so it will be suffixed by -nomt
without threads. As a result, libzstd.pc will not contain -pthread in
Libs.Private which will avoid the following static build failure with
zchunk) raised since commit 0f0e913f10caf21f23c2e46f210519a7a3bc0b32:

/home/buildroot/autobuild/instance-2/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc  -o src/unzck src/unzck.p/unzck.c.o src/unzck.p/util_common.c.o -Wl,--as-needed -Wl,--no-undefined -static -Wl,--start-group src/lib/libzck.a -largp /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libzstd.a -pthread /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a -Wl,--end-group
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: cannot find -lpthread

Fixes:
 - http://autobuild.buildroot.org/results/481d1979920daaecac48dec763151e124651740f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 253a951c4fe746306cdc3db80fae581d95ad6383)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.mk | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a4bbada825..e8f6315222 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -38,14 +38,15 @@ endif
 # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
 ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
 
+ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
 ifeq ($(BR2_STATIC_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd.a
+ZSTD_BUILD_LIBS_BASENAMES += libzstd.a
 ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS_BASENAMES += lib
 ZSTD_INSTALL_LIBS = install-shared
 else
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS_BASENAMES += lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
@@ -63,17 +64,20 @@ endif
 # purpose.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
-ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS_THREAD_SUFFIX = -mt
 else
 ZSTD_OPTS += HAVE_THREAD=0
-ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS_THREAD_SUFFIX = -nomt
 endif
 # check-package disable OverriddenVariable - override intended
-ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS = \
+	$(addsuffix -release, \
+		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
+			$(ZSTD_BUILD_LIBS_BASENAMES)))
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
+		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
