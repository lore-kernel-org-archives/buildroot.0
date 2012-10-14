From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 20:47:56 +0200
Subject: [Buildroot] [PATCH] sdl_gfx: don't use --enable-mmx on x86_64
Message-ID: <1350240476-22608-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though the MMX instructions are available on x86_64 processors,
the MMX code in sdl_gfx is written in IA32-specific assembly code, and
therefore does not build on x86_64. It generates the following build
issues:

SDL_imageFilter.c: Assembler messages:
SDL_imageFilter.c:34: Error: `pusha' is not supported in 64-bit mode
SDL_imageFilter.c:38: Error: `popa' is not supported in 64-bit mode
SDL_imageFilter.c:77: Error: `pusha' is not supported in 64-bit mode
SDL_imageFilter.c:93: Error: `popa' is not supported in 64-bit mode
[...]

We fix this by only enabling MMX support in this package when the
processor supports MMX *and* it is a IA32 compatible processor.

Fixes

  http://autobuild.buildroot.org/results/b9efc611f5da487079b6be37bb7a41a3198d63b9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_gfx/sdl_gfx.mk |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index e3ff630..c1c7f91 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -11,7 +11,14 @@ SDL_GFX_DEPENDENCIES = sdl
 SDL_GFX_CONF_OPT = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
-	--enable-static \
-	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx)
+	--enable-static
+
+# Even though x86_64 processors support MMX, the MMX-specific assembly
+# code in sdl_gfx is IA32 specific, and does not build for x86_64.
+ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),yy)
+SDL_GFX_CONF_OPT += --enable-mmx
+else
+SDL_GFX_CONF_OPT += --disable-mmx
+endif
 
 $(eval $(autotools-package))
-- 
1.7.9.5
