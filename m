From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Fri, 14 Mar 2008 08:17:58 +0530
Subject: [Buildroot] Add SDL_mixer to buildroot/package
References: <15514999.post@talk.nabble.com>
	<87hcfiacn1.fsf@macbook.be.48ers.dk>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA054073@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi,

Today i tried building buildroot for arm926ejs with yesterdays snapshot
for sdl & sdl mixer and what i found was that


1. make sdl will not create $(STAGING_DIR)/usr/include/SDL and will not
copy sdl header files to $(STAGING_DIR)/usr/include/SDL

2. and hence "make sdl_mixer" fails with missing sdl files 

/bin/sh ./libtool --mode=compile
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O0  -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
/opt/buildroot/build_arm/staging_dir -mtune=arm9tdmi  -D_GNU_SOURCE=1
-I/opt/buildroot/build_arm/staging_dir/include/SDL -D_GNU_SOURCE=1
-D_REENTRANT -DCMD_MUSIC -DWAV_MUSIC -DMOD_MUSIC -I./mikmod -DMID_MUSIC
-DUSE_TIMIDITY_MIDI -I./timidity -c ./effect_position.c  -o
build/effect_position.lo
mkdir build/.libs
 
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O0 -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
/opt/buildroot/build_arm/staging_dir -mtune=arm9tdmi -D_GNU_SOURCE=1
-I/opt/buildroot/build_arm/staging_dir/include/SDL -D_GNU_SOURCE=1
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
./SDL_mixer.h:66: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'const'
./SDL_mixer.h:87: error: expected specifier-qualifier-list before
'Uint8'
./SDL_mixer.h:114: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'int'


I reverted back the patch you had applied on
http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-sdl-ts158968
66.html and sdl builds correctly with header files copied to
$(STAGING_DIR)/usr/include/SDL.

but again sdl_mixer fails with the same error.

so i added CFLAGS to configure command as below and sdl_mixer is
building properly now,

$(SDL_MIXER_DIR)/.configured: $(SDL_MIXER_DIR)/.unpacked
$(STAGING_DIR)/usr/lib/libSDL.so
	(cd $(SDL_MIXER_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		CFLAGS+=-I$(STAGING_DIR)/usr/include/SDL \
<--------- i added this
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		<snip>
		<snip>
		<snip>


Kindly let me know if i need to change or add or update any files so as
to match your configs.

Regards
Gururaja


-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Friday, March 07, 2008 5:26 AM
To: Gururaja Hebbar K R
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Add SDL_mixer to buildroot/package

>>>>> "Hebbar" == Hebbar  <gururajakr@sanyo.co.in> writes:

Hi,

 Hebbar> Below is a patch to add sdl_mixer package to buildroot. I
Hebbar> have tested it for arm926ejs toolchain with buildroot 4th feb
Hebbar> Snapshot.

 Hebbar> Kindly add it to buildroot trunk.

I've committed a cleaned up version - Thanks!

--
Bye, Peter Korsgaard
