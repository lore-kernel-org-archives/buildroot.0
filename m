From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 5 May 2016 17:32:51 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
 host-dtc for the host package
In-Reply-To: <20160505220901.4db9e9a2@free-electrons.com>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <20160505220901.4db9e9a2@free-electrons.com>
Message-ID: <1040860357.13861098.1462480371842.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Arnout Vandecappelle" <arnout@mind.be>, "Yann E. MORIN" <yann.morin.1998@free.fr>, "Peter
> Korsgaard" <peter@korsgaard.com>
> Sent: Thursday, May 5, 2016 5:09:01 PM
> Subject: Re: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on host-dtc for the host package

> Hello,
> 
> Thanks for this patch. See my comments below.
> 
> On Wed,  4 May 2016 11:38:29 -0300, Carlos Santos wrote:
>> The mkimage utility needs dtc when the input is in Flat Image Trees (FIT)
>> format. If dtc is not available mkimage fails. Example:
>> 
>>     $ mkimage -f firmware.its firmware.im
>>     sh: dtc: command not found
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>>  package/uboot-tools/Config.in.host | 1 +
>>  package/uboot-tools/uboot-tools.mk | 2 ++
>>  2 files changed, 3 insertions(+)
>> 
>> diff --git a/package/uboot-tools/Config.in.host
>> b/package/uboot-tools/Config.in.host
>> index b5a42d9..5c44eaf 100644
>> --- a/package/uboot-tools/Config.in.host
>> +++ b/package/uboot-tools/Config.in.host
>> @@ -1,5 +1,6 @@
>>  config BR2_PACKAGE_HOST_UBOOT_TOOLS
>>  	bool "host u-boot tools"
>> +	select BR2_PACKAGE_HOST_DTC
>>  	help
>>  	  Companion tools for Das U-Boot bootloader.
>>  
>> diff --git a/package/uboot-tools/uboot-tools.mk
>> b/package/uboot-tools/uboot-tools.mk
>> index f47b3db..a07fbfa 100644
>> --- a/package/uboot-tools/uboot-tools.mk
>> +++ b/package/uboot-tools/uboot-tools.mk
>> @@ -65,6 +65,8 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
>>  	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
>>  endef
>>  
>> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
> 
> I am not sure I like the idea of having host-uboot-tools always depend
> on host-dtc, as it adds build time while host-dtc is only needed for
> some specific use cases of mkimage (generating FIT images).

The extra time needed to build host-dtc is negligible. This is what I get when I build it on my Core i5 notebook, including download time:

	$ time make host-dtc-dirclean host-dtc
	[...]
	real	0m8.387s
	user	0m7.552s
	sys	0m2.231s

> There are really three options I believe:
> 
> (1) What you did, i.e have host-dtc as an unconditional dependency of
>     host-uboot-tools. Everybody pays the price of building host-dtc
>     even if it's not needed.

It builds in a few seconds and does not have any impact on the size or performance of the target system, since it is a host tool.

> (2) Add a sub-option to host-uboot-tools so that people can say "I
>     need it with FIT image support", which will add host-dtc as a
>     dependency.

The user would spend more time choosing the extra option than downloading and building host-dtc.

> (3) Just do nothing, and let our users be smart enough to realize that
>     when mkimage complains that dtc is missing, they should enable
>     host-dtc.

The poor user would waste even more time attempting to find what broke the build.

Carlos Santos (Casantos)
DATACOM, P&D
