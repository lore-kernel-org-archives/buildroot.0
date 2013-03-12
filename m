From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Tue, 12 Mar 2013 20:20:28 +0000
Subject: [Buildroot] [PATCH 3 of 3] oprofile 0.9.8: fix compilation
	on	powerpc
In-Reply-To: <e866a53b0e64b92f119b.1363111856@BEANTN0L019720>
References: <patchbomb.1363111853@BEANTN0L019720>
 <e866a53b0e64b92f119b.1363111856@BEANTN0L019720>
Message-ID: <069B5A25F9844945B625ADE7258AC94C06200429@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patches fixes my build error I got when updating to latest buildroot sources on Friday. Fixing this was going to be my first task this Monday. Thanks!

I will check everything is working on my target later today. One possible minor change below:

> diff --git a/package/oprofile/oprofile.mk
> b/package/oprofile/oprofile.mk
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -8,7 +8,7 @@ OPROFILE_VERSION = 0.9.8
>  OPROFILE_SITE =
> http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-
> $(OPROFILE_VERSION)
>  OPROFILE_LICENSE = GPLv2+
>  OPROFILE_LICENSE_FILES = COPYING
> -OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
> +OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel=$(SYSROOT_DIR)
>  OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
>  OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
>  OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf
> libabi/opimport
> @@ -29,7 +29,19 @@ ifeq ($(OPROFILE_ARCH),)
>  OPROFILE_ARCH = $(BR2_ARCH)
>  endif
>
> -OPROFILE_DEPENDENCIES = popt binutils
> +OPROFILE_DEPENDENCIES = popt binutils libpfm4

I think this dependency is only needed for powerpc. So something like:

OPROFILE_DEPENDENCIES = popt binutils
ifeq ($(BR2_powerpc),y)
OPROFILE_DEPENDENCIES += libpfm4
Endif

Might be better?

> +
> +define OPROFILE_PREVENT_AUTOMAKE
> +     # Prevent automake from running.
> +     (cd $(@D); touch -c config* aclocal.m4 Makefile*);
> +endef
> +
> +define OPROFILE_FIX_CROSS_UNAME
> +     $(SED) 's/`uname -m`/$(OPROFILE_ARCH)/' $(@D)/configure
> +endef
> +
> +OPROFILE_POST_PATCH_HOOKS += OPROFILE_PREVENT_AUTOMAKE
> +OPROFILE_POST_PATCH_HOOKS += OPROFILE_FIX_CROSS_UNAME
>
>  define OPROFILE_INSTALL_TARGET_CMDS
>       $(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
