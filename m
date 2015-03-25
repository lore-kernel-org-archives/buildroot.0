From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Mar 2015 11:23:29 +0100
Subject: [Buildroot] [PATCH v5] package/sysdig: New package
In-Reply-To: <CAHXCMMK4ZLyB6XvSGAx5H64EdK3MwNc3J5hLMh+D7LkmhP2CDA@mail.gmail.com>
References: <1426856189-8223-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAHXCMMK4ZLyB6XvSGAx5H64EdK3MwNc3J5hLMh+D7LkmhP2CDA@mail.gmail.com>
Message-ID: <CA+TH9VmNaLtO1fN-Wb=FTjX_sU=cr9Ob0RS10MFjuXJpDj1_BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

2015-03-20 22:49 GMT+01:00 Samuel Martin <s.martin49@gmail.com>:
> Hi Angelo,
>
> On Fri, Mar 20, 2015 at 1:56 PM, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>> Sysdig is open source, system-level exploration:
>> capture system state and activity from a running Linux
>> instance, then save, filter and analyze.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>> Changes v4 -> v5:
>>   - Adjusted to 80 columns for sysdig.mk header
>>
>> Changes v3 -> v4:
>>   - Changed "depends on" to "select" and fixed selected packages
>>     dependencies.
>>   - moved "comment" section to the bottom
>>
>> Changes v2 -> v3:
>>   - Changed "depends on" and "select" to simplify package
>>
>> Changes v1 -> v2:
>>   - Changed "depends on" with "select" for dependencies (suggested by Baruch)
>>   - Added comment "sysdig needs a Linux kernel to be built" (suggested by Baruch)
>>   - Upgreded to recently released 0.1.99
>>
>>
>>  package/Config.in        |  1 +
>>  package/sysdig/Config.in | 21 +++++++++++++++++++++
>>  package/sysdig/sysdig.mk | 22 ++++++++++++++++++++++
>>  3 files changed, 44 insertions(+)
>>  create mode 100644 package/sysdig/Config.in
>>  create mode 100644 package/sysdig/sysdig.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index fce92a8..6596292 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -95,6 +95,7 @@ endif
>>         source "package/strace/Config.in"
>>         source "package/stress/Config.in"
>>         source "package/sysprof/Config.in"
>> +       source "package/sysdig/Config.in"
>>         source "package/tinymembench/Config.in"
>>         source "package/trace-cmd/Config.in"
>>         source "package/trinity/Config.in"
>> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
>> new file mode 100644
>> index 0000000..5c2b070
>> --- /dev/null
>> +++ b/package/sysdig/Config.in
>> @@ -0,0 +1,21 @@
>> +config BR2_PACKAGE_SYSDIG
>> +       bool "sysdig"
>> +       select BR2_PACKAGE_ZLIB
>> +       select BR2_PACKAGE_LUAJIT
>> +       select BR2_PACKAGE_LIBJSON
>> +       depends on BR2_LINUX_KERNEL
>> +       depends on BR2_INSTALL_LIBSTDCPP # libjson
>> +       depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>> +       help
>> +         Sysdig is open source, system-level exploration:
>> +         capture system state and activity from a running Linux instance,
>> +         then save, filter and analyze.
>> +         Think of it as strace + tcpdump + lsof + awesome sauce.
>> +         With a little Lua cherry on top.
>> +
>> +         http://sysdig.org
>> +
>> +comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
>> +       depends on !BR2_LINUX_KERNEL
>> +       depends on !BR2_INSTALL_LIBSTDCPP
>> +       depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
>> new file mode 100644
>> index 0000000..8fea399
>> --- /dev/null
>> +++ b/package/sysdig/sysdig.mk
>> @@ -0,0 +1,22 @@
>> +################################################################################
>> +#
>> +# sysdig
>> +#
>> +################################################################################
>> +
>> +SYSDIG_VERSION = 0.1.99
>> +SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
>> +SYSDIG_LICENSE = GPLv2
>> +SYSDIG_LICENSE_FILES = COPYING
>> +SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF
> You may also want to set USE_BUNDLED_JSONCPP here.

Yes, right!

>
>> +SYSDIG_DEPENDENCIES = zlib luajit libjson linux
>> +SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
>> +
>> +define SYSDIG_INSTALL_DRIVER
>> +       $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver modules
> This command actually build the kernel module, so should be in a _BUILD_HOOK ;-)
>
>> +       $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver modules_install
>> +endef
>> +
>> +SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
>
> The weird thing here is that you manually build/install the kernel
> module, whereas AFAICS it should be automatically done by the
> build-system (the driver directory is always scan in the Buildroot
> context (see [1]), and BUILD_DRIVER is ON by default ([2])).
> I suggest to disable BUILD_DRIVER in the conf. options.

I just pushed a patch with a better solution. Please review it!

Thank you!

>
>> +
>> +$(eval $(cmake-package))
>> --
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> [1] https://github.com/draios/sysdig/blob/dev/CMakeLists.txt#L50
> [2] https://github.com/draios/sysdig/blob/dev/driver/CMakeLists.txt#L1
>
> Regards,
>
> --
> Samuel



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
