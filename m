From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 26 Jun 2015 22:27:20 +0300
Subject: [Buildroot] [PATCH] ARC: switch to RC1 of upcoming arc-2015.06 tools
Message-ID: <1435346840-9677-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though this is only RC1 it's been heavily used internally so it should
not be any worse than existing arc-2014.12.

Moreover this relase (and so its RC1) finally delivers support of NPTL
for ARC in uClibc.

That's why it would be good to allow interested users to start trying it
(for example WebKit and apps that use WebKit could be successfully built
and run) also it will be helpful to run that new toolchain through
autobuilder in attempt to find any hidden regressions so we have a solid
toolchain for release.

If there's an interest in that patch more patches will follow with
subsequent RCs and essentially on appearence or relese Buildroot will be
updated with it.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: arc-buildroot at synopsys.com
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.hash  | 2 +-
 package/gcc/Config.in.host      | 2 +-
 package/gcc/gcc.hash            | 2 +-
 package/gdb/Config.in.host      | 2 +-
 package/gdb/gdb.hash            | 2 +-
 package/uclibc/Config.in        | 5 +++--
 package/uclibc/uclibc.hash      | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ec1bd17..926b3d2 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2014.12"	if BR2_arc
+	default "arc-2015.06-rc1"	if BR2_arc
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 028fc10..f662adc 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30  binutils-2.25.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx                                                               binutils-arc-2014.12.tar.gz
+none   xxx  binutils-arc-2015.06-rc1.tar.gz
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7189407..ab50b06 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -97,7 +97,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.2"     if BR2_GCC_VERSION_4_9_X
 	default "5.1.0"     if BR2_GCC_VERSION_5_1_X
-	default "arc-2014.12" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2015.06-rc1" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 1a27d1c..44e463c 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,4 +9,4 @@ sha512  e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e4226
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.1.0/sha512.sum
 sha512  30f6a94d3adb25bc51fcaddf32a6c41429f569eeb9ed64330445b1296f99998fbfa03277b375be4f7b2b80f519910ef88e4149db7cd9031e2c61a49f501bde94  gcc-5.1.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2014.12.tar.gz
+none  xxx  gcc-arc-2015.06-rc1.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index e2f8c27..d2469fc 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -49,7 +49,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2014.12-gdb" if BR2_arc
+	default "arc-2015.06-rc1-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 0130935..cf397d8 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,5 +3,5 @@ sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208c
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2014.12-gdb.tar.gz
+none	xxx	gdb-arc-2015.06-rc1-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 15a590f..32c356a 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -33,6 +33,7 @@ choice
 		bool "uClibc Git ARC"
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
+		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL
 		depends on BR2_arc
 
 	config BR2_UCLIBC_VERSION_NG
@@ -41,7 +42,7 @@ choice
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
 		       if BR2_m68k || BR2_arm || BR2_armeb
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
-		       if !BR2_arc && !BR2_m68k && !BR2_x86_i386
+		       if !BR2_m68k && !BR2_x86_i386
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
@@ -63,7 +64,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
-	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
+	default "arc-2015.06-rc1" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "1.0.3"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 841c96b..36fa86f 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -5,7 +5,7 @@ sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0
 sha256  b4c73fe3e7af4eeabf7510ee66ca85f775c3ed44d20b1bcd30c6ac481dd753cd        uClibc-ng-1.0.3.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
-none	xxx	uClibc-arc-2014.12.tar.gz
+none	xxx	uClibc-arc-2015.06-rc1.tar.gz
 
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
-- 
2.4.2
