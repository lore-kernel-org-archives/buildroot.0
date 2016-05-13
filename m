From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 15:05:25 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix user provided
	libraries deployment
Message-ID: <20160513130548.7C21980AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8389b623528016d83c7e54a59fbecdc02c846836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 919b4f9eab3e6dcd18cf9220af2c9bb2ca3e5098 the internal symbol
LIB_EXTERNAL_LIBS was renamed TOOLCHAIN_EXTERNAL_LIBS but the find and
replace command also renamed BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS to
BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS which doesn't exist.

So user provided libraries defined in BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
are not copied anymore to staging and target directories.

For example:
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS="libasan.* libubsan.*"

Simply revert this change by renaming
BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS to BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 24c1f03..34217c0 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -90,7 +90,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
-TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS))
+TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
 #
