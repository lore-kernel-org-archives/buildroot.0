From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 09:38:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-23
In-Reply-To: <20140224073008.3ECD8100F60@stock.ovh.net>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
Message-ID: <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Peter: a few of these problems have patches in the queue. Could you
apply these?]

On Mon, Feb 24, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-02-23
> ===============================
>
>         success : 98
>        failures : 14
>        timeouts : 0
>           TOTAL : 112
>

90% success rate, woohoo! :-)

> Classification of failures by reason
> ====================================
>
>                alsa-lib-1.0.26 | 4
      i686 |                alsa-lib-1.0.26 | NOK |
http://autobuild.buildroot.net/results/52aefcd1ff1d2ed2b648468794fe5beac7605789/
   powerpc |                alsa-lib-1.0.26 | NOK |
http://autobuild.buildroot.net/results/a3804fe08e2868933dfe019eb0cd618fe0fb4df3/
    x86_64 |                alsa-lib-1.0.26 | NOK |
http://autobuild.buildroot.net/results/2bda5ff80a2e8ed3efd341e3a95f491d18444006/
       sh4 |                alsa-lib-1.0.26 | NOK |
http://autobuild.buildroot.net/results/4191a9724338e60ce83f919d83c5e23864a88a0e/

I verified and these are not caused by my recent alsa-lib patches.
Problem is:

make[2]: Entering directory
`/home/tdescham/repo/contrib/buildroot-alsa/output/build/alsa-lib-1.0.26/aserver'
  CC       aserver.o
  CCLD     aserver
aserver.o: In function `pcm_shm_cmd':
aserver.c:(.text+0x193a): warning:
aserver.o: In function `main':
aserver.c:(.text.startup+0x37f): warning: gethostbyname is
obsolescent, use getnameinfo() instead.
/home/tdescham/repo/contrib/buildroot-alsa/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(vfork.os):
In function `__GI_vfork':
(.text+0x0): multiple definition of `__vfork'
/home/tdescham/repo/contrib/buildroot-alsa/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(pt-vfork.os):__vfork:(.text+0x0):
first defined here
collect2: ld returned 1 exit status
make[2]: *** [aserver] Error 1

Is this a new problem or has it been seen before?


>                 libnftnl-1.0.0 | 1
   powerpc |                 libnftnl-1.0.0 | NOK |
http://autobuild.buildroot.net/results/59dfd2d0308e32ac98e2f5facf62964cd39c6761/

make[3]: Entering directory `/home/test/test/2/output/build/libnftnl-1.0.0/src'
  CC     utils.lo
  CC     common.lo
  CC     table.lo
  CC     chain.lo
In file included from common.c:10:0:
/home/test/test/2/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/include/linux/netlink.h:31:2:
error: expected specifier-qualifier-list before 'sa_family_t'
make[3]: *** [common.lo] Error 1


>                 libsecret-0.15 | 1
     avr32 |                 libsecret-0.15 | NOK |
http://autobuild.buildroot.net/results/2d41f97378f06d0f3922e078ec0d02549690d4c1/

make[4]: Entering directory
`/home/test/test/3/output/build/libsecret-0.15/egg/tests'
  CC       test-hex.o
  CC       test-secmem.o
  CC       test-hkdf.o
  CC       test-dh.o
  CCLD     test-hex
test-hkdf.c: In function 'test_hkdf_test_case_7':
test-hkdf.c:329: internal compiler error: in
compute_frame_pointer_to_fb_displacement, at dwarf2out.c:10602
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.atmel.com/avr32/> for instructions.
make[4]: *** [test-hkdf.o] Error 1
make[4]: *** Waiting for unfinished jobs....
/home/test/test/3/output/build/libglib2-2.38.2/glib/.libs/libglib-2.0.so:
warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libgcrypt.so:
warning: input is not relaxable
make[4]: Leaving directory
`/home/test/test/3/output/build/libsecret-0.15/egg/tests'

Patch available: http://patchwork.ozlabs.org/patch/323392/


>               strongswan-5.0.4 | 1
       arm |               strongswan-5.0.4 | NOK |
http://autobuild.buildroot.net/results/e2394705545dad8e33ffc558df518014c15f5271/

Strongswan needs threads:

