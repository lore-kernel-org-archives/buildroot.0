From: John Stile <john@stilen.com>
Date: Wed, 06 Mar 2013 10:01:56 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <20130305194707.474ded42@skate>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate>
Message-ID: <1362592916.20183.152.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2013-03-05 at 19:47 +0100, Thomas Petazzoni wrote:
> Dear John Stile,
> 
> On Tue, 05 Mar 2013 08:21:17 -0800, John Stile wrote:
> 
> > Does this look like a good make file for buildroot?  
> 
> Unfortunately no, it is not a good makefile. It uses a way of writing
> packages that is deprecated since multiple years. Please use the
> generic-package or autotools-package infrastructure. Refer to the
> Buildroot manual at
> http://buildroot.org/downloads/manual/manual.html#adding-packages.
> 
> > Is this the right place to get advice on a make file, or even submit?
> 
> It is a good place.
> 
> > I put this together from various sources/references.
> 
> Could you list which sources/references you've found, so that we can
> kill them, and make those incorrect informations disappear?
> 
> The authoritative source of documentation for Buildroot is the
> Buildroot documentation itself.
> 
> Raah, Google is great... but nowadays people use Google first and find
> some random information, rather than first look at the project's
> documentation. I don't blame you: I do the same in many cases :-)
> 
> Best regards,
> 
> Thomas
If I'm going to rebuild a good package I might as well use the latest
version of dhcpcd, so I'll start with 5.6.7.

I am not sure if
http://roy.marples.name/downloads/dhcpcd/dhcpcd-5.6.7.tar.bz2
uses cmake or automake.  The tarball contains a Makefile, and their
configure script has the comment, "Try and be like autotools configure,
but without autotools", so I assume it is just using gnu make.  It does
contain a Makefile... but I don't see how to use it from:
http://buildroot.org/downloads/manual/manual.html#generic-package-tutorial

So I tried to make a pacakge using 
$(eval $(generic-package))

When I run make in buildroot, the package is not downloaded, or built.
Below is my package file so far.


#############################################################
#
# dhcpcd
#
#############################################################

DHCPCD_VERSION = 5.6.7
DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
DHCPCD_LICENSE = GPLv3+
DHCPCD_LICENSE_FILES = COPYING
DHCPCD_INSTALL_STAGING = YES
DHCPCD_CONFIG_SCRIPTS = configure
DHCPCD_DEPENDENCIES = 
DHCPCD_SITE_METHOD = wget

define DHCPCD_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define DHCPCD_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf
$(STAGING_DIR)/etc/dhcpcd.conf 
	$(INSTALL) -D -m 0755 $(@D)/dhcpcd $(STAGING_DIR)/usr/bin/dhcpcd
endef

define DHCPCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/dhcpcd $(TARGET_DIR)/usr/bin
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/dhcpcd.conf
endef

define DHCPCD_PERMISSIONS
	/usr/bin/dhcpcd  f  4755  0  0  -  -  -  -  -
endef

$(eval $(generic-package))
