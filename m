From: hartleys <hartleys@visionengravers.com>
Date: Thu, 6 Nov 2008 10:54:56 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081106125430.01B343C758@busybox.net>
References: <20081106125430.01B343C758@busybox.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C92005@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, November 06, 2008 5:54 AM, laird at uclibc.org wrote:
> Author: laird
> Date: 2008-11-06 04:54:29 -0800 (Thu, 06 Nov 2008) New Revision: 23943
>
> Log:
> package/Makefile.in: rpath setup for toolchains.
> 
> Apply the patch I posted some time ago that fixes rpath issues with
> external toolchains.
> Has been tested by users of buildroot and feedback looks good.
>
> Signed-off-by: Thomas Petazzoni
> Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>
>
>
>
> Modified:
>    trunk/buildroot/package/Makefile.in

Just updated to revision 23943. The patch looked liked it would fix the
issues I have with compiling mtd. But, no good I still get errors.

...
/usr/local/arm/4.1.1-920t/bin/arm-linux-gcc  -o
/home/bigguiness/buildroot/build_arm/mtd_orig/mkfs.jffs2
/home/bigguiness/buildroot/build_arm/mtd_orig/crc32.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr_rtime.o
/home/bigguiness/buildroot/build_arm/mtd_orig/mkfs.jffs2.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr_zlib.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr_lzo.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr.o -lz -llzo2
/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1/../../../../arm
-linux-uclibc/bin/ld: cannot find -lz
collect2: ld returned 1 exit status
make[1]: *** [/home/bigguiness/buildroot/build_arm/mtd_orig/mkfs.jffs2]
Error 1
...

In order to get mtd to build correctly I have to patch mtd.mk as
follows:

$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
	mkdir -p $(TARGET_DIR)/usr/sbin
	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include
-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
		BUILDDIR=$(MTD_DIR) \
		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)
LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)

With the patch above the compile output is:

...
/usr/local/arm/4.1.1-920t/bin/arm-linux-gcc
-L/home/bigguiness/buildroot/build_arm/staging_dir/lib
-L/home/bigguiness/buildroot/build_arm/staging_dir/usr/lib
-Wl,--rpath-link
-Wl,/home/bigguiness/buildroot/build_arm/staging_dir/lib
-Wl,--rpath-link
-Wl,/home/bigguiness/buildroot/build_arm/staging_dir/usr/lib -o
/home/bigguiness/buildroot/build_arm/mtd_orig/mkfs.jffs2
/home/bigguiness/buildroot/build_arm/mtd_orig/crc32.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr_rtime.o
/home/bigguiness/buildroot/build_arm/mtd_orig/mkfs.jffs2.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr_zlib.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr_lzo.o
/home/bigguiness/buildroot/build_arm/mtd_orig/compr.o -lz -llzo2
...

It appears mtd is using gcc to link the objects and not ld so the
correct flags are not getting passed.

Hartley
