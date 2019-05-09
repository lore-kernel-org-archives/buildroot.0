From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Thu, 09 May 2019 09:52:30 +0200
Subject: [Buildroot] [PATCH v2 0/3] murata-wireless firmware packages
In-Reply-To: <20190507154117.GG6887@scaer>
References: <20190507083218.24283-1-m.niestroj@grinn-global.com>
 <20190507154117.GG6887@scaer>
Message-ID: <87pnosxdxd.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN <yann.morin.1998@free.fr> writes:

> Marcin, All,
>
> On 2019-05-07 10:32 +0200, Marcin Niestroj spake thusly:
>> This set adds 3 firmware packages for muRata wireless modules (WiFi + BLE).
>> I've put all three packages into single murata-wireless directory and Kconfig
>> submenu, as they relate to the same hardware and there are plenty of options
>> to choose from. Not sure whether this is the correct approach, so looking
>> forward to get feedback on this.
>
> I wonder why we would actually need three packages.
>
> As far as I can see from a cursory look, they are all very tightly
> coupled; they even have the same choice about the actual variant to use.
>
> So, I would like we look at making that a single package, which
> downloads multiple tarballs, something like:
>
>     MURATA_WIRELESS_CYW_FW_VERSION = 8d87950bfad28c65926695b7357bd8995b60016a
>     MURATA_WIRELESS_CYW_FW_VERSION_NVRAM = d27f1bf105fa1e5b828e355793b88d4b66188411
>     MURATA_WIRELESS_CYW_FW_VERSION_PATCH = 748462f0b02ec4aeb500bedd60780ac51c37be31
>
>     MURATA_WIRELESS_CYW_FW_SITE = $(call github,murata-wireless,cyw-fmac-fw,$(MURATA_WIRELESS_CYW_FW_VERSION)
>     MURATA_WIRELESS_CYW_FW_EXTRA_DOWNLOADS = \
>         $(call github,murata-wireless,cyw-fmac-nvram,$(MURATA_WIRELESS_CYW_FW_VERSION_NVRAM)/cyw-bt-nvram-$(MURATA_WIRELESS_CYW_FW_VERSION_NVRAM).tar.gz \
>         $(call github,murata-wireless,cyw-fmac-patch,$(MURATA_WIRELESS_CYW_FW_VERSION_PATCH)/cyw-bt-patch-$(MURATA_WIRELESS_CYW_FW_VERSION_PATCH).tar.gz
>
>     define MURATA_WIRELESS_CYW_FW_EXTRACT_NVRAM_PATCH
>         $(foreach tar, $(notdir $(MURATA_WIRELESS_CYW_FW_EXTRA_DOWNLOADS)), \
>             $(call suitable-extractor,$(tar)) $(MURATA_WIRELESS_CYW_FW_DL_DIR)/$(tar) | \
>             $(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -$(sep) \
>         )
>     endef
>     MURATA_WIRELESS_CYW_FW_POST_EXTRACT_HOOKS += MURATA_WIRELESS_CYW_FW_EXTRACT_NVRAM_PATCH
>
> And a similar hook for the installation step (which I leave up to you as
> an exercise ;-) ).

Thanks for review and tips on how to use single package here. The only
downside that I see is that all three packages will be downloaded, even
if (in some cases) one or two are required only. However overall code
will be much simpler, so it is a good idea anyway.

>
> Regards,
> Yann E. MORIN.
>
>> Marcin Niestroj (3):
>>   package/murata-wireless-cyw-fmac-fw: new package
>>   package/murata-wireless-cyw-fmac-nvram: new package
>>   package/murata-wireless-cyw-bt-patch: new package
>>
>>  DEVELOPERS                                    |  1 +
>>  package/Config.in                             |  1 +
>>  package/murata-wireless/Config.in             |  7 ++
>>  .../murata-wireless-cyw-bt-patch/Config.in    | 47 ++++++++++
>>  .../murata-wireless-cyw-bt-patch.hash         |  3 +
>>  .../murata-wireless-cyw-bt-patch.mk           | 50 ++++++++++
>>  .../murata-wireless-cyw-fmac-fw/Config.in     | 91 +++++++++++++++++++
>>  .../murata-wireless-cyw-fmac-fw.hash          |  3 +
>>  .../murata-wireless-cyw-fmac-fw.mk            | 80 ++++++++++++++++
>>  .../murata-wireless-cyw-fmac-nvram/Config.in  | 91 +++++++++++++++++++
>>  .../murata-wireless-cyw-fmac-nvram.hash       |  3 +
>>  .../murata-wireless-cyw-fmac-nvram.mk         | 75 +++++++++++++++
>>  package/murata-wireless/murata-wireless.mk    |  9 ++
>>  13 files changed, 461 insertions(+)
>>  create mode 100644 package/murata-wireless/Config.in
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.hash
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.mk
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.hash
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.mk
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.hash
>>  create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.mk
>>  create mode 100644 package/murata-wireless/murata-wireless.mk
>>
>> --
>> 2.21.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot


--
Marcin Niestr?j
