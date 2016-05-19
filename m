From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 May 2016 01:09:47 +0200
Subject: [Buildroot] [RFC/PATCH next 1/2] spidermonkey185: New package.
In-Reply-To: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <8a47e77d-4c65-ef5f-1ab0-851a332f2be7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/16 17:59, Nicolas Cavallari wrote:
> This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
> It is rather unmaintained, but some software still depend on it.

 Mention couchdb explicitly here.

> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> 
> There are many ugly things in here, I would like your advice/opinion
> on whether this package can be upstreamable.

 Except for the huge patches, it's not _that_ ugly IMHO.

> 
> This commit is based on the 'next' branch.
> 
> 
>  package/Config.in                                  |    1 +
>  .../0001-fix-arm-compiler-flags.patch              |  340 ++
>  .../0002-regenerate-configure.patch                | 5397 ++++++++++++++++++++

 Ouch! Is it really necessary to add this? Usually it's possible to regenerate
the configure script with recent automake by making some small modifications to
the AC_INIT etc. calls.


>  package/spidermonkey185/Config.in                  |   15 +
>  package/spidermonkey185/spidermonkey185.hash       |    2 +
>  package/spidermonkey185/spidermonkey185.mk         |   51 +
>  6 files changed, 5806 insertions(+)
>  create mode 100644 package/spidermonkey185/0001-fix-arm-compiler-flags.patch
>  create mode 100644 package/spidermonkey185/0002-regenerate-configure.patch
>  create mode 100644 package/spidermonkey185/Config.in
>  create mode 100644 package/spidermonkey185/spidermonkey185.hash
>  create mode 100644 package/spidermonkey185/spidermonkey185.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8668612..89caf32 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -762,6 +762,7 @@ menu "External python modules"
>  endmenu
>  endif
>  	source "package/ruby/Config.in"
> +	source "package/spidermonkey185/Config.in"

 It feels a bit weird to put this in scripting languages, but I don't really
know a better place for it.

>  	source "package/tcl/Config.in"
>  if BR2_PACKAGE_TCL
>  menu "Tcl libraries/modules"
> diff --git a/package/spidermonkey185/0001-fix-arm-compiler-flags.patch b/package/spidermonkey185/0001-fix-arm-compiler-flags.patch
> new file mode 100644
> index 0000000..b0e188d
> --- /dev/null
> +++ b/package/spidermonkey185/0001-fix-arm-compiler-flags.patch
> @@ -0,0 +1,340 @@
> +# HG changeset patch
> +# User Mike Hommey <mh+mozilla@glandium.org>
> +# Date 1304348823 -7200
> +# Node ID e38cec9f833829a6137c03f4f1d282aca4063fcd
> +# Parent  6322e8f7cb2dd4e393b7ad18acbc09f1bae69771
> +Bug 626035 - Modify the way arm compiler flags are set in configure
> +[nicolas.cavallari: refresh the patch]

 This needs a better explanation why the patch is needed. Since this is such a
huge patch with unclear purpose, and since we know all the relevant ARM
information at the buildroot level, and since it's not upstreamable anyway
because it's such an old version, I'd prefer to do a minimal patch that just
removes things that can't be worked around, and pass all the relevant info
through CPPFLAGS or environment variables.

> +
> +From: https://bug626035.bmoattachments.org/attachment.cgi?id=529479
> +
[snip] Phew, glad I got rid of that :-)
> diff --git a/package/spidermonkey185/Config.in b/package/spidermonkey185/Config.in
> new file mode 100644
> index 0000000..a5ec455
> --- /dev/null
> +++ b/package/spidermonkey185/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_SPIDERMONKEY185
> +	bool "spidermonkey (1.8.5)"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork in executable tools.

 I believe v8 has much stricter arch requirements, and also atomics/sync
requirements.

