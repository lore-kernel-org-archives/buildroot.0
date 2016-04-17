From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 16:38:14 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160417163814.03b67f53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Apr 2016 19:08:10 +0200, Jan Viktorin wrote:
> This patch introduces support of the DPDK library (www.dpdk.org) into
> Buildroot. DPDK is a library for high-speed packet sending/receiving
> while bypassing the Linux Kernel. It allows to reach a high throughput
> for 10-100 Gbps networks on the x86 platform.
> 
> The package compiles and installs DPDK libraries on the target and
> staging and allows to compile other applications depending on the DPDK
> library. It can also install some basic tools the DPDK provides
> (testpmd, python scripts, test suite).
> 
> The patch assumes DPDK 16.04. This version contains support for the ARM
> architecture. The ARM ports can be tested by
> 
>  qemu_aarch64_virt_defconfig
>  qemu_arm_vexpress_defconfig
> 
> The included hash was calculated locally by downloading the tar.gz archives by
> hand.
> 
> There are unfortunately some pitfalls:
> 
> * it may require to enable PCI, MSIX, UIO in the Linux Kernel
>   (some defconfigs does not include as default and it is platform
>   dependent as ARMv7 almost does not use PCI)
> 
> * when building PCAP PMD driver, the libpcap is required (partially
>   fixed as suggested by Arnout)
> 
> * some tools the DPDK provides depend on Python(2) so the user has
>   to enable it to install those
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>

Thanks for this new iteration. Unfortunately, it still doesn't install
any kernel module to my system. At install time, your addition of the
install-kmod target simply does:

make[3]: Nothing to be done for 'install-kmod'.

Moreover, are you sure having a Linux kernel already built is always
necessary? My understanding is that while DPDK has its own kernel
modules, it can also rely on the kernel generic uio_pci_generic module.
In this case, DPDK only needs to build userspace components, and no
kernel component, which would make the dependency on Linux optional.

From the DPDK documentation: "To run any DPDK application, a suitable
uio module can be loaded into the running kernel. In many cases, the
standard uio_pci_generic module included in the Linux kernel can
provide the uio capability.".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
