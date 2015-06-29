From: Tal Zilcer <talz@ezchip.com>
Date: Mon, 29 Jun 2015 15:50:26 +0300
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix ARC failure to build in 2
	phases.
Message-ID: <1435582227-26345-1-git-send-email-talz@ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tal Zilcer <talz@ezchip.com>

When working with GCC initial at override source dir mode the
HOST_GCC_INITIAL_POST_PATCH_HOOKS is not called and compilation failes.
The solution is to use HOST_GCC_INITIAL_POST_RSYNC_HOOKS since this hook
is being called at override source dir mode.

Signed-off-by: Tal Zilcer <talz@ezchip.com>
---
 package/gcc/gcc-initial/gcc-initial.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0fa2353..6b747d0 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -33,7 +33,11 @@ define HOST_GCC_INITIAL_DISABLE_LIBGMON
 	$(SED) 's/crtbeginS.o libgmon.a crtg.o/crtbeginS.o crtg.o/' \
 		$(@D)/libgcc/config.host
 endef
+ifeq ($(HOST_GCC_INITIAL_OVERRIDE_SRCDIR),)
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
+else
+HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
+endif
 endif
 
 HOST_GCC_INITIAL_CONF_OPTS = \
-- 
1.7.1
