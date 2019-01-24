From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2019 17:12:01 +0100
Subject: [Buildroot] [PATCH 2/3] boot/uboot: use HOSTCC_NOCCACHE as
 kconfig HOSTCC
In-Reply-To: <20190113215155.GN2428@scaer>
References: <20190110211500.14368-1-thomas.petazzoni@bootlin.com>
 <20190110211500.14368-3-thomas.petazzoni@bootlin.com>
 <20190113214739.GL2428@scaer> <20190113215155.GN2428@scaer>
Message-ID: <2c9e76dc-ec17-e3d2-feb5-dbda889281fc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2019 22:51, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2019-01-13 22:47 +0100, Yann E. MORIN spake thusly:
>> On 2019-01-10 22:14 +0100, Thomas Petazzoni spake thusly:
>>> At kconfig time, dependencies are not built, and therefore host-ccache
>>> is not ready. Due to this, using $(HOSTCC) as the host compiler in
>>> KCONFIG_OPTS does not work: a "make uboot-menuconfig" invocation from
>>> a clean tree with ccache enabled fails.
>>>
>>> This commit fixes this by using $(HOSTCC_NOCCACHE). We cannot rely on
>>> the default value of HOSTCC passed by the kconfig-package
>>> infrastructure, because $(UBOOT_MAKE_OPTS) also contains a HOSTCC
>>> definition that would override the one passed by the kconfig-package
>>> infrastructure.
>>>
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>> ---
>>>  boot/uboot/uboot.mk | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>>> index cbdfee6ac3..6977bcc064 100644
>>> --- a/boot/uboot/uboot.mk
>>> +++ b/boot/uboot/uboot.mk
>>> @@ -227,8 +227,9 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>>>  # (which is typically wchar) but link with
>>>  # $(HOST_DIR)/lib/libncurses.so (which is not).  We don't actually
>>>  # need any host-package for kconfig, so remove the HOSTCC/HOSTLDFLAGS
>>> -# override again.
>>> -UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC)" HOSTLDFLAGS=""
>>> +# override again. In addition, host-ccache is not ready at kconfig
>>> +# time, so use HOSTCC_NOCCACHE.
>>> +UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
>>
>> Since you're just switching over to the no-ccache variant:
>>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> However, I wonder if we would not be better off if we had written
>> something like;
>>
>>     UBOOT_KCONFIG_OPTS = $(filter-out HOSTCC=% HOSTLDFLAGS=%, $(UBOOT_MAKE_OPTS))
> 
> No, no, we can't, because there might be spaces in the previous HOSTCC="..."
> definition, so we really need to over-override it.

 Maybe, instead of over-overriding HOSTCC, we can just avoid using
UBOOT_MAKE_OPTS in UBOOT_KCONFIG_OPTS, instead passing the ARCH= and
CROSS_COMPILE= explicitly. And we probably don't even need CROSS_COMPILE for
configuring.

 Regards,
 Arnout
