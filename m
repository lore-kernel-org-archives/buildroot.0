From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 May 2014 22:24:39 +0200
Subject: [Buildroot] [PATCH] toolchain-external: restrict Musl external
	toolchain to Microblaze BE
Message-ID: <1401481479-23667-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by William Welch <bvwelch@gmail.com>, the Musl external
toolchain provided by the musl-cross project is only Microblaze
big-endian. In fact, Musl seems to only support the big endian variant
of the Microblaze architecture, with the microblaze-* tuple.

This commit makes sure the Musl pre-built external toolchain provided
by musl-cross can only be selected for a big-endian Microblaze
configuration.

Reported-by: William Welch <bvwelch@gmail.com>
Cc: William Welch <bvwelch@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This is a fix, should be committed to 2014.05.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 4 ++--
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 857f26d..f4a5ccf 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -871,7 +871,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_12
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
-		(BR2_i386 && !BR2_x86_i386) || BR2_microblaze || BR2_mips || \
+		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
@@ -977,7 +977,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
-	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_microblaze
+	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_microblazebe
 	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && !BR2_SOFT_FLOAT)
 	default "mips-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && BR2_SOFT_FLOAT)
 	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && !BR2_SOFT_FLOAT)
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 34520be..c73cc4a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -378,7 +378,7 @@ else ifeq ($(BR2_armeb),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-1.0.0.tar.xz
 else ifeq ($(BR2_i386),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-1.0.0.tar.xz
-else ifeq ($(BR2_microblaze),y)
+else ifeq ($(BR2_microblazebe),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-1.0.0.tar.xz
 else ifeq ($(BR2_mips),y)
 ifeq ($(BR2_SOFT_FLOAT),y)
-- 
1.9.3
