From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:36:23 +0200
Subject: [Buildroot] [git commit] ghostscript: needs host-zlib
Message-ID: <20170326203639.663D9825C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d50c2e5a0067b526587961dc304697317bf324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ghostscript/ghostscript.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index e568b20..265503e 100644
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
