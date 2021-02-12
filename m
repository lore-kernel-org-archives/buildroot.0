From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Feb 2021 21:39:39 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <20210212184049.13202-3-peter@korsgaard.com>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
Message-ID: <20210212203939.GK1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-12 19:40 +0100, Peter Korsgaard spake thusly:
> With the upcoming addition of the images-install step,
> LINUX_FIRMWARE_INSTALl_FILES is called twice, for installing to the target
> and to the images directory - Which may race with each other and cause
> problems with the temporary install.tar tarball.
> 
> There is no specific reason to use a temporary file, we can just as well
> pipe the two tar invocations together, so do that instead.

Actually, there *is* a reason why an intermediate tarball is used, see
commit 21a283ffb0d (linux-firmware: fail build for missing file).

The idea is that, when we bump the version a firmware file may get
removed, and we may not notice right when updating (because of the 
many sub-options), and that file is still isted.

If that is the case, then the first tar will bail out on that missing
file, and stop right away, thus not including the followign files. But
because it is on the LHS of a pipe, its return code is ignored.

Then the second tar is still happy with what it gets, because it is a
proper tar archive (if the last file in a tarball was extracted
successfully, there is no way to know if the tarball was truncated or
not).

As a consequence, the copy is only partial, and the build does not fail.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/linux-firmware/linux-firmware.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 3420266335..b6549ad371 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -641,8 +641,8 @@ endif
>  ifneq ($(LINUX_FIRMWARE_FILES),)
>  define LINUX_FIRMWARE_INSTALL_FILES
>  	cd $(@D) && \
> -		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
> -		$(TAR) xf install.tar -C $(1)
> +		$(TAR) c $(sort $(LINUX_FIRMWARE_FILES)) | \
> +		$(TAR) x -C $(1)
>  endef
>  endif
>  
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
