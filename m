From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Wed, 26 Jan 2011 10:20:22 -0800 (PST)
Subject: [Buildroot] Enabling NFS
Message-ID: <89359.48464.qm@web161810.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have just spent some time trying to enable NFS on a beagle board. It seems 
that RPC is required for nfs. 


To enable nfs requires some NFS specific changes to:
find target/device/beagleboard/ | xargs grep  "_NFS"
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_NFS_FS=y
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_NFS_V3=y
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:# CONFIG_NFS_V3_ACL 
is not set
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:# CONFIG_NFS_V4 is 
not set
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_ROOT_NFS=y
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_NFSD=m
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_NFSD_V3=y
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:# CONFIG_NFSD_V3_ACL 
is not set
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_NFS_COMMON=y
target/device/beagleboard/beagleboard-busybox-1.17.x.config:CONFIG_FEATURE_MOUNT_NFS=y

target/device/beagleboard/beagleboard_defconfig:# BR2_PACKAGE_NFS_UTILS is not 
set

To enable RPC requires:
find target/device/beagleboard/ | xargs grep  "_RPC"
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:# CONFIG_ARCH_RPC is 
not set
target/device/beagleboard/beagleboard-linux-2.6.36.1.config:CONFIG_RPCSEC_GSS_KRB5=y

target/device/beagleboard/beagleboard-busybox-1.17.x.config:CONFIG_FEATURE_HAVE_RPC=y

target/device/beagleboard/beagleboard-busybox-1.17.x.config:# 
CONFIG_FEATURE_INETD_RPC is not set
target/device/beagleboard/beagleboard-uClibc-0.9.31.config:UCLIBC_HAS_RPC=y
target/device/beagleboard/beagleboard-uClibc-0.9.31.config:# UCLIBC_HAS_FULL_RPC 
is not set
target/device/beagleboard/beagleboard-uClibc-0.9.31.config:UCLIBC_HAS_REENTRANT_RPC=y

target/device/beagleboard/beagleboard_defconfig:BR2_INET_RPC=y

And here the big issue is the uclibc requires the option to be set, so that 
means a big build!

It seems having to configure buildroot, the kernel, busybox, and uclibc all to 
get this option on is quite an unexpected effort, and I have not even tried with 
uboot yet.

This is what I have found, and I got it working, but I wonder if there was extra 
stuff I did that I did not need to do?

Thanks, Steve



      
