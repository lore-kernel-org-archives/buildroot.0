From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 23:39:15 +0200
Subject: [Buildroot] [git commit] lsof: don't use host toolchain to
	determine target libc
Message-ID: <20140515214017.0DEFA9CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a13ea3b30b02580c0f582f2c2435818aa1921a3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lsof Configure script builds a test program using the host toolchain to
test whether glibc is used. This test is broken in cross compilation
environment. Set LINUX_CLIB to avoid the test. This should give the correct
result even for non glibc toolchains, since all libc variants we support have
the netinet/tcp.h header.

Fixes:
http://autobuild.buildroot.net/results/a1f/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/

Cc: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsof/lsof.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index f4b1b4c..332d1f8 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -49,7 +49,8 @@ endef
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" \
-		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 ./Configure linux)
+		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
+		LINUX_CLIB=-DGLIBCV=2 ./Configure linux)
 	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
 	$(LSOF_CONFIGURE_LOCALE_FIXUPS)
 endef
