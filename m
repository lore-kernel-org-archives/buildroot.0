From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 14:03:46 +0000
Subject: [Buildroot] [Bug 11706] binman (U-boot tool) cannot find libfdt
 "binman: No module named _libfdt" if python3 selected
In-Reply-To: <bug-11706-163@https.bugs.busybox.net/>
References: <bug-11706-163@https.bugs.busybox.net/>
Message-ID: <bug-11706-163-2fxe19rZRF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11706

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I can indeed reproduce the issue with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBVIPS=y
# BR2_TARGET_ROOTFS_TAR is not set

The problem is that binman has the following shebang:

#!/usr/bin/env python2

When python3 is selected for the target, we build host-python3, and we install
all host-Python modules for host-python3. So when binman uses python2, it uses
the system-provided python2, which does not have those additional Python
modules installed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
