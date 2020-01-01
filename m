From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 16:52:12 +0100
Subject: [Buildroot] [git commit] package/proj: fix build failure due to gcc
 bug 68485(C++)
Message-ID: <20200101154326.B15DD8EA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11874eea431303c09daeb560785e0a25fd069a3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The proj package exhibits gcc bug 68485 when building for the
Microblaze architecture C files (which was already worked around), but
also for C++ files.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 when compiling C++ files too if
BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:
http://autobuild.buildroot.net/results/dc9/dc9bc52ff3d5a83dcfe4a86a391590bef57e1cf0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Thomas: rework implementation to use a single condition for both CFLAGS and CXXFLAGS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proj/proj.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index ca943141ce..faa7dab19b 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -12,11 +12,15 @@ PROJ_INSTALL_STAGING = YES
 PROJ_DEPENDENCIES = host-pkgconf host-sqlite sqlite
 
 PROJ_CFLAGS = $(TARGET_CFLAGS)
+PROJ_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 PROJ_CFLAGS += -O0
+PROJ_CXXFLAGS += -O0
 endif
 
-PROJ_CONF_ENV = CFLAGS="$(PROJ_CFLAGS)"
+PROJ_CONF_ENV = \
+	CFLAGS="$(PROJ_CFLAGS)" \
+	CXXFLAGS="$(PROJ_CXXFLAGS)"
 
 $(eval $(autotools-package))
