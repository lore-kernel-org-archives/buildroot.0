From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 11:11:31 -0600
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <20190204165557.2160-1-peter@korsgaard.com>
References: <20190204165557.2160-1-peter@korsgaard.com>
Message-ID: <CANQCQpZziEBsTFH_Vi8u9gGWpfCTxaJ+RSzcz9PKFy47eqdq7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, Feb 4, 2019 at 10:56 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Build for x86-64 as public containers in general are only available for
> x86-64.  Docker needs a number of kernel options enabled, so use a custom
> kernel config based on the qemu one.
>
> Docker needs entropy at startup, so enable the virtio-rng-pci device to
> expose entropy to the guest.

Another option is enabling BR2_PACKAGE_HAVEGED to let the target compensate.

> The default RAM amount (128M) is not enough to
> run docker / docker-compose, so bump to 512MB.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Very cool, I was just setting up a similar test case.  Few notes below.

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
>  .gitlab-ci.yml                                     |   1 +
>  support/testing/conf/docker-compose-kernel.config  | 103 +++++++++++++++++++++
>  support/testing/conf/docker-compose.yml            |   4 +
>  .../testing/tests/package/test_docker_compose.py   |  70 ++++++++++++++
>  4 files changed, 178 insertions(+)
>  create mode 100644 support/testing/conf/docker-compose-kernel.config
>  create mode 100644 support/testing/conf/docker-compose.yml
>  create mode 100644 support/testing/tests/package/test_docker_compose.py
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 8f1e4ae804..69d6291039 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -318,6 +318,7 @@ tests.init.test_systemd.TestInitSystemSystemdRwFull: *runtime_test
>  tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: *runtime_test
>  tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
>  tests.package.test_atop.TestAtop: *runtime_test
> +tests.package.test_docker_compose.TestDockerCompose: *runtime_test
>  tests.package.test_dropbear.TestDropbear: *runtime_test
>  tests.package.test_ipython.TestIPythonPy2: *runtime_test
>  tests.package.test_ipython.TestIPythonPy3: *runtime_test
> diff --git a/support/testing/conf/docker-compose-kernel.config b/support/testing/conf/docker-compose-kernel.config
> new file mode 100644
> index 0000000000..9468ef8db8
> --- /dev/null
> +++ b/support/testing/conf/docker-compose-kernel.config
> @@ -0,0 +1,103 @@
> +# CONFIG_SWAP is not set
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +# CONFIG_CROSS_MEMORY_ATTACH is not set
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_CGROUPS=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +# CONFIG_COMPAT_BRK is not set
> +# CONFIG_X86_EXTENDED_PLATFORM is not set
> +CONFIG_IOSF_MBI=y
> +CONFIG_MCORE2=y
> +# CONFIG_X86_MCE is not set
> +# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> +CONFIG_LEGACY_VSYSCALL_NONE=y
> +# CONFIG_SUSPEND is not set
> +# CONFIG_ACPI is not set
> +CONFIG_CPU_IDLE=y
> +CONFIG_PCI_MSI=y
> +# CONFIG_VIRTUALIZATION is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +# CONFIG_MQ_IOSCHED_DEADLINE is not set
> +# CONFIG_MQ_IOSCHED_KYBER is not set
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_TRANSPARENT_HUGEPAGE=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_ADVANCED_ROUTER=y
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_IPV6 is not set
> +CONFIG_NETFILTER=y
> +CONFIG_NF_CONNTRACK=y
> +# CONFIG_NF_CONNTRACK_PROCFS is not set
> +# CONFIG_NF_CT_PROTO_DCCP is not set
> +# CONFIG_NF_CT_PROTO_SCTP is not set
> +# CONFIG_NF_CT_PROTO_UDPLITE is not set
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
> +CONFIG_NETFILTER_XT_MATCH_IPVS=y
> +CONFIG_IP_VS=y
> +CONFIG_IP_VS_RR=y
> +CONFIG_IP_VS_NFCT=y
> +CONFIG_IP_NF_IPTABLES=y
> +CONFIG_IP_NF_FILTER=y
> +CONFIG_IP_NF_NAT=y
> +CONFIG_IP_NF_TARGET_MASQUERADE=y
> +CONFIG_BRIDGE=y
> +# CONFIG_BRIDGE_IGMP_SNOOPING is not set
> +# CONFIG_WIRELESS is not set
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_NETDEVICES=y
> +CONFIG_DUMMY=y
> +CONFIG_MACVLAN=y
> +CONFIG_VXLAN=y
> +CONFIG_VETH=y
> +CONFIG_VIRTIO_NET=y
> +# CONFIG_ETHERNET is not set
> +# CONFIG_WLAN is not set
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +CONFIG_VT_HW_CONSOLE_BINDING=y
> +# CONFIG_DEVMEM is not set
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +# CONFIG_SERIAL_8250_LPSS is not set
> +# CONFIG_SERIAL_8250_MID is not set
> +# CONFIG_HW_RANDOM_INTEL is not set
> +# CONFIG_HW_RANDOM_AMD is not set
> +# CONFIG_HW_RANDOM_VIA is not set
> +CONFIG_HW_RANDOM_VIRTIO=y
> +# CONFIG_DEVPORT is not set
> +# CONFIG_HWMON is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_RTC_CLASS=y
> +CONFIG_VIRTIO_PCI=y
> +# CONFIG_VIRTIO_PCI_LEGACY is not set
> +# CONFIG_X86_PLATFORM_DEVICES is not set
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_EXT4_FS=y
> +CONFIG_OVERLAY_FS=y
> +CONFIG_OVERLAY_FS_REDIRECT_DIR=y
> +CONFIG_TMPFS=y
> +# CONFIG_MISC_FILESYSTEMS is not set
> +# CONFIG_NETWORK_FILESYSTEMS is not set
> +CONFIG_KEYS=y
> +CONFIG_SECURITYFS=y
> +# CONFIG_CRYPTO_ECHAINIV is not set
> +# CONFIG_CRYPTO_HW is not set
> +# CONFIG_UNUSED_SYMBOLS is not set
> +CONFIG_UNWINDER_FRAME_POINTER=y

