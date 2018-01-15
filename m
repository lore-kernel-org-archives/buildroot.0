From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jan 2018 17:57:43 +0100
Subject: [Buildroot] [PATCH 2/3] linux-firmware: fix install for Chelsio
 T[45]
In-Reply-To: <1515973281-3997-2-git-send-email-ricardo.martincoski@gmail.com>
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
 <1515973281-3997-2-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180115165743.GB2533@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-01-14 21:41 -0200, Ricardo Martincoski spake thusly:
> It's broken for the last 3 version bumps, since
> 1c9846ecc9 "linux-firmware: Bump to the latest version"
> 
> Fix it by updating the name of the file to install.
> Do not use * since it would install also old versions that would take
> 1MB extra space in the target.

I would prefer if we were to keep installing the older version, because
presumably older kernel versions (even if they request the unversionned
t4fw.bin) would probably have been working with earlier versions of the
firmware, so I'd prefer we leave to the user the option to redirect the
symlink to the correct version they want to use.

(of course, they'd have to provide a post-build script for that.)

> A comment to remember to update the file name when bumping the package
> is not needed because a previous patch in the series makes the build
> to fail for missing file.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

But still, this change is technically OK, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> I don't have hardware to run-test the firmware itself.
> 
> 2017.11.x and 2017.08.x should use t[45]fw-1.16.45.0.bin instead
> 2017.05.x is OK
> ---
>  package/linux-firmware/linux-firmware.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 03704d8..45483a3 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -337,14 +337,14 @@ LINUX_FIRMWARE_FILES += bnx2x/*
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
> -# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.26.0.bin
> -LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.26.0.bin cxgb4/t4fw.bin
> +# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.63.0.bin
> +LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.63.0.bin cxgb4/t4fw.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
> -# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.26.0.bin
> -LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.26.0.bin cxgb4/t5fw.bin
> +# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.63.0.bin
> +LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.63.0.bin cxgb4/t5fw.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
>  endif
>  
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
