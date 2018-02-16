From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Feb 2018 08:45:57 +0200
Subject: [Buildroot] [RFC 0/6] Support 32-bit binaries on a 64-bit
 architecture
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216064557.d6zfemlr7c2zj4x3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Markus,

On Thu, Feb 15, 2018 at 04:56:06PM -0800, Markus Mayer wrote:
> This series contains a proposal for supporting 32-bit libraries and
> binaries on a 64-bit platform.
> 
> There are some limitations and prerequisites as to the scope this has
> been tested.
> 
> - It has only been tested on ARM/ARM64.
> - It has only been tested with an external toolchain
>   (https://github.com/Broadcom/stbgcc-6.3/releases).
> - It requires that the Aarch64 compiler be compiled with "multi-lib"
>   enabled. This ensures that the sysroot doesn't contain a lib64 ->
>   lib symlink. Instead, lib and lib64 are separate directories.
> - It has only been tested with a fairly limited number of packages.
>   There might be other packages that don't correctly pass --libdir,
>   similar to bzip2 as mentioned below.

There is one thing I am missing here. AFAICS, this series does not add support 
for building 32-bit libraries in addition to their 64-bit versions. So the 
32-bit binaries that are to run on target must have their dependencies 
satisfied from the toolchain provided libraries. Is that correct?

baruch

> The patches in this series make the following changes, in this order:
> 
> - ensure that check-bin-arch allows Aarch32 binaries on Aarch64
> - introduce some new BR2 configuration variables (primarily for the
>   32-bit sysroot location on the host and where system libraries live
>   by default on the target)
> - tell the Buildroot core not to create lib32 or lib64 symlink when
>   32-bit support is enabled
> - tell the Buildroot core to copy the 32-bit sysroot when 32-bit support
>   is enabled
> - introduce the $(LIBDIR) variable to the bzip2 package, so we can tell
>   it that libbz2.so should go in /usr/lib64 when that is desired
> - modify the package core to pass /usr/lib (or /usr/lib64) as the library
>   location for the system
> 
> The result is that all 64-bit shared libraries should be installed into
> /usr/lib64. The 32-bit libraries are copied from the 32-bit sysroot on
> the host into /usr/lib.
> 
> I am quite certain this submission will only be a first step, but it does
> look like there are others who are faced with the same issue.
> 
> Markus Mayer (6):
>   support/scripts/check-bin-arch: improve architecture check
>   system/Config.in: add configuration options for 32-bit library support
>   core: system and toolchain: 32-bit run-time support on 64-bit platform
>   core/pkg-toolchain-external: copy external 32-bit libraries to staging
>   bzip2: introduce make variable $(LIBDIR)
>   package: use BR2_ROOTFS_LIB_DIR for all libraries we use
> 
>  package/bzip2/0003-add-libdir-to-makefile.patch    | 36 ++++++++++++++++++++++
>  .../bzip2/0004-add-libdir-to-makefile-libbz2.patch | 31 +++++++++++++++++++
>  package/bzip2/bzip2.mk                             |  4 ++-
>  package/dmalloc/dmalloc.mk                         |  7 +++--
>  package/e2fsprogs/e2fsprogs.mk                     |  2 ++
>  package/libzlib/libzlib.mk                         |  3 +-
>  package/linux-tools/linux-tool-cpupower.mk.in      |  7 ++++-
>  package/pciutils/pciutils.mk                       |  2 ++
>  package/pkg-autotools.mk                           |  1 +
>  package/readline/readline.mk                       |  2 +-
>  support/scripts/check-bin-arch                     | 15 +++++++++
>  system/Config.in                                   | 34 ++++++++++++++++++++
>  system/system.mk                                   | 11 ++++++-
>  .../toolchain-external/pkg-toolchain-external.mk   | 13 +++++++-
>  15 files changed, 161 insertions(+), 10 deletions(-)
>  create mode 100644 package/bzip2/0003-add-libdir-to-makefile.patch
>  create mode 100644 package/bzip2/0004-add-libdir-to-makefile-libbz2.patch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
