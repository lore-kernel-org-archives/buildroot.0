From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 14 Jan 2021 17:00:15 +0100
Subject: [Buildroot] [RFC PATCH] boot/uboot: fix uboot build failure
 with UBOOT_CUSTOM_DTS_PATH on uboot version >= 2020.x
In-Reply-To: <CAKHhJn0Jzdh3ivfndJNNtdY4NSLDtH6gsWEK_G88RziciUsiBA@mail.gmail.com>
References: <20201224122708.588130-1-giulio.benetti@benettiengineering.com>
 <fd80671d-f637-4a81-63c4-6dcfa6727de9@benettiengineering.com>
 <CAKHhJn0Jzdh3ivfndJNNtdY4NSLDtH6gsWEK_G88RziciUsiBA@mail.gmail.com>
Message-ID: <354b9177-6ceb-c624-d6d9-72cc75c87a36@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

Cc+ Thomas

On 1/13/21 8:53 PM, Johan Derycke wrote:
> Hi,
> 
> I ran into the same problem and your patch was useful to fix it.
> My UBOOT_CUSTOM_DTS_PATH contains also .dtsi files so I had to do a 
> small change to filter those out:
> 
> $(Q)$(SED) '1s;^;dtb-y += $(subst .dts,.dtb,$(*filter %.dts*,$(call 
> notdir,$(UBOOT_CUSTOM_DTS_PATH))))\n;' $(@D)/arch/$(UBOOT_ARCH)/dts/Makefile

Ah yes, good idea, so also .dtsi can be copied but not compiled

> Not sure if this is the "buildroot way" to fix this kind of issue, but I 
> consider it a useful hack ;-).

Here is where I ask Thomas or someone else to comment, because I don't 
even know if my patch is decent enough to be committed(for sure there is 
a more elegant and more clear way to achieve this).

Is there some way to improve code readibility?

Thanks in advance
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Best regards,
> 
> Johan
> 
> 
> Op do 24 dec. 2020 om 13:37 schreef Giulio Benetti 
> <giulio.benetti@benettiengineering.com 
> <mailto:giulio.benetti@benettiengineering.com>>:
> 
>     Hello everybody,
> 
>     On 12/24/20 1:27 PM, Giulio Benetti wrote:
>      > Starting from version 2020.x uboot can't build .dts files not
>     listed in
>      > dts/Makefile leading to a build failure when trying to pass a
>     .dts file to
>      > UBOOT_CUSTOM_DTS_PATH. So let's prepend that file(s) to
>     dts/Makefile if
>      > UBOOT_CUSTOM_DTS_PATH is used.
>      >
>      > Signed-off-by: Giulio Benetti
>     <giulio.benetti@benettiengineering.com
>     <mailto:giulio.benetti@benettiengineering.com>>
>      > ---
>      >? ?boot/uboot/uboot.mk <http://uboot.mk> | 3 +++
>      >? ?1 file changed, 3 insertions(+)
>      >
>      > diff --git a/boot/uboot/uboot.mk <http://uboot.mk>
>     b/boot/uboot/uboot.mk <http://uboot.mk>
>      > index d2b4e8dc60..1f5ef4b9d2 100644
>      > --- a/boot/uboot/uboot.mk <http://uboot.mk>
>      > +++ b/boot/uboot/uboot.mk <http://uboot.mk>
>      > @@ -296,6 +296,9 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>      >? ?UBOOT_CUSTOM_DTS_PATH = $(call
>     qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
>      >
>      >? ?define UBOOT_BUILD_CMDS
>      > +? ? ?$(if $(UBOOT_CUSTOM_DTS_PATH),
>      > +? ? ? ? ? ? ?$(Q)$(SED) '1s;^;dtb-y += $(subst .dts,.dtb,$(call
>     notdir,$(UBOOT_CUSTOM_DTS_PATH)))\n;'
>     $(@D)/arch/$(UBOOT_ARCH)/dts/Makefile
>      > +? ? ?)
> 
>     This is only a proposal to understand if this is the best way to fix
>     the
>     problem.
>     The other way I see is to add a patch for uboot which does the same
>     thing.
>     What do you all prefer?
>     I've got into this because I'm adding a board that is not mainlined and
>     while in Linux it works correctly, in uboot doesn't.
> 
>     The only board that uses UBOOT_CUSTOM_DTS_PATH I see is nanopi-r1
>     and it
>     builds correctly because it's based on uboot v2019.01
> 
>     Kind regards
>     -- 
>     Giulio Benetti
>     Benetti Engineering sas
> 
>      >? ? ? ?$(if $(UBOOT_CUSTOM_DTS_PATH),
>      >? ? ? ? ? ? ? ?cp -f $(UBOOT_CUSTOM_DTS_PATH)
>     $(@D)/arch/$(UBOOT_ARCH)/dts/
>      >? ? ? ?)
>      >
> 
> 
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
