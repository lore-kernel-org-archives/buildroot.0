From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 18 Jul 2012 23:17:39 +0200
Subject: [Buildroot] [PATCH 4/5] libglib2: define
	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
In-Reply-To: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1342646260-11203-5-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARMv5 atomic operations are not actually available as inlines
but libgcc does still provide them as functions. Trick glib into
using the functions instead of using the mutex-based fallbacks.

This should probably be platform-dependant. The inline functions
are available for ARMv6 and above and probably for other platforms
as well. Please advice on how to fix this properly.

Without this change performance of atomic operations is horrible
on ARMv5 systems.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libglib2/libglib2.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 004312f..353c824 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -15,6 +15,7 @@ LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 LIBGLIB2_CONF_ENV = \
+		CPPFLAGS=-D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 \
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
-- 
1.7.9.5