libtool: compile:  /home/test/test/1/output/host/usr/bin/arm-linux-gcc
-DHAVE_CONFIG_H -I. -I../.. -I../../src/libstrongswan
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DIPSEC_DIR=\"/usr/libexec/ipsec\" -DIPSEC_LIB_DIR=\"/usr/lib/ipsec\"
-DPLUGINDIR=\"/usr/lib/ipsec/plugins\"
-DSTRONGSWAN_CONF=\"/etc/strongswan.conf\" -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -include
/home/test/test/1/output/build/strongswan-5.0.4/config.h -MT
traffic_selector.lo -MD -MP -MF .deps/traffic_selector.Tpo -c
selectors/traffic_selector.c  -fPIC -DPIC -o .libs/traffic_selector.o
libtool: compile:  /home/test/test/1/output/host/usr/bin/arm-linux-gcc
-DHAVE_CONFIG_H -I. -I../.. -I../../src/libstrongswan
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DIPSEC_DIR=\"/usr/libexec/ipsec\" -DIPSEC_LIB_DIR=\"/usr/lib/ipsec\"
-DPLUGINDIR=\"/usr/lib/ipsec/plugins\"
-DSTRONGSWAN_CONF=\"/etc/strongswan.conf\" -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -include
/home/test/test/1/output/build/strongswan-5.0.4/config.h -MT thread.lo
-MD -MP -MF .deps/thread.Tpo -c threading/thread.c  -fPIC -DPIC -o
.libs/thread.o
threading/thread.c:17:21: fatal error: pthread.h: No such file or directory
compilation terminated.
make[6]: *** [thread.lo] Error 1


>                  dropwatch-1.4 | 1
microblaze |                  dropwatch-1.4 | NOK |
http://autobuild.buildroot.net/results/1ea98985ce06dc1b7569ef5abe2fc13090fb5f3a/

/home/test/test/2/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc
-g -o dropwatch main.o lookup.o lookup_bfd.o lookup_kas.o -lbfd
-liberty -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm
/home/test/test/2/output/host/usr/lib/gcc/microblaze-buildroot-linux-gnu/4.9.0/../../../../microblaze-buildroot-linux-gnu/bin/ld:
cannot find -liberty
collect2: error: ld returned 1 exit status
make[2]: *** [dropwatch] Error 1

I've seen a patch for this already...
I assume this is fixed with Arnout's patch:
http://git.buildroot.org/buildroot/commit/?id=70ee9fcdfcf6fc7cb214e454afe55cbffec84621


> tvheadend-c7d0335eb10d02b78... | 1

Too old kernel headers (SYS_TURBO), patch available:
http://patchwork.ozlabs.org/patch/323403/

>                     mpd-0.18.7 | 1
   powerpc |                     mpd-0.18.7 | NOK |
http://autobuild.buildroot.net/results/5c7405511a9138153d1de63347b99e063a3816fd/

/home/test/test/3/output/host/usr/bin/powerpc-e500v2-linux-gnuspe-g++
-DHAVE_CONFIG_H -I.  -DNDEBUG -I./src -pthread -isystem
/home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnuspe/sysroot/usr/include/glib-2.0
-isystem /home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnuspe/sysroot/usr/lib/glib-2.0/include
-isystem /home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnuspe/sysroot/usr/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'
-I/home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnuspe/sysroot/usr/include/yajl
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-std=gnu++0x -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2
-pipe -Os  -fvisibility=hidden -fno-threadsafe-statics
-fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math
-ftree-vectorize -ffunction-sections -fdata-sections -Wall -Wextra
-Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual
-Wwrite-strings -Wsign-compare -MT
src/playlist/libplaylist_plugins_a-SoundCloudPlaylistPlugin.o -MD -MP
-MF src/playlist/.deps/libplaylist_plugins_a-SoundCloudPlaylistPlugin.Tpo
-c -o src/playlist/libplaylist_plugins_a-SoundCloudPlaylistPlugin.o
`test -f 'src/playlist/SoundCloudPlaylistPlugin.cxx' || echo
'./'`src/playlist/SoundCloudPlaylistPlugin.cxx
In file included from ./src/fs/AllocatedPath.hxx:26:0,
                 from src/db/SimpleDatabasePlugin.hxx:24,
                 from src/DatabaseRegistry.cxx:22:
