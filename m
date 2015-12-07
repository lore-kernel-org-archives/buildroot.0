From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 11:08:52 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-12-06
In-Reply-To: <20151207110535.GC4258@free.fr>
References: <20151207073022.BE3B6101727@stock.ovh.net>
 <20151207110535.GC4258@free.fr>
Message-ID: <566568C4.2000100@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On 07/12/15 11:05, Yann E. MORIN wrote:
> Thomas, Vicente, All,
> 
> On 2015-12-07 08:30 +0100, Thomas Petazzoni spake thusly:
>> Build statistics for 2015-12-06
>>         mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/11c681f344c90f7faf40ece25909cd14ad21def0/
>>         mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c0f8d11a3ce3b15b5d029934f938e8700ed127cd/
> 
> Those and similar build failures on mip64el, and due to incompatible
> cflags passed to the compiler:
> 
>     /home/ymorin/dev/buildroot/O/host/usr/bin/mips64el-linux-gcc
>     -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>     --sysroot=/home/ymorin/dev/buildroot/O/host/usr/mips64el-buildroot-linux-gnu/sysroot
>     -isysroot /home/ymorin/dev/buildroot/O/host/usr/mips64el-buildroot-linux-gnu/sysroot
>     -D_ISOC99_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>     -D_POSIX_C_SOURCE=200112 -D_XOPEN_SOURCE=600 -DPIC -D_LARGEFILE_SOURCE
>     -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -march=mips64r6
>     -std=c99 -fomit-frame-pointer -fPIC -mips64 -mhard-float
>     -I/home/ymorin/dev/buildroot/O/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include
>     -L/home/ymorin/dev/buildroot/O/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib
>     -c -o /tmpfs/ffconf.sKCSXxBR.o /tmpfs/ffconf.E9anwOiq.c
>     /tmpfs/ffconf.E9anwOiq.c:1:0: error: '-mips64' conflicts with the other
>     architecture options, which specify a mips64r6 processor
>      #include <gnutls/gnutls.h>
>      ^
>     ERROR: gnutls not found using pkg-config
> 
> They have nothing to do with gnutls.
> 
> So, -march=mips64r6 conflicts with -mips64 (equivalent to -march=mips64)
> 
> ffmpeg is using a custom, hand-written ./configure script, and it does
> weird things, like, in the case of mips:
> 
>   3986 elif enabled mips; then
>   3987
>   3988     cpuflags="-march=$cpu"
>   3989
>   3990     case $cpu in
>   [--SNIP--]
>   4078     esac
> 
> ... and (in the case I tested) we pass --cpu=mips64r6.
> 
> But the case-block does not have a case for mips64r6, so it leave
> 'mips64 enabled' (in ffmpeg parlance), and furhter down the line, it
> forcibly passes -mips64:
> 
>   4854     elif enabled mips64 && enabled mipsfpu && disabled loongson2 && disabled loongson3; then
>   4855         add_cflags "-mips64"
>   4856         add_asflags "-mips64"
> 
> Notice that it does have a mips64r6 knowledge, since a little bit
> further, it does check for it:
> 
>   4860     elif enabled mips32r5 || enabled mips64r6; then
>   4861         check_cflags "-mfp64"
>   4862         check_ldflags "-mfp64"
> 
> However, mips64 is never disabled, so mips64r6 never tested.
> 
> Vicente, any help? ;-)

that's going to be fixed "from the root". I have sent patches to ffmpeg
in order to improve the mips architecture handling. Some of them have
been already applied, and the others have received positive reviews, so
I guess is just a matter of time.

After that, we could fix that in Buildroot by either backporting patches
or bumping the version.

Regards,

Vincent.

> Regards,
> Yann E. MORIN.
> 
