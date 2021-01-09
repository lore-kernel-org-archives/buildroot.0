From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jan 2021 22:58:39 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: CodeSourcery AArch64 2014.11
 does not contain libatomic
In-Reply-To: <20210109123337.1512700-1-bernd.kuhls@t-online.de>
References: <20210109123337.1512700-1-bernd.kuhls@t-online.de>
Message-ID: <20210109225814.2fa774ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Jan 2021 13:33:37 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes build error
> 
> output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-amd-linux-gnu/4.9.1/../../../../aarch64-amd-linux-gnu/bin/ld:
>  cannot find -latomic
> 
> using this defconfig
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64=y
> BR2_PACKAGE_OPENSSL=y
> 
> libopenssl is only used here as an example: all packages adding -latomic
> if BR2_TOOLCHAIN_HAS_LIBATOMIC=y are broken, like dav1d, ffmpeg, gnutls,
> kodi and vlc.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This toolchain was build with --disable-libatomic:

$ ./bin/aarch64-amd-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=./bin/aarch64-amd-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/home/thomas/projets/outputs/sourcery/host/opt/ext-toolchain/bin/../libexec/gcc/aarch64-amd-linux-gnu/4.9.1/lto-wrapper
Target: aarch64-amd-linux-gnu
Configured with: /scratch/meadori/aarch64-amd-linux-gnu-lite/src/gcc-4.9-2014.11/configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu --target=aarch64-amd-linux-gnu [...]--disable-libitm --disable-libatomic --disable-libssp [...]

So in fact our assumption that having gcc 4.8 implies that libatomic is
available is incorrect... as it depends on the toolchain configuration.

So I see two options here:

 (1) What you propose, which will just fix the problem for this
     particular toolchain, but not any other toolchain potentially built
     without libatomic.

 (2) Really detect the availability of libatomic, just like we do for
     other toolchain features.

I would have normally preferred (2), but here I believe the vast
majority of modern toolchains will have libatomic included, so it
bothers me a bit to introduce more complexity for a situation that is
uncommon today, and is going to become more and more uncommon.

What do others think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
