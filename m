From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 29 Jul 2019 01:35:54 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_12046=5D_Can=E2=80=99t_login_as_roo?=
 =?utf-8?q?t_user_after_upgrading_to_buildroot_2019=2E02?=
In-Reply-To: <bug-12046-163@https.bugs.busybox.net/>
References: <bug-12046-163@https.bugs.busybox.net/>
Message-ID: <bug-12046-163-sKBKL8TOaR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12046

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|NEEDINFO                    |INVALID

--- Comment #6 from Carlos Santos <unixmania@gmail.com> ---
(In reply to liadekel123 from comment #5)

OK, I was able to reproduce the problem with the following defconfig:

BR2_x86_64=y
BR2_DL_DIR="$(HOME)/src"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2018.11-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_SYSTEM_ENABLE_NLS=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

123456789012345678901234567890123456789012345678901234567890123456789012

The problem happens with Busybox login:

- If linux-pam is NOT selected
  - If /etc/securetty does not exist root can log in without restrictions
  - If /etc/securetty exists then root can log in only on terminals listed
there
- If linux-pam is selected
  - If pam_securetty is NOT enabled in /etc/pam.d/login then /etc/securetty is
ignored
  - If pam_securetty is enabled with "auth required pam_securetty.so"
    - If /etc/securetty does not exist root can log in without restrictions
    - If /etc/securetty exists then can log in only on terminals listed there

Considering that by default Buildroot does NOT install a /etc/securetty file
I'm keeping this bug as RESOLVED but changing the resolution reason from
NEEDINFO to INVALID.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
