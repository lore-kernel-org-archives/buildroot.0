From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 8 Feb 2012 14:06:33 +0100
Subject: [Buildroot] problem creating package : download fails !
	(buildroot appends netpbm-10.35.83.gz
In-Reply-To: <CAAXf6LVEp4t1Bba8nCaD7Pezm5trHkroreGfhPa-iMUA7FO47A@mail.gmail.com>
References: <ABF59CC0FD964B918D2A589BD7790307@JohanW7>
 <CAAXf6LVEp4t1Bba8nCaD7Pezm5trHkroreGfhPa-iMUA7FO47A@mail.gmail.com>
Message-ID: <AE4D3E2B6F4C4BD7A04C5850E738E32E@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Its solved : 

i only used NETPBM_SITE=http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/netpbm-10.35.83.tgz

It works with :

NETPBM_SITE=http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83
NETPBM_SOURCE=netpbm-10.35.83.tgz

I use this package because i need it to create a custom linux bootlogo ( i already patched linux/linux.mk and its Config.in)

For now i installed it on my host (apt-get intall netpbm)

But i want to build the netpbm ONLY for the host machine so its build binaries should end up in output/host and i then can call them
from my linux.mk to create a new bootlogo for the kernel. (pngtopnm , ppmquant and  pnmtoplainpnm are part the netpbm package)

The magic is (snip from my linux.mk):
...
define LINUX_CUSTOM_BOOTLOGO
	pngtopnm $(BR2_LINUX_KERNEL_CUSTOM_BOOTLOGO_FILE) | ppmquant -fs 223 | pnmtoplainpnm >
$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
endef

ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_BOOTLOGO),y)
LINUX_POST_CONFIGURE_HOOKS += LINUX_CUSTOM_BOOTLOGO
endif


So far no luck in creating this as a package ...

In my netpbm.mk i have:

#############################################################
#
# netpbm
#
#############################################################
NETPBM_VERSION = 10.35.83
NETPBM_SOURCE = netpbm-$(NETPBM_VERSION).tgz
NETPBM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/netpbm/super_stable/$(NETPBM_VERSION)

NETPBM_INSTALL_TARGET = NO
NETPBM_INSTALL_STAGING = NO
NETPBM_INSTALL_HOST = YES

$(eval $(call AUTOTARGETS))





-----Oorspronkelijk bericht-----
Van: patrickdepinguin at gmail.com [mailto:patrickdepinguin at gmail.com] Namens Thomas De Schampheleire
Verzonden: woensdag 8 februari 2012 13:37
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] problem creating package : download fails ! (buildroot appends netpbm-10.35.83.gz

Johan,

On Wed, Feb 8, 2012 at 1:24 PM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> Hi
>
> I have a problem in creating a package : the download link does not 
> work
>
> The link is
> http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/netpbm-10.35.83.tgz
>
> But buildroot seems to append netpbm-10.35.83.gz
>
> So it tries 
> http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/ne
> tpbm-10.35.83.tgz/netpbm-10.35.83.gz
>
> That fails.
>
> How to resolve this ?

You really need to provide some more information. The above description is way too vague.
Please provide your .mk file.

My guess is that you added the name of the package in the FOO_SITE variable, while you shouldn't.

Best regards,
Thomas
