From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2020 12:42:15 +0000
Subject: [Buildroot] [Bug 13101] New: BR audit2allow support
Message-ID: <bug-13101-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13101

            Bug ID: 13101
           Summary: BR audit2allow support
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: surf_fanatico at yahoo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Overview:
===========
BR audit2allow support is not working properly as when run there are errors
produced.  There are other issues seen with some utilities apparently not
supported.

This issue was first reported in this thread:
https://lists.busybox.net/pipermail/buildroot/2020-July/thread.html#286990

**********************************
Steps to Reproduce:
===================
Add selinux to a working linux-5.1.9 build, so far i have added the following
packages:

+BR2_PACKAGE_REFPOLICY=y
+BR2_PACKAGE_SETOOLS=y
+BR2_PACKAGE_POLICYCOREUTILS=y
+BR2_PACKAGE_SELINUX_PYTHON=y
+BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y 

The build completes with the kernel, rootfs and dtb.  SELinux support is seen
in that the Z option works with ps, ls and labels etc are seen.

Actual Results
===============
Once the build is tftp's to the device the following errors are observed:

1- selinux module not found in audit2allow
$ audit2allow -a

Traceback (most recent call last):File "/usr/bin/audit2allow", line 25, in
<module>import sepolgen.audit as auditFile
"usr/lib/python3.7/sepolgen/audit.py", line 23, in <module>File
"usr/lib/python3.7/sepolgen/refpolicy.py", line 21, in
<module>ModuleNotFoundError: No module named 'selinux'
buildroot/package/selinux-python$ cat selinux-python.hash#
https://github.com/SELinuxProject/selinux/wiki/Releasessha256
3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde
selinux-python-2.9.tar.gz
# ls__init__.pyc      interfaces.pyc    output.pyc        util.pycaccess.pyc   
    lex.pyc           policygen.pyc     yacc.pycaudit.pyc         matching.pyc 
    refparser.pycclassperms.pyc    module.pyc        refpolicy.pycdefaults.pyc 
    objectmodel.pyc   sepolgeni18n.pyc# pwd/usr/lib/python3.7/sepolgen
==> I do see selinux.py in the build directory but not in the target rootfs as
a pyc or otherwise:
buildroot/output/build/host-libselinux-2.9/src/selinux.pybuildroot/output/build/libselinux-2.9/src/selinux.py
Unfortunately this is a bad problem because audit2allow is practically a
requirement to be able to generate new policies.

2- /var/lib/selinux directory missing
$ semodule -l
libsemanage.semanage_create_store: Could not create module store at
/var/lib/selinux/targeted. (No such file or
directory).libsemanage.semanage_direct_connect: could not establish direct
connection (No such file or directory).semodule: Could not connect to policy
handler
ls /var/lib/selinux
ls: /var/lib/selinux: No such file or directory
==> looks like the directory can just be added

mkdir /var/lib/selinux
semodule -l
No modules.
sestatus | grep LoadedLoaded policy name: targeted
ls -alZ /etc/selinuxtotal 8drwxr-xr-x 3 root root system_u:object_r:root_t 0
Jul 13 2020 .drwxr-xr-x 18 root root system_u:object_r:root_t 0 Jan 1 00:00
..-rwxr-xr-x 1 root root system_u:object_r:root_t 311 Jul 13 2020 configrw-rr-
1 root root system_u:object_r:root_t 1904 Jul 13 2020 semanage.confdrwxr-xr-x 5
root root system_u:object_r:root_t 0 Jul 13 2020 targeted

Expected Results
================
audit2allow should work and be able to be run without errors
other selinux utilities should be removed if not supported or should be fixed

========================================================
Additional documentation from the thread below:
 Hi, 

.config settings included Thx
    On Thursday, July 16, 2020, 05:05:27 AM EDT, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:  

 On Thu, 16 Jul 2020 10:44:03 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> > Which Python version have you chosen ? Python 3.x or Python 2.x, i.e
