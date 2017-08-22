From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Aug 2017 08:59:26 +0300
Subject: [Buildroot] Include kernel's dtsi from customised dts in
 buiuldroot-external
In-Reply-To: <87h8x0le4p.fsf@gmail.com>
References: <87inhgle9f.fsf@gmail.com>
 <87h8x0le4p.fsf@gmail.com>
Message-ID: <20170822055926.hhnuv7e4y6grbtvg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bruno,

On Tue, Aug 22, 2017 at 01:01:10AM +0200, Bruno Kremel wrote:
> I have set up buildroot external for Toradex Colibri iMX6 board. I would
> like to customise kernel default dts, so I have made a copy of this dts
> to my external board/toradex/colibiri-imx6 and then in the defconfig I
> set up the path to custom dts:
> BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL)/board/toradex/colibri-imx6/imx6dl-colibri-mcp-25.dts"
> 
> This successfully makes buildroot use my modified dts file. But this
> file inludes some kernel dtsi files.
> Namely:
> #include <dt-bindings/input/input.h>
> #include <dt-bindings/interrupt-controller/irq.h>
> #include "imx6dl.dtsi"
> #include "imx6qdl-colibri.dtsi"
> 
> These are however not found by dts compiler during build and I end up
> with dtc failing on undefined symbols in devicetree.

So the pre-processor find the include files, but some symbols are missing. Is 
that correct?

> How can I specify dts include path such that it will use kernel dtsi
> files or what is the correct way to include these from external?

The LINUX_BUILD_CMDS macro should copy your custom dts to arch/arm/boot/dts, 
which is where the .dtsi files should be located. Can you verify that?

What errors do you see?

Does the kernel you took your base dts file from match the kernel you build?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
