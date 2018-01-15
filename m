From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jan 2018 17:53:37 +0100
Subject: [Buildroot] [PATCH 3/3] armbian-firmware: fail build for
 missing file
In-Reply-To: <1515973281-3997-3-git-send-email-ricardo.martincoski@gmail.com>
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
 <1515973281-3997-3-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180115165337.GA2533@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

I gues you wanted to Cc me on the first patch in the series, related to
linux-firmware, not armbian-firmware, right? ;-)

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
> Cc: Sergey Matyukevich <geomatsi@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> This package copied the install commands from linux-firmware.
> So let's copy the fix and also the commit log.
> ---
>  package/armbian-firmware/armbian-firmware.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
> index 48b0372..77e5185 100644
> --- a/package/armbian-firmware/armbian-firmware.mk
> +++ b/package/armbian-firmware/armbian-firmware.mk
> @@ -23,9 +23,9 @@ endif
>  
>  ifneq ($(ARMBIAN_FIRMWARE_FILES),)
>  define ARMBIAN_FIRMWARE_INSTALL_FILES
> -	cd $(@D) ; \
> -	$(TAR) c $(sort $(ARMBIAN_FIRMWARE_FILES)) | \
> -		$(TAR) x -C $(TARGET_DIR)/lib/firmware
> +	cd $(@D) && \
> +		$(TAR) cf install.tar $(sort $(ARMBIAN_FIRMWARE_FILES)) && \
> +		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
>  endef
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
