Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33957C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 08:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2081846ED;
	Sat, 28 May 2022 08:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J96FrHG55D3t; Sat, 28 May 2022 08:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC3B846AE;
	Sat, 28 May 2022 08:41:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42ADC1BF59E
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D024784CCE
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buJUaGRg7ZHV for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 08:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0BAA84C31
 for <buildroot@buildroot.org>; Sat, 28 May 2022 08:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C06AC8414C; Sat, 28 May 2022 08:29:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 10:08:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f32875ede7cf9111c126a7c24991c45bb617ab82
X-Git-Newrev: 2fb2767f1d9bdafce0083792060775ae84742ab3
X-Patchwork-Hint: ignore
Message-Id: <20220528082902.C06AC8414C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-pillow:
 fix pkg-config search paths
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fb2767f1d9bdafce0083792060775ae84742ab3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Currently pillow doesn't correctly search pkg-config system paths
for some libraries which can prevent some libraries from being
properly detected/enabled in pillow.

This is due to pillow implementing custom header validation
checks which need system paths present to function correctly:
https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633

Removed custom BUILD_CMDS and INSTALL_TARGET_CMDS which were
causing python-pillow to be installed for the host, they are
not required, we just need to set build_ext at the start
of PYTHON_PILLOW_BUILD_OPTS instead.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 10664068b994277c6c3e78553ea4b613ec3d9935)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Search-pkg-config-system-libs-cflags.patch | 33 ++++++++++++++++++++++
 package/python-pillow/python-pillow.mk             | 23 +++------------
 2 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
new file mode 100644
index 0000000000..d0552ce0f4
--- /dev/null
+++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
@@ -0,0 +1,33 @@
+From 9ea46247048f861f088f09541cd434aeb16e6f9c Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 15 Mar 2022 23:31:59 -0600
+Subject: [PATCH] Search pkg-config system libs/cflags.
+
+We need to search the system paths as well from pkg-config for
+some packages to be found properly.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+9ea46247048f861f088f09541cd434aeb16e6f9c]
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9a05e5105..d41aedbd6 100755
+--- a/setup.py
++++ b/setup.py
+@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
+ def _pkg_config(name):
+     try:
+         command = os.environ.get("PKG_CONFIG", "pkg-config")
+-        command_libs = [command, "--libs-only-L", name]
+-        command_cflags = [command, "--cflags-only-I", name]
++        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
++        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
+         if not DEBUG:
+             command_libs.append("--silence-errors")
+             command_cflags.append("--silence-errors")
+-- 
+2.25.1
+
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 901876e0ee..1d99f44fa1 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
+
+PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
+PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS)
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
@@ -68,22 +71,4 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
-define PYTHON_PILLOW_BUILD_CMDS
-	cd $(PYTHON_PILLOW_BUILDDIR); \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
-		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
-		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
-endef
-
-define PYTHON_PILLOW_INSTALL_TARGET_CMDS
-	cd $(PYTHON_PILLOW_BUILDDIR); \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
-		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
-		$(PYTHON_PILLOW_BUILD_OPTS) install \
-		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
-		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
-endef
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
