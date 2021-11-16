Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A257C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5761961AFB
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5761961AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27B1E80F5C;
	Tue, 16 Nov 2021 20:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgsY0t0RzheJ; Tue, 16 Nov 2021 20:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3590480F54;
	Tue, 16 Nov 2021 20:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C9C1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 771CE80F3E
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdCSw3_8BQOt for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63FB080F41
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C87988D362; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 21:29:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c2245cb65741c965f4bb87d35ac3c64f250a1ae
X-Git-Newrev: cf8900b0638e3d17c78ffa48655d4a972d1c7e8f
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.C87988D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: disable objcopy
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
Content-Type: multipart/mixed; boundary="===============7297682525093217745=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7297682525093217745==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cf8900b0638e3d17c78ffa48655d4a972d1c7e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop fourth patch and disable objcopy as suggested by upstream in
https://bugs.ghostscript.com/show_bug.cgi?id=704442#c2

This will also fix the following build failure on sparc and xtensa:

    OBJCOPY build/release/resources/fonts/urw/Dingbats.cff.o
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: --relax and -r may not be used together

While at it, drop MUPDF_DISABLE_OPENGL and use the new MUPDF_MAKE_OPTS
variable

Fixes:
 - http://autobuild.buildroot.org/results/e64d456174a0f701c0e0de68317debcdc429a660
 - http://autobuild.buildroot.net/results/0945f305d31530677282f38fa7c99af5295d47bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-Makefile-compile-hexdump.exe-with-HOSTCC.patch | 40 ++++++++++++++++++++
 .../0004-Use-CC-instead-of-LD-for-OBJCOPY.patch    | 43 ----------------------
 package/mupdf/mupdf.mk                             | 17 +++++----
 3 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/package/mupdf/0004-Makefile-compile-hexdump.exe-with-HOSTCC.patch b/package/mupdf/0004-Makefile-compile-hexdump.exe-with-HOSTCC.patch
new file mode 100644
index 0000000000..bc9debd332
--- /dev/null
+++ b/package/mupdf/0004-Makefile-compile-hexdump.exe-with-HOSTCC.patch
@@ -0,0 +1,40 @@
+From c0036573a995dc78d3cf60a30ff0af2b47f3680a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Nov 2021 23:24:27 +0100
+Subject: [PATCH] Makefile: compile hexdump.exe with HOSTCC
+
+hexdump.exe must be compiled for the host or the build will fail when
+cross-compiling with HAVE_OBJCOPY=no
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.ghostscript.com/show_bug.cgi?id=704442]
+---
+ Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 6492b1ca3..0732b358f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -60,6 +60,8 @@ AR_CMD = $(QUIET_AR) $(MKTGTDIR) ; $(AR) cr $@ $^
+ ifdef RANLIB
+   RANLIB_CMD = $(QUIET_RANLIB) $(RANLIB) $@
+ endif
++HOSTCC ?= $(CC)
++HOST_LINK_CMD = $(QUIET_LINK) $(MKTGTDIR) ; $(HOSTCC) -o $@ $^
+ LINK_CMD = $(QUIET_LINK) $(MKTGTDIR) ; $(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ TAGS_CMD = $(QUIET_TAGS) ctags -R --c-kinds=+p --exclude=platform/python --exclude=platform/c++
+ WINDRES_CMD = $(QUIET_WINDRES) $(MKTGTDIR) ; $(WINDRES) $< $@
+@@ -81,6 +83,9 @@ $(OUT)/%.a :
+ 	$(AR_CMD)
+ 	$(RANLIB_CMD)
+ 
++$(OUT)/scripts/hexdump.exe: scripts/hexdump.c
++	$(HOST_LINK_CMD)
++
+ $(OUT)/%.exe: %.c
+ 	$(LINK_CMD)
+ 
+-- 
+2.33.0
+
diff --git a/package/mupdf/0004-Use-CC-instead-of-LD-for-OBJCOPY.patch b/package/mupdf/0004-Use-CC-instead-of-LD-for-OBJCOPY.patch
deleted file mode 100644
index 0e0aadd29d..0000000000
--- a/package/mupdf/0004-Use-CC-instead-of-LD-for-OBJCOPY.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From da4b98447573daf77829811e95e3772e8a296934 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
-Date: Thu, 2 Sep 2021 20:17:26 +0200
-Subject: [PATCH] Use CC instead of LD for OBJCOPY
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When cross-compiling for mips targets using Buildroot, using LD for
-partial linking fails in the following way:
-/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: build/release/libmupdf.a(Dingbats.cff.o): ABI is incompatible with that of the selected emulation
-/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file build/release/libmupdf.a(Dingbats.cff.o)
-
-To fix it, use CC instead of LD for partial linking.
-
-'nostdlib' has to be added, or it will try to use GCC libraries for
-partial linking and fail with 'cannot find -lgcc_s'.
-
-Fixes:
-- http://autobuild.buildroot.net/results/156fe9ee5f6dccdc98990f6c5de5562383bc2b74
-
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
-[Upstream status: https://bugs.ghostscript.com/show_bug.cgi?id=704442]
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index b0fb617e2..0a8795e0e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -64,7 +64,7 @@ endif
- LINK_CMD = $(QUIET_LINK) $(MKTGTDIR) ; $(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- TAGS_CMD = $(QUIET_TAGS) ctags -R --c-kinds=+p
- WINDRES_CMD = $(QUIET_WINDRES) $(MKTGTDIR) ; $(WINDRES) $< $@
--OBJCOPY_CMD = $(QUIET_OBJCOPY) $(MKTGTDIR) ; $(LD) -r -b binary -z noexecstack -o $@ $<
-+OBJCOPY_CMD = $(QUIET_OBJCOPY) $(MKTGTDIR) ; $(CC) -Wl,-r -Wl,-b -Wl,binary -Wl,-z -Wl,noexecstack -nostdlib -o $@ $<
- 
- # --- Rules ---
- 
--- 
-2.33.0
-
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index c9d5b4a162..56ea7cc507 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -52,25 +52,28 @@ MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	XLIBS="$(MUPDF_LDFLAGS)" \
 	USE_SYSTEM_LIBS=yes
 
+MUPDF_MAKE_OPTS = \
+	HAVE_OBJCOPY=no \
+	prefix="/usr"
+
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MUPDF_DEPENDENCIES += libfreeglut
 else
-define MUPDF_DISABLE_OPENGL
-	sed -i 's/HAVE_GLUT := yes/HAVE_GLUT := no/g' $(@D)/Makerules
-endef
-MUPDF_POST_PATCH_HOOKS = MUPDF_DISABLE_OPENGL
+MUPDF_MAKE_OPTS += HAVE_GLUT=no
 endif
 
 define MUPDF_BUILD_CMDS
-	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) $(MUPDF_MAKE_OPTS) all
 endef
 
 define MUPDF_INSTALL_STAGING_CMDS
-	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" prefix="/usr" install_libs
+	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) $(MUPDF_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" install_libs
 endef
 
 define MUPDF_INSTALL_TARGET_CMDS
-	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" prefix="/usr" install
+	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) $(MUPDF_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))

--===============7297682525093217745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7297682525093217745==--
