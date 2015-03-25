From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 25 Mar 2015 13:29:56 -0500
Subject: [Buildroot] [PATCH v8] package/sysdig: New package
In-Reply-To: <CAMQcK5KooYkSGu9CZ78Z871DALorZK7GsYv39XAjnK=kLa7O1w@mail.gmail.com>
References: <1427280821-2909-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5KooYkSGu9CZ78Z871DALorZK7GsYv39XAjnK=kLa7O1w@mail.gmail.com>
Message-ID: <CAMQcK5+519qW9bQRgMw1MxdFk4Xu7Ap-NRTtr5aqmHChOkGraQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

I apologies as I accidentally pressed a keyboard shortcut that sent
the email prematurely.

On Wed, Mar 25, 2015 at 1:05 PM, Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
> Angelo,
>
> On Wed, Mar 25, 2015 at 5:53 AM, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>
> [...]
>
>>  package/Config.in                                  |  1 +
>>  .../0001-makefile-driver-compile-options.patch     | 23 ++++++++++++++++
>>  .../sysdig/0002-remove-dkms-module-updater.patch   | 32 ++++++++++++++++++++++
>>  package/sysdig/Config.in                           | 21 ++++++++++++++
>>  package/sysdig/sysdig.mk                           | 16 +++++++++++
>>  5 files changed, 93 insertions(+)
>>  create mode 100644 package/sysdig/0001-makefile-driver-compile-options.patch
>
> Have you submitted this sysdig patch upstream via a github pull request?
>
> Giving it a quick look at 0001 looks like something that could be
> upstreamable since

So upon further review of your 0001 patch I have some questions which
you can see below.

>
>>  create mode 100644 package/sysdig/0002-remove-dkms-module-updater.patch
>>  create mode 100644 package/sysdig/Config.in
>>  create mode 100644 package/sysdig/sysdig.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index e4ee95d..aaf12ec 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -94,6 +94,7 @@ endif
>>         source "package/spidev_test/Config.in"
>>         source "package/strace/Config.in"
>>         source "package/stress/Config.in"
>> +       source "package/sysdig/Config.in"
>>         source "package/sysprof/Config.in"
>>         source "package/tinymembench/Config.in"
>>         source "package/trace-cmd/Config.in"
>> diff --git a/package/sysdig/0001-makefile-driver-compile-options.patch b/package/sysdig/0001-makefile-driver-compile-options.patch
>> new file mode 100644
>> index 0000000..b3444ad
>> --- /dev/null
>> +++ b/package/sysdig/0001-makefile-driver-compile-options.patch
>> @@ -0,0 +1,23 @@
>> +Updated Makefile compile options
>> +
>> +This patch updates linux kernel module (driver) of sysdig to be
>> +compatible with buildroot compile flags.
>> +
>> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> +
>> +--- a/driver/Makefile.in
>> ++++ b/driver/Makefile.in
>> +@@ -6,10 +6,10 @@ KERNELDIR            ?= /lib/modules/$(shell uname -r)/build
>> +
>> + TOP := $(shell pwd)
>> + all:
>> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) modules
>> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) modules

How is LINUX_MAKE_FLAGS available in your environment when you are
attempting to run these commands? Buildroot doesn't export this
variable to the environment and I don't see how these are available
you cmake is executing this makefile.

>> + clean:
>> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) clean
>> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) clean
>> +
>> + install: all
>> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) modules_install
>> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) modules_install
>> diff --git a/package/sysdig/0002-remove-dkms-module-updater.patch b/package/sysdig/0002-remove-dkms-module-updater.patch
>> new file mode 100644
>> index 0000000..66fe3dd
>> --- /dev/null
>> +++ b/package/sysdig/0002-remove-dkms-module-updater.patch
>> @@ -0,0 +1,32 @@
>> +Remove DKMS module updater
>> +
>> +This patch disables the in target installation of DKMS module updater
>> +mechanism unneeded in buildroot.
>> +
>> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> +
>> +--- a/driver/CMakeLists.txt
>> ++++ b/driver/CMakeLists.txt
>> +@@ -38,22 +38,3 @@ add_custom_target(install_driver
>> +       DEPENDS driver
>> +       WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
>> +       VERBATIM)
>> +-
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
>> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
>> new file mode 100644
>> index 0000000..769cfe2
>> --- /dev/null
>> +++ b/package/sysdig/sysdig.mk
>> @@ -0,0 +1,16 @@
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
>> +SYSDIG_DEPENDENCIES = zlib luajit libjson linux
>> +SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
>
In your previous email you gave a link to saying why luajit is required:

[1] http://www.sysdig.org/wiki/how-to-install-sysdig-from-the-source-code/

However, from reading the documentation it says that you can use the
bundled luajit. Quoting from the site you provided:

---
By default the bundled version of LuaJIT will be built and linked
statically. If you prefer to use the system one, then you can do:

cmake -DUSE_BUNDLED_LUAJIT=OFF ..
---

This would imply that we can make an optional dependency on luajit by
doing something like this:

ifeq ($(BR2_PACKAGE_LUAJIT),y)
SYSDIG_CONF_OPTS += DUSE_BUNDLED_LUAJIT=OFF
SYSDIG_DEPENDENCIES += luajit
endif

I don't think it make sense to have an else case here since it doesn't
mention having to define BUNDLED_LUAJIT as on.

It appears that you can the same for zlib and jsoncpp as well. I have
not tried this yet but from reading the documentation it appears that
this all possible.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
