From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 7 May 2018 11:01:38 -0700
Subject: [Buildroot] [PATCH 2/2] python-kivy: new package
In-Reply-To: <CAGm1_ksqz1gKSeadvO49ApzBA0Cw0cjWEsOXbWB4PhPyy933yg@mail.gmail.com>
References: <20180507030032.22819-1-joseph.kogut@gmail.com>
 <20180507030032.22819-2-joseph.kogut@gmail.com>
 <CAGm1_ksqz1gKSeadvO49ApzBA0Cw0cjWEsOXbWB4PhPyy933yg@mail.gmail.com>
Message-ID: <CAMWSM7gxFD9bhmmh+qL+KH1KO78r-j43kHC3XyuK+pHybHrx4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Mon, May 7, 2018 at 3:05 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Joseph,
>
> On Mon, May 7, 2018 at 5:00 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>> ---
>>  DEVELOPERS                                    |  1 +
>>  package/Config.in                             |  1 +
>>  .../0001-remove-getconf-dependency.patch      | 43 +++++++++++++++++
>>  package/python-kivy/Config.in                 | 16 +++++++
>>  package/python-kivy/python-kivy.hash          |  4 ++
>>  package/python-kivy/python-kivy.mk            | 48 +++++++++++++++++++
>>  6 files changed, 113 insertions(+)
>>  create mode 100644 package/python-kivy/0001-remove-getconf-dependency.patch
>>  create mode 100644 package/python-kivy/Config.in
>>  create mode 100644 package/python-kivy/python-kivy.hash
>>  create mode 100644 package/python-kivy/python-kivy.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 3ddb292894..c44f8f7145 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -935,6 +935,7 @@ F:  configs/qemu_ppc64le_pseries_defconfig
>>  N:     Joseph Kogut <joseph.kogut@gmail.com>
>>  F:     package/gconf/
>>  F:     package/python-cython/
>> +F:     package/python-kivy/
>>  F:     package/python-raven/
>>  F:     package/python-schedule/
>>  F:     package/python-websockets/
>> diff --git a/package/Config.in b/package/Config.in
>> index a48abf9470..97b3110951 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -823,6 +823,7 @@ menu "External python modules"
>>         source "package/python-jsonschema/Config.in"
>>         source "package/python-json-schema-validator/Config.in"
>>         source "package/python-keyring/Config.in"
>> +       source "package/python-kivy/Config.in"
>>         source "package/python-libconfig/Config.in"
>>         source "package/python-libusb1/Config.in"
>>         source "package/python-lmdb/Config.in"
>> diff --git a/package/python-kivy/0001-remove-getconf-dependency.patch b/package/python-kivy/0001-remove-getconf-dependency.patch
>> new file mode 100644
>> index 0000000000..76b5f0b428
>> --- /dev/null
>> +++ b/package/python-kivy/0001-remove-getconf-dependency.patch
>> @@ -0,0 +1,43 @@
>> +From e5d2bc2db2235e05a1095f384c7358b255b50b09 Mon Sep 17 00:00:00 2001
>> +From: Joseph Kogut <joseph.kogut@gmail.com>
>> +Date: Thu, 3 May 2018 16:30:42 -0700
>> +Subject: [PATCH] input: probesysfs: remove getconf dependency
>> +
>> +Remove the dependency on getconf to get LONG_BIT value, in order to
>> +improve portability to Linux systems without Glibc and/or getconf.
>> +---
>> + kivy/input/providers/probesysfs.py | 7 ++-----
>> + 1 file changed, 2 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/kivy/input/providers/probesysfs.py b/kivy/input/providers/probesysfs.py
>> +index 8021d67e51..6bc424ecfa 100644
>> +--- a/kivy/input/providers/probesysfs.py
>> ++++ b/kivy/input/providers/probesysfs.py
>> +@@ -47,6 +47,7 @@
>> +     ProbeSysfsHardwareProbe = None
>> +
>> + else:
>> ++    import ctypes
>> +     from re import match, IGNORECASE
>> +     from glob import glob
>> +     from subprocess import Popen, PIPE
>> +@@ -89,7 +90,7 @@ def get_capabilities(self):
>> +                 return []
>> +
>> +             capabilities = []
>> +-            long_bit = getconf("LONG_BIT")
>> ++            long_bit = ctypes.sizeof(ctypes.c_long) * 8
>> +             for i, word in enumerate(line.split(" ")):
>> +                 word = int(word, 16)
>> +                 subcapabilities = [bool(word & 1 << i)
>> +@@ -112,10 +113,6 @@ def getout(*args):
>> +         except OSError:
>> +             return ''
>> +
>> +-    def getconf(var):
>> +-        output = getout("getconf", var)
>> +-        return int(output)
>> +-
>> +     def query_xinput():
>> +         global _cache_xinput
>> +         if _cache_xinput is None:
>> diff --git a/package/python-kivy/Config.in b/package/python-kivy/Config.in
>> new file mode 100644
>> index 0000000000..ac901eef80
>> --- /dev/null
>> +++ b/package/python-kivy/Config.in
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_PYTHON_KIVY
>> +       bool "python-kivy"
>> +       select BR2_PACKAGE_HOST_PYTHON_CYTHON
>> +       select BR2_PACKAGE_LIBPNG # runtime
>> +       select BR2_PACKAGE_MTDEV
>> +       select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
>> +       select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
>> +       depends on BR2_PACKAGE_HAS_LIBGL
>> +       help
>> +         A software library for rapid development of hardware-accelerated
>> +         multitouch applications.
>> +
>> +         http://kivy.org
>> +
>> +comment "python-kivy needs OpenGL"
>> +       depends on !BR2_PACKAGE_HAS_LIBGL
>> diff --git a/package/python-kivy/python-kivy.hash b/package/python-kivy/python-kivy.hash
>> new file mode 100644
>> index 0000000000..a7ef55fd32
>> --- /dev/null
>> +++ b/package/python-kivy/python-kivy.hash
>> @@ -0,0 +1,4 @@
>> +# sha256 locally computed
>> +sha256 53a4eb32b6f6ecb7dcf02ddf3631af247e43fd44eba74ca51fb20a82cd4c9589  python-kivy-5f6c66eba79e1f9360f2fba79ee2c4cc6a91ed13.tar.gz
>> +# License file, locally calculated
>> +sha256 282b3d8735ef6cbdcf8cc480947d50e0aea4ad1cc931d41f3f6a6bc23956f2d6  LICENSE
>> diff --git a/package/python-kivy/python-kivy.mk b/package/python-kivy/python-kivy.mk
>> new file mode 100644
>> index 0000000000..bec0a1aee8
>> --- /dev/null
>> +++ b/package/python-kivy/python-kivy.mk
>> @@ -0,0 +1,48 @@
>> +################################################################################
>> +#
>> +# python-kivy
>> +#
>> +################################################################################
>> +
>> +PYTHON_KIVY_VERSION = 5f6c66eba79e1f9360f2fba79ee2c4cc6a91ed13
>> +PYTHON_KIVY_SITE = $(call github,kivy,kivy,$(PYTHON_KIVY_VERSION))
>> +PYTHON_KIVY_SETUP_TYPE = distutils
>> +PYTHON_KIVY_LICENSE = MIT
>> +PYTHON_KIVY_LICENSE_FILES = LICENSE
>> +PYTHON_KIVY_DEPENDENCIES = host-python-cython libgl libpng mtdev
>
> is libpng really a runtime dependency?
>
> Yegor
>

Are you asking if libpng is legitimately a runtime dependency, or if
it is also a build dependency? I don't think Kivy requires libpng to
build.

Running:

    find output/target/lib/python3.6/site-packages/kivy/ -name "*.so"
-exec ldd {} \; | grep libpng

Yields:

    libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00007f907f73e000)
    libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00007fc24cd1d000)
    libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00007f9405e83000)
    libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00007f32b2e6f000)
    libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00007fb2fd18f000)
    libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00007f9427cd5000)


