From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 10:14:24 +0100
Subject: [Buildroot] [PATCH 1/2] pru-software-support: bump version to
 5.1.0
In-Reply-To: <20170224224408.8647-1-camden.mannett@protonmail.ch>
References: <20170224224408.8647-1-camden.mannett@protonmail.ch>
Message-ID: <20170225091424.GA3627@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, Arnout, All,

On 2017-02-24 22:44 +0000, Cam Mannett spake thusly:
> Signed-off-by: Cam Mannett <camden.mannett@protonmail.ch>
> ---
>  package/pru-software-support/pru-software-support.hash |  2 +-
>  package/pru-software-support/pru-software-support.mk   | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index 8f624da..08ca8d2 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,2 +1,2 @@
>  # Locally-calculated hash
> -sha256	b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
> +sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	v5.1.0
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index 06983c2..2b29efe 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,13 +4,24 @@
>  #
>  ################################################################################
>  
> -PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
> -PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
> +PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
> +PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_VERSION)
> +PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball

Please don't do that. This will generate an archive named just 'v5.1.0'
without the name of the package. This is highly inconvenient.

Please do as Arnout suggested (note the trailing '?' in the site):

    PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
    PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?

This will guarantee that the local file is correctly named to
pru-software-support-v5.1.0.tar.gz

Also, it seems that gitorious is generating reproducible archives, so
please do provide a hash. You can check if it is reproducible, the sha1
I got here was:
    f23e64c9adf0739a7dc73a31e5d7bb798c9e5dd0  pru-software-support-v5.1.0.tar.gz

Regards,
Yann E. MORIN.

>  PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPLv2, Public Domain
> -PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v4.0-Manifest.html
> +PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
>  PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
>  HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
>  
> +PRU_SOFTWARE_SUPPORT_EXTRACT_CMD = tar -C $(@D) --strip-components=1 -xzf $(DL_DIR)/$(PRU_SOFTWARE_SUPPORT_SOURCE)
> +
> +define PRU_SOFTWARE_SUPPORT_EXTRACT_CMDS
> +	$(PRU_SOFTWARE_SUPPORT_EXTRACT_CMD)
> +endef
> +
> +define HOST_PRU_SOFTWARE_SUPPORT_EXTRACT_CMDS
> +	$(PRU_SOFTWARE_SUPPORT_EXTRACT_CMD)
> +endef
> +
>  define HOST_PRU_SOFTWARE_SUPPORT_BUILD_CMDS
>  	$(MAKE) PRU_CGT=$(TI_CGT_PRU_INSTALLDIR) -C $(@D)/lib/src
>  endef
> -- 
> 2.9.3
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
