From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] external toolchain: slightly optimize the
	copy of the toolchain sysroot
In-Reply-To: <cover.1314826575.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826575.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bf913e756e822eac217406309f3e423ca5dca580.1314826575.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sysroot of an ARM CodeSourcery toolchain takes about 1.4 GB of
space, but 1.1+ GB of this space consists in locale-related
information which Buildroot doesn't use. By skipping the copy of those
unused files, we save quite a bit of time while importing the
toolchain sysroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 4d90d15..7f3efaa 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -79,6 +79,9 @@ copy_toolchain_lib_root = \
 #    non-default architecture variant is used. Without this, the
 #    compiler fails to find libraries and headers.
 #
+# Note that the 'locale' directories are not copied. They are huge
+# (400+MB) in CodeSourcery toolchains, and they are not really useful.
+#
 # $1: main sysroot directory of the toolchain
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
@@ -89,7 +92,7 @@ copy_toolchain_sysroot = \
 	ARCH_SUBDIR="$(strip $3)"; \
 	for i in etc lib sbin usr ; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+			rsync -au --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
-- 
1.7.4.1
