Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63402C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13CA3400A4;
	Wed, 12 Jan 2022 19:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUoKIHC6sKL8; Wed, 12 Jan 2022 19:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027BF4011D;
	Wed, 12 Jan 2022 19:47:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF6CB1BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233CD415D1
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Vzhh-9hQatN for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A899415CF
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 32EE08345C; Wed, 12 Jan 2022 19:39:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 20:43:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d0f84d2004b04bc93d5ceb58c86640f190e5d78
X-Git-Newrev: 1b5e90c3203f944cb7f7ccad766f38580b9b2b6f
X-Patchwork-Hint: ignore
Message-Id: <20220112193954.32EE08345C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycbor: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b5e90c3203f944cb7f7ccad766f38580b9b2b6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid the following build failure with gcc 4.8 raised
since bump to version 0.6.0 in commit
ee1a2826dcf7ff75f90b0bf9f7aa53d19ce19cf6 and
https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:

/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
cc1: error: -Werror=int-conversion: no option -Wint-conversion

Fixes:
 - http://autobuild.buildroot.org/results/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Makefile-add-DISABLE_WERROR.patch         | 44 ++++++++++++++++++++++
 package/tinycbor/tinycbor.mk                       |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
new file mode 100644
index 0000000000..334bea7eb0
--- /dev/null
+++ b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
@@ -0,0 +1,44 @@
+From 5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Jan 2022 23:17:45 +0100
+Subject: [PATCH] Makefile: add DISABLE_WERROR
+
+Allow the user to disable -Werror to avoid the following build failure
+with gcc 4.8 raised since version 0.6.0 and
+https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:
+
+/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
+cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
+cc1: error: -Werror=int-conversion: no option -Wint-conversion
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a9f/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/intel/tinycbor/commit/5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0]
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6492ea16..3cde2b3d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -236,10 +236,15 @@ tag: distcheck
+ .SECONDARY:
+ 
+ cflags := $(CPPFLAGS) -I$(SRCDIR)src
+-cflags += -std=gnu99 $(CFLAGS) \
++cflags += -std=gnu99 $(CFLAGS)
++
++ifneq ($(DISABLE_WERROR),1)
++cflags += \
+ 	-Werror=incompatible-pointer-types \
+ 	-Werror=implicit-function-declaration \
+ 	-Werror=int-conversion
++endif
++
+ %.o: %.c
+ 	@test -d $(@D) || $(MKDIR) $(@D)
+ 	$(CC) $(cflags) $($(basename $(notdir $@))_CCFLAGS) -c -o $@ $<
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index bf6e8e4c1e..cad50e633b 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
 
-TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
+TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
