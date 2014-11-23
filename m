From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:35:59 +0100
Subject: [Buildroot] [PATCH 1/5] toolchain-external: fix C++ build issues
	with the Blackfin toolchain
In-Reply-To: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416764163-12826-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Blackfin toolchain install some libtool .la files, which none of
the other toolchains seem to do, and those .la files confuse libtool
down the road, causing build failures due to incorrect library
paths. As an example, the thrift package has been constantly failing
to build on Blackfin due to this.

To solve this issue, we simply remove the .la files installed by the
toolchain from the staging directory.

Fixes:

  http://autobuild.buildroot.org/results/8ac/8ac073a4e9c3a228dd22d80ea02b9dc3fc739164/

And many similar occurences of the same problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index da3718c..72acb41 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -331,14 +331,17 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
@@ -666,6 +669,12 @@ define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
 		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
 endef
 
+# Some toolchains have .la libtool files that actually confuse libtool
+# down the road. Get rid of them.
+define TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
+	find $(STAGING_DIR) -name '*.la' | xargs rm -f
+endef
+
 define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	if test -f $(TARGET_CROSS)gdb ; then \
 		$(call gen_gdbinit_file) ; \
-- 
2.1.0
