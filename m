From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 31 Jan 2016 20:57:09 +0100
Subject: [Buildroot] [PATCH v12 2/3] toolchain-external: improve sysroot
 rsync if ARCH_LIB_DIR != lib/lib32/lib64
In-Reply-To: <1453984366-12393-2-git-send-email-patrickdepinguin@gmail.com>
References: <1453984366-12393-1-git-send-email-patrickdepinguin@gmail.com>
 <1453984366-12393-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56AE6715.1000700@gmail.com>
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
> 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
> 		rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
> 			--exclude '/lib/' --exclude '/lib32/' \
> 			--exclude '/lib64/' \
> 			$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
> 	done ; \
> 
> The exclusion logic of lib/lib32/lib64 has originally been added by commit
> 5628776c4a4d29d0715633ea463b64cc19e19c5a with the purpose of only copying
> the relevant usr/lib* directory from the toolchain to staging, instead of
> all. For example, if ARCH_LIB_DIR is 'lib64', then only usr/lib64 would be
> copied and usr/lib and usr/lib32 are ignored. It works by ignoring any
> lib/lib32/lib64 subdirectory on the rsync of 'usr' and then separately
> copying usr/{lib,lib32,lib64} as appropriate. (The exclusion rules only have
> impact on the files beneath the main source directory.)
> 
> However, ARCH_LIB_DIR can take other values than (lib, lib32, lib64), for
> example lib32-fp or lib64-fp (Octeon III toolchain with -march=octeon3). In
> the existing code, the rsync for 'usr' would then already copy these lib
> directories, and the next rsync for 'usr/$${ARCH_LIB_DIR}' does nothing.
> 
> By itself, this is not a very big problem: the staging directory simply has
> some extra directories. However, a subsequent patch will create a staging
> symlink from $${ARCH_LIB_DIR} to lib. The first rsync would then overwrite
> that symlink with the real directory usr/$${ARCH_LIB_DIR} from the
> toolchain, which is not correct.
> 
> Assuming the patch that creates the symlink ARCH_LIB_DIR->lib is applied,
> the original situation after 'make clean toolchain' with an
> ARCH_LIB_DIR=lib32-fp is:
> 
> $ ls -ld output/staging/{,usr/}lib* output/target/{usr/,}lib*
> drwxr-xr-x 2  4096 May 26  2015 output/staging/lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/staging/lib32 -> lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/staging/lib32-fp -> lib
> drwxr-xr-x 2  4096 Jan 20 13:47 output/staging/usr/lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/staging/usr/lib32 -> lib
> drwxr-xr-x 4  4096 May 26  2015 output/staging/usr/lib32-fp
> drwxr-xr-x 4  4096 May 26  2015 output/staging/usr/lib64-fp
> drwxr-xr-x 4  4096 May 26  2015 output/staging/usr/libexec
> drwxr-xr-x 3  4096 May 26  2015 output/staging/usr/libexec32
> drwxr-xr-x 3  4096 May 26  2015 output/staging/usr/libexec32-fp
> drwxr-xr-x 3  4096 May 26  2015 output/staging/usr/libexec64-fp
> drwxr-xr-x 2  4096 Jan 20 13:48 output/target/lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/target/lib32 -> lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/target/lib32-fp -> lib
> drwxr-xr-x 2  4096 Jan 20 13:48 output/target/usr/lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/target/usr/lib32 -> lib
> lrwxrwxrwx 1     3 Jan 20 13:47 output/target/usr/lib32-fp -> lib
> 
> Notice how usr/lib32-fp is not a symlink but a directory, and the presence
> of an unnecessary directory usr/lib64-fp.
> 
> This patch improves the rsync exclusion rules by excluding any lib*
> directory on the first rsync. As this would also exclude any
> libexec/libexec32/... directory, explicitly include them first (first match
> takes precedence). This (as is already the case today) results in more
> usr/libexec* directories than needed, but it is not touched by this patch.
> 
> With the fix applied, the situation becomes:
> 
> drwxr-xr-x 2 4096 May 26  2015 output/staging/lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/staging/lib32 -> lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/staging/lib32-fp -> lib
> drwxr-xr-x 4 4096 May 26  2015 output/staging/usr/lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/staging/usr/lib32 -> lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/staging/usr/lib32-fp -> lib
> drwxr-xr-x 4 4096 May 26  2015 output/staging/usr/libexec
> drwxr-xr-x 3 4096 May 26  2015 output/staging/usr/libexec32
> drwxr-xr-x 3 4096 May 26  2015 output/staging/usr/libexec32-fp
> drwxr-xr-x 3 4096 May 26  2015 output/staging/usr/libexec64-fp
> drwxr-xr-x 2 4096 Jan 20 14:27 output/target/lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/target/lib32 -> lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/target/lib32-fp -> lib
> drwxr-xr-x 2 4096 Jan 20 14:27 output/target/usr/lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/target/usr/lib32 -> lib
> lrwxrwxrwx 1    3 Jan 20 14:27 output/target/usr/lib32-fp -> lib
> 
> For cases where ARCH_LIB_DIR is one of lib, lib32 or lib64 this fix
> makes no difference, and likewise for internal toolchains.
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
>  toolchain/helpers.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 906993d..02cc0bb 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -154,8 +154,7 @@ copy_toolchain_sysroot = \
>  	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>  		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
>  			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
> -				--exclude '/lib/' --exclude '/lib32/' \
> -				--exclude '/lib64/' \
> +				--include '/libexec*/' --exclude '/lib*/' \
>  				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>  		fi ; \
>  	done ; \
> 
