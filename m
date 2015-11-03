From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 3 Nov 2015 10:40:09 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on powerpc64,
	gcc-4.9
Message-ID: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there

I'm trying to use xmlrpclib module from python on this architecture,
but whenever I import that module I'm answered back with an 'Illegal
instruction':

Python 2.7.10 (default, Oct 29 2015, 11:03:21)
[GCC 4.9.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import xmlrpclib
Illegal instruction

And this appears on dmesg:
python[1439]: unhandled signal 4 at 00003fffb19ec6dc nip 00003fffb19ec6dc
lr 00003fffb19ec6b0 code 30001

This doesn't happen when importing other modules, such as sys or os, but I
haven't tested any other module besides these.

# cat /proc/cpuinfo
processor    : 0
cpu        : e6500, altivec supported
clock        : 1466.666652MHz
revision    : 2.0 (pvr 8040 0120)
[ 7 identical cores more removed from this to avoid clutter ]
timebase    : 37500000
platform    : VPX3-133
model        : cw,vpx3-133

Attached buildroot's config:

BR2_powerpc64=y
BR2_powerpc_e6500=y
BR2_DL_DIR="$(BR2_EXTERNAL)/dl"
BR2_PACKAGE_OVERRIDE_FILE="$(BR2_EXTERNAL)/local.mk"
BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL)/patch"
BR2_KERNEL_HEADERS_3_10=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_OPENMP=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_USERS_TABLES="$(BR2_EXTERNAL)/users.table"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="ssh://.../linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="tag"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL)/$(PROJECT_NAME)tag_defconfig"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL)/$(PROJECT_NAME)/tag.dts"
BR2_PACKAGE_PYTHON=y
[ And the rest is just a selection of packages and non compiler nor kernel
related things ]


This only happens when using buildroot's toolchain.
One difference between buildroot's toolchain and the others,
is that buildroot's is the only one that supports a 64 bit target.

I don't know who can I debug that to provide more information,
but I'm willing to test whatever is needed.

Thank you, best regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151103/b7c57175/attachment.html>
