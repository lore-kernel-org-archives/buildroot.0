From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Sep 2015 10:11:56 -0700
Subject: [Buildroot] User question UTF-8
Message-ID: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to port a python application to buildroot/busybox. It
needs to read disk files from removable drives. The filenames may
contain utf-8 chars.

Currently ls from busybox prints ? for the utf-8 non-ascii chars. Both
from console on minicom and from ssh (which should handle utf-8).

There seems to be lots of config knobs.

I assume utf-8 chars are somehow related to locales? I enabled locales
in the internal glib toolchain.

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_PACKAGE_LIBPTHREAD_STUBS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SHEEVAPLUG=y


Busybox also has locale settings:
grep LOCAL output/build/busybox-1.23.2/.config
CONFIG_LOCALE_SUPPORT=y
# CONFIG_UNICODE_USING_LOCALE is not set
# CONFIG_FEATURE_UNIX_LOCAL is not set
# CONFIG_HUSH_LOCAL is not set

From googling, Linux always supports anything for filenames, since it
just uses bytes not unicode for filenames.

But I seem to be missing something. My generated system does not seem
to properly handle utf-8. I am guessing until that works the python os
module is also not going to handle utf-8. And indeed it does not work
now.

Regards, Steve
