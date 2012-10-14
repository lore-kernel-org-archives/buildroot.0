From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Oct 2012 20:51:35 +0200
Subject: [Buildroot] [git commit] sdl_gfx: don't use --enable-mmx on x86_64
Message-ID: <20121014185341.8802099835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3eced2687b68659716c7f4729e4bd31674934f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_gfx/sdl_gfx.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

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
