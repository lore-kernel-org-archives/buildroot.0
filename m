From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Sun, 3 Jun 2018 18:23:20 +0100
Subject: [Buildroot] Can eigen be used with pkg-config?
Message-ID: <CAFXrp_d7LU6fmhfDT2SWw2mMDO3uzKPG6fR75M43CSrUcf4zvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Likely me learning how to build packages rather than a bug, but there goes.

Using: https://github.com/cirosantilli/buildroot/tree/eigen which contains:

```
CXXFLAGS_EXTRA = $(shell $(PKG_CONFIG) --cflags eigen3)

hello: hello.cpp
$(CXX) $(CXXFLAGS) $(CXXFLAGS_EXTRA) -o '$@' '$<' $(LIBS)
```

and:

```
$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
```

build with:

```
outdir="output/qemu_x86_64_defconfig"
make O="$outdir" "$defconfig"
printf "
BR2_CCACHE=y
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=n
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
BR2_PACKAGE_HOST_QEMU_VDE2=y
BR2_PACKAGE_HELLO=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
${2:-}
" >> "${outdir}/.config"
make O="$outdir" olddefconfig
time make O="$outdir" BR2_JLEVEL="$(nproc)"
HOST_QEMU_OPTS='--enable-sdl --with-sdlabi=2.0' hello-reconfigure all
```

and it fails with:

```
>>> hello 1.0 Building
/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/x86_64-buildroot-linux-uclibc/sysroot"
INTLTOOL_PERL=/usr/bin/perl
/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/bin/x86_64-buildroot-linux-uclibc-g++
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
-I/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/eigen3
  -o 'hello' 'hello.c
pp'
hello.cpp:3:23: fatal error: Eigen/Dense: No such file or directory
 #include <Eigen/Dense>
                       ^
```

But if I do a direct:

```
CXXFLAGS_EXTRA = $(shell $(PKG_CONFIG) --cflags eigen3)
```

it works.

`output/qemu_x86_64_defconfig/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig/eigen3.pc/eigen3.pc`
contains:

```
prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=${prefix}

Name: Eigen3
Description: A C++ template library for linear algebra: vectors,
matrices, and related algorithms
Requires:
Version: 3.3.4
Libs:
Cflags: -I/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/eigen3
```

which is the correct path. But if I do:

```
/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/bin/pkg-config
--cflags eigen3
```

it gives the same wrong path:

```
-I/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/eigen3

```

This path contains at the end the correct path:

```
/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/eigen3
```

but it is prefixed with:

```
/home/ciro/bak/git/buildroot/output/qemu_x86_64_defconfig/host/bin/../x86_64-buildroot-linux-uclibc/sysroot
```

which must be the `CMAKE_INSTALL_PREFIX`.
