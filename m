From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 22:58:28 +0100
Subject: [Buildroot] [git commit] package/libnss: fix build failure on RHEL
 7 using -DLINUX
Message-ID: <20200108214851.DCDE7861FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de676e0d2767ad60d44fa2c4dd058ef8f131d3fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NSS Makefile emits -DLINUX to OS_CFLAGS only if OS_TEST=Linux when
building for Target. But nsinstall.c is a host utility and it uses
NATIVE_FLAGS instead of OS_CFLAGS, this is why -DLINUX is not emitted.
This is necessary for the case one builds for Target OS Linux on a Host
OS that is not Linux.

After discussing upstream [*], it turned out that our current patch,
introduced with commit fe4b47a12181 (package/libnss: fix build failure
on RHEL 7) to fix the bug, is wrong. The best way to fix it is to append
-DLINUX to NATIVE_FLAGS in libnss.mk.

[*] https://bugzilla.mozilla.org/show_bug.cgi?id=1603398

So let's append -DLINUX to NATIVE_FLAGS after HOST_CFLAGS to make sure
<getopt.h> is included, since in nsintall.c it is included only if LINUX
macro is defined and this caused the build failure not finding getopt
functions and macros in some build environment(i.e. RHEL 7). On other
build environments getopt.h is indirectly included by unistd.h this is
why it worked on them.

This reverts commit fe4b47a12181b89eecb9a8e324f1ad053147f948.

Fixes:
    http://autobuild.buildroot.net/results/797/797f07ff757e7972d8c96b6a9f6abe68d17e0808/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998 at free.fr:
  - meld the two commits into one
  - update and rearrange the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...8-Fix-nsinstall.c-build-failure-on-RHEL-7.patch | 29 ----------------------
 package/libnss/libnss.mk                           |  2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch b/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
deleted file mode 100644
index 631d97d11f..0000000000
--- a/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1ba8516045bc8a13fd72e1a85206a04b29d96758 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 12 Dec 2019 12:57:29 +0100
-Subject: [PATCH] Bug 1603398 - Fix nsinstall.c build failure on RHEL 7
-
-In Linux.mk -DLINUX and -Dlinux must be passed to DEFINES, not
-OS_CFLAGS.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/coreconf/Linux.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
-index d07f8a3c5..4b45a6054 100644
---- a/nss/coreconf/Linux.mk
-+++ b/nss/coreconf/Linux.mk
-@@ -132,7 +132,7 @@ endif
- 
- OS_CFLAGS		= $(DSO_CFLAGS) $(OS_REL_CFLAGS) $(ARCHFLAG) -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR
- ifeq ($(KERNEL),Linux)
--	OS_CFLAGS	+= -DLINUX -Dlinux
-+	DEFINES		+= -DLINUX -Dlinux
- endif
- OS_LIBS			= $(OS_PTHREAD) -ldl -lc
- 
--- 
-2.20.1
-
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 950c9850d3..61950ade25 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -68,7 +68,7 @@ define LIBNSS_BUILD_CMDS
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-		$(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS)"
+		$(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX"
 endef
 
 define LIBNSS_INSTALL_STAGING_CMDS
