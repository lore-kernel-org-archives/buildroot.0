From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 21:51:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix -fno-common build
 failure
In-Reply-To: <20200517073338.27034-1-heiko.thiery@gmail.com>
References: <20200517073338.27034-1-heiko.thiery@gmail.com>
Message-ID: <20200517195113.GX12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-05-17 09:33 +0200, Heiko Thiery spake thusly:
> Added upstream patch for fixing build failure when using GCC10 as a host
> compiler (-fno-common is now default)
> 
> Fixes:
> http://autobuild.buildroot.org/results/0fc/0fcb11a40bcff78e8084335114af390d2fac31e1
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I've tested it in a Docker container running FC32, and was able to
reproduce the issue, and this patch fixed it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0003-bitbang-Fix-FTBFS-with-GCC-10.patch  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
> 
> diff --git a/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch b/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
> new file mode 100644
> index 0000000000..cf83515247
> --- /dev/null
> +++ b/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
> @@ -0,0 +1,37 @@
> +From c60252ac2b636c4d99b766a574b9df0966151696 Mon Sep 17 00:00:00 2001
> +From: Andreas Fritiofson <andreas.fritiofson@gmail.com>
> +Date: Fri, 17 Apr 2020 13:49:28 +0200
> +Subject: [PATCH] bitbang: Fix FTBFS with GCC 10
> +
> +GCC 10 defaults to -fno-common which breaks the sharing of bitbang_swd
> +struct between bitbang drivers due to a missing extern.
> +
> +Change-Id: I2b4122f7939cec91a72284006748f99a23548324
> +Signed-off-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
> +Reviewed-on: http://openocd.zylin.com/5592
> +Tested-by: jenkins
> +Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
> +Reviewed-by: Jonathan McDowell <noodles-openocd@earth.li>
> +
> +Patch taken from upstream: https://github.com/ntfreak/openocd/commit/c60252ac2b636c4d99b766a574b9df0966151696
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmailcom>
> +---
> + src/jtag/drivers/bitbang.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/jtag/drivers/bitbang.h b/src/jtag/drivers/bitbang.h
> +index edb779ca..bbbc693d 100644
> +--- a/src/jtag/drivers/bitbang.h
> ++++ b/src/jtag/drivers/bitbang.h
> +@@ -56,7 +56,7 @@ struct bitbang_interface {
> + 	void (*swdio_drive)(bool on);
> + };
> + 
> +-const struct swd_driver bitbang_swd;
> ++extern const struct swd_driver bitbang_swd;
> + 
> + extern bool swd_mode;
> + 
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