> > BR2_PACKAGE_PYTHON=y or BR2_PACKAGE_PYTHON3=y ?  
> 
> I did not encounter such an issue, but I only used versions 3.0+. If I
> think about something, I'll let you know.

Hm, I see that package/selinux-python/Config.in has:

        depends on !BR2_PACKAGE_PYTHON
        select BR2_PACKAGE_PYTHON3

so anyway, this is all only Python 3.x.
So yeah, I'm not sure how Tomas got into this build issue. Tomas: could
share the Buildroot .config being used ?

[TA] Here is the python stuff:
# BR2_PACKAGE_PYTHON is not setBR2_PACKAGE_PYTHON3=y#
BR2_PACKAGE_PYTHON3_PY_ONLY is not setBR2_PACKAGE_PYTHON3_PYC_ONLY=y#
BR2_PACKAGE_PYTHON3_PY_PYC is not set
## core python3 modules#
## The following modules are unusual or require extra libraries##
BR2_PACKAGE_PYTHON3_BZIP2 is not set# BR2_PACKAGE_PYTHON3_CODECSCJK is not set#
BR2_PACKAGE_PYTHON3_CURSES is not set# BR2_PACKAGE_PYTHON3_DECIMAL is not set#
BR2_PACKAGE_PYTHON3_OSSAUDIODEV is not set# BR2_PACKAGE_PYTHON3_READLINE is not
set# BR2_PACKAGE_PYTHON3_SSL is not set# BR2_PACKAGE_PYTHON3_SQLITE is not set#
BR2_PACKAGE_PYTHON3_PYEXPAT is not set# BR2_PACKAGE_PYTHON3_XZ is not set
BR2_PACKAGE_PYTHON3_UNICODEDATA=yBR2_PACKAGE_PYTHON3_ZLIB=y
[TA] Here are other settings from our .config:

