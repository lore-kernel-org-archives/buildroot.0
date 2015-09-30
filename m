From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 22:56:10 +0200
Subject: [Buildroot] [git commit] iostat: fix build with musl
Message-ID: <20150930205738.65FB481D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbb793624e264b3f97661cdf15893127aed77653
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl does not provide access to the kernel defined HZ macro. Under Linux HZ is
always 100, so use that value.

Fixes:
http://autobuild.buildroot.net/results/dc9/dc98a572c7055cb66cf14648af750b7e0c8e136e/
http://autobuild.buildroot.net/results/fe3/fe3907858f90f766f1949be631427dbb079e08ed/
http://autobuild.buildroot.net/results/59e/59e7c8a3d94d06ba52ea5034fcabd9737a5314db/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iostat/iostat.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d28dc1b..d591c67 100644
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
