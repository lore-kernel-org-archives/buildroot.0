From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:08:49 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
In-Reply-To: <794007695.ejsOJfsjEF@diego>
References: <20200425000629.2068191-1-heiko@sntech.de>
 <20200427174108.6f7f8e86@windsurf.home>
 <bd6aea3f-408b-a1b2-5d54-89da4db5f4ae@mind.be>
 <794007695.ejsOJfsjEF@diego>
Message-ID: <20200427210849.436f0a53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 20:19:45 +0200
Heiko Stuebner <heiko.stuebner@theobroma-systems.com> wrote:

> Am Montag, 27. April 2020, 18:59:51 CEST schrieb Arnout Vandecappelle:
> > On 27/04/2020 17:41, Thomas Petazzoni wrote:  
> > > Thanks. Should I nevertheless introduce the PYLIBFDT_PYTHON3 and
> > > PYELFTOOLS_PYTHON3 options, in addition to this ? Or do we for these
> > > new use cases favor using only the CUSTOM_DEPENDENCIES solution ?  
> > 
> >  Given how controversial this new option is, I guess it's better to add the
> > -python3 options.  
> 
> personally I imagined CUSTOM_DEPENDENCIES to _not_ be preferred
> over standard options.

Indeed, they are not necessarily mutually exclusive.

> I.e. things like BR2_TARGET_UBOOT_NEEDS_ATF_BL31 come with their
> own special handling for example for including the bl31 binary into the
> build.

NEEDS_ATF_BL31 indeed does more than adding dependencies. But:

ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
UBOOT_DEPENDENCIES += host-dtc
endif

ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
UBOOT_DEPENDENCIES += host-python host-swig
endif

ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
UBOOT_DEPENDENCIES += host-python-pyelftools
endif

ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
UBOOT_DEPENDENCIES += host-openssl
endif

ifeq ($(BR2_TARGET_UBOOT_NEEDS_LZOP),y)
UBOOT_DEPENDENCIES += host-lzop
endif

is really all about adding dependencies, and we need two more.

But OK, I'll cook a patch to support the Python 3.x situation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
