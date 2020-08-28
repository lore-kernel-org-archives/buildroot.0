From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 23:25:30 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/ibm-sw-tpm2: fix
 glibc build errors
Message-ID: <20200828211823.3263C7FF3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8675780f596cf4ad7821989616c7ad569ffb0768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

In order to not have to define all architecture bitness variants in
src/LibSupport.h to conditionally define RADIX_BITS, a patch was created
to depend on LONG_BIT being defined via limits.h

For glibc, LONG_BIT is behind a _XOPEN_SOURCE define guard so patch the
makefile to define this macro as well as _DEFAULT_SOURCE.

Defining _XOPEN_SOURCE requires _DEFAULT_SOURCE to be explicitly defined
for builds to succeed as it is no longer impliclty defined when
_XOPEN_SOURCE is defined.

Fixes:
	http://autobuild.buildroot.net/results/bc145dd23c80a0660300766d0c114a00ed2e52b6/
	http://autobuild.buildroot.net/results/1d84e70c30d4d0719274aa4f3edc01772beb24a3/

Fixes: 19bd089004 ("package/ibm-sw-tpm2: fix patch to address musl builds")

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a34e7f88f67b77066f73894dc8e42bca3c076fa6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Use-LONG_BIT-to-define-RADIX_BITS.patch   | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
index 3a7e02ba7a..d72239f42b 100644
--- a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
+++ b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
@@ -1,4 +1,4 @@
-From 24a352fc99ebde22235b05b18615817ef7f4263c Mon Sep 17 00:00:00 2001
+From 7c32c58f4ce802d2682038f73bb8c8f850237f89 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 26 Apr 2020 15:33:39 +0200
 Subject: [PATCH] Use LONG_BIT to define RADIX_BITS
@@ -6,14 +6,17 @@ Subject: [PATCH] Use LONG_BIT to define RADIX_BITS
 This allows to avoid having to support each CPU architecture
 individually.
 
+Also, add the necessary defines in the makefile to expose LONG_BIT
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  src/LibSupport.h | 17 +++--------------
- 1 file changed, 3 insertions(+), 14 deletions(-)
+ src/makefile     |  2 ++
+ 2 files changed, 5 insertions(+), 14 deletions(-)
 
 diff --git a/src/LibSupport.h b/src/LibSupport.h
-index b2e6a51..f064d20 100644
+index b2e6a51..0b59d18 100644
 --- a/src/LibSupport.h
 +++ b/src/LibSupport.h
 @@ -64,20 +64,9 @@
@@ -40,6 +43,19 @@ index b2e6a51..f064d20 100644
  
  // These macros use the selected libraries to the proper include files.
  #define LIB_QUOTE(_STRING_) #_STRING_
+diff --git a/src/makefile b/src/makefile
+index f124e78..9af1e51 100644
+--- a/src/makefile
++++ b/src/makefile
+@@ -46,6 +46,8 @@ CCFLAGS = -Wall  			\
+ 	 -c -ggdb -O0 			\
+ 	-DTPM_POSIX			\
+ 	-D_POSIX_			\
++	-D_DEFAULT_SOURCE		\
++	-D_XOPEN_SOURCE			\
+ 	-DTPM_NUVOTON
+ 
+ # add this line for big endian platforms
 -- 
-2.25.3
+2.28.0
 
