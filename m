From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:34:55 +0200
Subject: [Buildroot] [PATCH 04/12] reproducibility/linux: override build
 timestamp
In-Reply-To: <1465918277-30675-4-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-4-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702093455.GD22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> with SOURCE_DATE_EPOCH
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  linux/linux.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index a751da9..2a7310c 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -97,6 +97,14 @@ LINUX_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	BR_BINARIES_DIR=$(BINARIES_DIR)
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +LINUX_MAKE_ENV += \
> +	KBUILD_BUILD_VERSION=1 \

The kernel sets it to 0 (zero) as a fallback when there is no .version
file. Should we also set it to 0, too? Note: I'm fine with 1 as well,
so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	KBUILD_BUILD_USER=buildroot \
> +	KBUILD_BUILD_HOST=buildroot \
> +	KBUILD_BUILD_TIMESTAMP="$(shell TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
> +endif
> +
>  # Get the real Linux version, which tells us where kernel modules are
>  # going to be installed in the target filesystem.
>  LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
> -- 
> 2.8.2
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
