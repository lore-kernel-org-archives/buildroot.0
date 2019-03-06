From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Mar 2019 10:28:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Allow to build
 with uclibc but w/o mausezahn
In-Reply-To: <20190306052900.rlg6ebkp5e4ewtzu@vkochan-ThinkPad-T470p>
References: <20190304085741.13782-1-vadim4j@gmail.com>
 <899f39cb-501b-ef06-7884-5d4f4ef7909a@mind.be>
 <20190306052900.rlg6ebkp5e4ewtzu@vkochan-ThinkPad-T470p>
Message-ID: <2b7060f3-d03b-a456-4796-b5a6f81c72d9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/03/2019 06:29, Vadim Kochan wrote:
> Hi Arnout,
> 
> On Mon, Mar 04, 2019 at 08:06:00PM +0100, Arnout Vandecappelle wrote:
>>  Hi Vadim,
>>
>> On 04/03/2019 09:57, Vadim Kochan wrote:
[snip]
>>> +if BR2_PACKAGE_NETSNIFF_NG
>>> +
>>> +config BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN
>>> +	bool "mausezahn"
>>
>>  Is it worth to add a separate config for this? I.e., does it give significant
>> saving in either binary size (including libcli and libnet dependencies) or
>> runtime performance?
>>
>>  If not, we prefer to handle it "automatically" in the .mk file only. In other
>> words, keep the libcli and libnet selects above but make them conditional on
>> !uclibc, and change the .mk file as indicated below...
> 
> Well libnet + libcli uses ~180K,

 That indeed sounds significant. To really compare you should do a minimal build
of netsniff-ng and its dependencies using a musl toolchain; if that ends up at
something like 2MB rootfs size, the 180K is worth it.

 We'd still typically have it in the .mk file only, like:

ifeq ($(BR2_PACKAGE_LIBCLI)$(BR2_PACKAGE_LIBNET):$(BR2_TOOLCHAIN_USES_UCLIBC),yy:)

 However, in this case the libcli and libnet dependencies are very non-obvious,
so having an explicit Config.in option indeed makes sense.

> but actually I thought that it is OK to
> get rid not needed dependencies), if you think this is not good then
> I will prepare a patch for netsniff-ng's configure script which will check
> ceill() support and will skip the mausezahn compilation.

 That would be even better of course, because then we don't need that explicit
list of tools.

 Now you mention it, it looks like the libpcap dependency is also only used for
mausezahn...

 Regards,
 Arnout

> 
>>
>>> +	default y
>>> +	# Build with uClibc fails due to missing ceill()
>>> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>>> +	select BR2_PACKAGE_LIBCLI
>>> +	select BR2_PACKAGE_LIBNET
>>> +
>>> +comment "mausezahn needs glibc or musl toolchain"
>>> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
>>> +
>>> +endif
>>> +
>>> +comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
>>>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>>> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC \
>>> -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>>> +	depends on !BR2_TOOLCHAIN_HAS_THREADS  || \
>>> +			!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>>> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
>>> index 77d8921425..9fe50f10d3 100644
>>> --- a/package/netsniff-ng/netsniff-ng.mk
>>> +++ b/package/netsniff-ng/netsniff-ng.mk
>>> @@ -13,9 +13,14 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
>>>  NETSNIFF_NG_CONF_ENV = \
>>>  	NACL_INC_DIR=/dev/null \
>>>  	NACL_LIB_DIR=/dev/null
>>> -NETSNIFF_NG_DEPENDENCIES = \
>>> -	libnl libpcap libcli libnetfilter_conntrack \
>>> -	liburcu libnet
>>> +NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
>>> +
>>> +NETSNIFF_NG_TOOLS = netsniff-ng trafgen astraceroute flowtop ifpps bpfc curvetun
>>> +
>>> +ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
>>
>>  ... make this condition
>>
>> ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
>>
>> (and move the comment from Config.in to here).
>>
>>> +NETSNIFF_NG_DEPENDENCIES += libcli libnet
>>> +NETSNIFF_NG_TOOLS += mausezahn
>>> +endif
>>>  
>>>  ifeq ($(BR2_PACKAGE_GEOIP),y)
>>>  NETSNIFF_NG_DEPENDENCIES += geoip
>>> @@ -41,12 +46,13 @@ define NETSNIFF_NG_CONFIGURE_CMDS
>>>  endef
>>>  
>>>  define NETSNIFF_NG_BUILD_CMDS
>>> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>>> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(NETSNIFF_NG_TOOLS)
>>>  endef
>>>  
>>>  define NETSNIFF_NG_INSTALL_TARGET_CMDS
>>>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>>> -		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
>>> +		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install \
>>> +			-C $(@D) $(NETSNIFF_NG_TOOLS)
>>
>>  I don't like very much that we have to enumerate the tools in the .mk file, but
>> I don't see any other possibility.
>>
>>  Regards,
>>  Arnout
>>
>>>  endef
>>>  
>>>  $(eval $(generic-package))
>>>
> 
> Regards,
> Vadim Kochan
> 
