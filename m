From: Malte Starostik <m-starostik@versanet.de>
Date: Tue,  2 Nov 2010 02:18:17 +0100
Subject: [Buildroot] [PATCH] Prohibit config cache for host-libtool
Message-ID: <1288660697-7641-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes this one when building from scratch:
libtool: link: (cd libltdl/.libs && /usr/bin/gcc -O2
		 -I/home/malte/devel/buildroot/output/host/include
		 -I/home/malte/devel/buildroot/output/host/usr/include
		 -c -fno-builtin  -fPIC -DPIC "libltdlS.c")
libltdlS.c:26: error: 'lt_ptr' undeclared here (not in a function)
libltdlS.c:26: error: expected '}' before numeric constant
make[3]: *** [libltdl/libltdl.la] Fehler 1

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 package/libtool/libtool.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 60fee9f..8f89c7d 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -17,6 +17,7 @@ endef
 HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_CUSTOM_INSTALL
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
+HOST_LIBTOOL_USE_CONFIG_CACHE = NO
 
 $(eval $(call AUTOTARGETS,package,libtool))
 $(eval $(call AUTOTARGETS,package,libtool,host))
-- 
1.7.2.2
