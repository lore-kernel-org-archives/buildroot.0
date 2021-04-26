From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 22:03:43 +0200
Subject: [Buildroot] [PATCH] boot: introduce at91bootstrap4
In-Reply-To: <20210423070822.1351638-1-eugen.hristev@microchip.com>
References: <20210423070822.1351638-1-eugen.hristev@microchip.com>
Message-ID: <20210426220343.003df308@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Fri, 23 Apr 2021 10:08:22 +0300
Eugen Hristev via buildroot <buildroot@busybox.net> wrote:

> Introduce new bootloader package for the next generation
> of at91bootstrap, at91bootstrap4
> 
> AT91Bootstrap4 only supports devices: sam9x60, sama5d2, sama5d3,
> sama5d4, sama7g5.
> 
> Based on at91bootstrap3 recipes.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Why would we need a new package for this? It still like just a new
version of at91bootstrap. I just had a look a the differences between
at91bootstrap3/ and at91bootstrap4/ and here are the only meaningful
differences:

+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3),y)
+AT91BOOTSTRAP3_DEPENDENCIES += host-python3
+endif

-AT91BOOTSTRAP3_LICENSE = Atmel License
+AT91BOOTSTRAP3_LICENSE = Microchip License

 (this one perhaps applies to at91bootstrap3 as well, in fact)

 define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
-	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
+	cp $(@D)/build/binaries/*.bin $(BINARIES_DIR)
 endef

So, shouldn't we instead have a single package covering both? Perhaps
with a sub-option to select "latest 3.x version" and "latest 4.x
version" ?

I know it would be annoying for this package to be named
"at91boostrap3". Perhaps we should, for once, do a bit of renaming
dance and change at91bootstrap to at91bootstrap1 or at91bootstrap-old,
and keep "at91bootstrap" for the "new" 3.x/4.x version? It is not great
in terms of backward compatibility for old configs, though.

(Side note: I find it somewhat annoying that such vendor-provided
solutions tend to drop support for older platforms... It seems that
open-source communities do a better job at maintaining long-term
support for older platforms. What would you say if you had to use a
decade old Buildroot or Yocto to build a system for an AT91SAM9263
processor ?)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
