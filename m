From: Claudio Leonel <cls@elaxys.com.br>
Date: Fri, 24 Nov 2006 16:13:10 -0200
Subject: [Buildroot]  SDL_image, SDL_ttf & Co
Message-ID: <45673636.1020104@elaxys.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It is a coincidence !
We are right now also trying to write buildroot
packages for SDL_image, SDL_ttf and SDL_gfx.
We don't know buildroot well, but I think It does
not support package hierarchies so it will be
better to write three independent packages:
sld_image, sdl_ttf and sdl_gfx.

We are having problems writing the SDL_image package
(our first one). We based it on the original SDL package.
It seems that the linker is linking with our host library
'libpng12' instead of the target library in the staging_dir.
The errors are listed below, and our 'sdl_image.mk' makefile
follows. We would appreciate if anyone could tell us
what we did wrong.

Regards


---------------------------------------------------------------------------------------
/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc 
-Os -pipe 
-I/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/usr/include/SDL 
-D_GNU_SOURCE=1 -D_REENTRANT -o .libs/showimage showimage.o -Wl,-rpath 
-Wl,/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/usr/lib 
  -L/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/lib 
./.libs/libSDL_image.so /usr/lib/libpng12.so -lz 
-L/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/usr/lib 
/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/usr/lib/libSDL.so 
-lm -ldl -lpthread -Wl,--rpath 
-Wl,/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/usr/lib
/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/bin-ccache/../lib/gcc/i386-linux-uclibc/3.4.6/../../../../i386-linux-uclibc/bin/ld: 
warning: libm.so.6, needed by /usr/lib/libpng12.so, not found (try using 
-rpath or -rpath-link)
/home/s/pchecker/s/buildroot/buildroot/build_i386/staging_dir/bin-ccache/../lib/gcc/i386-linux-uclibc/3.4.6/../../../../i386-linux-uclibc/bin/ld: 
warning: libc.so.6, needed by /usr/lib/libpng12.so, not found (try using 
-rpath or -rpath-link)
/usr/lib/libpng12.so: undefined reference to `strcpy at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `free at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `_setjmp at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `pow at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `strncpy at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `fread at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `sprintf at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `fflush at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `gmtime at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `memset at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `memcpy at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `malloc at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `longjmp at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `fprintf at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `__stack_chk_fail at GLIBC_2.4'
/usr/lib/libpng12.so: undefined reference to `strlen at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `stderr at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `fwrite at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `__strtod_internal at GLIBC_2.0'
/usr/lib/libpng12.so: undefined reference to `abort at GLIBC_2.0'
collect2: ld returned 1 exit status
make[1]: *** [showimage] Error 1
make[1]: Leaving directory 
`/home/s/pchecker/s/buildroot/buildroot/build_i386/SDL_image-1.2.5'
make: *** 
[/home/s/pchecker/s/buildroot/buildroot/build_i386/SDL_image-1.2.5/.compiled] 
Error 2
-----------------------------------------------------------------------------



sdl_image.mk file:

#############################################################
#
# SDL_IMAGE
#
#############################################################
SDL_IMAGE_VERSION:=1.2.5
SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release/$(SDL_IMAGE_SOURCE)
SDL_IMAGE_CAT:=$(ZCAT)
SDL_IMAGE_DIR:=$(BUILD_DIR)/SDL_image-$(SDL_IMAGE_VERSION)

$(DL_DIR)/$(SDL_IMAGE_SOURCE):
	$(WGET) -P $(DL_DIR) $(SDL_IMAGE_SITE)/$(SDL_IMAGE_SOURCE)

sdl_image-source: $(DL_DIR)/$(SDL_IMAGE_SOURCE)

$(SDL_IMAGE_DIR)/.unpacked: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
	$(SDL_IMAGE_CAT) $(DL_DIR)/$(SDL_IMAGE_SOURCE) | tar -C (BUILD_DIR) 
$(TAR_OPTIONS) -
	touch $(SDL_IMAGE_DIR)/.unpacked

$(SDL_IMAGE_DIR)/.configured: $(SDL_IMAGE_DIR)/.unpacked
	(cd $(SDL_IMAGE_DIR); \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS) " \
	./configure \
	--target=$(GNU_TARGET_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--prefix=$(STAGING_DIR)/usr \
	--disable-tif );
	touch $(SDL_IMAGE_DIR)/.configured

$(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
	$(MAKE) -C $(SDL_IMAGE_DIR)
	touch $(SDL_IMAGE_DIR)/.compiled
	
$(STAGING_DIR)/usr/lib/libSDL_image.so: $(SDL_IMAGE_DIR)/.compiled
	$(MAKE) -C $(SDL_IMAGE_DIR) install
	touch -c $(STAGING_DIR)/usr/lib/libSDL_image.so
	
$(TARGET_DIR)/usr/lib/libSDL_image.so: 
$(STAGING_DIR)/usr/lib/libSDL_image.so
	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_image*.so* $(TARGET_DIR)/usr/lib/
	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libSDL_image.so

sdl_image: uclibc sdl $(TARGET_DIR)/usr/lib/libSDL_image.so

sdl_image-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_IMAGE_DIR) uninstall
	-$(MAKE) -C $(SDL_IMAGE_DIR) clean

sdl_image-dirclean:
	rm -rf $(SDL_IMAGE_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_SDL_IMAGE)),y)
TARGETS+=sdl_image
endif
