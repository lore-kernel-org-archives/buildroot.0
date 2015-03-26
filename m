From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 26 Mar 2015 21:37:20 +0100
Subject: [Buildroot] [PATCH v9] package/sysdig: New package
In-Reply-To: <CAMQcK5KZ89uEWt_9BqZ=Cdo2JXHfzKsMaaSAZoN71bdkEvNi9Q@mail.gmail.com>
References: <1427356117-27840-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5KZ89uEWt_9BqZ=Cdo2JXHfzKsMaaSAZoN71bdkEvNi9Q@mail.gmail.com>
Message-ID: <CA+TH9Vn6t-bT78+Z8iGFq7X3ftnbZqk0-mzoQJgVODDLpQmG-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

2015-03-26 19:38 GMT+01:00 Ryan Barnett <ryan.barnett@rockwellcollins.com>:
> Hi Angelo,
>
> On Thu, Mar 26, 2015 at 2:48 AM, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>> Sysdig is open source, system-level exploration:
>> capture system state and activity from a running Linux
>> instance, then save, filter and analyze.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> It would be good to carry forward previous reviews when you submit a
> new version of a patch. In your v8 of this patch Yegor Yefremov
> reviewed your patch so after your Signed-off-by line you should put
> this:
>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Are you sure? IMO, If the patch changes it should be reviewed again.

>
> I have a found a few other things when testing v9 and I have listed them below.
>
> [...]
>
>> diff --git a/package/sysdig/0002-remove-dkms-module-updater.patch b/package/sysdig/0002-remove-dkms-module-updater.patch
>> new file mode 100644
>> index 0000000..8c0e739
>> --- /dev/null
>> +++ b/package/sysdig/0002-remove-dkms-module-updater.patch
>> @@ -0,0 +1,31 @@
>> +Rmove DKMS module updater
>
> Minor typo: 'Rmove' should be 'Remove'.

good catch!

>
>> +
>> +This patch disables the in target installation of DKMS module updater
>> +mechanism unneeded in buildroot.
>> +
>> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> +
>> +--- a/driver/CMakeLists.txt
>> ++++ b/driver/CMakeLists.txt
>> +@@ -39,21 +39,3 @@ add_custom_target(install_driver
>> +       WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
>> +       VERBATIM)
>> +
>> +-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Makefile.dkms
>> +-      RENAME Makefile
>> +-      DESTINATION "src/sysdig-${SYSDIG_VERSION}")
>> +-
>> +-install(FILES
>> +-      ${CMAKE_CURRENT_BINARY_DIR}/dkms.conf
>> +-      dynamic_params_table.c
>> +-      event_table.c
>> +-      flags_table.c
>> +-      main.c
>> +-      ppm.h
>> +-      ppm_events.c
>> +-      ppm_events.h
>> +-      ppm_events_public.h
>> +-      ppm_fillers.c
>> +-      ppm_ringbuffer.h
>> +-      syscall_table.c
>> +-      DESTINATION "src/sysdig-${SYSDIG_VERSION}")
>> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
>> new file mode 100644
>> index 0000000..caf7ef8
>> --- /dev/null
>> +++ b/package/sysdig/Config.in
>> @@ -0,0 +1,21 @@
>> +config BR2_PACKAGE_SYSDIG
>> +       bool "sysdig"
>> +       select BR2_PACKAGE_ZLIB
>> +       select BR2_PACKAGE_LUAJIT
>> +       select BR2_PACKAGE_JSONCPP
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
>
> When you have a toolchain that doesn't have one of the required
> dependencies, this comment doesn't show up. This is due to have 3
> separate depends. Instead the depends should look like this:
>
> comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
>         depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
>                   || !BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

Good catch, but the message should be viewed only on supported arhcs,
so it should be:

 comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
         depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP
         depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

> (Note indentation above should be tabs instead of spaces)
>
>> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
>> new file mode 100644
>> index 0000000..e05124b
>> --- /dev/null
>> +++ b/package/sysdig/sysdig.mk
>> @@ -0,0 +1,24 @@
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
>> +SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
>> +       -DUSE_BUNDLED_JSONCPP=OFF
>> +SYSDIG_DEPENDENCIES = zlib luajit jsoncpp linux
>> +SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
>> +
>> +SYSDIG_MAKE_ENV = LINUX_DIR='$(LINUX_DIR)' LINUX_MAKE_FLAGS='$(LINUX_MAKE_FLAGS)'
>> +
>> +define SYSDIG_INSTALL_DRIVER
>> +       cd $(@D)/buildroot-build; $(MAKE) $(SYSDIG_MAKE_ENV) install_driver
>> +endef
>> +
>> +SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
>> +
>> +$(eval $(cmake-package))
>
> With these final fixups I think we are about done with some issues. I
> will look for you v10
>
> Thanks,
> -Ryan
>
> --
> Ryan Barnett / Sr Software Engineer
> Airborne Information Systems / Security Systems and Software
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> ryan.barnett at rockwellcollins.com
> www.rockwellcollins.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
