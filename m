From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Mar 2020 21:00:01 +0000
Subject: [Buildroot] [Bug 12596] New: host-e2fsprogs: tune2fs
 incompatibility on older glibc version
Message-ID: <bug-12596-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12596

            Bug ID: 12596
           Summary: host-e2fsprogs: tune2fs incompatibility on older glibc
                    version
           Product: buildroot
           Version: 2019.02.9
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ryan.barnett at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When host-e2fsprogs is selected and build as part of a buildroot configuration
on a host system which has a glibc version >= 2.25, the tune2fs command will
require a glibc version >= 2.25. This is an issue if an SDK is created and then
later run onto a system which has a glibc version < 2.25 as there will be error
such as:

tune2fs: /lib/x86_64-linux-gnu/libc.so.6: version GLIBC_2.25 not found
(required by /opt/br-sdk/lib/libblkid.so.1)

This can be reproduced using the following a Ubuntu 18.04 host to build an SDK
from the following configuration:

BR2_x86_i686=y
# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2018.11-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
# BR2_ENABLE_LOCALE_PURGE is not set
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
# BR2_ENABLE_LOCALE_PURGE is not set
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_E2FSPROGS=y

Then run:

make sdk

After the SDK is created, utilize an Ubuntu 16.04 machine to extract the SDK
tar.gz file and run:

cd <br-sdk>
./relocate-sdk.sh
./sbin/tune2fs --help

However, if the SDK was created on a Ubuntu 16.04 and relocated to Ubuntu
18.04, then tune2fs will work fine. 

What are the options for forcing e2fsprogs to compile/work with the older
version of glibc?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
