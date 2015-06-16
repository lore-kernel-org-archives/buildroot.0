From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Jun 2015 00:29:18 +0200
Subject: [Buildroot] [PATCH v3 1/1] libmusicbrainz: new package
In-Reply-To: <1434351932-24023-1-git-send-email-pieter.degendt@gmail.com>
References: <1434351932-24023-1-git-send-email-pieter.degendt@gmail.com>
Message-ID: <5580A33E.5030300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 09:05, Pieter De Gendt wrote:
> This library is built for both host and target platform as
> required by cmake. This implies that dependencies are also
> built for the host platform (neon).

 This should be split into two patches: the first one adds the host version of
neon (with the commit message mentioning why), the second one adds libmusicbrainz.


> Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> ---
> Changes v2 -> v3:
>   - Corrected host dependencies
> Changes v1 -> v2: (suggested by Thomas Petazzoni)
>   - Added license info
>   - Added comment for clarification
>   
>  package/Config.in                        |  1 +
>  package/libmusicbrainz/Config.in         | 18 ++++++++++++++++++
>  package/libmusicbrainz/libmusicbrainz.mk | 22 ++++++++++++++++++++++
>  package/neon/neon.mk                     |  1 +
>  4 files changed, 42 insertions(+)
>  create mode 100644 package/libmusicbrainz/Config.in
>  create mode 100644 package/libmusicbrainz/libmusicbrainz.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6dbc32d..4f42e94 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -683,6 +683,7 @@ menu "Audio/Sound"
>  	source "package/libmodplug/Config.in"
>  	source "package/libmpd/Config.in"
>  	source "package/libmpdclient/Config.in"
> +	source "package/libmusicbrainz/Config.in"
>  	source "package/libreplaygain/Config.in"
>  	source "package/libsamplerate/Config.in"
>  	source "package/libsidplay2/Config.in"
> diff --git a/package/libmusicbrainz/Config.in b/package/libmusicbrainz/Config.in
> new file mode 100644
> index 0000000..51417fe
> --- /dev/null
> +++ b/package/libmusicbrainz/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBMUSICBRAINZ
> +	bool "libmusicbrainz"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_NEON
> +	select BR2_PACKAGE_NEON_LIBXML2
> +	help
> +	  The MusicBrainz Client Library (libmusicbrainz), 
> +	  also known as mb_client, is a development library 
> +	  geared towards developers who wish to add MusicBrainz 
> +	  lookup capabilities to their applications. The library 
> +	  supports Windows, Linux and Mac OS X, with packages 
> +	  released for the RedHat and Debian distributions.

 Help text should be wrapped at 72 columns. Also a lot of end-of-line spaces.

 The last sentence is not really helpful in the buildroot context.

> +
> +	  http://musicbrainz.org/doc/libmusicbrainz
> +
> +comment "libmusicbrainz needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/libmusicbrainz/libmusicbrainz.mk b/package/libmusicbrainz/libmusicbrainz.mk
> new file mode 100644
> index 0000000..f01a823
> --- /dev/null
> +++ b/package/libmusicbrainz/libmusicbrainz.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libmusicbrainz
> +#
> +################################################################################
> +
> +LIBMUSICBRAINZ_VERSION = release-5.1.0
> +LIBMUSICBRAINZ_SITE = $(call github,metabrainz,libmusicbrainz,$(LIBMUSICBRAINZ_VERSION))

 There's also an uploaded file:

https://github.com/metabrainz/libmusicbrainz/releases/download/release-5.1.0/libmusicbrainz-5.1.0.tar.gz

so _VERSION = 5.1.0 and _SITE =
https://github.com/metabrainz/libmusicbrainz/releases/download/release-$(LIBMUSICBRAINZ_VERSION)

(note: http:// URL redirects to https://)

> +LIBMUSICBRAINZ_LICENSE = LGPLv2.1

 Although the website says LGPL, all the source files have 'or later', so LGPLv2.1+

> +LIBMUSICBRAINZ_LICENSE_FILES = COPYING.txt
> +LIBMUSICBRAINZ_INSTALL_STAGING = YES
> +
> +# Cross compilation requires host compilation due to the
> +# automatic generation of the C interface source files (see INSTALL.txt)
> +HOST_LIBMUSICBRAINZ_DEPENDENCIES = host-libxml2 host-neon host-pkgconf

 It is possible to avoid these dependencies by patching libmusicbrainz, but the
patch becomes pretty complicated so I guess this is OK.

> +LIBMUSICBRAINZ_DEPENDENCIES = libxml2 neon host-pkgconf host-libmusicbrainz
> +
> +# Cross compilation variable for cmake to find the host generated files
> +LIBMUSICBRAINZ_CONF_OPTS = -DIMPORT_EXECUTABLES=$(HOST_LIBMUSICBRAINZ_DIR)/ImportExecutables.cmake
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))

 There's a hash file missing:

# From https://musicbrainz.org/doc/libmusicbrainz
md5	4cc5556aa40ff7ab8f8cb83965535bc3	libmusicbrainz-5.1.0.tar.gz
# Locally calculated
sha256	6749259e89bbb273f3f5ad7acdffb7c47a2cf8fcaeab4c4695484cef5f4c6b46
libmusicbrainz-5.1.0.tar.gz

> diff --git a/package/neon/neon.mk b/package/neon/neon.mk
> index 0cff1a2..284a98c 100644
> --- a/package/neon/neon.mk
> +++ b/package/neon/neon.mk
> @@ -48,3 +48,4 @@ NEON_CONF_OPTS += --disable-webdav
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

 Well, it's not so simple... neon has a lot of optional dependencies, which
depending on the order of the build will be taken from the host directory or
from the system (or skipped if they don't exist on the system). This may lead to
linking with incompatible libraries. In this case, host-neon is not actually
used (it just needs to be present to satisfy cmake), so it doesn't really
matter. However, if another package ever does use host-neon, it could become a
problem.

 Therefore I think it is best to explicitly disable all optional dependencies in
HOST_NEON_CONF_OPTS. And also set HOST_NEON_DEPENDENCIES = host-pkgconfig to
avoid all the redundant dependencies.


 Regards,
 Arnout




-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
