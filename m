From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 16:55:53 +0200
Subject: [Buildroot] [PATCH 5/6 RFC] toolchain/external: use generic
 extract commands (blackfin case)
In-Reply-To: <c1fedf9874fad47ccea6cf67a4913a2010e3a3f4.1441233378.git.yann.morin.1998@free.fr>
References: <cover.1441233378.git.yann.morin.1998@free.fr>
 <c1fedf9874fad47ccea6cf67a4913a2010e3a3f4.1441233378.git.yann.morin.1998@free.fr>
Message-ID: <560FEC79.5090800@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 03/09/2015 00:51, Yann E. MORIN a ?crit :
> The backfin toolchains come in two archives.
> 
> We extract the first (main) archive using the generic extract commands,
> while the second is extracted as a post-extract hook.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  toolchain/toolchain-external/toolchain-external.mk | 33 ++++++++++++----------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index b14e0a1..6bc2fdc 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -253,6 +253,16 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>  	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
>  endef
>  
> +# Special handling for Blackfin toolchain, because of the split in two
> +# tarballs, and the organization of tarball contents. The tarballs
> +# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
> +# which themselves contain the toolchain. This is why we strip more
> +# components than usual.
> +define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
> +	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
> +		$(TAR) --strip-components=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
> +endef
> +
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
>  TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> @@ -340,14 +350,20 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386
>  TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
> +TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386
>  TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
> +TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
>  TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
> +TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
> @@ -408,21 +424,8 @@ TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
>  TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
>  
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
> -# Special handling for Blackfin toolchain, because of the split in two
> -# tarballs, and the organization of tarball contents. The tarballs
> -# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
> -# which themselves contain the toolchain. This is why we strip more
> -# components than usual.
> -define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
> -	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
> -	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
> -		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> -	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
> -		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> -endef
> -else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
> -# Normal handling of toolchain tarball extraction.
> +# Normal handling of downloaded toolchain tarball extraction.
> +ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
>  TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
>  define TOOLCHAIN_EXTERNAL_MOVE
>  	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
> 
