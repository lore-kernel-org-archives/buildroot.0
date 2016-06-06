From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:24:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: add optional support
 for mpg123
In-Reply-To: <1465027220-19359-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465027220-19359-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160606232418.2e80ebb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 10:00:20 +0200, Bernd Kuhls wrote:
> mplayer has optional support for mpg123, to get reproducable builds
> add mpg123 as optional dependency.
> 
> Linked libraries without this patch:
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mplayer | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
> 
> Linked libraries after this patch:
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mplayer | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libmpg123.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
> 
> Like with many other optional libraries detection of mpg123 is broken if
> --enable-mpg123 is passed to configure leading to a build error:
> 
> libmpcodecs/ad_mpg123.o: In function `set_format':
> ad_mpg123.c:(.text+0x63): undefined reference to `mpg123_getformat'
> libmpcodecs/ad_mpg123.o: In function `decode_a_bit':
> ad_mpg123.c:(.text+0x1b6): undefined reference to `mpg123_feed'
> ad_mpg123.c:(.text+0x20e): undefined reference to `mpg123_replace_buffer'
> ad_mpg123.c:(.text+0x223): undefined reference to `mpg123_decode_frame_64'
> ad_mpg123.c:(.text+0x275): undefined reference to `mpg123_strerror'
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
