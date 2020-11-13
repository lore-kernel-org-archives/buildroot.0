From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2020 23:21:19 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/linux-backports: bump
 version to 5.8
In-Reply-To: <20201113130941.67928-2-ju.o@free.fr>
References: <20201113130941.67928-1-ju.o@free.fr>
 <20201113130941.67928-2-ju.o@free.fr>
Message-ID: <20201113222119.GH771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

Peter, Thomas, Arnout: question for you below, please read-on.

On 2020-11-13 14:09 +0100, Julien Olivain spake thusly:
> Attempting to compile this package with newer Kernel version (e.g. v5.4)
> fails with message:
> 
>    Generating local configuration database from kernel ...Kernel version parse failed!
> 
> Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
> rather old and beat the very purpose of having newer drivers in older
> kernels.
> 
> Since backports tag v4.14-rc4-1, the requirement on minimal kernel
> version changed from 3.0 to 3.10. See commit [1]. The minimal kernel
> version check is changed accordingly.
> 
> License files are also updated: the linux backports package copies the
> license files from the kernel version used for its generation. v5.8 is now
> "GPL-2.0 WITH Linux-syscall-note".

So, this got me wondering...

[--SNIP--]
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> index 1827ee18b7..1e054c7969 100644
> --- a/package/linux-backports/linux-backports.mk
> +++ b/package/linux-backports/linux-backports.mk
> @@ -4,12 +4,15 @@
>  #
>  ################################################################################
>  
> -LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
> +LINUX_BACKPORTS_VERSION_MAJOR = 5.8
>  LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
>  LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
>  LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
> -LINUX_BACKPORTS_LICENSE = GPL-2.0
> -LINUX_BACKPORTS_LICENSE_FILES = COPYING
> +LINUX_BACKPORTS_LICENSE = GPL-2.0 WITH Linux-syscall-note

In linux.mk, we have "GPL-2.0" without the extra clause "WITH
Linux-syscall-note". There is no such SPDX identifier (contrary to the
claims in COPYING).

I wonder what we should use, but one thing is sure: we want to use the
same for linux and linux-backports.

> +LINUX_BACKPORTS_LICENSE_FILES = \
> +	COPYING \
> +	LICENSES/exceptions/Linux-syscall-note \
> +	LICENSES/preferred/GPL-2.0

This list is the same as we have in linux.mk.

However:

 1. COPYING also states:

    In addition, other licenses may also apply. Please see:
        Documentation/process/license-rules.rst

 2. ... and indeed, there are a few additional licenses throughout the
    tree, which texts are also available:

    LICENSES/deprecated/GPL-1.0
    LICENSES/deprecated/ISC
    LICENSES/deprecated/Linux-OpenIB
    LICENSES/deprecated/X11
    LICENSES/dual/Apache-2.0
    LICENSES/dual/CDDL-1.0
    LICENSES/dual/MPL-1.1
    LICENSES/exceptions/GCC-exception-2.0
    LICENSES/exceptions/Linux-syscall-note
    LICENSES/preferred/BSD-2-Clause
    LICENSES/preferred/BSD-3-Clause
    LICENSES/preferred/BSD-3-Clause-Clear
    LICENSES/preferred/GPL-2.0
    LICENSES/preferred/LGPL-2.0
    LICENSES/preferred/LGPL-2.1
    LICENSES/preferred/MIT

In linux, it is very probably that most, if not all of those licenses,
do apply. I think it would make sense to be exhaustive in this case.

linux-backports has the same set of licenses, and I think it should
carry it as well (for consistency with linux).

Peter, Thomas, Arnout: thoughts?

(Julien: do not resend for now, let's wait a bit for more feedback)

Regards,
Yann E. MORIN.

>  # flex and bison are needed to generate kconfig parser. We use the
>  # same logic as the linux kernel (we add host dependencies only if
> @@ -91,7 +94,7 @@ $(eval $(kconfig-package))
>  # instead.
>  #
>  # Furthermore, we want to check the kernel version, since linux-backports
> -# only supports kernels >= 3.0. To avoid overriding linux-backports'
> +# only supports kernels >= 3.10. To avoid overriding linux-backports'
>  # KCONFIG_STAMP_DOTCONFIG rule defined in the kconfig-package infra, we
>  # use an intermediate stamp-file.
>  #
> @@ -103,10 +106,12 @@ $(LINUX_BACKPORTS_DIR)/$(LINUX_BACKPORTS_KCONFIG_STAMP_DOTCONFIG): $(LINUX_BACKP
>  
>  .SECONDEXPANSION:
>  $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/$$(LINUX_KCONFIG_STAMP_DOTCONFIG)
> -	$(Q)LINUX_VERSION_PROBED=$(LINUX_VERSION_PROBED); \
> -	if [ $${LINUX_VERSION_PROBED%%.*} -lt 3 ]; then \
> -		printf "Linux version '%s' is too old for linux-backports (needs 3.0 or later)\n" \
> -			"$${LINUX_VERSION_PROBED}"; \
> +	$(Q)KVER=$(LINUX_VERSION_PROBED); \
> +	KVER_MAJOR=`echo $${KVER} | sed 's/^\([0-9]*\)\..*/\1/'`; \
> +	KVER_MINOR=`echo $${KVER} | sed 's/^[0-9]*\.\([0-9]*\).*/\1/'`; \
> +	if [ $${KVER_MAJOR} -lt 3 -o \( $${KVER_MAJOR} -eq 3 -a $${KVER_MINOR} -lt 10 \) ]; then \
> +		printf "Linux version '%s' is too old for linux-backports (needs 3.10 or later)\n" \
> +			"$${KVER}"; \
>  		exit 1; \
>  	fi
>  	$(Q)touch $(@)
> -- 
> 2.28.0
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
