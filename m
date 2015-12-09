From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed,  9 Dec 2015 15:11:50 +0100
Subject: [Buildroot] [PATCH v2 0/3] dpdk: new package
In-Reply-To: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series introduces the DPDK package into Buildroot. The DPDK
library (www.dpdk.org) allows high-speed packet sending/receiving
while bypassing the Linux Kernel. It allows to reach a high throughput
for 10-100 Gbps networks on the x86 platform.

The ARM ports can be tested by

 qemu_aarch64_virt_defconfig
 qemu_arm_vexpress_defconfig

I did not test, how it works with x86 as I do not use Buildroot
for this.

There are unfortunately some pitfalls:

* There is a new install infra in DPDK that is not reflected in
  this patch set. I will send v3 of this patch set that uses the
  new install infra after I make the intergration.

* The DPDK may require to enable PCI, MSIX, UIO in the Linux Kernel
  (some defconfigs does not include as default and it is platform
  dependent as ARMv7 almost does not use PCI).

* When building PCAP PMD driver, the libpcap is required (partially
  fixed as suggested by Arnout).

* Some tools the DPDK provides depend on Python(2) so the user has
  to enable it to install those.

The DPDK tests require pexpect and ptyprocess python packages to run
so they are included.

Jan Viktorin (3):
  python-ptyprocess: new package
  python-pexpect: new package
  dpdk: new package

 package/Config.in                              |   3 +
 package/dpdk/Config.in                         |  47 +++++++++++
 package/dpdk/dpdk.hash                         |   4 +
 package/dpdk/dpdk.mk                           | 112 +++++++++++++++++++++++++
 package/python-pexpect/Config.in               |  10 +++
 package/python-pexpect/python-pexpect.mk       |  14 ++++
 package/python-ptyprocess/Config.in            |   7 ++
 package/python-ptyprocess/python-ptyprocess.mk |  13 +++
 8 files changed, 210 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk
 create mode 100644 package/python-pexpect/Config.in
 create mode 100644 package/python-pexpect/python-pexpect.mk
 create mode 100644 package/python-ptyprocess/Config.in
 create mode 100644 package/python-ptyprocess/python-ptyprocess.mk

-- 
2.6.3
