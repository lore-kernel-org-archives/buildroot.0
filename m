From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 26 Mar 2017 17:00:17 -0300
Subject: [Buildroot] [PATCH] ghostscript: needs host-zlib
Message-ID: <20170326200017.16602-1-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ghostscript configure script checks for zlib on the host when
configuring the build of auxiliary programs used in the compilation
process and fails if such library is not found.

Add 'host-zlib' as a dependency and, while at it, also enclose $(HOSTCC)
in double quotes, otherwise configure fails when that variable expands
to a command containing spaces (e.g. when ccache is enabled).

Fixes:

  http://autobuild.buildroot.net/results/61af9caa7fe6fce6b11f78f66b9d3590f37e92e7/
  http://autobuild.buildroot.net/results/904f06e14247c22f740d8fd8902618017e0518f6/

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/ghostscript/ghostscript.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index e568b2047..265503e47 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -15,6 +15,7 @@ GHOSTSCRIPT_DEPENDENCIES = \
 	host-lcms2 \
 	host-libjpeg \
 	host-pkgconf \
+	host-zlib \
 	fontconfig \
 	ghostscript-fonts \
 	jpeg \
@@ -31,7 +32,7 @@ endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
 GHOSTSCRIPT_CONF_ENV = \
-	CCAUX=$(HOSTCC) \
+	CCAUX="$(HOSTCC)" \
 	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)"
 
 GHOSTSCRIPT_CONF_OPTS = \
-- 
2.11.0
