From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 18 Jun 2012 10:02:19 -0500
Subject: [Buildroot] [RFC/PATCH 0/4] support building from read-only source
	tree
Message-ID: <1340031743-29694-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are several places in Buildroot where files are copied from the
source tree to the output directory and then modified.  The most
obvious case is copying a .config or equivalent to the build
directory and then modifying it with sed, as with uClibc or busybox.

This works fine when the source file has write permissions; this is
preserved in the destination copy.  This is the behavior in the common
case of running from a git repository or a release tarball.

However, when the source file is read-only, the destination copy is
also not writable and such fixups fail.  This occurs when the the
Buildroot source tree is being hosted in a Perforce repository.
Perforce uses local file permissions to track whether a file is being
edited and checks out all regular files read-only by design.

The following changes were enough to get qemu_mips_malta_defconfig to
build and run successfully.  I submit these patches for discussion and
illustration of the effort required to support this use case.

Nathan Lynch (4):
  uClibc: ensure .oldconfig is writable
  ensure target fs is writable
  busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable
  linux: ensure buildroot_defconfig is writable

 Makefile                   |    1 +
 linux/linux.mk             |    3 ++-
 package/busybox/busybox.mk |    3 ++-
 toolchain/uClibc/uclibc.mk |    1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.10.2
