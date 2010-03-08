From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Mar 2010 22:46:56 +0100
Subject: [Buildroot] mtd-utils fails to build
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190902242788@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Mon, 8 Mar 2010 16:04:46 -0500")
References: <BD79186B4FD85F4B8E60E381CAEE190902242788@mi8nycmail19.Mi8.com>
Message-ID: <877hpmv63z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> I am trying to do a clean build using the current git pull of buildroot.

 H> Everything goes as expected until trying to build mtd-utils. When trying
 H> to build mkfs.jffs2 the build cannot find zlib.h and errors out.

 H> It appears that a compile and assemble, but do not link (option -c), happens
 H> first for each file followed by compile and place output into <file>
 H> (option -o).

 H> The problem appears to be that the -c option happens without passing the
 H> --sysroot configuration so the compiler cannot locate the external headers.

 H> Following is a snip of the last part of the build:

Thanks, fixed in git:

commit d5bf5f967009733da99c55febacb3fb0be686cad
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Mon Mar 8 22:44:28 2010 +0100

    mtd-utils: fix build with external toolchain
    
    Reported by H Hartley Sweeten.
    
    Make sure we pass proper CFLAGS to mtd-utils, so builds needing --sysroot
    works (E.G. external toolchains).
    
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 244fd8e..3e0fcaf 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -111,14 +111,14 @@ MTD_BUILD_TARGETS := $(MTD_TARGETS) $(MTD_UBI_TARGETS)
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 ifneq ($(MTD_TARGETS),)
-       $(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" \
+       $(MAKE) $(TARGET_CONFIGURE_ENV) \
                BUILDDIR=$(MTD_DIR) \
                CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
                WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
                -C $(MTD_DIR) $(MTD_TARGETS)
 endif
 ifneq ($(MTD_UBI_TARGETS),)
-       $(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" \
+       $(MAKE) $(TARGET_CONFIGURE_ENV) \
                BUILDDIR=$(MTD_DIR)/ubi-utils \
                CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
                WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \

-- 
Bye, Peter Korsgaard
