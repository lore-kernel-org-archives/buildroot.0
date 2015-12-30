From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:19:27 +0100
Subject: [Buildroot] [PATCH 1/1] ACS CCID PC/SC Driver added.
In-Reply-To: <1451475203-23925-2-git-send-email-juha@codercoded.com>
References: <1451475203-23925-1-git-send-email-juha@codercoded.com>
 <1451475203-23925-2-git-send-email-juha@codercoded.com>
Message-ID: <20151230141927.24a250e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Juha Rantanen,

Thanks for this contribution. See some comments below.

On Wed, 30 Dec 2015 13:33:23 +0200, Juha Rantanen wrote:

> diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
> new file mode 100644
> index 0000000..9635a99
> --- /dev/null
> +++ b/package/acsccid/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_ACSCCID
> +    bool "acsccid"

Indentation should be done with one tab.

> +    depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +    select BR2_PACKAGE_PCSC_LITE
> +    select BR2_PACKAGE_LIBUSB

libusb is not mandatory, you can disable using --disable-libusb.

> +    select BR2_PACKAGE_FLEX
> +    select BR2_PACKAGE_PERL

What makes you think Perl and Flex are needed?

For Flex, I see a .l file in the source, so you quite probably needs
Flex on your build machine (by adding host-flex in <pkg>_DEPENDENCIES),
but I don't see why you would need Flex on the target.

For Perl, I see it being used at build time, but not at configure time.
And since we guarantee that a Perl interpreter is available on the
build machine as hard dependency of Buildroot, you don't need anything.

> +    help
> +      acsccid is a PC/SC driver for Linux/Mac OS X and it supports ACS CCID smart card readers.

Indentation for help text is one tab + two spaces. Also, it should be
wrapped so that the lines do not have more than 72 columns.

Since your package has a dependency on threads, you need to add a
Config.in comment like this:

comment "acsccid needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

See the Buildroot manual for details about this (or the numerous
examples in the Buildroot tree).

> diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
> new file mode 100644
> index 0000000..1325e73
> --- /dev/null
> +++ b/package/acsccid/acsccid.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# acsccid
> +#
> +#############################################################

80 # signs are needed, and an empty new line after this header.

> +ACSCCID_VERSION = 1.1.1
> +ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
> +ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
> +ACSCCID_INSTALL_STAGING = YES
> +ACSCCID_INSTALL_TARGET = YES

Not needed, this is the default.

> +ACSCCID_CONF_OPTS = --enable-shared

Not needed, and potentially wrong. --{enable,disable}-{shared,static}
is automatically passed by the package infrastructure, depending on the
Buildroot configuration in terms of static/shared libraries.

> +ACSCCID_DEPENDENCIES = pcsc-lite libusb flex perl host-pkgconf

As indicated above, I believe the libusb dependency is optional, and
there is no flex and perl dependency, but instead just a host-flex
dependency.

So most likely, something like this:

ACSCCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf

ifeq ($(BR2_PACKAGE_LIBUSB),y)
ACSCCID_DEPENDENCIES += libusb
ACSCCID_CONF_OPTS += --enable-libusb
else
ACSCCID_CONF_OPTS += --disable-libusb
endif

Also, you forgot add the <pkg>_LICENSE and <pkg>_LICENSE_FILES
variables.

Could you rework your patch to take into account those comments, and
send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
