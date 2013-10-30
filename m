From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 18:51:37 +0100
Subject: [Buildroot] [git commit] ext-toolchain: MIPS: Select correct
	endianness for the target
Message-ID: <20131104211054.43FC79BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3a2b806dee5e642077ca3fafd67e3b17e09b669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, an external-toolchain on a mipsel/mips64el target
didn't select the appriopriate endianness but
it asked the user to set the correct CFLAGS on his/her own.
We fix this by appending "-EL" to the toolchain wrapper options
if the user has selected a mipsel/mips64el target.

[Thomas: remove unneeded test on BR2_ENDIAN, since mipsel and mips64el
are always little-endian, and add the corresponding big endian case.]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |   24 +++++---------------
 .../toolchain-external/ext-toolchain-wrapper.c     |    6 +++++
 toolchain/toolchain-external/toolchain-external.mk |    9 ++++++-
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 48b5865..646f918 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -213,12 +213,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
 	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -229,12 +227,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
 	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -242,7 +238,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -250,7 +246,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian uclibc
 	      Not usable in Buildroot yet.
 	    - MIPS32 little endian uclibc
@@ -284,12 +280,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -300,12 +294,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -313,7 +305,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -321,7 +313,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian uclibc
 	      Not usable in Buildroot yet.
 	    - MIPS32 little endian uclibc
@@ -355,12 +347,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -371,12 +361,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -384,7 +372,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -392,7 +380,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian uclibc
 	      Not usable in Buildroot yet.
 	    - MIPS32 little endian uclibc
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 727e322..d54f1f5 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -63,6 +63,12 @@ static char *predef_args[] = {
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
+#ifdef BR_MIPS_TARGET_LITTLE_ENDIAN
+	"-EL",
+#endif
+#ifdef BR_MIPS_TARGET_BIG_ENDIAN
+	"-EB",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d41cc7c..d658d4f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -207,7 +207,14 @@ ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
 endif
-
+ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
+TOOLCHAIN_EXTERNAL_CFLAGS += -EL
+endif
+ifeq ($(BR2_mips)$(BR2_mips64),y)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_CFLAGS += -EB
+endif
 ifneq ($(BR2_TARGET_OPTIMIZATION),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
