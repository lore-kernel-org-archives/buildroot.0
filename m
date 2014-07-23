From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jul 2014 00:13:50 +0200
Subject: [Buildroot] [PATCH] toolchain: include C libraries in legal-info
In-Reply-To: <1406153080-29619-1-git-send-email-yann.morin.1998@free.fr>
References: <1406153080-29619-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140723221350.GD17249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-07-24 00:04 +0200, Yann E. MORIN spake thusly:
> So far, the legal-info infrastructure was not exporting the legal
> info for the C libraries. This is because the legal-info only acts
> on packages defined in $(TARGETS).
> 
> But the C libraries are never added to $(TARGETS), since there is no
> corresponding BR2_PACKAGE_<C-LIBRARY>.
> 
> This patch adds such symbols for the 4 C libraries we support in our
> internal backend: uClibc, glibc, eglibc and musl.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Tested by building the toolchain of the defconfig, which is
> uClibc-based. Tests not replicated to other C libraries.
> ---
>  Makefile                 |  4 ++++
>  package/glibc/Config.in  | 10 ++++++++++
>  package/musl/Config.in   |  4 ++++
>  package/uclibc/Config.in |  5 +++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/musl/Config.in
> 
> diff --git a/Makefile b/Makefile
> index 1af51de..17a11f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -419,6 +419,10 @@ dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
>  
> +.PHONY: DEBUG-ME
> +DEBUG-ME:
> +	@echo $(TARGETS)
> +

As Thomas astutely noticed, this should probably not be here... :-)

I will respin later, waiting for more reviews...

Regards,
Yann E. MORIN.

>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  
>  world: target-post-image
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index c2d6231..df1e273 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -1,5 +1,10 @@
>  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>  
> +# For legal-info
> +config BR2_PACKAGE_EGLIBC
> +	bool
> +	default y
> +
>  choice
>  	prompt "eglibc version"
>  	default BR2_EGLIBC_VERSION_2_18
> @@ -18,6 +23,11 @@ endif
>  
>  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
> +# For legal-info
> +config BR2_PACKAGE_GLIBC
> +	bool
> +	default y
> +
>  choice
>  	prompt "glibc version"
>  	default BR2_GLIBC_VERSION_2_18
> diff --git a/package/musl/Config.in b/package/musl/Config.in
> new file mode 100644
> index 0000000..f5c1b57
> --- /dev/null
> +++ b/package/musl/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_MUSL
> +	bool
> +	depends on BR2_TOOLCHAIN_USES_MUSL
> +	default y
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 0838b6c..851ad1e 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -1,5 +1,10 @@
>  if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  
> +# For legal-info
> +config BR2_PACKAGE_UCLIBC
> +	bool
> +	default y
> +
>  comment "uClibc Options"
>  
>  choice
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
