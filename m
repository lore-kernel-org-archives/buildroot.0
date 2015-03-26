From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 26 Mar 2015 16:17:09 +0100
Subject: [Buildroot] [PATCH v8] package/sysdig: New package
In-Reply-To: <CAMQcK5J8g+J3O=J-DL8yvPZ8TAXMprE8DNwv5u4wy9G0mxt+Nw@mail.gmail.com>
References: <1427280821-2909-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5J8g+J3O=J-DL8yvPZ8TAXMprE8DNwv5u4wy9G0mxt+Nw@mail.gmail.com>
Message-ID: <CA+TH9Vm2x48d72OfUOuTc96u3MbF13OpDEyZYSkyh-ar2_E+CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,


2015-03-25 22:56 GMT+01:00 Ryan Barnett <ryan.barnett@rockwellcollins.com>:
> Angelo,
>
> Sorry for the noise before I have now had a change to actually
> download and try your patch out. Please see the issues that I have had
> when just doing a build with 'make sysdig'
>
> On Wed, Mar 25, 2015 at 5:53 AM, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>>
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
>
> This doesn't work because when I do a build and run file on the .ko I
> get the following:
>
> $ file build/sysdig-0.1.99/buildroot-build/driver/sysdig-probe.ko
> build/sysdig-0.1.99/buildroot-build/driver/sysdig-probe.ko: ELF 64-bit
> LSB  relocatable, x86-64, version 1 (SYSV),
> BuildID[sha1]=0ea061af98e9fd2b5ba04d2be1c309833a20217a, not stripped
>
> My target was a Cortex-A5 (arm 32-bit LE). So this patch isn't working
> because I think KERNELDIR is being set by above to /lib/modules$(shell
> uname -r)/build
>
> So in order to use this patch with buildroot we need to modify the
> sysdig.mk in order to make this work.
>
>> +
>> + clean:
>> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) clean
>> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) clean
>> +
>> + install: all
>> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) modules_install
>> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) modules_install
>
> [...]
>
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
>
> In order to make sure the kernel driver is actually cross compiling
> with buildroot's kernel I had to add the following:
>
> SYSDIG_MAKE_ENV = KERNELDIR="$(LINUX_SRCDIR)" \
>           LINUX_MAKE_FLAGS='$(LINUX_MAKE_FLAGS)'
>
> (Note: spacing should be a tab).
>
>
>> +SYSDIG_DEPENDENCIES = zlib luajit libjson linux
>
> I think your dependancy should be on 'jsoncpp' instead of libjson. I
> was unable to detect jsoncpp in the configure step when just running:
>
> 'make sysdig'

I submitted and updated patch addressing these issues. I tested the
patch several time and now it should work like expected.

>
>> +SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
>> +
>> +$(eval $(cmake-package))
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
