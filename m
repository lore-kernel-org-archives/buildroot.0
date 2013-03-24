From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 11:49:16 +0100
Subject: [Buildroot] [PATCH v2] oprofile 0.9.8: fix compilation on
	powerpc
In-Reply-To: <925a76f808cf62f15265.1363892597@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Thu, 21 Mar 2013 20:03:17 +0100")
References: <925a76f808cf62f15265.1363892597@BEANTN0L019720>
Message-ID: <877gkxoyxf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The oprofile build was broken on powerpc since version 0.9.8.
 Thomas> This was detected in several autobuilds, like
 Thomas> http://autobuild.buildroot.net/results/6f6c02d18495907d50fcdfc6003ac20d493c55fe/

 Thomas> Thomas Petazzoni had some fixes pending in his own tree, and this patch is
 Thomas> partially based on this work (credits to him). Here is an overview:
 Thomas> - I took over (and fixed) the oprofile.mk changes, except for the powerpc-
 Thomas>   specific part. For powerpc, there is a new dependency to libpfm4.
 Thomas> - I reimported those Yocto patches that were specific to the ppc build
 Thomas>   issues, but left out the other ones. Those can be added in separate
 Thomas>   commits.

..

 Thomas> +++ b/package/oprofile/Config.in
 Thomas> @@ -2,6 +2,7 @@ config BR2_PACKAGE_OPROFILE
 Thomas>  	bool "oprofile"
 Thomas>  	select BR2_PACKAGE_POPT
 Thomas>  	select BR2_PACKAGE_BINUTILS
 Thomas> +	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 Thomas>  	depends on BR2_INSTALL_LIBSTDCPP
 Thomas>  	depends on !BR2_aarch64 # binutils
 Thomas>  	help
 
 Thomas> -OPROFILE_DEPENDENCIES = popt binutils
 Thomas> +OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
 Thomas> +ifneq ($(BR2_powerpc)$(BR2_PACKAGE_LIBPFM4),) # powerpc OR libpfm4 selected
 Thomas> +OPROFILE_DEPENDENCIES += libpfm4
 Thomas> +endif

BR2_PACKAGE_LIBPFM4 is guaranteed to be enabled on powerpc, so I've
changed it to just be:

ifeq (ifeq ($(BR2_PACKAGE_LIBPFM4),y)
OPROFILE_DEPENDENCIES += libpfm4
endif

Committed with this change, thanks.

-- 
Bye, Peter Korsgaard
