From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 24 Aug 2007 15:29:22 +0200
Subject: [Buildroot] libmad-0.15.1b fails on build
References: <f90898420708240326v49be5083g287fbf4ffb961c8b@mail.gmail.com>
Message-ID: <008301c7e653$84c251f0$4b04c63e@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Simon Pasch" <fpasch@googlemail.com>
To: <buildroot@uclibc.org>
Sent: Friday, August 24, 2007 12:26 PM
Subject: [Buildroot] libmad-0.15.1b fails on build


> Libmad fails to build for x86 (likely for other architectures too)
> because of the avr32-optimization-patch.
> 
> If you don't intend to build libmad for avr32, simply removing the patch helps.
> 
> 
> Perhaps it would make sense to make the patch depend on the chosen
> architecture. Don't know how this is solved in other packages. I tried
> it with the folowing patch. (To keep the patch simple I manually
> renamed the file "libmad-0.15.1b-avr32-optimization.patch" to
> "libmad-0.15.1b-avr32-optimization.avr32_patch")
> 
> 
> --- buildroot.old/package/libmad/libmad.mk 2007-08-24 09:15:35.000000000 +0200
> +++ buildroot/package/libmad/libmad.mk 2007-08-24 12:10:43.000000000 +0200
> @@ -16,6 +16,9 @@
> $(LIBMAD_DIR)/.unpacked: $(DL_DIR)/$(LIBMAD_SOURCE)
>  $(LIBMAD_CAT) $(DL_DIR)/$(LIBMAD_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
>  $(CONFIG_UPDATE) $(LIBMAD_DIR)
> +ifeq ($(strip $(BR2_avr32)),y)
> + toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/
> libmad-$(LIBMAD_VERSION)\*.avr32_patch\*
> +endif
>  toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/
> libmad-$(LIBMAD_VERSION)\*.patch\*
>  touch $@
> 
> Didn't have the time...but it seems, that the mplayer-package has some
> avr32-only optimizations too

I think it would be better to generalize and do the following:

toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
as usual, followed by:
toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)




Best Regards
Ulf Samuelsson
