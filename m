From: Rouslan Solomakhin <rouslan@solomakhin.net>
Date: Sun, 2 Sep 2007 13:14:04 -0500 (CDT)
Subject: [Buildroot] Patch for gcc makefile
Message-ID: <45513.24.207.255.59.1188756844.squirrel@box240.bluehost.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I got the following error using buildroot svn today and yesterday:


strip:
'/home/rouslan/Software/Buildroot/svn-buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gccbug':
No such file
make: ***
[/home/rouslan/Software/Buildroot/svn-buildroot/toolchain_build_i686/gcc-4.2.1-final/.installed]
Error 1


The following patch seems to fix it:

Index: toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- toolchain/gcc/gcc-uclibc-4.x.mk     (revision 19763)
+++ toolchain/gcc/gcc-uclibc-4.x.mk     (working copy)
@@ -293,7 +293,7 @@
                $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gccbug
        # Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-       strip --strip-all -R .note -R .comment $(filter-out
-gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+       strip --strip-all -R .note -R .comment $(filter-out
gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
        -strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/faked
 endif
        # Make sure we have 'cc'.

Cheers,
Rouslan
