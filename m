From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Thu, 16 Jul 2015 11:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] gcc: make sure we don't have a copy of
	libiberty.a in host library dir
Message-ID: <1437039568-22957-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With old gcc version (like with 4.7.4), libiberty.a is copied to
library directory and it's not the behavior we want.

According to Arnout Vandecappelle, newer version of gcc
have fixed the problem. But if you choose gcc 4.7.X, the problem
is there. Therefore, I send this little patch which remove the
bad file after the build is finished.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/gcc/gcc-final/gcc-final.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 16bf4ee..2cce860 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -185,6 +185,12 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
 endif
 
+define HOST_GCC_FINAL_RM_LIBIBERTY_A
+	rm -f $(HOST_DIR)/usr/lib/libiberty.a
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_RM_LIBIBERTY_A
+
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
 endif
-- 
2.1.4
