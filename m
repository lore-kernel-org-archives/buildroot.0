From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 15 Nov 2013 08:59:25 +0000
Subject: [Buildroot] [PATCH] uclibc: patch 0.9.31 for avr32,
	to add __kernel_long_t and __kernel_ulong_t data types
Message-ID: <1384505965-19957-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

As reported by Thomas Petazzoni, the uclibc 0.9.31 build fails for avr32:

In file included from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/kernel.h:4,
                 from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/netlink.h:4,
                 from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:5,
                 from libc/inet/netlinkaccess.h:27,
                 from libc/inet/if_index.c:36:
/opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/sysinfo.h:8: error: expected specifier-qualifier-list before '__kernel_long_t'
make[1]: *** [libc/inet/if_index.os] Error 1
make[1]: Leaving directory `/opt/toolchain-build/build/uclibc-0.9.31.1'

The problem is reported at:

  https://lkml.org/lkml/2013/5/18/1

The offending kernel commit is:

  http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=ccdfcc398594

The fix is to patch uclibc 0.9.31 to add the missing kernel data types. The patch
will only be generated for avr32, since uclibc 0.9.31 is not available in Buildroot
for any other architecture.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...add-__kernel_long-and-__kernel_ulong.patch.avr32 | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/uclibc/0.9.31.1/uclibc-0013-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch.avr32

diff --git a/package/uclibc/0.9.31.1/uclibc-0013-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch.avr32 b/package/uclibc/0.9.31.1/uclibc-0013-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch.avr32
new file mode 100644
index 0000000..55cb0c5
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uclibc-0013-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch.avr32
@@ -0,0 +1,21 @@
+libc/sysdeps: add __kernel_long and __kernel_ulong
+
+Linux 3.4 added __kernel_long_t and __kernel_ulong_t and various
+exported header files were updated to use these new types. Add the
+definitions for __kernel_long_t and __kernel_ulong_t to the relevant
+kernel_types.h headers.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/libc/sysdeps/linux/avr32/bits/kernel_types.h b/libc/sysdeps/linux/avr32/bits/kernel_types.h
+--- a/libc/sysdeps/linux/avr32/bits/kernel_types.h	2011-06-08 19:58:40.000000000 +0100
++++ b/libc/sysdeps/linux/avr32/bits/kernel_types.h	2013-11-15 08:01:09.209037851 +0000
+@@ -39,6 +39,8 @@ typedef unsigned int		__kernel_gid32_t;
+ typedef unsigned short		__kernel_old_uid_t;
+ typedef unsigned short		__kernel_old_gid_t;
+ typedef unsigned short		__kernel_old_dev_t;
++typedef long			__kernel_long_t;
++typedef unsigned long		__kernel_ulong_t;
+ 
+ #ifdef __GNUC__
+ typedef long long		__kernel_loff_t;
-- 
1.8.3.2
