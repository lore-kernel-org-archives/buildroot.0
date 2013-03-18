From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 21:19:44 +0100
Subject: [Buildroot] [PATCHv4] Added package HPLIP for printing to HP
	printers
In-Reply-To: <1363372025-10592-1-git-send-email-olivier.schonken@gmail.com>
 (Olivier Schonken's message of "Fri, 15 Mar 2013 20:27:05 +0200")
References: <1362243769-8714-1-git-send-email-olivier.schonken@gmail.com>
 <1363372025-10592-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <87r4jczcin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "O" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 O> HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed
 O> solution for printing, scanning, and faxing with HP inkjet and laser
 O> based printers in Linux.

 O> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 O> ---
 O> Changelog:
 O> The --includedir=$(STAGING_DIR)/usr/include is unfortunately necessary even
 O> with the modified Makefile.am for a succesful build.

 O> Created a menu for cups related components to be kept close together.

 O> Fixed a jpeg and dbus dependencies, Thanks for pointing out the dbus
 O> dependency Baruch.

 O> Added Licensing information

 O>  package/Config.in                  |    3 ++
 O>  package/hplip/Config.in            |   15 ++++++++
 O>  package/hplip/hplip-fix-make.patch |   74 ++++++++++++++++++++++++++++++++++++
 O>  package/hplip/hplip.mk             |   54 ++++++++++++++++++++++++++
 O>  4 files changed, 146 insertions(+)
 O>  create mode 100644 package/hplip/Config.in
 O>  create mode 100644 package/hplip/hplip-fix-make.patch
 O>  create mode 100644 package/hplip/hplip.mk

 O> diff --git a/package/Config.in b/package/Config.in
 O> index a65054c..21c3ec9 100644
 O> --- a/package/Config.in
 O> +++ b/package/Config.in
 O> @@ -631,7 +631,10 @@ source "package/can-utils/Config.in"
 O>  source "package/connman/Config.in"
 O>  source "package/ctorrent/Config.in"
 O>  source "package/conntrack-tools/Config.in"
 O> +menu "cups (common unix printing system)"
 O>  source "package/cups/Config.in"
 O> +source "package/hplip/Config.in"
 O> +endmenu #cups

With only a single sub package I don't think the menu makes sense (but
keep hplip right after cups).


 O>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 O>  source "package/dhcp/Config.in"
 O>  endif
 O> diff --git a/package/hplip/Config.in b/package/hplip/Config.in
 O> new file mode 100644
 O> index 0000000..4c673e6
 O> --- /dev/null
 O> +++ b/package/hplip/Config.in
 O> @@ -0,0 +1,15 @@
 O> +config BR2_PACKAGE_HPLIP
 O> +	bool "hplip"
 O> +	depends on BR2_PACKAGE_CUPS
 O> +	select BR2_PACKAGE_LIBUSB
 O> +	select BR2_PACKAGE_JPEG

It needs atleast C++ support as well:

checking whether the C++ compiler works... no
configure: error: in `/home/peko/source/buildroot/output/build/hplip-3.12.11':
configure: error: C++ compiler cannot create executables
See `config.log' for more details

Please check with a minimal build to ensure you have all dependencies.


 O> +	help
 O> +	  HP Linux Imaging and Printing (HPLIP)
 O> +	  HPLIP is an HP-developed solution for printing, scanning, and faxing
 O> +	  with HP inkjet and laser based printers in Linux. The HPLIP project 
 O> +	  provides printing support for 2,211 printer models, including 
 O> +	  Deskjet, Officejet, Photosmart, PSC (Print Scan Copy), Business 
 O> +	  Inkjet, LaserJet, Edgeline MFP, and LaserJet MFP. 
 O> +	  
 O> +	  http://hplipopensource.com/
 O> +

You have a number of trailing spaces and an extra empty line at the
bottom here.

 O> diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
 O> new file mode 100644
 O> index 0000000..2d62392
 O> --- /dev/null
 O> +++ b/package/hplip/hplip.mk
 O> @@ -0,0 +1,54 @@
 O> +#############################################################
 O> +#
 O> +# hplip
 O> +#
 O> +#############################################################
 O> +
 O> +HPLIP_VERSION = 3.12.11

Latest version is 3.13.3. Any reason why you are not using that?

 O> +HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip/

That URL doesn't work. It seems like it should be:

http://prdownloads.sourceforge.net/hplip/


 O> +HPLIP_AUTORECONF = YES
 O> +HPLIP_DEPENDENCIES = cups libusb jpeg
 O> +HPLIP_LICENSE = GPLv2 BSD-3c MIT
 O> +HPLIP_LICENSE_FILES = COPYING
 O> +
 O> +HPLIP_CONF_OPT = \
 O> +	--disable-qt4 \
 O> +	--disable-scan-build \
 O> +	--disable-gui-build \
 O> +	--disable-doc-build \
 O> +	--disable-network-build \
 O> +	--enable-hpcups-install \
 O> +	--disable-hpijs-install \
 O> +	--enable-cups-ppd-install \
 O> +	--enable-cups-drv-install \
 O> +	--disable-foomatic-ppd-install \
 O> +	--disable-foomatic-drv-install \
 O> +	--disable-foomatic-rip-hplip-install \
 O> +	--enable-new-hpcups \
 O> +	--enable-lite-build \
 O> +	--with-sysroot=$(STAGING_DIR) \
 O> +	--includedir=$(STAGING_DIR)/usr/include

We do have qt4, sane, polkit and python in buildroot, so optional
support for these would be nice (but isn't essential).

 O> +
 O> +ifeq ($(BR2_PACKAGE_DBUS),y)
 O> +	HPLIP_CONF_OPT += --enable-dbus-build 
 O> +	HPLIP_DEPENDENCIES += dbus
 O> +else
 O> +	HPLIP_CONF_OPT += --disable-dbus-build 
 O> +endif

Again trailing spaces for both.


 O> +
 O> +define HPLIP_POST_INSTALL_TARGET_FIXUP
 O> +	mkdir -p $(TARGET_DIR)/usr/share/hplip/data/models
 O> +	cp $(@D)/data/models/* $(TARGET_DIR)/usr/share/hplip/data/models
 O> +endef
 O> +HPLIP_POST_INSTALL_TARGET_HOOKS += HPLIP_POST_INSTALL_TARGET_FIXUP
 O> +
 O> +define HPLIP_PRE_CONFIGURE_FIXUP
 O> +	touch $(@D)/AUTHORS
 O> +	touch $(@D)/ChangeLog
 O> +	touch $(@D)/CHANGES
 O> +	touch $(@D)/NEWS
 O> +	touch $(@D)/README
 O> +endef
 O> +HPLIP_PRE_CONFIGURE_HOOKS += HPLIP_PRE_CONFIGURE_FIXUP

As far as I can see CHANGES isn't needed. It would be good with a
comment explaining why it is needed (missing from tarball but needed to
autoreconf).

Care to fix these issues and resend?

-- 
Bye, Peter Korsgaard
