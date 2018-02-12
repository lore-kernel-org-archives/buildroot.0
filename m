From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 12 Feb 2018 13:39:33 +0100
Subject: [Buildroot] Using cross tools without knowing the cross prefix
Message-ID: <CAAXf6LU9ZkpV+3wbjM_Ybb6F0DKsMY+8MUAd2SQi2ap2PnZ55A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The cross tools installed/extracted by Buildroot are in
$(HOST_DIR)/bin/ and are called
<prefix>-gcc, <prefix>-gdb, etc. where <prefix> could e.g.
mips64-octeon-linux-gnu-

When working with many different Buildroot repositories and some
common wrapper logic external to Buildroot (which I believe is not
uncommon, at least in corporate environments) one does not always know
the prefix upfront. One typically knows the path the Buildroot
repository and the defconfig it should use, but all other details are
supposed to be internal to Buildroot.

As such, there is not really a simple way to refer to these cross
tools. One has to guess/determine the correct prefix.

Things become even more complex when tools could be named differently
depending on whether they originate from an external toolchain, or are
built by Buildroot, like gdb. As can be seen from the comment and
logic in method setup_gdb_wrapper in (rejected) patch [1], there are
several cases to consider:

For internal toolchains:
 - if BR2_PACKAGE_HOST_GDB is set, gdb is built by buildroot and a real file at
   $(TARGET_CROSS)gdb ( == $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb )
For external toolchains:
 - if BR2_PACKAGE_HOST_GDB is not set, gdb is provided by the external
   toolchain and $(TARGET_CROSS)gdb is a symlink.
 - if BR2_PACKAGE_HOST_GDB is set, gdb is built by buildroot and a real file at
   $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb


Today, in our local tree, we add a symlink
output/host/usr/bin/cross-gdb that points to the correct one. The
external script then can point to that common path without having to
know the underlying prefix.
Using something like 'output/host/usr/bin/*-gdb' does not work
reliably because the external toolchain could provide an (old) gdb and
Buildroot could build one as well (typically a newer one).


While I'm currently mostly interested in cross-gdb, the problem is
generic for cross-gcc, cross-g++, ... as well. Can we create a
mechanism that solves this problem generically, for example by
adding links cross-<tool> for every useful tool inside $(HOST_DIR)/bin?
Or alternatively, use a second directory tree like:
$(HOST_DIR)/bin/cross/{gcc,gdb,nm,readelf} etc. ?

Thanks for your input,
Thomas


[1] http://lists.busybox.net/pipermail/buildroot/2016-April/160055.html
