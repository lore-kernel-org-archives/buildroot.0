From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 10:13:10 +0100
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <CANQCQpZziEBsTFH_Vi8u9gGWpfCTxaJ+RSzcz9PKFy47eqdq7Q@mail.gmail.com>
 (Matthew Weber's message of "Mon, 4 Feb 2019 11:11:31 -0600")
References: <20190204165557.2160-1-peter@korsgaard.com>
 <CANQCQpZziEBsTFH_Vi8u9gGWpfCTxaJ+RSzcz9PKFy47eqdq7Q@mail.gmail.com>
Message-ID: <87womeppi1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Peter,
 > On Mon, Feb 4, 2019 at 10:56 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> Build for x86-64 as public containers in general are only available for
 >> x86-64.  Docker needs a number of kernel options enabled, so use a custom
 >> kernel config based on the qemu one.
 >> 
 >> Docker needs entropy at startup, so enable the virtio-rng-pci device to
 >> expose entropy to the guest.

 > Another option is enabling BR2_PACKAGE_HAVEGED to let the target compensate.

True, but given that most real systems have a hw rng, this is probably
closer to real life.

 >> The default RAM amount (128M) is not enough to
 >> run docker / docker-compose, so bump to 512MB.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Very cool, I was just setting up a similar test case.  Few notes below.

 > Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 > There is a script "./build/docker-engine*/contrib/check-config.sh"
 > which could be copied over to the target and used to do a docker
 > configuration check as part of the test case (would need config.gz
 > enabled).  I had started to add this as a br2-external post script, I
 > could send something after this merges.

Yes, I had originally used this script to figure out the kernel options
to use:

From the moby check-config script:
    (https://github.com/moby/moby/blob/e2de2123399f494cb41a4cb62392999c80c2e99c/contrib/check-config.sh)

    info: reading kernel config from /proc/config.gz ...

    Generally Necessary:
    - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
    - CONFIG_NAMESPACES: enabled
    - CONFIG_NET_NS: enabled
    - CONFIG_PID_NS: enabled
    - CONFIG_IPC_NS: enabled
    - CONFIG_UTS_NS: enabled
    - CONFIG_CGROUPS: enabled
    - CONFIG_CGROUP_CPUACCT: enabled
    - CONFIG_CGROUP_DEVICE: enabled
    - CONFIG_CGROUP_FREEZER: enabled
    - CONFIG_CGROUP_SCHED: enabled
    - CONFIG_CPUSETS: enabled
    - CONFIG_MEMCG: enabled
    - CONFIG_KEYS: enabled
    - CONFIG_VETH: enabled
    - CONFIG_BRIDGE: enabled
    - CONFIG_BRIDGE_NETFILTER: enabled
    - CONFIG_NF_NAT_IPV4: enabled
    - CONFIG_IP_NF_FILTER: enabled
    - CONFIG_IP_NF_TARGET_MASQUERADE: enabled
    - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled
    - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled
    - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled
    - CONFIG_IP_NF_NAT: enabled
    - CONFIG_NF_NAT: enabled
    - CONFIG_NF_NAT_NEEDED: enabled
    - CONFIG_POSIX_MQUEUE: enabled

    Optional Features:
    - CONFIG_USER_NS: missing
    - CONFIG_SECCOMP: enabled
    - CONFIG_CGROUP_PIDS: enabled
    - CONFIG_MEMCG_SWAP: missing
    - CONFIG_MEMCG_SWAP_ENABLED: missing
    - CONFIG_LEGACY_VSYSCALL_NONE: enabled
        (containers using eglibc <= 2.13 will not work. Switch to
         "CONFIG_VSYSCALL_[NATIVE|EMULATE]" or use "vsyscall=[native|emulate]"
         on kernel command line. Note that this will disable ASLR for the,
         VDSO which may assist in exploiting security vulnerabilities.)
    - CONFIG_BLK_CGROUP: enabled
    - CONFIG_BLK_DEV_THROTTLING: missing
    - CONFIG_IOSCHED_CFQ: missing
    - CONFIG_CFQ_GROUP_IOSCHED: missing
    - CONFIG_CGROUP_PERF: missing
    - CONFIG_CGROUP_HUGETLB: missing
    - CONFIG_NET_CLS_CGROUP: missing
    - CONFIG_CGROUP_NET_PRIO: missing
    - CONFIG_CFS_BANDWIDTH: missing
    - CONFIG_FAIR_GROUP_SCHED: enabled
    - CONFIG_RT_GROUP_SCHED: missing
    - CONFIG_IP_VS: enabled
    - CONFIG_IP_VS_NFCT: enabled
    - CONFIG_IP_VS_RR: enabled
    - CONFIG_EXT4_FS: enabled
    - CONFIG_EXT4_FS_POSIX_ACL: missing
    - CONFIG_EXT4_FS_SECURITY: missing
        enable these ext4 configs if you are using ext3 or ext4 as backing filesystem
    - Network Drivers:
      - "overlay":
        - CONFIG_VXLAN: enabled
          Optional (for encrypted networks):
          - CONFIG_CRYPTO: enabled
          - CONFIG_CRYPTO_AEAD: missing
          - CONFIG_CRYPTO_GCM: missing
          - CONFIG_CRYPTO_SEQIV: missing
          - CONFIG_CRYPTO_GHASH: missing
          - CONFIG_XFRM: missing
          - CONFIG_XFRM_USER: missing
          - CONFIG_XFRM_ALGO: missing
          - CONFIG_INET_ESP: missing
          - CONFIG_INET_XFRM_MODE_TRANSPORT: missing
      - "ipvlan":
        - CONFIG_IPVLAN: missing
      - "macvlan":
        - CONFIG_MACVLAN: enabled
        - CONFIG_DUMMY: enabled
      - "ftp,tftp client in container":
        - CONFIG_NF_NAT_FTP: missing
        - CONFIG_NF_CONNTRACK_FTP: missing
        - CONFIG_NF_NAT_TFTP: missing
        - CONFIG_NF_CONNTRACK_TFTP: missing
    - Storage Drivers:
      - "aufs":
        - CONFIG_AUFS_FS: missing
      - "btrfs":
        - CONFIG_BTRFS_FS: missing
        - CONFIG_BTRFS_FS_POSIX_ACL: missing
      - "devicemapper":
        - CONFIG_BLK_DEV_DM: missing
        - CONFIG_DM_THIN_PROVISIONING: missing
      - "overlay":
        - CONFIG_OVERLAY_FS: enabled
      - "zfs":
        - /dev/zfs: missing
        - zfs command: missing
        - zpool command: missing

    Limits:
    - /proc/sys/kernel/keys/root_maxkeys: 1000000

I did indeed afterwards clean up the kernel config a bit, and dropped
CONFIG_IKCONFIG.


 >> diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
 >> new file mode 100644
 >> index 0000000000..49ff2677da
 >> --- /dev/null
 >> +++ b/support/testing/conf/docker-compose.yml
 >> @@ -0,0 +1,4 @@
 >> +version: '3'
 >> +services:
 >> +  busybox:
 >> +    image: "busybox:latest"
 >> diff --git a/support/testing/tests/package/test_docker_compose.py
 >> b/support/testing/tests/package/test_docker_compose.py
 >> new file mode 100644
 >> index 0000000000..8bf3ae00b5
 >> --- /dev/null
 >> +++ b/support/testing/tests/package/test_docker_compose.py
 >> @@ -0,0 +1,70 @@
 >> +import os
 >> +
 >> +import infra.basetest
 >> +
 >> +
 >> +class TestDockerCompose(infra.basetest.BRTest):
 >> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
 >> +        """
 >> +        BR2_x86_64=y
 >> +        BR2_x86_core2=y
 >> +        BR2_TOOLCHAIN_EXTERNAL=y
 >> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 >> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 >> +
 >> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.05.tar.bz2"
 >> +        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 >> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 >> +        BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 >> +        # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 >> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
 >> +        BR2_SYSTEM_DHCP="eth0"
 >> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
 >> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
 >> +        BR2_LINUX_KERNEL=y
 >> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 >> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 >> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 >> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
 >> +        BR2_PACKAGE_CA_CERTIFICATES=y
 >> +        BR2_PACKAGE_CGROUPFS_MOUNT=y
 >> +        BR2_PACKAGE_DOCKER_CLI=y
 >> +        BR2_PACKAGE_DOCKER_COMPOSE=y
 >> +        BR2_PACKAGE_DOCKER_ENGINE=y
 >> +        BR2_TARGET_ROOTFS_EXT2=y
 >> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
 >> +        # BR2_TARGET_ROOTFS_TAR is not set
 >> +        """.format(
 >> +            infra.filepath("tests/package/copy-sample-script-to-target.sh"),
 >> +            infra.filepath("conf/docker-compose.yml"),
 >> +            infra.filepath("conf/docker-compose-kernel.config"))
 >> +
 >> +    def wait_for_dockerd(self):
 >> +        # dockerd takes a while to start up
 >> +        _, _ = self.emulator.run('while [ ! -e /var/run/docker.sock ]; do sleep 1; done', 120)
 >> +
 >> +    def docker_test(self):
 >> +        # will download container if not available, which may take some time
 >> +        _, exit_code = self.emulator.run('docker run --rm busybox:latest /bin/true', 120)
 >> +        self.assertEqual(exit_code, 0)

 > Another way to test could be to directly grep /proc/self/cgroups for
 > the presence of docker.  Does the return code cover that the container
 > was all the way up?

The return code is the return code from executing /bin/true inside the
container, so it should only succeed if we were really able to
successfully execute it.


 > Unrelated to above, I ran into errors like the following but I was
 > targeting my build for aarch64 in my runtime test.

 > Building Go toolchain3 using go_bootstrap and Go toolchain2.
 > Building packages and commands for host, linux/amd64.
 > Building packages and commands for target, linux/arm64.
 > # cmd/trace
 > /accts/mlweber1/wip/TestDocker/build/host-go-1.11.5/pkg/tool/linux_amd64/link:
 > running /accts/mlweber1/wip/TestDocker/host/bin/aarch64-linux-gnu-gcc
 > failed: exit status 1
 > aarch64-linux-gnu-gcc: error: unrecognized command line option
 > '-Qunused-arguments'; did you mean '-Wunused-parameter'?
 > make[1]: *** [package/pkg-generic.mk:233:
 > /accts/mlweber1/wip/TestDocker/build/host-go-1.11.5/.stamp_built]
 > Error 2

Hmm, I haven't seen such error before. Googling around, it seems to be a
command line argument supported by clang:

https://github.com/Ericsson/codechecker/issues/985

-- 
Bye, Peter Korsgaard
