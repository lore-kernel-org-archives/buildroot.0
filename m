From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2015 18:40:58 +0200
Subject: [Buildroot] [PATCH] Add support for MIPS Codescape MTI GNU
 Linux toolchain
In-Reply-To: <1437668379-29461-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1437668379-29461-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150723164058.GA3530@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-07-23 18:19 +0200, Vicente Olivert Riera spake thusly:
> - Add support for MIPS Codescape MTI GNU Linux toolchain
> - Add a hash value
> - Add logic to 'toolchain/helpers.mk' to allow the SYSROOT_DIR and
>   ARCH_SYSROOT_DIR sit side by side instead of nested.
> - Add logic for creating the side-by-side symlink as a post install
>   hook.
> - Add logic to allow Buildroot finding the toolchain binaries under
>   $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/helpers.mk                               |  5 ++-
>  toolchain/toolchain-external/Config.in             | 50 ++++++++++++++++++++++
>  .../toolchain-external/toolchain-external.hash     |  4 ++
>  toolchain/toolchain-external/toolchain-external.mk | 20 +++++++++
>  4 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 895f3f1..42e1332 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -144,7 +144,10 @@ copy_toolchain_sysroot = \
>  				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>  		fi ; \
>  	done ; \
> -	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
> +	SYSROOT_DIR_CANON=`readlink -f $${SYSROOT_DIR}` ; \
> +	ARCH_SYSROOT_DIR_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
> +	if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} \
> +		-a $${ARCH_SYSROOT_DIR_CANON:0:$${\#SYSROOT_DIR_CANON}} == $${SYSROOT_DIR_CANON} ] ; then \

Aha, nice little trick! ;-)

I believe this would warrant a bit more explanations. I know this piece
of code is not currently well commented, but that'd be nice if you could
explain what's going here, especially since this code is generic and
thus applies to all toolchains.

[--SNIP--]
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 3980c62..7c79396 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -55,6 +55,10 @@ sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-lin
>  sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
>  
> +# Codescape toolchains from Imagination Technologies
> +# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-03/
> +md5 26b2d006766022e617d6eaeed163f894  Codescape.GNU.Tools.Package.2015.06-03.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz

Usually, when upstream only has md5, we add a locally computed stronger
hash; sha256 is a good choice.

And since you *are* the upstream, maybe you could replace your md5s with
at least sha1 or even sha256?

> +
>  # Synopsys DesignWare ARC toolchains
>  sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
>  sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 5ce4d33..5b50a1c 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -145,9 +145,13 @@ else
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>  TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
>  else
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)

"else ifeq" on the same line, so you do not need to add another endif...

> +TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin
> +else
>  TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
>  endif
>  endif
> +endif

... here.

>  TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
>  TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc
> @@ -253,6 +257,18 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>  	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
>  endef
>  
> +# The Codescape toolchain uses a sysroot layout that places them
> +# side-by-side instead of nested like multilibs. A symlink is needed
> +# much like for the nested sysroots which are handled in
> +# copy_toolchain_sysroot but there is not enough information in there
> +# to determine whether the sysroot layout was nested or side-by-side.
> +# Add the symlink here for now.
> +define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
> +	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
> +	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
> +	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
> +endef
> +
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
>  TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> @@ -284,6 +300,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
> +TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-03
> +TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-03.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz

You also provide an x86 (not 64) toolchain, so please use that one (and
select BR2_HOSTARCH_NEEDS_IA32_LIBS). There still are a lot of users
stuck on 32-bit systems out there in the wild... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
