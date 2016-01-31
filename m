From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 31 Jan 2016 20:56:51 +0100
Subject: [Buildroot] [PATCH v12 1/3] toolchain-external: don't exclude
 too much lib in sysroot rsync
In-Reply-To: <1453984366-12393-1-git-send-email-patrickdepinguin@gmail.com>
References: <1453984366-12393-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56AE6703.5030700@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 28/01/2016 13:32, Thomas De Schampheleire a ?crit :
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The copy_toolchain_sysroot helper in toolchain/helpers.mk performs an
> rsync of various directories from the extracted external toolchain to the
> corresponding directory in staging.
> 
> The relevant (simplified) snippet is:
>     for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>             rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
>                     --exclude lib --exclude lib32 --exclude lib64 \
>                     $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>     done ; \
> 
> The exclusion logic of lib/lib32/lib64 has been added by commit
> 5628776c4a4d29d0715633ea463b64cc19e19c5a with the purpose of only copying
> the relevant usr/lib* directory from the toolchain to staging, instead of
> all. For example, if ARCH_LIB_DIR is 'lib64', then only usr/lib64 would be
> copied and usr/lib and usr/lib32 are ignored. It works by ignoring any
> lib/lib32/lib64 subdirectory on the rsync of 'usr' and then separately
> copying usr/{lib,lib32,lib64} as appropriate. (The exclusion rules only have
> impact on the files beneath the main source directory.)
> 
> However, on the rsync of 'usr', ANY of the following directories AND files
> would be excluded:
>     lib/
>     lib
>     lib32/
>     foobar/something/lib/
>     something-else/lib64/
> 
> while it is only the intention to skip directories directly under usr.
> 
> Therefore, add a leading (to restrict the scope to first-level) and trailing
> (to restrict to directories) slash to the exclude pattern. From 'man rsync':
> 
>     - if the pattern starts with a / then it is anchored to [..] the root of
>       the transfer.
>     - if the pattern ends with a / then it will only match a directory, not
>       a regular file, symlink, or device.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
> v12: unchanged
> v11: unchanged
> v10: new patch
> 
>  toolchain/helpers.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 70695ee..906993d 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -154,7 +154,8 @@ copy_toolchain_sysroot = \
>  	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>  		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
>  			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
> -				--exclude lib --exclude lib32 --exclude lib64 \
> +				--exclude '/lib/' --exclude '/lib32/' \
> +				--exclude '/lib64/' \
>  				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>  		fi ; \
>  	done ; \
> 
