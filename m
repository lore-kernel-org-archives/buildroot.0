From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Nov 2014 00:21:16 +0100
Subject: [Buildroot] [PATCH v3 2/3] toolchain-helpers: factorise the
 arch sysroot symlink creation
In-Reply-To: <1415919806-13005-3-git-send-email-romain.naour@openwide.fr>
References: <1415919806-13005-1-git-send-email-romain.naour@openwide.fr>
 <1415919806-13005-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141127232116.GP3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-11-14 00:03 +0100, Romain Naour spake thusly:
> The part of copy_toolchain_sysroot function that create the symlink in the
> staging directory will be used in two different place in the following patch.
> So factorize this part in a new function called
> toolchain_create_arch_sysroot_symlink.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> v3: no change
> v2: new	patch
> ---
>  toolchain/helpers.mk | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 3121da4..7d7af5f 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -83,6 +83,20 @@ copy_toolchain_lib_root = \
>  \
>  	echo -n
>  
> +# Calculate the symlink's depth by counting the number of slashs.
> +# Then create the symlink to arch sysroot.
> +# $1: arch specific subdirectory in the sysroot
> +toolchain_create_arch_sysroot_symlink = \
> +	ARCH_SUBDIR="$(strip $1)"; \

I think I have some problems parsing that...

  - $(strip $1) is makefile syntax,
  - $1 is the first argument to the macro,
  - $1 is set to literally $${ARCH_SUBDIR} at the time of the call.

So, you're calling $(strip) which is evaluated by make on a shell
variable, set in the shell to something that is already $(strip)ed.

I think this assignement should just go away.

Unless I'm too tired and I missed something...

> +	mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
> +	relpath="./" ; \
> +	nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
> +	for slash in `seq 1 $${nbslashs}` ; do \
> +		relpath=$${relpath}"../" ; \
> +	done ; \
> +	ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
> +	echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}"
> +
>  #
>  # Copy the full external toolchain sysroot directory to the staging
>  # dir. The operation of this function is rendered a little bit
> @@ -148,14 +162,7 @@ copy_toolchain_sysroot = \
>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
>  			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
>  		fi ; \
> -		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
> -		relpath="./" ; \
> -		nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
> -		for slash in `seq 1 $${nbslashs}` ; do \
> -			relpath=$${relpath}"../" ; \
> -		done ; \
> -		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
> -		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
> +		$(call toolchain_create_arch_sysroot_symlink,$${ARCH_SUBDIR}) ; \

Here you are doing the call with something that is supposed to be
a shell variable.

Care to review this part, and provide an explanation of what I missed?

Regards,
Yann E. MORIN.

>  	fi ; \
>  	if test -n "$${SUPPORT_LIB_DIR}" ; then \
>  		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
> -- 
> 1.9.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
