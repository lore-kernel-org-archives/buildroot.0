From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] package infrastructure: add
	LD_LIBRARY_PATH
Message-ID: <20100223202925.536EE776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1b6242fdcf2cff7ebf09fec4cc1be58963e8427
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the compilation of target or host packages, host tools might be
used, and in turn, they might use host libraries installed in
$(HOST_DIR)/usr/lib. Therefore, we pass a LD_LIBRARY_PATH variable
when building packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index bc0ac7c..043ef3e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -236,7 +236,8 @@ TARGET_CONFIGURE_ENV=\
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
+TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -277,6 +278,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
-- 
1.6.3.3
