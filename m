From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  8 Jan 2020 18:07:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: fix build failure on RHEL 7
 using -DLINUX
In-Reply-To: <20200108170745.99342-1-giulio.benetti@benettiengineering.com>
References: <20200108170745.99342-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200108170745.99342-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NSS Makefile emits -DLINUX to OS_CFLAGS only if OS_TEST=Linux when
building for Target. But nsinstall.c is a host utility and it uses
NATIVE_FLAGS instead of OS_CFLAGS, this is why -DLINUX is not emitted.
This is necessary for the case one builds for Target OS Linux on a Host
OS that is not Linux.

So let's append -DLINUX to NATIVE_FLAGS after HOST_CFLAGS to make sure
<getopt.h> is include, since in nsintall.c it is included only if LINUX
macro is defined and this caused the build failure not finding getopt
functions and macros in some build environment(i.e. RHEL 7). On other
build environments getopt.h is indirectly included by unistd.h this is
why it worked on them.

Fixes:
http://autobuild.buildroot.net/results/797/797f07ff757e7972d8c96b6a9f6abe68d17e0808/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.20.1
