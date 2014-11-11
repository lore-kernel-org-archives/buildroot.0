From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 23:49:19 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20141111073014.AA83D101626@stock.ovh.net>
References: <20141111073014.AA83D101626@stock.ovh.net>
Message-ID: <20141111234919.3178e9d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yann, Gustavo, Bernd, Nathaniel, Maxime, Samuel, Peter, please read on,
there is some stuff for you below :-)

On Tue, 11 Nov 2014 08:30:14 +0100 (CET), Thomas Petazzoni wrote:
> Build statistics for 2014-11-10
> ===============================
> 
>         success : 197
>        failures : 49 
>        timeouts : 4  
>           TOTAL : 250

So a 20% failure rate. Not too bad, but we definitely need to improve
this.

>         i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6ce1ecdf2bf1f14f1497e9960a1b6689568a3658/
>      powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a990b0deb0269e91bcd7fb008eb40a2e00350114/

This is the same problem twice: uClibc behaving badly when vfork() is
used in static linking configurations. This is now fixed for the
internal toolchain backend. The first build failure is with an external
Crosstool-NG toolchain using uClibc. Yann, what would be your
recommendation here? Is it something you intend to fix upstream in
Crosstool-NG? Or should I add an exception for this toolchain to not be
used in static linking configurations?

The second toolchain is a Buildroot toolchain, so this problem will go
away once I rebuild all the external Buildroot toolchain with the
latest Buildroot version.

>       mipsel |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/045782ef114689c2cb7171b15f63f2770139806a/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=48fe144111652547cf72d2bf3e8e15f36ee40b6d.

>         bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/4d0c3c8b68b37f532378f19041379cb5c5798950/

in_netlink.c:40:29: error: netlink/netlink.h: No such file or directory
in_netlink.c:41:27: error: netlink/cache.h: No such file or directory
in_netlink.c:42:27: error: netlink/utils.h: No such file or directory
in_netlink.c:43:32: error: netlink/route/link.h: No such file or directory
in_netlink.c:44:30: error: netlink/route/tc.h: No such file or directory

Gustavo, maybe?

>         i686 | checking whether /home/peko... | TIM | http://autobuild.buildroot.net/results/a7763e614d960e044d757eaf971c8a2777485f23/

Ignore.

> microblazeel |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/2bed33fe03c8e49e7766f14020beea0d8e205fc1/

  CCLD     clamscan
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompress'
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressInit'
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressEnd'
collect2: error: ld returned 1 exit status

Linking issue against the bzip2 library.

Bernd?

>       x86_64 |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/8a8ddc4c9abda5366a3e76ae98f99b821aa52b09/

checking for zmq_init in -lzmq... no
configure: error: cannot link with -lzmq, install libzmq.
make: *** [/home/test/autobuild/instance-1/output/build/czmq-v3.0.0/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-1/buildroot'

Don't know. Anyone to investigate this one?

>       x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/58a36291201a848a0a11cbb2b200c2b39434046c/
>       x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fe53d0e9ad7c152105cb37a18e4d712bbde3398d/

Linking fluid...
/home/peko/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to `xcb_get_reply_fds'
/home/peko/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to `xcb_send_fd'
collect2: error: ld returned 1 exit status

Bernd, you are our X.org expert. Can you have a look? It might be worth
mentioning that fltk 1.3.3 has been released on November 3rd, so we
could try to upgrade and see if it fixes the problem.


>       x86_64 |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a0ff4949d621caf4cada6ae3f66ed38f569d34b9/

checking for tgetent in -ltinfo... no
checking for termcap functions library... configure: error: No curses/termcap library found

Missing host-ncurses dependency. Nathaniel, since this is happening on
your build server, maybe you could have a look?

>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/be3466bacf99f8796d4cb73440e40f29041d7848/
>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b2140fc00e3de3ac401a49d2920bcf695f6aa184/
>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b6ee496683e91d73fd55111beb0e40fc6fc90be7/
>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6eadc312e621953345e6c25c89625da6e6d54868/

The kernel headers problem. We need to re-add a dependency on kernel
headers >= 3.0 I believe. Gustavo, what do you think?

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/afadd15313ceb5b2dbe3bcef48a9bc8a5108b061/
>          sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/cc599de01d56177a74c5563cc0b9932754a34d55/
>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bd6575362a3ce97e24b65180fddbc3eae4bc10fb/

Gazillions of:

/home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lc_shift'
/home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lc_mask'
/home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lc_mask'
/home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lookup_cache'

For no apparent reason: some configs above are static, but some are
not. Gustavo, you are our libmemcached guy :-)

>         bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/f08787c7965c5594d9560db0aa2adb7b07a65a45/

libshairplay_la-http_parser.o
dnssd.c:74:21: error: dns_sd.h: No such file or directory
dnssd.c:78: error: expected declaration specifiers or '...' before '*' token
dnssd.c:80: error: expected ')' before '*' token
dnssd.c:93: error: expected ')' before 'sdRef'
dnssd.c:96: error: expected ')' before '*' token

Maxime, can you have a look? You are the person who added libshairplay
in the first place.

>        nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/80dd3131cacecd629a72c38c1487d7b4ccb47a60/

