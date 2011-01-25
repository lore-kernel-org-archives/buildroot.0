From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 14:19:02 +0100
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
 toolchain profiles and download
In-Reply-To: <20101215223834.1623496a@surf>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<201012141548.38928.vapier@gentoo.org>
	<20101215113152.2cf64845@surf>
	<201012150614.44014.vapier@gentoo.org>
	<20101215223834.1623496a@surf>
Message-ID: <20110125141902.3a505c6b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

What do you think of the below proposal ?

Regards,

Thomas

On Wed, 15 Dec 2010 22:38:34 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 15 Dec 2010 06:14:43 -0500
> Mike Frysinger <vapier@gentoo.org> wrote:
> 
> > it seems the profiles thing only supports downloading toolchain
> > binaries ?  in the Blackfin setup, the toolchain is usually installed
> > via the host package manager (we offer rpms/debs/etc...), so that
> > still wouldnt work for us ... -mike
> 
> Below a very experimental/hackish way of integrating the Blackfin
> toolchain into the existing logic. I've tested, I can successfully
> build Busybox in both FLAT mode and FDPIC mode, with Buildroot that
> downloads/installs the toolchain automatically.
> 
> The patch is not meant for inclusion yet, there are things I don't like
> in it. It's just to show how I think it could work.
> 
> Thomas
> 
> From 5a317c7fc771a8feebbdef81d83134225baf3591 Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: Wed, 15 Dec 2010 22:32:13 +0100
> Subject: [PATCH] toolchain: add support for Blackfin toolchain
> 
> WARNING: This is not for inclusion, only for demonstration.
> 
> The Blackfin toolchain toolchain is delivered in two parts, one part
> with toolchain binaries, and another with the libraries, normally
> installed into /opt/uClinux/bfin-uclinux and
> /opt/uClinux/bfin-linux-uclibc. For those reasons, we need to extend a
> bit the external toolchain download/extraction strategy to :
> 
>  * Be able to download two tarballs instead of one
> 
>  * Be able to specify a per-toolchain number of directories to be
>    skipped when uncompressing the tarball.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in   |    9 +++++++++
>  toolchain/toolchain-external/ext-tool.mk |   28 ++++++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 8eab6de..126796d 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -101,6 +101,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
>  	    - SH4A, uClibc, little endian
>              - SH4A, uClibc, big endian
>  
> +config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_2010R1
> +        bool "Blackfin toolchain 2010R1"
> +	depends on BR2_bfin
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	help
> +	  Blackfin toolchain
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>         bool "Custom toolchain"
>         help
> @@ -149,6 +156,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	default "sh4-linux-gnu"          if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
> +	default "bfin-linux-uclibc"      if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_2010R1 && BR2_ABI_ELF
> +	default "bfin-uclinux"           if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_2010R1 && BR2_ABI_FLAT
>  	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
>  					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>  
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 6c83ca1..edd7bf5 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -129,6 +129,12 @@ TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-g
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
>  TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_2010R1),y)
> +TOOLCHAIN_EXTERNAL_SITE       = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
> +TOOLCHAIN_EXTERNAL_SOURCE     = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_SITE_BIS   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8386/
> +TOOLCHAIN_EXTERNAL_SOURCE_BIS = blackfin-toolchain-uclibc-full-2010R1-RC4.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 4
>  else
>  # A value must be set (even if unused), otherwise the
>  # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
> @@ -136,13 +142,31 @@ else
>  TOOLCHAIN_EXTERNAL_SOURCE=none
>  endif
>  
> +ifeq ($(TOOLCHAIN_EXTERNAL_SOURCE_BIS),)
> +TOOLCHAIN_EXTERNAL_SOURCE_BIS=none
> +endif
> +
> +ifeq ($(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS),)
> +TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS=1
> +endif
> +
>  # Download and extraction of a toolchain
>  $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
>  	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE),$(TOOLCHAIN_EXTERNAL_SOURCE))
>  
> -$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
> +$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_BIS):
> +	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_BIS),$(TOOLCHAIN_EXTERNAL_SOURCE_BIS))
> +
> +$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: \
> +	$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) \
> +	$(if $(filter none,$(TOOLCHAIN_EXTERNAL_SOURCE_BIS)),,$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_BIS))
>  	mkdir -p $(@D)
> -	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> +	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
> +		$(TAR) $(TAR_STRIP_COMPONENTS)=$(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS) -C $(@D) $(TAR_OPTIONS) -
> +ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE_BIS),none)
> +	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_BIS))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_BIS) | \
> +		$(TAR) $(TAR_STRIP_COMPONENTS)=$(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS) -C $(@D) $(TAR_OPTIONS) -
> +endif
>  	touch $@
>  
>  # Checks for an already installed toolchain: check the toolchain


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110125/963acca7/attachment.asc>
