From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 23:46:35 +0200
Subject: [Buildroot] Analysis of build results for 2018-05-06
In-Reply-To: <20180507060023.E26CE207B7@mail.bootlin.com>
References: <20180507060023.E26CE207B7@mail.bootlin.com>
Message-ID: <20180507234635.4d21612b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

-rc1 is approaching, it's time to have a look at build failures, and
we're not doing too bad.

Some statistics: on a total of 52 failures, we have:

 - Fixed already merged for libfreeimage (21), lxc (9), udftools (3),
   libupnpp (2), gst1-plugins-ugly (1)

   Total: 36 already fixed

 - Fixes proposed for: zeromq (4), cifs-utils (3), clamav (2), mplayer (1)

   Total: 10 with fixes proposed

 - No fixes proposed but probably easy to fix: host-rauc (2), zip (1)

   Total: 3 easy to fix

 - No fixes, and probably difficult: gst-ffmpeg (1), host-go (1), libnss (1)

   Total: 3 difficult to fix

On Mon,  7 May 2018 08:00:23 +0200 (CEST), Thomas Petazzoni wrote:

>        sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/a5342890f39bdccae1324e7d3dbe0eab1aad28e5 |     
>        sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/616918dc67a91572d62cdf25b8747dc2656dfa2c |     
>        sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/72c0832f6e0cf67bb51b962d669418d77f8ea72c | 

Feels like a binutils bug:

  collect2: fatal error: ld terminated with signal 6 [Aborted], core dumped

I've proposed a work around: disable PIE support in cifs-utils. See
https://patchwork.ozlabs.org/patch/909908/.

>          arc |                 clamav-0.100.0 | NOK | http://autobuild.buildroot.net/results/746d5d870286aec108a3aa25711f9bb6dbe2050b |     
> microblazeel |                 clamav-0.100.0 | NOK | http://autobuild.buildroot.net/results/c43d2ebd8ab30016969d642dbd71c297dc5f6bab |     

clamsubmit.c:6:10: fatal error: curl/curl.h: No such file or directory
 #include <curl/curl.h>

Fixed by https://patchwork.ozlabs.org/patch/909936/.

> microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/02c49c5ddb422e5a58e74c90f426caa55110b106 |     

This package seems to be causing time-outs regularly:
http://autobuild.buildroot.net/?reason=gst-ffmpeg.

Must be another gcc bug on Microblaze, I guess.

>    powerpc64 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/f4609691ec87c42ca5899d3c24a70e11618be487 |     

Fixed by:

8d5667f185d4c0ce2cdaf0800b4f5680256d6a5c gst1-plugins-ugly: fix x264 compile failure

I suppose.

>       x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3636b1ac5756a782fd7578186508aaf9d105e3e9 | ORPH

Anisse Astier is working on this:
https://github.com/golang/go/issues/25177.

Anisse, any news ? Perhaps we could have your patch in Buildroot, while
it gets discussed by Go people upstream ?

>          arc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/11debbc3c4388596a0b0efe42d159bc1b9182b93 |     
>     mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/c2ec7326b277a9487e4e169135a94f859d919542 |     

In file included from src/emmc.c:7:0:
/usr/include/linux/mmc/ioctl.h:10:2: error: unknown type name '__u32'
/usr/include/linux/mmc/ioctl.h:11:2: error: unknown type name '__u32'
/usr/include/linux/mmc/ioctl.h:12:2: error: unknown type name '__u32'
/usr/include/linux/mmc/ioctl.h:38:2: error: unknown type name '__u32'
/usr/include/linux/mmc/ioctl.h:41:2: error: unknown type name '__u64'

Peter: this only happens on your gcc20 autobuilder, could you perhaps
have a look: http://autobuild.buildroot.net/?reason=host-rauc%.

>       mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d77f8d2648ea3e792c745a9eae7a575b44fde82a |     
>         i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/218bbbf36a9d310e3682e02e45a730793274098b |     
>       mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f1d441339f7a4eef6655aea1078bfa5264e626fa |     
>       x86_64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/131f97d2c3525794163e5c7863bb8b8523fb05ba |     
>        nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/5e2b345b7a69bdd329819cd2a7fbd14dfaee8762 |     
>         i586 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a7d21c62f14953dd48ed9339fc29f5b5ecffada7 |     
>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/475579558f6656f7f71e4443471a9343789fd130 |     
>         i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d789bb918d14d573789eff8be7d3462411e22ba1 |     
>       x86_64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/025f51e65591645d2932235c5be1669fd06169ea |     
>       x86_64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b4752ec2e75e0c80cd5dd69a737f6d366fbe54ef |     
>       x86_64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4ddd391c0680109483fa0eedf129e2d0b1a4a848 |     
>        nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/76ef90a05a704e927053e9ad6a806389ff95bd34 |     
>     mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/8820df57529bdd9f4713f3e63f2fd52fa34277c6 |     
>    powerpc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/61189571cb34e2a9b97ca1aa4958f5b84bdb1c7a |     
>     mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1a42a09993516cced77c99f94ba96db5b0255029 |     
>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4788502705d15ba48e631a4ad83b419059be37dc |     
>         m68k |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/81d53bbe369ab36be30e26022a89fc8c69a9bd4e |     
>       mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/37bc0247e898b02788b301226331045ddb0717a9 |     
>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1211e8ecde40a5146e1345d598dafab61e1cbf80 |     
>         i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/92e07da76d7f393dda324df5fb5f13f432a37c44 |     
>         or1k |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a5b565b272b1236f472eaa47b6545169b256a4fb |     

