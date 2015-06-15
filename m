From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Mon, 15 Jun 2015 09:20:11 -0500
Subject: [Buildroot] $(SED) not defined if 'make menuconfig
	savedefconfig'
In-Reply-To: <20150615153742.02ebdb85@free-electrons.com>
References: <CAM+bi4tjaJB2bJuQ40_cap55ZrEmOYg4Ssz+TMM_zg5Cb0yo6A@mail.gmail.com>
 <20150615153742.02ebdb85@free-electrons.com>
Message-ID: <20150615142011.GA16458@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Alvaro,

On Mon, Jun 15, 2015 at 03:37:42PM +0200, Thomas Petazzoni wrote:
> Dear Alvaro Gamez,
> 
> On Mon, 15 Jun 2015 12:26:02 +0200, Alvaro Gamez wrote:
> 
> > While using buildroot-submodule (
> > https://github.com/Openwide-Ingenierie/buildroot-submodule) I've noticed
> > this happens since commit f71a621d91ec27f175fc84012962f88b1107305f was
> > introduced into buildroot.
> > 
> > $ make menuconfig savedefconfig
> > [Do whatever, or nothing at all and exit, there's no need to save anything]
> > *** End of the configuration.
> > *** Execute 'make' to start the build or try 'make help'.
> > 
> > make: /BR2_DEFCONFIG=/d: Command not found
> > Makefile:777: recipe for target 'savedefconfig' failed
> > make: *** [savedefconfig] Error 127
> > 
> > However,
> > $ make menuconfig
> > $ make savedefconfig
> > 
> > does not end with that error. I've just tracked it down to the fact that
> > $(SED) is not defined when menuconfig savedefconfig are used in a single
> > make call, whereas it equals to '/bin/sed -i -e'
> > 
> > Simply replacing that @$(SED) by /bin/sed -i -e on line 777 of Makefile
> > makes it work again, but I don't think that solution is desirable. I'm
> > sorry I can't provide a full patch, the motive of this bug is beyond my
> > knowledge.
> 
> Hum, right. Can you try the below patch:
> 
> diff --git a/Makefile b/Makefile
> index d3f80c4..67eb50c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -272,6 +272,7 @@ HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
>  HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
>  HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
>  HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
> +SED := $(shell which sed || type -p sed) -i -e
>  
>  export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
>  export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
> diff --git a/package/Makefile.in b/package/Makefile.in
> index c02d31f..f256b05 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -217,7 +217,6 @@ endif
>  INSTALL := $(shell which install || type -p install)
>  FLEX := $(shell which flex || type -p flex)
>  BISON := $(shell which bison || type -p bison)
> -SED := $(shell which sed || type -p sed) -i -e
>  UNZIP := $(shell which unzip || type -p unzip) -q
>  
>  APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
> 
> 

I reproduced Alvaro's observation and your patch does resolve the
issue.

Tested-by: Doug Kehn <rdkehn@yahoo.com>

Regards,
...doug
