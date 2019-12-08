From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:59:11 +0100
Subject: [Buildroot] [PATCH 4/7] sysrepo: Optional support for C++
 bindings
In-Reply-To: <658112fad0f8e93c64403732be0ee1fd5ad99341.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <658112fad0f8e93c64403732be0ee1fd5ad99341.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191208225911.3d781d15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 10:37:14 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/sysrepo/Config.in  | 6 ++++++
>  package/sysrepo/sysrepo.mk | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
> index df7f0fd68e..81571ff9b3 100644
> --- a/package/sysrepo/Config.in
> +++ b/package/sysrepo/Config.in
> @@ -25,6 +25,12 @@ config BR2_PACKAGE_SYSREPO_EXAMPLES
>  	help
>  	  Enable sysrepo examples.
>  
> +config BR2_PACKAGE_SYSREPO_CPP
> +	bool "Enable sysrepo C++ bindings"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	help
> +	  Build the C++ wrapper around sysrepo.
> +
>  endif
>  
>  comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index 216e517526..113ed7a929 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -61,5 +61,12 @@ HOST_SYSREPO_CONF_OPTS = \
>  	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
>  	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
>  
> +ifdef BR2_PACKAGE_SYSREPO_CPP

ifeq ($(BR2_PACKAGE_SYSREPO_CPP),y)

> +	SYSREPO_DEPENDENCIES += host-swig
> +	HOST_SYSREPO_DEPENDENCIES += host-swig
> +	SYSREPO_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF
> +	HOST_SYSREPO_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF

This has the same problem as your patch on libyang C++ bindings:
BR2_PACKAGE_SYSREPO_CPP is an option that affects the target package,
so it should not have an effect on the host package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
