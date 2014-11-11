From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Nov 2014 12:48:48 +0100
Subject: [Buildroot] [PATCH v3 2/2] elfutils: bump version to 0.160
In-Reply-To: <1415703637-11831-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1415703637-11831-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415703637-11831-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5461F7A0.2030107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/14 12:00, Vicente Olivert Riera wrote:
> - Bump version to 0.160
> - Add a hash file
> - Adapt patches to the new version
> - Add a new patch to really make -Werror conditional to BUILD_WERROR
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

[snip]

> diff --git a/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch b/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
> new file mode 100644
> index 0000000..59aae5e
> --- /dev/null
> +++ b/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
> @@ -0,0 +1,24 @@
> +Really make -Werror conditional to BUILD_WERROR

 This subject is wrong, since it's not conditional on BUILD_WERROR (and
BUILD_WERROR isn't even defined by the configure script). So it should just be
"Remove -Werror from build" or something similar.

 I've looked for an easy way to make this upstreamable, but it doesn't look trivial.


> +
> +Otherwise it will fail with an error message like this one:
> +
> +elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this
> +function [-Werror=maybe-uninitialized]
> +    arsym[n].as_name = NULL;
> +	 ^
> +cc1: all warnings being treated as errors
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +
> +diff -rup a/config/eu.am b/config/eu.am
> +--- a/config/eu.am	2014-11-10 16:19:14.356031479 +0000
> ++++ b/config/eu.am	2014-11-10 16:21:11.702072011 +0000
> +@@ -35,7 +35,6 @@ LD_AS_NEEDED = @LD_AS_NEEDED@
> + DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
> + AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
> + AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
> +-	    $(if $($(*F)_no_Werror),,-Werror) \
> + 	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
> + 	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
> + 	    $($(*F)_CFLAGS)
> diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
> new file mode 100644
> index 0000000..f0f4598
> --- /dev/null
> +++ b/package/elfutils/elfutils.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
> +sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch

 This one triggers an interesting bug in our download infrastructure. The
elfutils-portability.patch file has the same name as in the previous version,
but it has a different hash (of course). So when building with a pre-populated
download directory, it will fail the first time.

 The ideal solution would be if we would force the version number into all
downloaded files. But since we have the hashes now, a much simpler solution (at
least conceptually, could be tricky to implement) would be to retry the download
once if the hash check has failed. Or alternatively, check the hash before _and_
after the download.


 Regards,
 Arnout

> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 4f00a27..4914b3b 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ELFUTILS_VERSION = 0.155
> +ELFUTILS_VERSION = 0.160
>  ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
>  ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
>  ELFUTILS_LICENSE = GPLv3 GPLv2 LGPLv3
> @@ -13,9 +13,7 @@ ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
>  # The tarball does not have a generated configure script
>  ELFUTILS_AUTORECONF = YES
>  ELFUTILS_CONF_OPTS += --disable-werror
> -ELFUTILS_PATCH = \
> -	elfutils-portability.patch \
> -	elfutils-robustify.patch
> +ELFUTILS_PATCH = elfutils-portability.patch
>  
>  ELFUTILS_INSTALL_STAGING = YES
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
