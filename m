From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 26 Oct 2008 14:57:01 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/libogg
	audio/libvorbis docker edit etc...
In-Reply-To: <20081026061944.0F6DE3C2B3@busybox.net>
References: <20081026061944.0F6DE3C2B3@busybox.net>
Message-ID: <200810261357.02012.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org, 26.10.2008:
> Author: jacmet
> Date: 2008-10-25 23:19:43 -0700 (Sat, 25 Oct 2008)
> New Revision: 23794
> 
> Log:
> package: cleanup PKG_CONFIG_SYSROOT
> 
> PKG_CONFIG_SYSROOT_DIR and friends get set in package/Makefile.in,
> so there's no need to set it in the makefiles of the individual
> packages as well.
> 
> Based on a patch by Markus Heidelberg.
> 
> Modified:
>    trunk/buildroot/package/audio/libogg/libogg.mk
>    trunk/buildroot/package/audio/libvorbis/libvorbis.mk
>    trunk/buildroot/package/docker/docker.mk
>    trunk/buildroot/package/editors/vim/vim.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/editors/vim/vim.mk
> ===================================================================
> --- trunk/buildroot/package/editors/vim/vim.mk	2008-10-26 06:03:23 UTC (rev 23793)
> +++ trunk/buildroot/package/editors/vim/vim.mk	2008-10-26 06:19:43 UTC (rev 23794)
> @@ -36,14 +36,8 @@
>  
>  $(VIM_DIR)/.configured: $(VIM_DIR)/.patched
>  	(cd $(VIM_DIR)/src; \
> -		PATH=$(TARGET_PATH) \
> -		CC="$(TARGET_CC)" \
> -		CPP="$(TARGET_CPP)" \

This lets configure abort at the compiler check, patch below.

>  		CFLAGS="$(TARGET_CFLAGS)" \
>  		STRIP="$(TARGET_STRIP)" \
> -		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
> -		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
> -		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
>  		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>  		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>          $(TARGET_CONFIGURE_ARGS) \


---
 package/editors/vim/vim.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/editors/vim/vim.mk b/package/editors/vim/vim.mk
index a9d79ed..826e3c7 100644
--- a/package/editors/vim/vim.mk
+++ b/package/editors/vim/vim.mk
@@ -36,11 +36,12 @@ $(VIM_DIR)/.patched: $(VIM_DIR)/.unpacked
 
 $(VIM_DIR)/.configured: $(VIM_DIR)/.patched
 	(cd $(VIM_DIR)/src; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		STRIP="$(TARGET_STRIP)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-        $(TARGET_CONFIGURE_ARGS) \
 		./configure --prefix=/usr \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.5.6.4
