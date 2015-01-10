From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:11:04 +0100
Subject: [Buildroot] [RFC] xorriso: new package
In-Reply-To: <54B08792.4070309@ou.edu>
References: <54B08792.4070309@ou.edu>
Message-ID: <20150110111104.19ed65dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

Thanks for this contribution! See some comments below.

On Fri, 09 Jan 2015 19:59:46 -0600, Steve Kenton wrote:

> I added xorriso to "Target packages > Hardware handling"
> since that is where cdrkit resides

Seems good.

> config BR2_PACKAGE_XORRISO
> 	bool "xorriso"
> 	select BR2_LIBICONV
> 	depends on BR2_USE_WCHAR && BR2_LARGEFILE
> 
> I don't understand why "select BR2_LIBICONV" is needed because I thought
> that libiconv was implied by "depends on BR2_USE_WCHAR && BR2_LARGEFILE"
> but without it the uClibc build ends with the error below

So, you have several possibilities:

 * With glibc, iconv support is always available in the C library,
   since locale support is always built into glibc.

 * With uClibc, iconv support is built into the library if locale
   support is enabled, and iconv support is not available is locale
   support is disabled. In this last case, we can use the separate
   libiconv package.

So, what you should do is:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

in Config.in, and:

<foo>_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)

in the .mk file.

> diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
> --- buildroot.ori/package/Config.in	2015-01-09 15:52:22.000000000 -0600
> +++ buildroot/package/Config.in	2015-01-09 18:59:47.030390893 -0600

Can you use Git instead to create the patch?

> @@ -391,6 +391,7 @@ endif
>  	source "package/usbutils/Config.in"
>  	source "package/w_scan/Config.in"
>  	source "package/wipe/Config.in"
> +	source "package/xorriso/Config.in"
>  endmenu
> 
>  menu "Interpreter languages and scripting"
> diff -pruN buildroot.ori/package/xorriso/Config.in buildroot/package/xorriso/Config.in
> --- buildroot.ori/package/xorriso/Config.in	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/xorriso/Config.in	2015-01-09 19:19:29.758413581 -0600
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_XORRISO
> +	bool "xorriso"
> +	select BR2_LIBICONV

See above on how to improve this.

> +	depends on BR2_USE_WCHAR && BR2_LARGEFILE
> +	help
> +	  xorriso cd/dvd/bd iso 9660 manipulation and disc burner.
> +
> +	  libburnia is a project for reading, mastering and writing
> +	  optical discs. Currently it is comprised of libraries named
> +	  libisofs, libburn, libisoburn, a cdrecord emulator named cdrskin,
> +	  and an integrated multi-session tool named xorriso.
> +	  The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
> +	  It is base of the  GNU xorriso package and is actively maintained.
> +
> +	  The source code for the libburnia project is distributed under
> +	  the terms of the  GNU General Public License version 2 or later
> +	  (GPLv2+). Be aware that linking libisoburn with GPLv3+ library
> +	  libreadline-6 will automatically change the license of the resulting
> +	  libisoburn.so and xorriso binary to GPLv3+.

I don't think this last paragraph is really needed.

> +	
> +	  http://libburnia-project.org/
> +	  http://www.gnu.org/software/xorriso

You must add a comment here about the wchar and largefile dependencies:

comment "xorriso needs a toolchain w/ wchar, largefile"
	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE

see
http://buildroot.org/downloads/manual/manual.html#_literal_config_in_literal_file,
section "17.2.2. Dependencies on target and toolchain options".

> diff -pruN buildroot.ori/package/xorriso/xorriso.mk buildroot/package/xorriso/xorriso.mk
> --- buildroot.ori/package/xorriso/xorriso.mk	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/xorriso/xorriso.mk	2015-01-09 19:03:27.778395128 -0600
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# XORRISO
> +#
> +#############################################################

We have settled on 80 # signs for the comment header. The name of the
package should be in lower case. And there should be an empty new line
between this header and the first variable. Yes, those are silly rules,
but they allow us to have some consistent across Buildroot.

> +XORRISO_VERSION = 1.3.8
> +XORRISO_SOURCE = xorriso-$(XORRISO_VERSION).tar.gz

This line is not needed, since it's the default.

> +XORRISO_SITE = http://www.gnu.org/software/xorriso

Please use $(BR2_GNU_MIRROR). You can grep in the Buildroot source code
to see how it's used.

> +XORRISO_INSTALL_STAGING = NO
> +XORRISO_INSTALL_TARGET = YES

Those two lines are not needed, since it's the default.

> +XORRISO_LICENSE = GPLv3+

Can you also add XORRISO_LICENSE_FILES ?

Other than that, it looks good. Could you take into account those
comments, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