> +	help
> +	  SpiderMonkey is Mozilla's JavaScript engine written in C/C++. It is
> +	  used in various Mozilla products, including Firefox.
> +
> +	  This is the old 1.8.5 branch, used in Firefox 4.
> +
> +
> +comment "Spider monkey (1.8.5) need a toolchain with C++, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/spidermonkey185/spidermonkey185.hash b/package/spidermonkey185/spidermonkey185.hash
> new file mode 100644
> index 0000000..bd651d7
> --- /dev/null
> +++ b/package/spidermonkey185/spidermonkey185.hash
> @@ -0,0 +1,2 @@
> +# Locally generated.
> +sha256	5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687	js185-1.0.0.tar.gz
> diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
> new file mode 100644
> index 0000000..2ac541d
> --- /dev/null
> +++ b/package/spidermonkey185/spidermonkey185.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# Spidermonkey (1.8.5)
> +#
> +################################################################################
> +
> +SPIDERMONKEY185_VERSION = 1.0.0
> +SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
> +SPIDERMONKEY185_SOURCE = js185-${SPIDERMONKEY185_VERSION}.tar.gz
> +
> +SPIDERMONKEY185_INSTALL_STAGING = YES
> +SPIDERMONKEY185_INSTALL_TARGET = YES

 This is the default -> remove

> +
> +SPIDERMONKEY185_LICENSE = \
> +	MPL-1.1/GPL-2.0/LGPL-2.1 (Mostly), \
> +	MIT variants (libffi+, v8, mkdepend), \
> +	BSD-2c/BSD-3c (various parts), public domain (some tests)

 We only specify the license of the things actually installed to target (or
host). So not the build utils (mkdepend), not the things that are not installed
(tests). The Mostly can also be removed. The / is not clear, you either use ,
for and, or ' or ' for or. BSD, MIT and public domain can be left out if the
combined work (i.e. the binary) is anyway MPL/GPL - but they have to be included
if it's for separate scripts. For historical reasons, we use MPLv1.1, GPLv2 and
LGPLv2.1. Are all of them without +?

 Are there no license files at all?

> +
> +SPIDERMONKEY185_CONF_ENV = \
> +	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN"

 That doesn't look right: forcing target endianness in the host flags?

> +SPIDERMONKEY185_CONF_OPTS = \
> +		--target=$(GNU_TARGET_NAME) \
> +		--build=$(GNU_TARGET_NAME) \
> +		--host=$(GNU_HOST_NAME)

 This is already passed by the default _CONFIGURE_CMDS.

> +
> +# This dependency does not make sense outside of the mozilla code base.

 How so? Either the libraries depend on libnspr so the dependency has to be
there, or they don't so the dependency should be removed - also within the
mozilla code base.

> +define SPIDERMONKEY185_FIX_PC_NSPR_DEPENDENCY
> +	sed -i -re 's/nspr >= 4.7//' \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/mozjs185.pc

 I think I prefer a patch to .pc.in instead.

> +endef
> +
> +SPIDERMONKEY185_POST_INSTALL_STAGING_HOOKS += \
> +	SPIDERMONKEY185_FIX_PC_NSPR_DEPENDENCY
> +
> +
> +# These symlinks are created absolute with DESTDIR embedded into it.

 Eek...

> +# Make them relative so they work on the target.

 We probably want to do that in staging as well (for the long-term goal of
relocatable HOST_DIR). And perhaps it's easier to do that with a patch than with
a hook - in particular if you manage to get AUTORECONF to work.

> +define SPIDERMONKEY185_FIX_SHLIB_SYMLINK
> +	ln -fs libmozjs185.so.1.0.0 $(TARGET_DIR)/usr/lib/libmozjs185.so
> +	ln -fs libmozjs185.so.1.0.0 $(TARGET_DIR)/usr/lib/libmozjs185.so.1.0
> +endef
> +
> +SPIDERMONKEY185_POST_INSTALL_TARGET_HOOKS += \
> +	SPIDERMONKEY185_FIX_SHLIB_SYMLINK
> +
> +$(eval $(autotools-package))
> +
> +# Hack so configure/make is run inside the js/src subdirectory.
> +SPIDERMONKEY185_SRCDIR = $(SPIDERMONKEY185_DIR)/js/src/

 Just do
SPIDERMONKEY185_SUBDIR = js/src
(not a hack at all).

> +
> +

 Spurious empty lines.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
