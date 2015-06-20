From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Jun 2015 11:30:54 +0200
Subject: [Buildroot] [PATCH v1 0/2] Make Buildroot for Zedboard
 independent on Xilinx tools
In-Reply-To: <20150620102642.2d88adfb@jvn>
References: <20150618231816.513316f9@free-electrons.com>
 <1434721125-5688-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <5584749E.2010302@mind.be> <20150620102642.2d88adfb@jvn>
Message-ID: <558532CE.2040501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/20/15 10:26, Jan Viktorin wrote:
> On Fri, 19 Jun 2015 21:59:26 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 06/19/15 15:38, Jan Viktorin wrote:
>>> From: Jan Viktorin <viktorin@rehivetech.com>
>>>
>>> Dear Thomas,
>>>
>>> thank you for the review. I've made the changes accordingly.
>>>
>>> I've created host-zynq-boot-bin package to cover the small
>>> python script. It downloads U-Boot xilinx-v2015.1 from Xilinx
>>> github for this purpose (quite an overkill, isn't it...).
>>>
>>> There are now just 2 patches of U-Boot 2015.07. 0001 adds
>>> calling of the zynq-boot-bin.py and 0002 fixes the default
>>> U-Boot environment to boot out-of-the-box from SD card.
>>>
>>> There is still one thing to solve (I wasn't sure how).
>>> There is no dependency specified between U-Boot and the
>>> host-zynq-boot-bin package. It should be probably conditional
>>> but what kind of condition to write there? Should we use
>>> it for every Zynq architecture? (Is it possible to detect
>>> it by Buildroot?)
>>
>>  You can revert the two packages: make host-zynq-boot-bin depend on
>> uboot, and move the call to the python script to the
>> host-zynq-boot-bin package. One less patch for uboot :-)
> 
> So, you mean to drop the patch 0001 and call the zynq-boot-bin.py from
> BUILD/INSTALL (?) stage of this package?

 Yes, from the BUILD stage.

 You'll want to set _INSTALL_STAGING = NO and _INSTALL_IMAGES = YES.


> (I expect the dependency on
> uboot will guarantee, it is called after uboot.) 

 Yep.


> The package will get
> the path to the uboot's build dir as UBOOT_DIR, is it right?

 It will, but we prefer not to rely on that. Since uboot.mk will anyway install
the spl.bin file to $(IMAGES_DIR), you can take it from there.

> 
> So host-zynq-boot-bin should depend on uboot and it is up to the user
> to select this package to create the boot.bin file automatically
> or not. Is that OK?

 Exactly!


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
