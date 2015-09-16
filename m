From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 17 Sep 2015 11:28:46 +1200
Subject: [Buildroot] [PATCHv3] micropython: new package
In-Reply-To: <20150916231247.545612bd@free-electrons.com>
References: <CAFOYHZBmchw4SpcVDLGnM4TfYrsSHN2-OHRHQyR=FpHXziYu=w@mail.gmail.com>
 <1442357392-17531-1-git-send-email-judge.packham@gmail.com>
 <20150916231247.545612bd@free-electrons.com>
Message-ID: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 17, 2015 at 9:12 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Chris Packham,
>
> On Wed, 16 Sep 2015 10:49:52 +1200, Chris Packham wrote:
>> Micro Python is a lean and fast implementation of the Python 3
>> programming language that is optimised to run on a microcontroller.
>>
>> Signed-off-by: Chris Packham <judge.packham@gmail.com>
>
> It starts to look almost good, there are still a few things to adjust.
> See below.
>
>>  package/Config.in                          |  2 ++
>>  package/micropython-lib/Config.in          |  7 +++++++
>>  package/micropython-lib/micropython-lib.mk | 17 +++++++++++++++++
>>  package/micropython/0001-fix-version.patch | 14 ++++++++++++++
>>  package/micropython/Config.in              |  8 ++++++++
>>  package/micropython/micropython.mk         | 27 +++++++++++++++++++++++++++
>>  6 files changed, 75 insertions(+)
>
> Could you split that up into two patches, one for micropython, and one
> for micropython-libs (in that order in the patch series) ?

Will do.

>> diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
>> new file mode 100644
>> index 0000000..a7e017b
>> --- /dev/null
>> +++ b/package/micropython-lib/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_MICROPYTHON_LIB
>> +     bool "micropython-lib"
>> +     depends on BR2_PACKAGE_MICROPYTHON
>> +     help
>> +       Core Python libraries ported to MicroPython.
>> +
>> +       http://micropython.org
>> diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
>> new file mode 100644
>> index 0000000..4445306
>> --- /dev/null
>> +++ b/package/micropython-lib/micropython-lib.mk
>> @@ -0,0 +1,17 @@
>> +################################################################################
>> +#
>> +# micropython-lib
>> +#
>> +################################################################################
>
> One empty line here, as noted by Jerzy
>

Done.

>> +MICROPYTHON_LIB_VERSION = v0.5
>> +MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
>> +MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
>> +MICROPYTHON_LIB_LICENSE_FILES = LICENSE
>> +
>> +define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>> +             PREFIX=$(TARGET_DIR)/usr/lib/micropython \
>
> Is this really the correct value for PREFIX ? I haven't checked myself,
> but PREFIX=$(TARGET_DIR)/usr would look more traditional.

Yes it's correct for the way the micropython-lib Makefile[1] is written.

>
>> +             install
>> +endef
>> +
>> +$(eval $(generic-package))
>> diff --git a/package/micropython/0001-fix-version.patch b/package/micropython/0001-fix-version.patch
>> new file mode 100644
>> index 0000000..e2cad58
>> --- /dev/null
>> +++ b/package/micropython/0001-fix-version.patch
>> @@ -0,0 +1,14 @@
>
> All patches need a description + Signed-off-by line. See
> http://git.buildroot.net/buildroot/tree/package/python/100-optional-test-modules.patch
> for example.

Done

>> +diff -Naur micropython-v1.4.5-old/py/makeversionhdr.py micropython-v1.4.5/py/makeversionhdr.py
>> +--- micropython-v1.4.5-old/py/makeversionhdr.py      2015-08-12 00:42:30.000000000 +1200
>> ++++ micropython-v1.4.5/py/makeversionhdr.py  2015-09-16 10:21:06.698962836 +1200
>> +@@ -70,9 +70,7 @@
>> +
>> + def make_version_header(filename):
>> +     # Get version info using git, with fallback to docs/conf.py
>> +-    info = get_version_info_from_git()
>> +-    if info is None:
>> +-        info = get_version_info_from_docs_conf()
>> ++    info = get_version_info_from_docs_conf()
>> +
>> +     git_tag, git_hash, ver = info
>> +
>> diff --git a/package/micropython/Config.in b/package/micropython/Config.in
>> new file mode 100644
>> index 0000000..ec47463
>> --- /dev/null
>> +++ b/package/micropython/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_MICROPYTHON
>> +     bool "micropython"
>> +     select BR2_PACKAGE_LIBFFI
>
> If you select libffi, then you need to replicate the dependencies of
> libffi, so:
>
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>

Done

>> +     help
>> +       Micro Python is a lean and fast implementation of the Python 3
>> +       programming language that is optimised to run on a microcontroller.
>> +
>> +       http://micropython.org
>
> And:
>
> comment "micropython needs a toolchain w/ thread"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>

Done

>> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
>> new file mode 100644
>> index 0000000..75a517d
>> --- /dev/null
>> +++ b/package/micropython/micropython.mk
>> @@ -0,0 +1,27 @@
>> +################################################################################
>> +#
>> +# micropython
>> +#
>> +################################################################################
>
> Need an empty line here.
>

Done

>> +MICROPYTHON_VERSION = v1.4.5
>> +MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
>> +MICROPYTHON_LICENSE = MIT
>> +MICROPYTHON_LICENSE_FILES = LICENSE
>> +MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
>> +
>> +# Use fallback implementation for exception handling on architectures that don't
>> +# have explicit support.
>> +ifeq ($(BR2_powerpc),y)
>> +MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
>> +endif
>> +
>> +define MICROPYTHON_INSTALL_TARGET_CMDS
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
>> +             CROSS_COMPILE=$(TARGET_CROSS) \
>> +             DESTDIR=$(TARGET_DIR) \
>> +             PREFIX=$(TARGET_DIR)/usr \
>> +             CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
>> +             install
>> +endef
>
> It seems like this is going to do the build and installation in the
> <pkg>_INSTALL_TARGET_CMDS, which isn't nice. I've done a quick test,
> and the following seems to work:
>
> define MICROPYTHON_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
>                 CROSS_COMPILE=$(TARGET_CROSS) \
>                 CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
> endef
>
> define MICROPYTHON_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
>                 DESTDIR=$(TARGET_DIR) \
>                 PREFIX=$(TARGET_DIR)/usr \
>                 install
> endef
>
> Which is much more in line with Buildroot standards.
>

Done.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

[1] - https://github.com/micropython/micropython-lib/blob/master/Makefile#L8
