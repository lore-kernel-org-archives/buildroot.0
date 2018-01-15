From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jan 2018 18:00:18 +0100
Subject: [Buildroot] [PATCH 1/3] linux-firmware: fail build for missing
 file
In-Reply-To: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180115170018.GA11122@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, all,

On 2018-01-14 21:41 -0200, Ricardo Martincoski spake thusly:
> When a file is listed to be installed but is missing from the package
> source currently the first tar command exits with error code but it is
> ignored and the build succeeds.
> This issue by itself is minor because those listed files that are
> present in the package source get installed to the target.
> But the code is currently error prone, e.g. to a typo in the file list.
> 
> Fix this by first creating a tarball in the build directory and then
> installing it, instead of using a pipe between the two tar invocations.
> Also use && between the commands, so the first command that exits with
> error code fails the build.
> Since the two tar invocations remain in use, the desired behavior
> remains the same:
>  - list of files can contain *;
>  - list of files can contain file inside path, and the path is then
>    replicated in the target;
>  - symlinks are not followed but are installed.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Bizarely enough I am in Cc of this patch, but I did not receive it
directly... Anyway...

I was about to do a very similar change, so let's go with yours:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Should it go to 2017.11.x and 2017.08.x too? See next patch
> ---
>  package/linux-firmware/linux-firmware.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index cf79e56..03704d8 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -443,9 +443,9 @@ endif
>  
>  ifneq ($(LINUX_FIRMWARE_FILES),)
>  define LINUX_FIRMWARE_INSTALL_FILES
> -	cd $(@D) ; \
> -	$(TAR) c $(sort $(LINUX_FIRMWARE_FILES)) | \
> -		$(TAR) x -C $(TARGET_DIR)/lib/firmware
> +	cd $(@D) && \
> +		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
> +		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
>  endef
>  endif
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
