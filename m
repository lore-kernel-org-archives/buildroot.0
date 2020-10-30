From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Oct 2020 08:50:40 +0100
Subject: [Buildroot] [PATCH 3/8] package/optee-client: bump to version 3.11.0
In-Reply-To: <20201030075045.6960-1-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
Message-ID: <20201030075045.6960-3-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Client package version to OP-TEE release 3.11.0.
Remove local patch file since issue addressed since.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...teec-CMakeLists.txt-fix-static-build.patch | 55 -------------------
 package/optee-client/optee-client.hash        |  4 +-
 package/optee-client/optee-client.mk          |  2 +-
 3 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 package/optee-client/0001-libckteec-CMakeLists.txt-fix-static-build.patch

diff --git a/package/optee-client/0001-libckteec-CMakeLists.txt-fix-static-build.patch b/package/optee-client/0001-libckteec-CMakeLists.txt-fix-static-build.patch
deleted file mode 100644
index 5307c7032c..0000000000
--- a/package/optee-client/0001-libckteec-CMakeLists.txt-fix-static-build.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dedd04034fd246c5726ad875e8207c821e9471b7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Jul 2020 00:09:21 +0200
-Subject: [PATCH] libckteec/CMakeLists.txt: fix static build
-
-Remove SHARED from add_library call to avoid the following build failure
-when the toolchain does not support shared library:
-
-[ 78%] Linking C shared library libckteec.so
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(close.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(close.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(close.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(open64.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-cancellation.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-cancellation.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(open.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(open.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux[ 84%] Building C object tee-supplicant/CMakeFiles/tee-supplicant.dir/src/teec_ta_load.c.o
--uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(open.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-3/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__syscall_fcntl.os)(.eh_frame) prevents .eh_frame_hdr table being created
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: further warnings about FDE encoding preventing .eh_frame_hdr generation dropped
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.33.1 assertion fail elf32-microblaze.c:1542
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/crtbeginT.o: probably compiled without -fPIC?
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value
-collect2: error: ld returned 1 exit status
-libckteec/CMakeFiles/ckteec.dir/build.make:144: recipe for target 'libckteec/libckteec.so.0.1.0' failed
-
-This build failure is raised on version 3.9.0 since
-https://github.com/ffontaine/optee_client/commit/fa679fc6f1f0c6240513ec69c63f0f89c2c4dd99
-
-Fixes:
- - http://autobuild.buildroot.org/results/fe2d0f5a956bf23635e51258f92d9ab2e5af7941
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OP-TEE/optee_client/pull/215]
----
- libckteec/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libckteec/CMakeLists.txt b/libckteec/CMakeLists.txt
-index f0e14d1..615c9fe 100644
---- a/libckteec/CMakeLists.txt
-+++ b/libckteec/CMakeLists.txt
-@@ -33,7 +33,7 @@ set (SRC
- ################################################################################
- # Built library
- ################################################################################
--add_library (ckteec SHARED ${SRC})
-+add_library (ckteec ${SRC})
- 
- set_target_properties (ckteec PROPERTIES
- 	VERSION ${PROJECT_VERSION}
--- 
-2.27.0
-
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index b08ebc38c0..d8e507dba7 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.9.0.tar.gz
-sha256 1b072e6be8a697656e9fe34499789bbd4132b3720f8d1b95c659e8e6c5873654  optee-client-3.9.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.11.0.tar.gz
+sha256 91f8ec191cd999ee666b6203ec376415d5dc90a8a9955f3d5fce1f48df77169b  optee-client-3.11.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 842ba8a81a..8108fc2130 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.9.0
+OPTEE_CLIENT_VERSION = 3.11.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.17.1
