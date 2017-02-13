From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 16:20:36 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: add support for full image
 socfpga mkpimage support
In-Reply-To: <20170213145716.e7gshandk5sokluc@ed>
References: <20170130103326.14427-2-lionel@svkt.org>
 <20170213135934.32014-1-lionel@svkt.org>
 <20170213135934.32014-2-lionel@svkt.org>
 <20170213152747.13a39b36@free-electrons.com>
 <20170213145716.e7gshandk5sokluc@ed>
Message-ID: <20170213162036.4ab6a939@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 15:57:16 +0100, Lionel Flandrin wrote:

> > Thanks for this new iteration!
> > 
> > On Mon, 13 Feb 2017 14:59:34 +0100, Lionel Flandrin wrote:
> >   
> > >  ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
> > > +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> > > +UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
> > > +UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 0
> > > +else
> > > +UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = u-boot-dtb.bin
> > > +UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 1
> > > +endif  
> > 
> > So when the SPL is used, the header version should always be 0, and
> > when the full U-Boot is used directly, the header version should always
> > be 1 ?
> > 
> > I thought 0 was for older SoCs, and 1 for newer SoCs. Or are we sure
> > that SPL booting will only ever be used on older SoCs, and direct U-Boot
> > booting will only be used on newer SoCs ?  
> 
> Yeah I considered adding an option for selecting the version,
> technically it could go either way but in practice I can't think of a
> situation where you'd want a v1 header with a SPL or vice versa.
> 
> Basically:
> Cyclone V/Arria V ->  64K internal RAM + header v0
> Arria 10          -> 256K internal RAM + header v1
> 
> I believe the main reason for the v1 header is simply to allow file
> sizes greater than 64k.
> 
> Unless you managed to create a full u-boot build smaller than 64K
> you'd never be able to make a v0 image without SPL.
> 
> You could technically create a v1 SPL image (which the current
> Makefile wouldn't allow) but I'm not sure why anybody would want that.
> 
> So I thought adding an option might end up being more confusing than
> helpful even if it results in a bit of "magic" in the makefile.

OK, thanks for the explanation. It makes sense to me. However, I
believe this should be explicitly mentioned in the help text of the
Config.in option.

> On a completely unrelated tangent: I kept the previous naming
> convention for the resulting image, which creates ".crc"
> files. Changing this would break build systems that use the SPL images
> but I thought it was a rather unexpected extension for these files. My
> previous patch used ".mkpimage". Altera uses "-mkpimage.bin".
> 
> That being said it might not be worth breaking people's builds over
> that.

Yeah, just keep the existing .crc extension. The other extension you
propose don't really bring any benefit, and keeping .crc makes sure
things won't break for existing users. As long as the generated file
name is mentioned in the help text of the Config.in option, we're good
IMO.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