checking for libgcrypt... no
configure: error: cannot find OpenSSL or Libgcrypt,
try --with-libssl-prefix=PATH or --with-libgcrypt-prefix=PATH

Related to http://patchwork.ozlabs.org/patch/364983/ maybe?

Someone to look into this?

>        nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/df7da91985a7bf2b05093bae7379ef22362a44fc/

checking for avformat_open_input in -lavformat... no
configure: error: Could not find libavformat - part of ffmpeg
make: *** [/home/buildroot/instance-0/output/build/minidlna-1.1.4/.stamp_configured] Error 1
make: Leaving directory `/home/buildroot/instance-0/buildroot'

Some ffmpeg related problem. Bernd, maybe?

>         bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/df9a68c43eaf26a60865bf07c5913d65f051288c/

Tries to build a shared library in a pure static lib context. Since I
added mpdecimal, I guess this one is on my plate.

>          arm |                 nodejs-0.10.33 | NOK | http://autobuild.buildroot.net/results/e1fb34818ff1167aa008b4011befb9fd14c81293/

Fixed by http://git.buildroot.net/buildroot/commit/?id=e712638b4adc6e18b3ce99ab37b94530e9aa786f.

>         i686 |                 pulseaudio-5.0 | TIM | http://autobuild.buildroot.net/results/74e233383535f4459216c05fc705ee6b67707ac0/

Ignore.

>      powerpc |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/69d23eefe2a23ee130f723c9dfa9a1a875698dc7/

uClibc bug. Vicente has pinged again the uClibc folks. Not sure what we
can do about this...

>         i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9efc2b14a28fd21ed2ce492f41de538673d13dce/
>         i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/0f640d6b701bb854ada2023861a234dfe489f038/
>       x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/c58f7e10a416e0eaf7e49f0bb5ce9e6f85bc1559/
>       x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5979559734620358a92186a6e67aea46b6034b44/

ERROR: fdt disabled but some requested targets require it.
       You can turn off fdt only if you also disable all the system emulation
       targets which need it (by specifying a cut down --target-list).

Yann ?


>         i686 |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/af8f3d3cc018006cee58d57cd9e8c6d8b3de3247/

AttributeError: 'dict_keys' object has no attribute 'sort'
make[3]: *** [generated/udis86_itab.c] Error 1
make[3]: *** Waiting for unfinished jobs....

Smells like a python2 vs. python3 issue. Maybe qt5webkit needs a
dependency on host-python, and use python2 explicitly? Or maybe it can
be fixed to be python3 compatible. Samuel, maybe?

>      powerpc |                      rpm-5.2.0 | TIM | http://autobuild.buildroot.net/results/839b9044e936d992f12dd802b1d7578030e95f2d/

Ignore.

>      powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/caf9899e529495b349df1c4a926749b98b4941cc/
>      powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/50d5c1f7d234c12b00792c0a3a88885c1e3f1525/
>         i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4e6fea56a1ae075ce0a286e20ff891c75762f10d/
>     mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/84d3ec783b6d66e30e6fae9bc5d2a14fe9f2997a/
>       xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6d6ea6ef929ad1d47d9773eb1a62d85a16e54fa5/
>         bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/737c523cf856205a6cfa06da1156a350e8998624/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/a713bc6de2c2cdca01a9d8852395cda7c9368e50/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/811a7bad83b825e621ee86de216024d67f04a46e/
>       x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6988e8d23db8e575b409cbddad0a6e2fdf29ba36/
>         bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9daaf33512d6b7573acb0c0f62c4a0b26396cf64/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/59d80e3d7487dd68b9273af70517adabec65c593/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/db8b78cf6f3e7b940510ee94b58b96ece396a6cf/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6ff11e1a03106025883e86739bf73f99e976f817/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9c2396573db3cf1f40f5445c214d4e611989c4ad/
>       x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/90312a2bacc94dd79d8f5540aca7546061b0eb03/
>          arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2dc638f751ad635690225404878d13fd1748b81a/
>       x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b6e63b198b3b3a181a509d57a21282e77b2b196c/
>      powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1d57af90b482b7bf300483ffb3dbfb1d449aa014/
>         sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/8d406922b5986ba297aed9cca90adf9a1b995f6d/
>      powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/75d45ae59b30ca394c1f409e53af931c27f8120b/

Peter, you really don't want to mark it as broken for now? We can
always revert once the issue gets resolved upstream, if it gets
resolved before the final 2014.11 is out. In the mean time, it's
unnecessarily polluting the build results.

>          arm |                  tn5250-0.17.4 | TIM | http://autobuild.buildroot.net/results/0988b54f84baa927f4ea789148f8d5ead0547d9b/

Ignore.

>          arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6b1123ea69c79bdd73bb85d2c8c3aac153a6f99a/

checking for GLES2/gl2.h... yes
checking whether to use OpenGL ES 2 support... configure: error: Cannot enable OpenGL ES 2 support without EGL
make: *** [/home/peko/autobuild/instance-0/output/build/webkit-1.11.5/.stamp_configured] Error 1
make: Leaving directory `/home/peko/autobuild/instance-0/buildroot'

Bernd, an OpenGL issue for you :)

>         bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/e63e422c77d9bcec8b58405dbf6a236be0d2a31b/

The atomic intrinsics dependency issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
