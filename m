From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 23:16:57 +0100
Subject: [Buildroot] Buildroot 2019.02 released
Message-ID: <87o96qgu92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again an active development cycle with close to 1300 changes and
contributions from more than 100 unique contributors!

Of noteworthy new features/changes we have:

- Dependencies: Require Python >= 2.7 as it is needed for E.G. building
  libglib2. Ensure GNU gzip is used for reproducible tarballs (instead
  of pigz). Require CMake 3.8 or newer to fix compilation issue with
  certain packages. If not available, host-cmake will instead be built.


- Infrastructure: The package list infrastructure now correctly handles
  packages installing files with old mtime.

  BR2_SYSTEM_DEFAULT_PATH setting to customize the default path
  for processes.

  The custom skeleton logic will now populate the needed /bin, /lib,
  /sbin directories/symlinks if not present. Merged /usr can now be used
  with a custom skeleton.

  Rootfs overlays can now override symbolic links from packages. This
  was disabled to ensure the correct symbolic links are present when
  merged /usr is used. Instead validate that the rootfs overlays do not
  include invalid /bin, /sbin and /lib entries.

  Various improvements to the meson infrastructure.

  Luarocks: A Buildroot addon has been added to automate creating a
  Buildroot package from luarocks, similar to scancpan and scanpypi.

  scanpypi: protect against zip-slip vulnerability in zip/tar
  handling. Correctly handle underscores in python package names.

  kconfig: Fix for make linux-menuconfig / uboot-menuconfig from a clean
  tree when ccache is enabled.

  printvars: Fix performance regression since 2018.02

  Default to sha256 password encoding, drop md5 support.


- Architecture: Support for RISC-V 32bit architecture, ARM A55, 75 and
  Saphira variants, MIPS support for mips32r3, mips64r3 and Marvell
  Octeon II/III variants.


- Toolchain: ARC toolchain 2018.09, ARM 8.2-2018.11, Codescape IMG/MTI
  MIPS 2018.09-02, MUSL 1.1.21, GCC 6.5.0 / 7.4.0 / 8.3.0, GDB 8.2.1


- Packages: Bump openssl to 1.1.1x series, bringing TLSv1.3 support and
  long term support. Split fftw into
  fftw-{single,double,long-double,quad} packages for the different data
  precision options. linux: Support building device tree blobs with the
  -@ option for device tree overlays. The weston-imx i.MX variant of
  weston is now used when imx-gpu-viv is enabled.
  Update to pkgconf 1.5.3, which brings support for --define-prefix
  (used by GStreamer). Drop openssl support from Qt 5.6, as it is not
  compatible with openssl 1.1.x. Instead add libressl support.


- New defconfigs: Aarch64 EFI, Orangepi one plus, Orangepi lite 2, QEMU
  RISC-V 32bit virt, Rock64


- New packages: brcm-patchram-plus, clinfo, cunit, docker-cli,
  erlang-p1-eimp, exempi, fail2ban, fftw-double, fftw-double-long,
  fftw-quad, fftw-single, gerbera, grpc, gst1-shark, intel-gmmlib, iwd,
  kf5-kcoreaddons, libeastl, libpackagekite, libtorrent-rasterbar,
  lua-std-debug, lua-std-normalize, mini-snmpd, netsurf, pamtester,
  pcm-tools, python-aiodns, python-aiohttp, python-aiohttp-jinja2,
  python-aiohttp-remotes, python-aiohttp-security,
  python-aiohttp-session, python-aiohttpd-sse, python-aiojobs,
  python-cchardet, python-pycares, python-sentry-sdk, python-wtforms,
  python3-setuptools, rcw, rtc-tools, shim, utp_com, vmtouch,
  websocketpp

- Removed packages: fftw, lua 5.2.x, luacrypto, perl-time-hires,
  python-pyqt, qt, qtuio, tn5250


And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02


Upgrading from 2018.02.x:

In addition to these changes, for people upgrading from 2018.02.x the
most noteworthy changes since that release are:

- The download infrastructure has seen a major overhaul, with the main
  visible new feature being Git caching: a package fetched from Git no
  longer needs to be re-cloned entirely everytime its version is
  changed. Anoter visible change is that the download folder now has
  subfolders per package. See
  http://lists.busybox.net/pipermail/buildroot/2018-April/217923.html
  for more details about those changes.

- Hardening flags (RELRO) are now handled by the toolchain wrapper
  instead of explicitly through CFLAGS/LDFLAGS, fixing a number of
  issues.

- Infrastructure: new package infrastructure added for packages using
  the Meson build system and for packages using golang.

- Architecture: support for the Blackfin architecture has been removed,
  as it was removed from Linux upstream, poorly maintained in
  binutils/gdb, and abandoned by Analog Devices.

- Linux: addition of BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF and
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL to support building Linux kernel
  configurations that need libelf on the host or openssl on the host.

- When a file being downloaded is part of a package with a .hash file,
  but there is no hash listed for this file, the file is now preserved
  in the download directory rather than removed. This helps when
  updating a package, as it gives the ability to easily calculate the
  hash of the file.

- Addition of '<pkg>-show-recursive-depends' and
  '<pkg>-show-recursive-rdepends' make targets, to respectively display
  the recursive list of dependencies and the recursive list of reverse
  dependencies of a given package.


Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes
until 2020.02 is out. The currently 2018.02.x LTS release will see one
more update before it becomes EOL, so start migration to 2019.02 soon.

The next release will be 2019.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
