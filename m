From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Dec 2010 12:19:09 +0100
Subject: [Buildroot] [PATCH 1/1] package: correct usage of PKG_CONFIG_LIBDIR
	and PKG_CONFIG_PATH
In-Reply-To: <cover.1293535143.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293535143.git.thomas.petazzoni@free-electrons.com>
Message-ID: <dfd500e8d6ee6be7e90583199314956adcce265f.1293535143.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our usage of PKG_CONFIG_LIBDIR and PKG_CONFIG_PATH was
incorrect. According to pkg-config's documentation:

  PKG_CONFIG_PATH

     A colon-separated (on Windows, semicolon-separated) list of
     directories to search for .pc files.  The default directory will
     always be searched after searching the path; the default is
     libdir/pkgconfig:datadir/pkgconfig where libdir is the libdir
     where pkg-config and datadir is the datadir where pkg-config was
     installed.

  PKG_CONFIG_LIBDIR

     Replaces the default pkg-config search directory.

In TARGET_CONFIGURE_OPTS (used to build packages for the target), we
were doing:

 PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"

This is incorrect for two reasons:

 * Adding $(PKG_CONFIG_PATH) to the PKG_CONFIG_PATH is useless, as
   PKG_CONFIG_PATH only *adds* new paths to the existing search paths.

 * PKG_CONFIG_PATH keeps default path (/usr/lib/pkgconfig) in the
   search path, which is incorrect for target packages: we should only
   look in $(STAGING_DIR)/usr/lib/pkgconfig. Lionel was hit by an
   issue caused by this: while compiling packages for the target, it
   was looking at .pc files in /usr/lib/pkgconfig on his host machine.

So instead, we just use PKG_CONFIG_LIBDIR with
$(STAGING_DIR)/usr/lib/pkgconfig.

In HOST_CONFIGURE_OPTS (used to build packages for the host), we were
doing:

   PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"

But there's no real reason to use PKG_CONFIG_LIBDIR here: as we are
compiling for the host, we may well have some interesting libraries in
/usr/lib/pkgconfig. So searching through them after
$(HOST_DIR)/usr/lib/pkgconfig sounds like the right thing to do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 71c8dbc..4f1f1e4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -219,7 +219,7 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
+		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
@@ -241,7 +241,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-- 
1.7.0.4