It seems several modules are linked with libpng, though I'm unsure if
any of its symbols are used. Kivy is capable of using multiple image
providers, and sdl2_image should be enough. Regardless, Kivy currently
won't start without libpng.

>> +
>> +ifeq ($(BR2_PACKAGE_GSTREAMER),y)
>> +       PYTHON_KIVY_DEPENDENCIES += gstreamer
>> +       PYTHON_KIVY_ENV += USE_GSTREAMER=1
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
>> +       PYTHON_KIVY_DEPENDENCIES += libegl
>> +       PYTHON_KIVY_ENV += USE_EGL=1
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_X11)$(BR2_PACKAGE_SDL2_IMAGE)$(BR2_PACKAGE_SDL2_MIXER)$(BR2_PACKAGE_SDL2_TTF),yyyyy)
>> +       PYTHON_KIVY_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
>> +       PYTHON_KIVY_ENV += USE_SDL2=1
>> +       PYTHON_KIVY_ENV += KIVY_SDL2_PATH=$(STAGING_DIR)/usr/include/SDL2
>> +else
>> +       PYTHON_KIVY_ENV += USE_SDL2=0
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
>> +       PYTHON_KIVY_DEPENDENCIES += wayland
>> +       PYTHON_KIVY_ENV += USE_WAYLAND=1
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
>> +       PYTHON_KIVY_DEPENDENCIES += xserver_xorg-server
>> +       PYTHON_KIVY_ENV += USE_X11=1
>> +endif
>> +
>> +define PYTHON_KIVY_REMOVE_EXAMPLES
>> +       rm -rf $(TARGET_DIR)/usr/share/kivy-examples
>> +endef
>> +
>> +PYTHON_KIVY_POST_INSTALL_TARGET_HOOKS += PYTHON_KIVY_REMOVE_EXAMPLES
>> +
>> +$(eval $(python-package))
>> --
>> 2.17.0
>>
