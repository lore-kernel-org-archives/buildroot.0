From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 2 Feb 2016 11:57:21 +0100
Subject: [Buildroot] [PATCH v2] toolchain: add a harmless link when
 sysroot detection is not accurate
In-Reply-To: <1453475155-49586-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453475155-49586-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <56B08B91.5080704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping

Currently Codescape MIPS toolchains are broken for big-endian. This 
patch fixes the problem.

On 22/01/16 16:05, Vicente Olivert Riera wrote:
> Sometimes is not possible to detect if the sysroots are nested or side
> by side. For instance this happens for MIPS big endian, where the
> sysroot and the arch-sysroot directories are the same. Examples:
>
> === Mentor Sourcery CodeBench toolchain
>
> $ readlink -f $(LANG=C mips-linux-gnu-gcc -print-file-name=libc.a) | sed
> -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::'
> /toolchains/mips-2015.11/mips-linux-gnu/libc/
>
> $ readlink -f $(LANG=C mips-linux-gnu-gcc -EB -print-file-name=libc.a) |
> sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::'
> /toolchains/mips-2015.11/mips-linux-gnu/libc/
>
> === Codescape toolchain
>
> $ readlink -f $(LANG=C mips-img-linux-gnu-gcc -print-file-name=libc.a) |
> sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::'
> /toolchains/mips-img-linux-gnu/2015.06-05/sysroot/mips-r6-hard/
>
> $ readlink -f $(LANG=C mips-img-linux-gnu-gcc -EB
> -print-file-name=libc.a) | sed -r -e
> 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::'
> /toolchains/mips-img-linux-gnu/2015.06-05/sysroot/mips-r6-hard/
>
> For those cases where the sysroot detection is not accurate we add a
> harmless symlink necessary for certain toolchains such as Codescape for
> MIPS. The other toolchains in this situation (unknown sysroot layout)
> don't need this symlink to work, but as stated before, this symlink is
> harmless.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Update the comment above the copy_toolchain_sysroot function.
>   - Explain in the commit log which toolchains are affected and provide
>     some outputs of -print-file-name to explain the problem.
>     (Both changes requested by Thomas Petazzoni)
>
>   toolchain/helpers.mk | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 70695ee..c8245f7 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -130,6 +130,12 @@ copy_toolchain_lib_root = \
>   #
>   # * Create a symbolic link
>   #
> +# If we are in the situation where we don't know if the sysroot layout
> +# is nested of side by side, we:
> +#
> +# * Create a symbolic link because it's harmless and is necessary for
> +#   certain toolchains like Codescape for MIPS.
> +#
>   # Finally, some toolchains (i.e Linaro binary toolchains) store
>   # support libraries (libstdc++, libgcc_s) outside of the sysroot, so
>   # we simply copy all the libraries from the "support lib directory"
> @@ -160,9 +166,12 @@ copy_toolchain_sysroot = \
>   	done ; \
>   	SYSROOT_DIR_CANON=`readlink -f $${SYSROOT_DIR}` ; \
>   	ARCH_SYSROOT_DIR_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
> +	echo "SYSROOT_DIR_CANON: $${ARCH_SYSROOT_DIR_CANON}" ; \
> +	echo "ARCH_SYSROOT_DIR_CANON: $${ARCH_SYSROOT_DIR_CANON}" ; \
>   	if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} ] ; then \
>   		relpath="./" ; \
>   		if [ $${ARCH_SYSROOT_DIR_CANON:0:$${\#SYSROOT_DIR_CANON}} == $${SYSROOT_DIR_CANON} ] ; then \
> +			echo "Nested sysroots detected." ; \
>   			if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
>   				cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
>   			fi ; \
> @@ -174,9 +183,16 @@ copy_toolchain_sysroot = \
>   			ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
>   			echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
>   		elif [ `dirname $${ARCH_SYSROOT_DIR_CANON}` == `dirname $${SYSROOT_DIR_CANON}` ] ; then \
> +			echo "Side by side sysroots detected." ; \
>   			ln -snf $${relpath} $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` ; \
>   			echo "Symlinking $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` -> $${relpath}" ; \
>   		fi ; \
> +	else \
> +		relpath="./" ; \
> +		echo "Unable to detect if sysroots are nested or side by side." ; \
> +		echo "Creating a harmless symlink necessary for certain toolchains." ; \
> +		ln -snf $${relpath} $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` ; \
> +		echo "Symlinking $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` -> $${relpath}" ; \
>   	fi ; \
>   	if test -n "$${SUPPORT_LIB_DIR}" ; then \
>   		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
>