All fixed by:

  d5eeda49583a090d8f8265aed1461d9ae4450ca8 libfreeimage: correct 0005-Manage-powf64-with-glibc.patch line endings

I suspect.

> microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/c973d3a73b5ce75d678e4419c5db2dcf9016aa29 |     

Also causes compiler hangs on Microblaze it seems:

  http://autobuild.buildroot.net/?reason=libnss

Anybody to see whether this issue is fixed with gcc 7.x or gcc 8.x ?

>         m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/001e9fc2bd973444c92563f8f5eddb74c85cd997 |     
>         m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/5152e01d4dbf7ab3f053f44ea2a8eb9765b7e902 |     

Fixed by:

  7987bbe5713baa505b5dc464b718399a79fbcf2f libupnpp: fix build with uclibc

>         m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/6a8ebe8e66004f766175dbc5ac62cd72c24bc872 |     
>          arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/7427f23ceada2884ee03b84c8202edd4f11e415e |     

sleep.cxx:55:56: error: 'clock_nanosleep' was not declared in this scope
     return clock_nanosleep (CLOCK_REALTIME, 0, req, rem);

We have two fixes for this:

 - A version bump of log4cplus provided by Fabrice:
   https://patchwork.ozlabs.org/patch/909269/

 - A uClibc-ng change provided by Waldemar, which Peter has already
   applied:
   https://git.buildroot.org/buildroot/commit/?id=ba33728bc3118a6f1d2b4233e7bddb17b2f67f1f

Fabrice, could you comment on why the version bump of log4cplus fixes
the problem ?

>         m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ac2d3ce7120c9bf811f4205d84fac05eaa414923 |     
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/183ed85d7a0b26aa87c300d8fc5323831a87d483 |     
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2d1372d12ca94ea647d80264cfd40c166e4a3fba |     
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ef823b0b7dc75e18e6a875d18abbdf530397d02d |     
>       x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fc4000c7b348bdc85eab1ce85dcdb9d9dbbbb3cc |     
>          arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/db50d3490f7f4ef23ac2c41ca98e51fa3ad35bdf |     
>     mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/acc28762239d92184b3ff2aff3be801c1a81eb68 |     
>      sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/79a885a12e3f73ff5c20f6e3bdf0cd7908fcb3b4 |     
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1e361ef5c8ee20a9524d6a204c204b3e19bf5641 |     

These issues should all be fixed by:

  52dcec570e056502c4f9e7b4640bca2bd2db8c23 lxc: fix build with static libcap and shared gnutls

>     mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1be1be9d961b01146204cdce7cfa3dbe7e286f53 |     

Bernd proposes to drop mplayer, I guess we should do this before the
release:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=41905

>          arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/b088955699ab9417896b35f67edc37e2dcadf21a |     
>          arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4d34c795f1f377f456cb3aa511726b68ccb89dc1 |     
>          arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/f0f0db00f141d16c42b83eee59cbe18d21c0a6a4 |     

These should be fixed by my series on readline/udftools.

>        sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b149aa2ee00e4d6a53c884cf99ecb2dd8af58b65 |     
>        sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e4b3616ac2695d3b6898185a70da6509b1faa2b8 |     
>        sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6e79326f2dd9b1bbb00cbfd228430b7a6b675214 |     
>        sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/103100d642bbc0ca7b19270791600819d2c64cbc |     

These should be fixed by the patch from Asaf
http://patchwork.ozlabs.org/patch/909911/.

>          arm |                         zip-30 | NOK | http://autobuild.buildroot.net/results/674a9703f86449cdf100629369d7293ad78d6f13 |     

timezone.c: In function 'mktime':
timezone.c:644:18: error: dereferencing pointer to incomplete type 'struct tm'
   save_isdst = tm->tm_isdst;

Smells like a fairly trivial musl build issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
