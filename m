From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 4 Oct 2016 08:53:18 +0200
Subject: [Buildroot] [PATCH v3] package/linux-tools: add gpio
In-Reply-To: <20161003170644.GB3924@free.fr>
References: <20161003122548.2477-1-m.niestroj@grinn-global.com>
 <20161003170644.GB3924@free.fr>
Message-ID: <3c84132d-9e2b-5e9c-83bb-b43e8acdf1db@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On 03.10.2016 19:06, Yann E. MORIN wrote:
> Marcin, All,
>
> On 2016-10-03 14:25 +0200, Marcin Niestroj spake thusly:
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> ---
>> Changes v2 -> v3:
>>  * Add info about supported Linux version in Config.in
>>    (suggested by Baruch)
>>
>> Changes v1 -> v2:
>>  * Adapt to new linux-tools infra, which is moved to package/ directory
>>    (suggested by Yann)
>>
>>  package/linux-tools/Config.in          | 12 ++++++++++++
>>  package/linux-tools/linux-tool-gpio.mk | 28 ++++++++++++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 package/linux-tools/linux-tool-gpio.mk
>>
>> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
>> index 61c196f..bd07509 100644
>> --- a/package/linux-tools/Config.in
>> +++ b/package/linux-tools/Config.in
>> @@ -20,6 +20,18 @@ comment "cpupower needs a toolchain w/ wchar"
>>  	depends on !BR2_bfin
>>  	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
>>
>> +config BR2_PACKAGE_LINUX_TOOLS_GPIO
>> +	bool "gpio"
>> +	select BR2_PACKAGE_LINUX_TOOLS
>> +	help
>> +	  gpio is a collection of tools to get information about,
>> +	  control and monitor gpios present on system.
>> +
>> +	  These tools use new gpio ABI which will deprecate sysfs gpio
>> +	  interface in the future.
>> +
>> +	  These tools are available only from kernel version 4.8.
>> +
>>  config BR2_PACKAGE_LINUX_TOOLS_PERF
>>  	bool "perf"
>>  	select BR2_PACKAGE_LINUX_TOOLS
>> diff --git a/package/linux-tools/linux-tool-gpio.mk b/package/linux-tools/linux-tool-gpio.mk
>> new file mode 100644
>> index 0000000..db0094a
>> --- /dev/null
>> +++ b/package/linux-tools/linux-tool-gpio.mk
>> @@ -0,0 +1,28 @@
>> +################################################################################
>> +#
>> +# gpio
>> +#
>> +################################################################################
>> +
>> +LINUX_TOOLS += gpio
>> +
>> +GPIO_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS)
>
> Any reason not to use $(LINUX_MAKE_FLAGS) in the first place?
>
>     GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
>
> LINUX_MAKE_FLAGS shall contain all the required variable definitions
> needed to build for the target.
>
> Yes, cpupower directly defines CROSS_COMPILE et al., but perf and
> selftests do use LINUX_MAKE_FLAGS, and I think we should use that unless
> there is a good reason not to.
>
> This would allow use to easily update the compile options/variables.

I just did it similar to cpupower package. But using LINUX_MAKE_FLAGS
looks like a better option.

What about specifying also DESTDIR together:
GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
so we can simplify GPIO_INSTALL_TARGET_CMDS?
This would be similar to perf package.

>
> (Sorry, I forgot to point that out in the previous review...)
>
> Regards,
> Yann E. MORIN.
>
>> +define GPIO_BUILD_CMDS
>> +	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
>> +		echo "Your kernel version is too old and does not have the gpio tools." ; \
>> +		echo "At least kernel 4.8 must be used." ; \
>> +		exit 1 ; \
>> +	fi
>> +
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
>> +		$(GPIO_MAKE_OPTS) \
>> +		gpio
>> +endef
>> +
>> +define GPIO_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
>> +		$(GPIO_MAKE_OPTS) \
>> +		DESTDIR=$(TARGET_DIR) \
>> +		gpio_install
>> +endef
>> --
>> 2.10.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Marcin Niestroj