./src/fs/Path.hxx:61:29: error: invalid return type 'Path' of
constexpr function 'static constexpr Path Path::Null()'
./src/fs/Path.hxx:69:47: error: invalid return type 'Path' of
constexpr function 'static constexpr Path
Path::FromFS(Path::const_pointer)'
make[2]: *** [src/DatabaseRegistry.o] Error 1

>                      php-5.5.8 | 1
       sh4 |                      php-5.5.8 | NOK |
http://autobuild.buildroot.net/results/3644fc595370b8c13b17ccb6ab1ea7fe8f66c219/

php needs mmu:

checking for fork... no
configure: error: pcntl: fork() not supported by this platform
make: *** [/home/test/test/1/output/build/php-5.5.8/.stamp_configured] Error 1


>          qt5connectivity-5.2.0 | 1
   powerpc |          qt5connectivity-5.2.0 | NOK |
http://autobuild.buildroot.net/results/c54dc99425fb2eee5cfed4af6e72b4f7b07cb32d/

cd scanner/ && ( test -e Makefile ||
/home/test/test/2/output/host/usr/bin/qmake
/home/test/test/2/output/build/qt5connectivity-5.2.0/examples/bluetooth/scanner/scanner.pro
-o Makefile ) && /usr/bin/make -f Makefile
Project ERROR: Unknown module(s) in QT: quick


>               wireshark-1.10.5 | 1
    xtensa |               wireshark-1.10.5 | NOK |
http://autobuild.buildroot.net/results/3bbba270745d96a08ff6eb98f9f3d39ca3a3ea9e/

{standard input}:119517: Error: operand 1 of 'j' has out of range
value '4294825646'
{standard input}:119521: Error: operand 1 of 'j' has out of range
value '4294828543'
{standard input}:119525: Error: operand 1 of 'j' has out of range
value '4294829836'
{standard input}:119529: Error: operand 1 of 'j' has out of range
value '4294830953'
{standard input}:119533: Error: operand 1 of 'j' has out of range
value '4294832702'
{standard input}:119537: Error: operand 1 of 'j' has out of range
value '4294834399'
{standard input}:119541: Error: operand 1 of 'j' has out of range
value '4294835783'


>                  cairo-1.12.10 | 1
       arm |                  cairo-1.12.10 | NOK |
http://autobuild.buildroot.net/results/35e2435769ce4b1fc7480f03d26beaf9abbd5986/

  CC     cairo-gl-device.lo
In file included from cairo-gl-composite.c:48:0:
cairo-gl-private.h:255:8: error: unknown type name 'GLchar'
        const GLchar** string, const GLint* length);
        ^
cairo-gl-private.h:259:22: error: unknown type name 'GLchar'
     GLsizei *length, GLchar *infoLog);
                      ^
cairo-gl-private.h:270:23: error: unknown type name 'GLchar'
      GLsizei *length, GLchar *infoLog);
                       ^
cairo-gl-private.h:273:5: error: unknown type name 'GLchar'
     GLint (*GetUniformLocation) (GLuint program, const GLchar* name);
     ^
cairo-gl-private.h:287:5: error: unknown type name 'GLchar'
     const GLchar *name);
     ^
make[4]: *** [cairo-gl-composite.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from cairo-gl-device.c:46:0:
cairo-gl-private.h:255:8: error: unknown type name 'GLchar'
        const GLchar** string, const GLint* length);
        ^
cairo-gl-private.h:259:22: error: unknown type name 'GLchar'
     GLsizei *length, GLchar *infoLog);
                      ^
cairo-gl-private.h:270:23: error: unknown type name 'GLchar'
      GLsizei *length, GLchar *infoLog);
                       ^
cairo-gl-private.h:273:5: error: unknown type name 'GLchar'
     GLint (*GetUniformLocation) (GLuint program, const GLchar* name);
     ^
cairo-gl-private.h:287:5: error: unknown type name 'GLchar'
     const GLchar *name);
     ^
make[4]: *** [cairo-gl-device.lo] Error 1
make[4]: Leaving directory `/home/test/test/1/output/build/cairo-1.12.10/src'


Best regards,
Thomas
