From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:36:06 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] dos2unix: fix static build
Message-ID: <20180718213123.23D1588D14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac9dc9fcab4c223029ec455d3aea251f3c6f9995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Pass the -static flag to the final link command. Otherwise, the
generated executables are not static when the external toolchain
provides both shared and static libraries.

Should also fix:
http://autobuild.buildroot.net/results/a5a/a5a64bc3ff5a91a8680ac52f3505362491923b26/
http://autobuild.buildroot.net/results/ebf/ebfe81e65751d7a5ca3aa4e20cc708a24ba65204/

Cc: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fe5fcdfdbd209177cf8f4a5368ae2324540d4d67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 9b82340590..5001397f05 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_USE_WCHAR),)
 DOS2UNIX_MAKE_OPTS += UCS=
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+DOS2UNIX_MAKE_OPTS += LDFLAGS_USER=-static
+endif
+
 define DOS2UNIX_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(DOS2UNIX_MAKE_OPTS)
 endef
