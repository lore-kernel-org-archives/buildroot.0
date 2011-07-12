From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2011 08:43:23 +0200
Subject: [Buildroot] [PATCH] pcsc-lite and ccid support
In-Reply-To: <1310452089-23322-1-git-send-email-ruckuus@gmail.com>
References: <1310452089-23322-1-git-send-email-ruckuus@gmail.com>
Message-ID: <20110712084323.74ff5c0c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello !

Thanks for those patches. A few comments below.

Le Tue, 12 Jul 2011 13:28:09 +0700,
ruckuus at gmail.com a ?crit :

> --- /dev/null
> +++ b/package/ccid/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_CCID
> +	depends on BR2_PACKAGE_PCSC_LITE

If I understood correctly ccid is a set of programs that depends on
pcsc-lite which is a library ? If this is the case, then you should
turn this into :

	select BR2_PACKAGE_PCSC_LITE

This is because we prefer to have automatic selection of required
dependencies.

> +	bool "ccid"
> +	help
> +		Card reader driver

The help message should be intended with one tab + 2 spaces. The
description could also be a little bit more elaborate (which type of
hardware is supported, etc.). And we typically include the URL of the
project. See other packages for examples.

> +##########################################################
> +#
> +# CCID
> +#
> +# ########################################################
> +CCID_VERSION = 5706
> +CCID_SITE = svn://anonscm.debian.org/pcsclite/trunk/Drivers/ccid

The latest ccid release is 1.4.4, dated May 2011, which doesn't seem to
be that old. In general, we prefer using stable releases rather than
SVN versions when possible. Do you have a good reason for choosing a
specific SVN version instead of the latest project release ?

> +CCID_INSTALL_STAGING = YES
> +CCID_INSTALL_TARGET = YES
> +CCID_AUTORECONF = YES
> +CCID_DEPENDENCIES = pcsc-lite libusb

If you depend on libusb here, then the CCID package should also:

	select BR2_PACKAGE_LIBUSB

> +$(eval $(call AUTOTARGETS, package, ccid))
> diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
> new file mode 100644
> index 0000000..51e32c8
> --- /dev/null
> +++ b/package/pcsc-lite/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PCSC_LITE
> +	select BR2_PACKAGE_CCID

Is it pcsc that depends on ccid, or ccid that depends on pcsc ?
According to your *_DEPENDENCIES variable, it's ccid that depends on
pcsc-lite, so the "select BR2_PACKAGE_CCID" here should go away.

> +	bool "pcsc-lite"
> +	help
> +		Middleware to be used with PC/SC

Same comment as above: indentation is tab + 2 spaces, more elaborate
description, and project URL.

> +##########################################################
> +#
> +# PCSC-Lite
> +#
> +# ########################################################
> +PCSC_LITE_VERSION = 5853
> +PCSC_LITE_SITE = svn://anonscm.debian.org/pcsclite/trunk/PCSC

Same question, SVN version really needed ?

> +PCSC_LITE_INSTALL_STAGING = YES
> +PCSC_LITE_INSTALL_TARGET = YES
> +PCSC_LITE_AUTORECONF = YES
> +PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb
> --enable-embedded +PCSC_LITE_DEPENDENCIES=libusb
> +
> +$(eval $(call AUTOTARGETS, package, pcsc-lite))

Again, thanks for proposing those two packages!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
