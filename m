From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Tue, 27 Apr 2021 06:07:22 +0000
Subject: [Buildroot] [PATCH] boot: introduce at91bootstrap4
In-Reply-To: <20210426220343.003df308@windsurf>
References: <20210423070822.1351638-1-eugen.hristev@microchip.com>
 <20210426220343.003df308@windsurf>
Message-ID: <3dba2a91-26d5-12fa-ec05-adc6395f5e59@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/26/21 11:03 PM, Thomas Petazzoni wrote:
> Hello Eugen,
> 
> On Fri, 23 Apr 2021 10:08:22 +0300
> Eugen Hristev via buildroot <buildroot@busybox.net> wrote:
> 
>> Introduce new bootloader package for the next generation
>> of at91bootstrap, at91bootstrap4
>>
>> AT91Bootstrap4 only supports devices: sam9x60, sama5d2, sama5d3,
>> sama5d4, sama7g5.
>>
>> Based on at91bootstrap3 recipes.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Why would we need a new package for this? It still like just a new
> version of at91bootstrap. I just had a look a the differences between
> at91bootstrap3/ and at91bootstrap4/ and here are the only meaningful
> differences:

One big reason for this is the fact that some MPUs are no longer 
supported. We have to keep the 3.x series available for MPUs like 9x5, 
9260, etc, which are not supported in bootstrap4.

Bootstrap4 only supports sama5d2, sama5d3, sama5d4, sam9x60 and sama7g5.
For these variants only, the user could possibly use either 
at91bootstrap3 or at91bootstrap4.
But all the older boards still need bootstrap3.

How would you manage this ?
I thought the easiest way is to have two separate packages, rather than 
trying to obtain two pretty much different versions of bootstrap in the 
same recipe.
And buildroot does not really have the 'machine concept' like yocto 
project does. So you don't really know for which machine you are 
building a package, inside that package's recipe. And probably in 
buildroot you don't even want to know and you don't care.

So, what do you think ?

> 
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3),y)
> +AT91BOOTSTRAP3_DEPENDENCIES += host-python3
> +endif
> 
> -AT91BOOTSTRAP3_LICENSE = Atmel License
> +AT91BOOTSTRAP3_LICENSE = Microchip License
> 
>   (this one perhaps applies to at91bootstrap3 as well, in fact)
> 
>   define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> -       cp $(@D)/binaries/*.bin $(BINARIES_DIR)
> +       cp $(@D)/build/binaries/*.bin $(BINARIES_DIR)
>   endef
> 
> So, shouldn't we instead have a single package covering both? Perhaps
> with a sub-option to select "latest 3.x version" and "latest 4.x
> version" ?

3.x versions series will be phased out. I mean, no longer updated . And 
not in long term, but , very soon.

> 
> I know it would be annoying for this package to be named
> "at91boostrap3". Perhaps we should, for once, do a bit of renaming
> dance and change at91bootstrap to at91bootstrap1 or at91bootstrap-old,
> and keep "at91bootstrap" for the "new" 3.x/4.x version? It is not great
> in terms of backward compatibility for old configs, though.
> 
> (Side note: I find it somewhat annoying that such vendor-provided
> solutions tend to drop support for older platforms... It seems that
> open-source communities do a better job at maintaining long-term
> support for older platforms. What would you say if you had to use a
> decade old Buildroot or Yocto to build a system for an AT91SAM9263
> processor ?)

Well. This happens with everything. Even in open source. Some old 
architectures are being removed. You cannot use kernel 5.12 for 
computers with floppy disks anymore. Such is life... things get 
obsoleted. There are still buildroot and yocto available for older 
processors, just not the latest versions.

Eugen

> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
