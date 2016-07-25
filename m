From: David Raeman <draeman@bbn.com>
Date: Mon, 25 Jul 2016 16:26:57 -0400
Subject: [Buildroot] [PATCH 2/2] host-dtc: Install libftd and associated
	header files.
In-Reply-To: <20160725220137.663c9c03@free-electrons.com>
References: <20160725195227.21112-1-draeman@bbn.com>	<20160725195227.21112-2-draeman@bbn.com>
 <20160725220137.663c9c03@free-electrons.com>
Message-ID: <00d701d1e6b2$e48f0380$adad0a80$@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for the confusion.  I did not mean to imply any problem with the qemu
package provided by buildroot.  I am emulating a Xilinx Zynq target, so I
use a custom package in my br2-external tree that fetches the version of
QEMU that is patched by Xilinx.  It is fetched from
https://github.com/Xilinx/qemu using the new github hook for the SITE macro:

        XLNX_QEMU_SITE = $(call github,Xilinx,qemu,$(XLNX_QEMU_VERSION))

The canonical QEMU repository embeds a ref to dtc's upstream repo in its
source tree using a git submodule.  The QEMU source tree fetched by
buildroot from http://wiki.qemu.org/download/ has that submodule content
populated as a part of the downloaded tarball.  So the qemu package is able
to build using its internal tree of dtc/libfdt, and thus it does not require
finding libfdt within HOST_DIR.

In my case, the Xilinx-patched version downloaded using $(call github ...)
is fetching a tarball from GitHub which does not have the embedded Git
submodule populated.  So the build is instead looking for libfdt within
HOST_DIR and fails if it does not find it.

If there is an aversion to allowing libfdt to be installed as a part of the
host package, I could instead change my br2-external package to download the
Xilinx-patched QEMU using the git:// scheme instead of grabbing the tarball
via $(call github ...).  Then it would grab the Git submodule reference and
I could fetch it by customizing EXTRACT_CMDS.  Either approach is equally
fine with me.

Cheers,
David


-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Monday, July 25, 2016 4:02 PM
To: David Raeman <draeman@bbn.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH 2/2] host-dtc: Install libftd and associated
header files.

Hello,

On Mon, 25 Jul 2016 15:52:27 -0400, David Raeman wrote:
> The dtc package currently does not install libfdt for the host install.
> It can be useful to have libfdt on the host, such as for building QEMU 
> with the --enable-fdt configure switch.
> 
> Signed-off-by: David Raeman <draeman@bbn.com>

We already have the support for --enable-fdt for the host qemu:

ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu HOST_QEMU_OPTS +=
--enable-system --enable-fdt HOST_QEMU_DEPENDENCIES += host-dtc else
HOST_QEMU_OPTS += --disable-system endif

Do you mean that it doesn't work?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
