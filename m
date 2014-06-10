From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 12:20:06 +0000 (UTC)
Subject: [Buildroot] [Bug 7184] supervisord depends on libxml2 implicitly
In-Reply-To: <bug-7184-163@https.bugs.busybox.net/>
References: <bug-7184-163@https.bugs.busybox.net/>
Message-ID: <20140610122006.0C69A9CFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7184

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-06-10 12:20:05 UTC ---
(In reply to comment #2)
> I made a build for qemu with only supervisord, and during boot I get another
> error:
> 
> Starting supervisord: Traceback (most recent call last):
>   File "/usr/bin/supervisord", line 5, in <module>
>     from pkg_resources import load_entry_point
> ImportError: No module named pkg_resources

After explicitly adding python-setuptools to the configuration, this error
disappeared. This means that supervisord has a missing runtime dependency on
python-setuptools.

Note that supervisord starts correctly after this, even without xml in my
configuration. Please clarify which steps are needed to reproduce the problem.

The defconfig I am using is:
BR2_x86_64=y
BR2_DL_DIR="~/repo/contrib/dl"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_SETUPTOOLS=y
BR2_PACKAGE_SUPERVISOR=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
