From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Nov 2014 00:06:28 +0100
Subject: [Buildroot] [PATCH v3 1/3] toolchain-external: Detect empty or
 invalid sysroot
In-Reply-To: <1415919806-13005-2-git-send-email-romain.naour@openwide.fr>
References: <1415919806-13005-1-git-send-email-romain.naour@openwide.fr>
 <1415919806-13005-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141127230628.GO3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-11-14 00:03 +0100, Romain Naour spake thusly:
> With the Sourcery Codebench standard edition, the sysroot returned
> point to a non existant directory if no CFLAGS are specified.

I finally get to review this. Sorry for the long delay... :-(

[--SNIP--]
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> v3: no change
> v2: new patch
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 28 +++++++++++++++-------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index da3718c..109af21 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
[--SNIP--]
> @@ -443,6 +443,18 @@ define toolchain_find_libdir
>  $$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
>  endef
>  
> +# Returns the main sysroot location for the given compiler + flags
> +# First, try to find the sysroot without flags.
> +# If the sysroot path is empty/bogus then use the arch sysroot instead.
> +define toolchain_find_sysroot
> +$$(main_sysroot="$(call toolchain_find_arch_sysroot,$(1))"; \
> +if ! test -d $${main_sysroot}; then \
> +	echo -n $(call toolchain_find_arch_sysroot,$(1), $(2)) ; \
> +else \
> +	echo -n $${main_sysroot}; \
> +fi)

Two comments:
  - we prefer positive logic,
  - we usually do not prepend a space before arguments to make macros.

So:

    if test -d $${main_sysroot}; then \
        echo -n $${main_sysroot}; \
    else
        echo -n $(call toolchain_find_arch_sysroot,$(1),$(2)) ; \
    fi

> +endef
> +
>  # Checks for an already installed toolchain: check the toolchain
>  # location, check that it supports sysroot, and then verify that it
>  # matches the configuration provided in Buildroot: ABI, C++ support,
> @@ -450,13 +462,13 @@ endef
>  define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>  	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
>  	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
> -	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> +	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \

Ditto: no space in front of a macro argument.

>  	if test -z "$${SYSROOT_DIR}" ; then \
>  		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
>  		exit 1 ; \
>  	fi ; \
>  	$(call check_kernel_headers_version,\
> -		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
> +		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS)),\

Ditto: no space in front of a macro argument.

>  		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
>  	if test "$(BR2_arm)" = "y" ; then \
>  		$(call check_arm_abi,\
> @@ -539,12 +551,12 @@ endif
>  #                       to the target filesystem.
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_CORE
> -	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> +	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \

Ditto: no space in front of a macro argument.

>  	if test -z "$${SYSROOT_DIR}" ; then \
>  		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
>  		exit 1 ; \
>  	fi ; \
> -	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	ARCH_SYSROOT_DIR="$(call toolchain_find_arch_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \

Ditto: no space in front of a macro argument.

>  	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>  	SUPPORT_LIB_DIR="" ; \
>  	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
> @@ -590,7 +602,7 @@ ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
>  define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
>  	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
>  	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
> -	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	FDPIC_SYSROOT_DIR="$(call toolchain_find_arch_sysroot,$${FDPIC_EXTERNAL_CC}, $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \

Ditto: no space in front of a macro argument.

Otherwise, looks OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
