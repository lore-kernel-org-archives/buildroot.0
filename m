From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 08:28:19 +0200
Subject: [Buildroot] [PATCH 1/1] Added shellinabox v2.19
In-Reply-To: <1467687630-10035-1-git-send-email-olivier.singla@gmail.com>
References: <1467687630-10035-1-git-send-email-olivier.singla@gmail.com>
Message-ID: <20160705082819.60e235d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 23:00:30 -0400, Olivier Singla wrote:
> From: Olivier <olivier.singla@gmail.com>
> 
> Shell In A Box implements a web server that can export arbitrary command
> line tools to a web based terminal emulator. This emulator is accessible
> to any JavaScript and CSS enabled web browser and does not require any
> additional browser plugins.
> 
> Signed-off-by: Olivier <olivier.singla@gmail.com>

Thanks for this new version! It's much better now that it is sent with
"git send-email". There are still a few things to fix, but it's clearly
heading into the right direction.

First, the title of the commit should be:

	shellinabox: new package


> diff --git a/package/shellinabox/0001-Makefile.am-fix-static.patch b/package/shellinabox/0001-Makefile.am-fix-static.patch
> new file mode 100644
> index 0000000..e1ad67d
> --- /dev/null
> +++ b/package/shellinabox/0001-Makefile.am-fix-static.patch

The patches added to the packages must have a description +
Signed-off-by.

> @@ -0,0 +1,11 @@
> +--- shellinabox-2.19/Makefile.am.orig	2016-07-03 20:46:42.655784211 -0400
> ++++ shellinabox-2.19/Makefile.am	2016-07-03 20:46:50.582801842 -0400
> +@@ -126,7 +126,7 @@
> + 
> + shellinaboxd_LDADD   = liblogging.la                                          \
> +                        libhttp.la
> +-shellinaboxd_LDFLAGS = -static
> ++shellinaboxd_LDFLAGS =
> + ## Added this for compatibility with older versions of autoconf/automake
> + docdir               = ${datadir}/doc/${PACKAGE}
> + 
> diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
> new file mode 100644
> index 0000000..75cdfd8
> --- /dev/null
> +++ b/package/shellinabox/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SHELLINABOX
> +	bool "shellinabox"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +

Why did you remove the description here? Please re-add it, intended
with one tab + two spaces.

> +	  https://github.com/shellinabox/shellinabox
> diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
> new file mode 100644
> index 0000000..16bf12c
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated after checking pgp signature
> +

Useless blank line. Which PGP signature did you check? I don't think
Github provides PGP signatures for the auto generated tarballs.

> +sha256	d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da  v2.19.tar.gz
> diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
> new file mode 100644
> index 0000000..03adc21
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# shellinabox
> +#
> +################################################################################
> +
> +SHELLINABOX_VERSION = 2.19
> +SHELLINABOX_SOURCE = v$(SHELLINABOX_VERSION).tar.gz
> +SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive

Please use the Github macro:

SHELLINABOX_VERSION = v2.19
SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,$(SHELLINABOX_VERSION))

> +SHELLINABOX_INSTALL_STAGING = YES

Is shellinabox really a library? I don't think it is, so installing to
staging is not needed.

> +SHELLINABOX_LICENSE = GNU GPL v2

We encode the GNU GPL v2 as "GPLv2" in this variable. In addition,
shellinabox uses the OpenSSL exception to allow to be linked against
OpenSSL, so this should be:

SHELLINABOX_LICENSE = GPLv2 with OpenSSL exception

Also, please add:

SHELLINABOX_LICENSE_FILES = COPYING GPL-2

> +#SHELLINABOX_CONF_OPTS = --enable-shared --disable-static

Please remove commented lines.

> +SHELLINABOX_AUTORECONF = YES

Could you add above this line a comment:

# Fetching from Github, and patching Makefile.am, so we need to
# autoreconf

> +
> +SHELLINABOX_DEPENDENCIES = zlib 

This line as a trailing space, not needed.

Also, please add an empty line here.

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +	SHELLINABOX_CONF_OPTS += --enable-ssl

Please don't indent such lines. More importantly, you forgot to add:

SHELLINABOX_DEPENDENCIES += openssl

Without this, you have no guarantee that openssl will be built before
shellinabox.

> +else
> +	SHELLINABOX_CONF_OPTS += --disable-ssl
> +endif
> +SHELLINABOX_CONF_OPTS += --disable-runtime-loading
> +
> +$(eval $(autotools-package))

Could you fix those comments and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
