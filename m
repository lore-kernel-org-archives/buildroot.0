From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Nov 2019 14:22:30 -0600
Subject: [Buildroot] [PATCH next v8 3/6] package/pkg-generic: make
 libtool .la files compatible with per-package directories
In-Reply-To: <20191105164646.23820-4-thomas.petazzoni@bootlin.com>
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
 <20191105164646.23820-4-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpZMy5ftz3ZadNhmVH+bA1V11bJLSFPKRa-X-BLKUE3byw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Nov 5, 2019 at 10:47 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Libtool .la files unfortunately contain a number of absolute paths,
> which now refer to per-package directories. Due to this, when building
> package A, .la files may contain absolute paths referring to
> directories in package B per-package sysroot. This causes some -L
> flags referring to other sysroot from being added, which doesn't work
> as the linker no longer realizes that such paths are within its
> sysroot.

Building on this top level parallel make series and disabling the "pkg
size and bin arch hooks" first (https://pastebin.com/nUb3Qsgs)

BR2_aarch64=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
# BR2_TARGET_GENERIC_GETTY is not set
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_LIBXSLT=y
# BR2_TARGET_ROOTFS_TAR is not set

Then I do a 'make -s -j 32' .  Note the number of jobs doesn't seem to
matter (still fails without -j set).

I get the following error and it looks like all the sysroot paths are
valid but it can't find the standard lib....

https://pastebin.com/2W1EKjwd

Digging a bit more and I notice the failing build has an extra -L path
stuck towards the end of the link line after "-lxml2".  I noticed this
extra -L path goes away and the build is successful with zlib
disabled.

I haven't tested but I believe I had a build where the external
toolchain includes zlib (bootlin buildroot internal build) and it
doesn't appear to include this extra path.  I'm guessing the failure
is related to how zlib builds with per pkg or a fixup when moving
files around.  I did check the zlib.pc and it was clean (below).

$ cat build/libzlib-1.2.11/zlib.pc
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
sharedlibdir=${libdir}
includedir=${prefix}/include

Name: zlib
Description: zlib compression library
Version: 1.2.11

Requires:
Libs: -L${libdir} -L${sharedlibdir} -lz
Cflags: -I${includedir}

Ideas welcome :-)

Regards,
Matt