There is a script "./build/docker-engine*/contrib/check-config.sh"
which could be copied over to the target and used to do a docker
configuration check as part of the test case (would need config.gz
enabled).  I had started to add this as a br2-external post script, I
could send something after this merges.


> diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
> new file mode 100644
> index 0000000000..49ff2677da
> --- /dev/null
> +++ b/support/testing/conf/docker-compose.yml
> @@ -0,0 +1,4 @@
> +version: '3'
> +services:
> +  busybox:
> +    image: "busybox:latest"
> diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
> new file mode 100644
> index 0000000000..8bf3ae00b5
> --- /dev/null
> +++ b/support/testing/tests/package/test_docker_compose.py
> @@ -0,0 +1,70 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestDockerCompose(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_x86_64=y
> +        BR2_x86_core2=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.05.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
> +        BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +        # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
> +        BR2_PACKAGE_CA_CERTIFICATES=y
> +        BR2_PACKAGE_CGROUPFS_MOUNT=y
> +        BR2_PACKAGE_DOCKER_CLI=y
> +        BR2_PACKAGE_DOCKER_COMPOSE=y
> +        BR2_PACKAGE_DOCKER_ENGINE=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(
> +            infra.filepath("tests/package/copy-sample-script-to-target.sh"),
> +            infra.filepath("conf/docker-compose.yml"),
> +            infra.filepath("conf/docker-compose-kernel.config"))
> +
> +    def wait_for_dockerd(self):
> +        # dockerd takes a while to start up
> +        _, _ = self.emulator.run('while [ ! -e /var/run/docker.sock ]; do sleep 1; done', 120)
> +
> +    def docker_test(self):
> +        # will download container if not available, which may take some time
> +        _, exit_code = self.emulator.run('docker run --rm busybox:latest /bin/true', 120)
> +        self.assertEqual(exit_code, 0)

Another way to test could be to directly grep /proc/self/cgroups for
the presence of docker.  Does the return code cover that the container
was all the way up?

Unrelated to above, I ran into errors like the following but I was
targeting my build for aarch64 in my runtime test.

Building Go toolchain3 using go_bootstrap and Go toolchain2.
Building packages and commands for host, linux/amd64.
Building packages and commands for target, linux/arm64.
# cmd/trace
/accts/mlweber1/wip/TestDocker/build/host-go-1.11.5/pkg/tool/linux_amd64/link:
running /accts/mlweber1/wip/TestDocker/host/bin/aarch64-linux-gnu-gcc
failed: exit status 1
aarch64-linux-gnu-gcc: error: unrecognized command line option
'-Qunused-arguments'; did you mean '-Wunused-parameter'?
make[1]: *** [package/pkg-generic.mk:233:
/accts/mlweber1/wip/TestDocker/build/host-go-1.11.5/.stamp_built]
Error 2

Matt
