From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:44 +0100
Subject: [Buildroot] [PATCH 04/16] Support multilib variants in
	sub-subdirectories
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c64ef7b2460e2c3b7f5aa758c7aee89ce45fa57e.1327772176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When an external toolchain has multiple variants organized in
sub-directories, Buildroot only copies the selected sysroot and not
all sysroots. In order to make this work, Buildroot creates a symbolic
link of the name of the original selected sysroot to the main sysroot
to trick the compiler so that it finds its libraries at the expected
location.

I.e, if the toolchain as the following organization (example take on
the ARM CodeSourcery toolchain) :

     .	    	for ARMv5T
     armv4  	for ARMv4T
     thumb2 	for ARMv7-A/Thumb

and ARMv4T is selected, then Buildroot will copy the contents of
armv4t/ from the toolchain into its $(STAGING_DIR) and then create a
$(STAGING_DIR)/armv4t symbolic link to $(STAGING_DIR).

However, our logic to do so only works when there was one directory
level for multilib sysroots. But in the MIPS CodeSourcery toolchain
there are multiple levels. For example, the MIPS16 soft-float
little-endian sysroot variant is in mips16/soft-float/el/ compared to
the main sysroot.

This patch improves our logic to support this case. The logic is a bit
more complicated as we don't want to create a symbolic link to an
absolute path, but a symbolic link to a relative path, because we want
the host/ directory to be relocatable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 4c3f240..3f4818f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -103,7 +103,14 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
-		ln -s . $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
+		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
+		relpath="./" ; \
+		nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
+		for slash in `seq 1 $${nbslashs}` ; do \
+			relpath=$${relpath}"../" ; \
+		done ; \
+		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
+		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
 	fi ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
-- 
1.7.4.1
