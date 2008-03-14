From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 13 Mar 2008 18:05:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
In-Reply-To: <20080307133125.0D12A1201B3@busybox.net>
References: <20080307133125.0D12A1201B3@busybox.net>
Message-ID: <16042261.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi,

With this commit, sdl header are not copied to $(STAGING_DIR)/usr/include
folder and sdl_mixer fails to build because of missing sdl.h and other sdl
related header files.


I think we need to maintain --includedir option.

Regards
Gururaja

/bin/sh ./libtool --mode=compile
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc -O0 
-I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
/opt/buildroot/build_arm/staging_dir -mtune=arm9tdmi  -D_GNU_SOURCE=1
-I/opt/buildroot/build_arm/staging_dir/usr/include/SDL -D_GNU_SOURCE=1
-D_REENTRANT -DCMD_MUSIC -DWAV_MUSIC -DMOD_MUSIC -I./mikmod -DMID_MUSIC
-DUSE_TIMIDITY_MIDI -I./timidity -c ./effect_position.c  -o
build/effect_position.lo
mkdir build/.libs
 /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O0 -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
/opt/buildroot/build_arm/staging_dir -mtune=arm9tdmi -D_GNU_SOURCE=1
-I/opt/buildroot/build_arm/staging_dir/usr/include/SDL -D_GNU_SOURCE=1
-D_REENTRANT -DCMD_MUSIC -DWAV_MUSIC -DMOD_MUSIC -I./mikmod -DMID_MUSIC
-DUSE_TIMIDITY_MIDI -I./timidity -c ./effect_position.c  -fPIC -DPIC -o
build/.libs/effect_position.o
./effect_position.c:31:17: error: SDL.h: No such file or directory
In file included from ./effect_position.c:32:
./SDL_mixer.h:28:23: error: SDL_types.h: No such file or directory
./SDL_mixer.h:29:23: error: SDL_rwops.h: No such file or directory
./SDL_mixer.h:30:23: error: SDL_audio.h: No such file or directory
./SDL_mixer.h:31:24: error: SDL_endian.h: No such file or directory
./SDL_mixer.h:32:25: error: SDL_version.h: No such file or directory
./SDL_mixer.h:33:24: error: begin_code.h: No such file or directory
In file included from ./effect_position.c:32:
./SDL_mixer.h:66: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'const'
./SDL_mixer.h:87: error: expected specifier-qualifier-list before 'Uint8'
./SDL_mixer.h:114: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'int'
./SDL_mixer.h:122: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'int'
./SDL_mixer.h:127: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'int'
./SDL_mixer.h:130: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'Mix_Chunk'




root at guru_vlinux:/opt/buildroot# ls -la
build_arm/staging_dir/usr/include/SDL
ls: build_arm/staging_dir/usr/include/SDL: No such file or directory
root at guru_vlinux:/opt/buildroot#                                            


root at guru_vlinux:/opt/buildroot# ls -la
build_arm/staging_dir/usr/lib/libSDL*
lrwxrwxrwx 1 root root      20 Mar 14 12:50
build_arm/staging_dir/usr/lib/libSDL-1.2.so.0 -> libSDL-1.2.so.0.11.2
-rwxr-xr-x 1 root root 1053059 Mar 14 12:51
build_arm/staging_dir/usr/lib/libSDL-1.2.so.0.11.2
-rw-r--r-- 1 root root 1544098 Mar 14 12:50
build_arm/staging_dir/usr/lib/libSDL.a
-rwxr-xr-x 1 root root    1145 Mar 14 12:50
build_arm/staging_dir/usr/lib/libSDL.la
lrwxrwxrwx 1 root root      20 Mar 14 12:50
build_arm/staging_dir/usr/lib/libSDL.so -> libSDL-1.2.so.0.11.2
-rw-r--r-- 1 root root    1750 Mar 14 12:50
build_arm/staging_dir/usr/lib/libSDLmain.a
root at guru_vlinux:/opt/buildroot#                                                            




Peter Korsgaard-3 wrote:
> 
> Log:
> sdl: cleanup configure args + sdl-config, fixup /lib vs /usr/lib
> 
> 
> Modified:
>    trunk/buildroot/package/sdl/sdl.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/sdl/sdl.mk
> ===================================================================
> --- trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:16 UTC (rev 21269)
> +++ trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:24 UTC (rev 21270)
> @@ -55,18 +55,10 @@
>  		--target=$(GNU_TARGET_NAME) \
>  		--host=$(GNU_TARGET_NAME) \
>  		--build=$(GNU_HOST_NAME) \
> -		--prefix=/usr \
> +		--prefix=$(STAGING_DIR)/usr \
>  		--exec-prefix=/usr \
> -		--bindir=/bin \
> -		--sbindir=/sbin \
> -		--libdir=/lib \
> -		--libexecdir=/lib \
>  		--sysconfdir=/etc \
> -		--datadir=/share \
>  		--localstatedir=/var \
> -		--includedir=/include \
> -		--mandir=/man \
> -		--infodir=/info \
>  		--enable-pulseaudio=no \
>  		--disable-arts \
>  		--disable-esd \
> @@ -91,11 +83,9 @@
>  	touch $@
>  
>  $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
> -	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR) install
> -	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
> -		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
> -		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
> -		-e "s,-I/include/SDL,-I\'$(STAGING_DIR)/include/SDL\',g" \
> +	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_DIR) install
> +# sdl-config uses -Lexec_prefix/lib instead of -Lprefix/lib - fix it
> +	$(SED) 's^-L\$${exec_prefix}^-L\$${prefix}^' \
>  		$(STAGING_DIR)/usr/bin/sdl-config
>  	touch -c $@
>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-sdl-tp15896866p16042261.html
Sent from the BuildRoot mailing list archive at Nabble.com.