BR2_powerpc=yBR2_powerpc_e500mc=yBR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL)/patches"BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=yBR2_TOOLCHAIN_HEADERS_AT_LEAST="5.1"BR2_TOOLCHAIN_BUILDROOT_GLIBC=yBR2_TOOLCHAIN_BUILDROOT_CXX=yBR2_GCC_VERSION_5_X=yBR2_GCC_TARGET_CPU="e500mc"BR2_PACKAGE_MTD=y#
BR2_PACKAGE_MTD_FLASH_UNLOCK is not set# BR2_PACKAGE_MTD_MTD_DEBUG is not
setBR2_PACKAGE_LIBFFI=yBR2_PACKAGE_LIBCAP=yBR2_PACKAGE_LIBSECCOMP=yBR2_PACKAGE_LIBSELINUX=yBR2_PACKAGE_REFPOLICY=yBR2_PACKAGE_SETOOLS=yBR2_PACKAGE_POLICYCOREUTILS=yBR2_PACKAGE_PCRE_32=yBR2_PACKAGE_LRZSZ=yBR2_PACKAGE_DAEMON=yBR2_PACKAGE_LXC=yBR2_PACKAGE_DROPBEAR=yBR2_PACKAGE_DROPBEAR_CLIENT=yBR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="$(BR2_EXTERNAL)/package/dropbear/localoptions.h"BR2_PACKAGE_IPERF3=y#
BR2_PACKAGE_DROPBEAR_WTMP is not set# BR2_PACKAGE_DROPBEAR_LASTLOG is not set#
BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not
setBR2_PACKAGE_OPENSSH=yBR2_PACKAGE_LIBOPENSSL_BIN=yBR2_PACKAGE_LIBOPENSSL_ENGINES=yBR2_PACKAGE_HAVE_CRYPTODEV=yBR2_PACKAGE_CRYPTODEV_LINUX=yBR2_PACKAGE_DBUS=yBR2_PACKAGE_EXPAT=yBR2_PACKAGE_NSS_MDNS=yBR2_PACKAGE_LIBDAEMON=yBR2_PACKAGE_AVAHI=yBR2_PACKAGE_AVAHI_AUTOIPD=yBR2_PACKAGE_AVAHI_DAEMON=yBR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY=yBR2_PACKAGE_STRACE=yBR2_PACKAGE_I2C_TOOLS=yBR2_PACKAGE_CRYPTODEV=yBR2_PACKAGE_PKC_HOST=yBR2_PACKAGE_PKC_FIRMWARE=yBR2_PACKAGE_FM_UCODE_FIRMWARE=yBR2_PACKAGE_FM_UCODE_FIRMWARE_FILE="fsl_fman_ucode_CPU.bin"BR2_PACKAGE_SUDO=yBR2_PACKAGE_KMOD=yBR2_PACKAGE_KMOD_TOOLS=yBR2_PACKAGE_MEMTESTER=yBR2_PACKAGE_LIBGPIOD=yBR2_PACKAGE_LIBGPIOD_TOOLS=y
# BR2_PACKAGE_PYTHON is not setBR2_PACKAGE_PYTHON3=y#
BR2_PACKAGE_PYTHON3_PY_ONLY is not setBR2_PACKAGE_PYTHON3_PYC_ONLY=y#
BR2_PACKAGE_PYTHON3_PY_PYC is not set
## core python3 modules#
## The following modules are unusual or require extra libraries##
BR2_PACKAGE_PYTHON3_BZIP2 is not set# BR2_PACKAGE_PYTHON3_CODECSCJK is not set#
BR2_PACKAGE_PYTHON3_CURSES is not set# BR2_PACKAGE_PYTHON3_DECIMAL is not set#
BR2_PACKAGE_PYTHON3_OSSAUDIODEV is not set# BR2_PACKAGE_PYTHON3_READLINE is not
set# BR2_PACKAGE_PYTHON3_SSL is not set# BR2_PACKAGE_PYTHON3_SQLITE is not set#
BR2_PACKAGE_PYTHON3_PYEXPAT is not set# BR2_PACKAGE_PYTHON3_XZ is not set
BR2_PACKAGE_PYTHON3_UNICODEDATA=yBR2_PACKAGE_PYTHON3_ZLIB=y
BR2_TARGET_ROOTFS_CPIO=yBR2_TARGET_ROOTFS_CPIO_XZ=yBR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y#
BR2_TARGET_ROOTFS_TAR is not
setBR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL)/board/COMPANY/BOARD/post-image.sh"BR2_ROOTFS_USERS_TABLES="$(BR2_EXTERNAL)/board/COMPANY/BOARD/users.config"BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL)/board/COMPANY/BOARD/rootfs-overlay"BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y


> > > 2- /var/lib/selinux directory missing
> > > $ semodule -llibsemanage.semanage_create_store: Could not create module store at /var/lib/selinux/targeted. (No such file or directory).libsemanage.semanage_direct_connect: could not establish direct connection (No such file or directory).semodule: Could not connect to policy handler
> > > ls /var/lib/selinuxls: /var/lib/selinux: No such file or directory  
> > > ==> looks like the directory can just be added    
> > 
> > On this one, I'm not sure, would need testing. I don't immediately see
> > anything creating /var/lib/selinux in Buildroot, so if it's not done by
> > the build system of one the SELinux packages, indeed /var/lib/selinux
> > will be missing.
> > 
> > Antoine: you are working on building systems with SELinux supports, did
> > you face the /var/lib/selinux missing problem ? Or perhaps because
> > you're testing with systemd, the situation is different ?  
> 
> Using a modular policy at runtime isn't supported by the current
> refpolicy support in BR. When playing with it, I had similar issues with
> directories missing. Also, I don't think adding those directories alone
> will make it working, there's probably more work to do.

How could have Tomas encountered this with the current Buildroot, where
we don't even have the logic to build a modular policy ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
You are receiving this mail because:
You are on the CC list for the bug.
