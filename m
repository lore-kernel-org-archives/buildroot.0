From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 13:31:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: new
 package
In-Reply-To: <673011296db7589d8efb4461a37594d9c993a13b.camel@wiedemann-group.com>
 (Michel Alex's message of "Tue, 4 Feb 2020 09:52:02 +0000")
References: <8b51f7b227fd3cef7bc968a0c4f0eebd018d6655.camel@wiedemann-group.com>
 <87h8073fdt.fsf@dell.be.48ers.dk>
 <4106e322c7a21137383f4aa10f70f7aa0c8abc65.camel@wiedemann-group.com>
 <874kw6ofdw.fsf@dell.be.48ers.dk>
 <673011296db7589d8efb4461a37594d9c993a13b.camel@wiedemann-group.com>
Message-ID: <87ftfqmt3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel Alex <Alex.Michel@wiedemann-group.com> writes:

Hi,

 > Peter,
 > I'm sorry for that, I must use evolution email client. Please use the
 > attached file.

Thanks.

 > From 1367aeb2b1d91473be1e35ccb9660300f8bb2dc2 Mon Sep 17 00:00:00 2001
 > From: Alex Michel <alex.michel@wiedemann-group.com>
 > Date: Tue, 4 Feb 2020 09:04:38 +0100
 > Subject: [PATCH v2] package/network-manager-openvpn: new package

 > This package provides OpenVPN plugin for network manager

 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
 > ---
 >  .../network-manager-openvpn.hash              |  4 ++++
 >  .../network-manager-openvpn.mk                | 22 +++++++++++++++++++
 >  package/network-manager/Config.in             |  8 +++++++
 >  3 files changed, 34 insertions(+)
 >  create mode 100644 package/network-manager-openvpn/network-manager-openvpn.hash
 >  create mode 100644 package/network-manager-openvpn/network-manager-openvpn.mk

 > diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
 > new file mode 100644
 > index 0000000000..0c52fb8d13
 > --- /dev/null
 > +++ b/package/network-manager-openvpn/network-manager-openvpn.hash
 > @@ -0,0 +1,4 @@
 > +# From https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.10.sha256sum
 > +sha256 af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef  NetworkManager-openvpn-1.8.10.tar.xz
 > +# Locally computed
 > +sha256 c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
 > diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
 > new file mode 100644
 > index 0000000000..522cd2413e
 > --- /dev/null
 > +++ b/package/network-manager-openvpn/network-manager-openvpn.mk
 > @@ -0,0 +1,22 @@
 > +################################################################################
 > +#
 > +# network-manager-openvpn
 > +#
 > +################################################################################
 > +
 > +NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.8
 > +NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).10
 > +NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 > +NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
 > +NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
 > +NETWORK_MANAGER_OPENVPN_LICENSE = GPL-2.0+
 > +NETWORK_MANAGER_OPENVPN_LICENSE_FILES = COPYING
 > +
 > +NETWORK_MANAGER_OPENVPN_CONF_OPTS = \
 > +	--without-gnome
 > +
 > +define NETWORK_MANAGER_OPENVPN_USERS
 > +      nm-openvpn -1 nm-openvpn -1 * - - - Openvpn user

./utils/check-package warned about the indentation of this
line. Consider running check-package on future patches before
submitting.


 > +endef
 > +
 > +$(eval $(autotools-package))
 > diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
 > index e6a3f5f04f..a1df4e0431 100644
 > --- a/package/network-manager/Config.in
 > +++ b/package/network-manager/Config.in
 > @@ -61,6 +61,14 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 >  	help
 >  	  This option enables support for OpenVSwitch
 
 > +config BR2_PACKAGE_NETWORK_MANAGER_OPENVPN
 > +	bool "OpenVPN support"
 > +	depends on BR2_PACKAGE_OPENVPN
 > +	help
 > +	  This option enables support for OpenVPN
 > +
 > +	  https://gitlab.gnome.org/GNOME/NetworkManager-openvpn
 > +

This was actually not what I meant. I have moved this into
package/network-manager-openvpn/Config.in and adjusted the text a bit.

You forgot to add an entry to our DEVELOPERS file, so I did that and
committed, thanks.

-- 
Bye, Peter Korsgaard
