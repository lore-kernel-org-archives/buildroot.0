From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Sep 2015 20:13:23 +0300
Subject: [Buildroot] [PATCH] iostat: fix build with musl
Message-ID: <0adb275dfb0b27263aa2a671be7505ca55eb5db8.1443633203.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl does not provide access to the kernel defined HZ macro. Under Linux HZ is
always 100, so use that value.

Fixes:
http://autobuild.buildroot.net/results/dc9/dc98a572c7055cb66cf14648af750b7e0c8e136e/
http://autobuild.buildroot.net/results/fe3/fe3907858f90f766f1949be631427dbb079e08ed/
http://autobuild.buildroot.net/results/59e/59e7c8a3d94d06ba52ea5034fcabd9737a5314db/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iostat/iostat.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d28dc1b76e55..d591c67dcb36 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -10,7 +10,8 @@ IOSTAT_LICENSE = GPL
 IOSTAT_LICENSE_FILES = LICENSE
 
 define IOSTAT_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -DHZ=100"
 endef
 
 define IOSTAT_INSTALL_TARGET_CMDS
-- 
2.5.3
