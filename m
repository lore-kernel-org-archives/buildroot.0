From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Sat, 04 Jan 2020 21:11:37 +0100
Subject: [Buildroot] [PATCH] package/meson: support cmake exported
 packages
In-Reply-To: <20200102183438.GU3519@scaer>
References: <20190806082810.24082-1-m.niestroj@grinn-global.com>
 <20200102183438.GU3519@scaer>
Message-ID: <87mub33rt2.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN <yann.morin.1998@free.fr> writes:

> Marcin, All,
>
> On 2019-08-06 10:28 +0200, Marcin Niestroj spake thusly:
>> So far meson was not able to find CMake modules in cross compiled
>> environments such as Buildroot. Added patch allows to do that
>> now. Additionally meson needs to know path to cmake binary in order to
>> finalize CMake module import.
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>
> Thanks for the patch. However, it took too long to review it, and now we
> have a newer meson. 0.52.1, which already includes your changes, right?
>
> As such, I've marked this patch as "Not applicable" in Patchwork.

Thanks for letting me know!

This patch was solving two issues. One (being able to import cmake
modules from meson) that was solved already in mainline meson and is
available in Buildroot. Second was that cmake binary and toolchain file
were not seen by meson, so it could not use it to import modules
(e.g. libraries). I tried to solve it by providing path to cmake binary
in cross-compilation.conf.in file. Not sure whether there is still such
problem with current Buildroot version. I noticed that there was some
development in this area last months, so I will test this scenario once
again when back on the project.

Regards,
Marcin

>
> Thanks you! :-)
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  ...port-for-crosscompiled-CMake-modules.patch | 60 +++++++++++++++++++
>>  package/meson/cross-compilation.conf.in       |  1 +
>>  package/pkg-meson.mk                          |  1 +
>>  3 files changed, 62 insertions(+)
>>  create mode 100644 package/meson/0002-Improve-support-for-crosscompiled-CMake-modules.patch
>>
>> diff --git a/package/meson/0002-Improve-support-for-crosscompiled-CMake-modules.patch b/package/meson/0002-Improve-support-for-crosscompiled-CMake-modules.patch
>> new file mode 100644
>> index 0000000000..eeeab4962b
>> --- /dev/null
>> +++ b/package/meson/0002-Improve-support-for-crosscompiled-CMake-modules.patch
>> @@ -0,0 +1,60 @@
>> +From 61edbcf60e20dbf730e6074f055f78e0e217f4ed Mon Sep 17 00:00:00 2001
>> +From: Marcin Niestroj <m.niestroj@grinn-global.com>
>> +Date: Thu, 1 Aug 2019 11:01:49 +0200
>> +Subject: [PATCH] Improve support for crosscompiled CMake modules
>> +
>> +commit 987539e2331f2c78e94cbcf3623a82a66dd52267 upstream.
>> +
>> +There are two variables that CMake takes into account during
>> +find_package() in cross-compiled environments, which are: CMAKE_SYSROOT
>> +and CMAKE_FIND_ROOT_PATH. Those are used in cmFindCommon::RerootPaths()
>> +function, which blindly prepends all search paths with those specified
>> +via CMAKE_SYSROOT and CMAKE_FIND_ROOT_PATH.
>> +
>> +Extend search paths by using CMAKE_SYSROOT and CMAKE_FIND_ROOT_PATH in a
>> +similar way as CMake does, so we successfully find CMake packages
>> +information in cross-compiled environments.
>> +
>> +Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> +---
>> + mesonbuild/dependencies/base.py                | 11 ++++++++++-
>> + mesonbuild/dependencies/data/CMakePathInfo.txt |  2 ++
>> + 2 files changed, 12 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
>> +index 21da8e24..98b02ff7 100644
>> +--- a/mesonbuild/dependencies/base.py
>> ++++ b/mesonbuild/dependencies/base.py
>> +@@ -1178,7 +1178,16 @@ class CMakeDependency(ExternalDependency):
>> +             return None
>> +
>> +         # Extract the variables and sanity check them
>> +-        module_paths = sorted(set(self.get_cmake_var('MESON_PATHS_LIST')))
>> ++        root_paths = set(self.get_cmake_var('MESON_FIND_ROOT_PATH'))
>> ++        root_paths.update(set(self.get_cmake_var('MESON_CMAKE_SYSROOT')))
>> ++        root_paths = sorted(root_paths)
>> ++        root_paths = list(filter(lambda x: os.path.isdir(x), root_paths))
>> ++        module_paths = set(self.get_cmake_var('MESON_PATHS_LIST'))
>> ++        rooted_paths = []
>> ++        for j in [Path(x) for x in root_paths]:
>> ++            for i in [Path(x) for x in module_paths]:
>> ++                rooted_paths.append(str(j / i.relative_to(i.anchor)))
>> ++        module_paths = sorted(module_paths.union(rooted_paths))
>> +         module_paths = list(filter(lambda x: os.path.isdir(x), module_paths))
>> +         archs = self.get_cmake_var('MESON_ARCH_LIST')
>> +
>> +diff --git a/mesonbuild/dependencies/data/CMakePathInfo.txt b/mesonbuild/dependencies/data/CMakePathInfo.txt
>> +index 713c2da3..662ec583 100644
>> +--- a/mesonbuild/dependencies/data/CMakePathInfo.txt
>> ++++ b/mesonbuild/dependencies/data/CMakePathInfo.txt
>> +@@ -25,5 +25,7 @@ endif()
>> + set(MESON_ARCH_LIST ${LIB_ARCH_LIST})
>> + set(MESON_PATHS_LIST ${TMP_PATHS_LIST})
>> + set(MESON_CMAKE_ROOT ${CMAKE_ROOT})
>> ++set(MESON_CMAKE_SYSROOT ${CMAKE_SYSROOT})
>> ++set(MESON_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH})
>> +
>> + message(STATUS ${TMP_PATHS_LIST})
>> +--
>> +2.22.0
>> +
>> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
>> index fc8e27f7eb..cd466dbd05 100644
>> --- a/package/meson/cross-compilation.conf.in
>> +++ b/package/meson/cross-compilation.conf.in
>> @@ -9,6 +9,7 @@ cpp = '@TARGET_CROSS at g++'
>>  ar = '@TARGET_CROSS at ar'
>>  strip = '@TARGET_CROSS at strip'
>>  pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
>> +cmake = ['@BR2_CMAKE@', '-DCMAKE_TOOLCHAIN_FILE=@HOST_DIR@/share/buildroot/toolchainfile.cmake']
>>
>>  [properties]
>>  needs_exe_wrapper = true
>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>> index 0b811d1cc0..ec3e89dc1a 100644
>> --- a/package/pkg-meson.mk
>> +++ b/package/pkg-meson.mk
>> @@ -79,6 +79,7 @@ define $(2)_CONFIGURE_CMDS
>>  	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
>>  	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
>>  	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
>> +	    -e "s%@BR2_CMAKE@%$$(BR2_CMAKE)%g" \
>>  	    package/meson/cross-compilation.conf.in \
>>  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>>  	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
>> --
>> 2.22.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
