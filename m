From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  1 May 2010 14:10:28 +0200
Subject: [Buildroot] [PATCH] package: Add $(HOST_DIR)/usr/lib to
	LD_LIBRARY_PATH for host but not target
In-Reply-To: <1272587053-19535-3-git-send-email-llandwerlin@gmail.com>
References: <1272587053-19535-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272715828-8632-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Some packages like icu requires to be compiled against the host system
first to be able to compile against the target. This is due to the
usage of self generated binaries by the package to build itself. When
the generated tools also depends on generated libraries it is required
to add the path to these libraries in the library path
(LD_LIBRARY_PATH) especially for the configure step.

Adding $(HOST_DIR)/usr/lib to LD_LIBRARY_PATH for target compilation
might break the link step by mixing host libraries and target
binaries.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3dfc712..6d99205 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -209,7 +209,6 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_CONFIGURE_ENV=\
@@ -219,7 +218,6 @@ TARGET_CONFIGURE_ENV=\
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
@@ -257,9 +255,11 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
+		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
-- 
1.7.0.4
